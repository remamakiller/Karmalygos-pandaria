/*
 * Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2016 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Vehicle.h"
#include "Player.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "MovementStructures.h"

void WorldSession::HandleDismissControlledVehicle(WorldPacket &recvData)
{
    TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_DISMISS_CONTROLLED_VEHICLE");

    uint64 vehicleGUID = _player->GetCharmGUID();

    if (!vehicleGUID)                                       // something wrong here...
    {
        recvData.rfinish();                                // prevent warnings spam
        return;
    }

    MovementInfo mi;
    _player->ReadMovementInfo(recvData, &mi);

    _player->m_movementInfo = mi;

    _player->ExitVehicle();
}

void WorldSession::HandleChangeSeatsOnControlledVehicle(WorldPacket& recvData)
{
    TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE");

    Unit* vehicle_base = GetPlayer()->GetVehicleBase();
    if (!vehicle_base)
    {
        recvData.rfinish();                                // prevent warnings spam
        return;
    }

    VehicleSeatEntry const* seat = GetPlayer()->GetVehicle()->GetSeatForPassenger(GetPlayer());
    if (!seat->CanSwitchFromSeat())
    {
        recvData.rfinish();                                // prevent warnings spam
        TC_LOG_ERROR("network", "HandleChangeSeatsOnControlledVehicle, Opcode: %u, Player %u tried to switch seats but current seatflags %u don't permit that.",
            recvData.GetOpcode(), GetPlayer()->GetGUIDLow(), seat->m_flags);
        return;
    }

    switch (recvData.GetOpcode())
    {
        case CMSG_REQUEST_VEHICLE_PREV_SEAT:
            GetPlayer()->ChangeSeat(-1, false);
            break;
        case CMSG_REQUEST_VEHICLE_NEXT_SEAT:
            GetPlayer()->ChangeSeat(-1, true);
            break;
        case CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE:
        {
            static MovementStatusElements const accessoryGuid[] =
            {
                MSEExtraInt8, 
                MSEHasGuidByte2,
                MSEHasGuidByte1,
                MSEHasGuidByte7,
                MSEHasGuidByte5,
                MSEHasGuidByte3,
                MSEHasGuidByte6,
                MSEHasGuidByte4,
                MSEHasGuidByte0,
                MSEGuidByte5,
                MSEGuidByte4,
                MSEGuidByte7,
                MSEGuidByte1,
                MSEGuidByte3,
                MSEGuidByte2,
                MSEGuidByte6,
                MSEGuidByte0,
            };

            Movement::ExtraMovementStatusElement extra(accessoryGuid);
            MovementInfo movementInfo;
            GetPlayer()->ReadMovementInfo(recvData, &movementInfo, &extra);
            vehicle_base->m_movementInfo = movementInfo;

            uint64 accessory = extra.Data.guid;
            int8 seatId = extra.Data.byteData;

            if (vehicle_base->GetGUID() != movementInfo.guid)
                return;
            
            if (!accessory)
                GetPlayer()->ChangeSeat(-1, seatId > 0); // prev/next
            else if (Unit* vehUnit = Unit::GetUnit(*GetPlayer(), accessory))
            {
                if (Vehicle* vehicle = vehUnit->GetVehicleKit())
                    if (vehicle->HasEmptySeat(seatId))
                        vehUnit->HandleSpellClick(GetPlayer(), seatId);
            }
            break;
        }
        case CMSG_REQUEST_VEHICLE_SWITCH_SEAT:
        {
            int8 seatId;
            recvData >> seatId;

            ObjectGuid guid;    // current vehicle guid
            uint8 maskorder[8] = { 7, 3, 0, 1, 6, 4, 5, 2 };
            recvData.ReadBitInOrder(guid, maskorder);

            uint8 byteorder[8] = { 5, 0, 2, 3, 7, 4, 6, 1 };
            recvData.ReadBytesSeq(guid, byteorder);

            if (vehicle_base->GetGUID() == guid)
                GetPlayer()->ChangeSeat(seatId);
            else if (Unit* vehUnit = Unit::GetUnit(*GetPlayer(), guid))
                if (Vehicle* vehicle = vehUnit->GetVehicleKit())
                    if (vehicle->HasEmptySeat(seatId))
                        vehUnit->HandleSpellClick(GetPlayer(), seatId);
            break;
        }
        default:
            break;
    }
}

void WorldSession::HandleEnterPlayerVehicle(WorldPacket& recvData)
{
    ObjectGuid Guid;
    Guid[5] = recvData.ReadBit();
    Guid[7] = recvData.ReadBit();
    Guid[3] = recvData.ReadBit();
    Guid[0] = recvData.ReadBit();
    Guid[2] = recvData.ReadBit();
    Guid[4] = recvData.ReadBit();
    Guid[6] = recvData.ReadBit();
    Guid[1] = recvData.ReadBit();

    recvData.ReadByteSeq(Guid[5]);
    recvData.ReadByteSeq(Guid[3]);
    recvData.ReadByteSeq(Guid[1]);
    recvData.ReadByteSeq(Guid[2]);
    recvData.ReadByteSeq(Guid[7]);
    recvData.ReadByteSeq(Guid[0]);
    recvData.ReadByteSeq(Guid[6]);
    recvData.ReadByteSeq(Guid[4]);

    if (Player* player = ObjectAccessor::FindPlayer(Guid))
    {
        if (!player->GetVehicleKit())
            return;
        if (!player->IsInRaidWith(_player))
            return;
        if (!player->IsWithinDistInMap(_player, INTERACTION_DISTANCE))
            return;

        _player->EnterVehicle(player);
    }
}

void WorldSession::HandleEjectPassenger(WorldPacket& data)
{
    Vehicle* vehicle = _player->GetVehicleKit();
    if (!vehicle)
    {
        data.rfinish();                                     // prevent warnings spam
        TC_LOG_ERROR("network", "HandleEjectPassenger: Player %u is not in a vehicle!", GetPlayer()->GetGUIDLow());
        return;
    }

    ObjectGuid guid;
    data.ReadGuidMask(guid, 4, 2, 1, 6, 5, 0, 7, 3);
    data.ReadGuidBytes(guid, 2, 7, 0, 6, 4, 3, 5, 1);

    if (IS_PLAYER_GUID(guid))
    {
        Player* player = ObjectAccessor::FindPlayer(guid);
        if (!player)
        {
            TC_LOG_ERROR("network", "Player %u tried to eject player %u from vehicle, but the latter was not found in world!", GetPlayer()->GetGUIDLow(), GUID_LOPART(guid));
            return;
        }

        if (!player->IsOnVehicle(vehicle->GetBase()))
        {
            TC_LOG_ERROR("network", "Player %u tried to eject player %u, but they are not in the same vehicle", GetPlayer()->GetGUIDLow(), GUID_LOPART(guid));
            return;
        }

        VehicleSeatEntry const* seat = vehicle->GetSeatForPassenger(player);
        ASSERT(seat);
        if (seat->IsEjectable())
            player->ExitVehicle();
        else
            TC_LOG_ERROR("network", "Player %u attempted to eject player %u from non-ejectable seat.", GetPlayer()->GetGUIDLow(), GUID_LOPART(guid));
    }

    else if (IS_CREATURE_GUID(guid))
    {
        Unit* unit = ObjectAccessor::GetUnit(*_player, guid);
        if (!unit) // creatures can be ejected too from player mounts
        {
            TC_LOG_ERROR("network", "Player %u tried to eject creature guid %u from vehicle, but the latter was not found in world!", GetPlayer()->GetGUIDLow(), GUID_LOPART(guid));
            return;
        }

        if (!unit->IsOnVehicle(vehicle->GetBase()))
        {
            TC_LOG_ERROR("network", "Player %u tried to eject unit %u, but they are not in the same vehicle", GetPlayer()->GetGUIDLow(), GUID_LOPART(guid));
            return;
        }

        VehicleSeatEntry const* seat = vehicle->GetSeatForPassenger(unit);
        ASSERT(seat);
        if (seat->IsEjectable())
        {
            ASSERT(GetPlayer() == vehicle->GetBase());
            unit->ExitVehicle();
        }
        else
            TC_LOG_ERROR("network", "Player %u attempted to eject creature GUID %u from non-ejectable seat.", GetPlayer()->GetGUIDLow(), GUID_LOPART(guid));
    }
    else
        TC_LOG_ERROR("network", "HandleEjectPassenger: Player %u tried to eject invalid GUID " UI64FMTD, GetPlayer()->GetGUIDLow(), uint64(guid));
}

void WorldSession::HandleRequestVehicleExit(WorldPacket& recvData)
{
    TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_REQUEST_VEHICLE_EXIT");

    if (Vehicle* vehicle = GetPlayer()->GetVehicle())
    {
        if (VehicleSeatEntry const* seat = vehicle->GetSeatForPassenger(GetPlayer()))
        {
            if (seat->CanEnterOrExit())
                GetPlayer()->ExitVehicle();
            else
                TC_LOG_ERROR("network", "Player %u tried to exit vehicle, but seatflags %u (ID: %u) don't permit that.",
                GetPlayer()->GetGUIDLow(), seat->m_ID, seat->m_flags);
        }
    }
}

void WorldSession::HandleMoveSetVehicleRecAck(WorldPacket& recvData)
{
    TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_SET_VEHICLE_REC_ID_ACK");

    static MovementStatusElements const vehicleIdExtra = MSEExtraInt32;
    Movement::ExtraMovementStatusElement extras(&vehicleIdExtra);
    MovementInfo movementInfo;
    GetPlayer()->ReadMovementInfo(recvData, &movementInfo, &extras);

    uint32 vehicleId = extras.Data.extraInt32Data;

    ObjectGuid vehicleGuid = GetPlayer()->GetGUID();
    WorldPacket data(SMSG_SET_VEHICLE_REC_ID, 8 + 4);
    data.WriteGuidMask(vehicleGuid, 5, 7, 2, 1, 4, 0, 3, 6);
    data.WriteGuidBytes(vehicleGuid, 5, 7, 4, 6, 2, 1, 3, 0);
    data << uint32(vehicleId);
    GetPlayer()->SendMessageToSet(&data, true);
}
