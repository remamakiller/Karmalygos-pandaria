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

#include "Common.h"
#include "Log.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "ObjectAccessor.h"
#include "CreatureAI.h"
#include "ObjectDefines.h"
#include "Vehicle.h"
#include "VehicleDefines.h"
#include "Player.h"
#include "Opcodes.h"

void WorldSession::HandleAttackSwingOpcode(WorldPacket& recvData)
{
    ObjectGuid guid;

    guid[6] = recvData.ReadBit();
    guid[5] = recvData.ReadBit();
    guid[7] = recvData.ReadBit();
    guid[0] = recvData.ReadBit();
    guid[3] = recvData.ReadBit();
    guid[1] = recvData.ReadBit();
    guid[4] = recvData.ReadBit();
    guid[2] = recvData.ReadBit();

    recvData.ReadByteSeq(guid[6]);
    recvData.ReadByteSeq(guid[7]);
    recvData.ReadByteSeq(guid[1]);
    recvData.ReadByteSeq(guid[3]);
    recvData.ReadByteSeq(guid[2]);
    recvData.ReadByteSeq(guid[0]);
    recvData.ReadByteSeq(guid[4]);
    recvData.ReadByteSeq(guid[5]);

    TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_ATTACKSWING Message guidlow:%u guidhigh:%u", GUID_LOPART(guid), GUID_HIPART(guid));

    Unit* pEnemy = ObjectAccessor::GetUnit(*_player, guid);

    if (!pEnemy)
    {
        // stop attack state at client
        SendAttackStop(NULL);
        return;
    }

    AttackSwingResult result = ATTACKSWING_DONT_REPORT;
    if (!_player->IsValidAttackTarget(pEnemy, nullptr, nullptr, false, &result))
    {
        if (result != ATTACKSWING_DONT_REPORT)
            _player->SendAttackSwingResult(result);
        // stop attack state at client
        SendAttackStop(pEnemy);
        return;
    }

    //! Client explicitly checks the following before sending CMSG_ATTACKSWING packet,
    //! so we'll place the same check here. Note that it might be possible to reuse this snippet
    //! in other places as well.
    if (Vehicle* vehicle = _player->GetVehicle())
    {
        VehicleSeatEntry const* seat = vehicle->GetSeatForPassenger(_player);
        ASSERT(seat);
        if (!(seat->m_flags & VEHICLE_SEAT_FLAG_CAN_ATTACK))
        {
            SendAttackStop(pEnemy);
            return;
        }
    }

    _player->Attack(pEnemy, true);
}

void WorldSession::HandleAttackStopOpcode(WorldPacket & /*recvData*/)
{
    GetPlayer()->AttackStop();
}

void WorldSession::HandleSetSheathedOpcode(WorldPacket& recvData)
{
    uint32 sheathed;
    bool hasData = false;

    recvData >> sheathed;
    hasData = recvData.ReadBit();

    //TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_SETSHEATHED Message guidlow:%u value1:%u", GetPlayer()->GetGUIDLow(), sheathed);

    if (hasData)
    {
        if (sheathed >= MAX_SHEATH_STATE)
        {
            TC_LOG_ERROR("network", "Unknown sheath state %u ??", sheathed);
            return;
        }

        GetPlayer()->SetSheath(SheathState(sheathed));
    }
}

void WorldSession::SendAttackStop(Unit const* enemy)
{
    WorldPacket data(SMSG_ATTACKSTOP, (8+8+1));

    ObjectGuid attackerGuid = GetPlayer()->GetGUID();
    ObjectGuid victimGuid = enemy ? enemy->GetGUID() : 0;

    data.WriteBit(victimGuid[5]);
    data.WriteBit(victimGuid[6]);
    data.WriteBit(attackerGuid[3]);
    data.WriteBit(attackerGuid[6]);
    data.WriteBit(attackerGuid[7]);
    data.WriteBit(attackerGuid[2]);
    data.WriteBit(attackerGuid[5]);
    data.WriteBit(victimGuid[4]);
    data.WriteBit(0);
    data.WriteBit(victimGuid[3]);
    data.WriteBit(victimGuid[0]);
    data.WriteBit(victimGuid[2]);
    data.WriteBit(victimGuid[7]);
    data.WriteBit(attackerGuid[4]);
    data.WriteBit(attackerGuid[1]);
    data.WriteBit(attackerGuid[0]);
    data.WriteBit(victimGuid[1]);

    data.FlushBits();

    data.WriteByteSeq(victimGuid[0]);
    data.WriteByteSeq(victimGuid[3]);
    data.WriteByteSeq(victimGuid[5]);
    data.WriteByteSeq(victimGuid[2]);
    data.WriteByteSeq(attackerGuid[0]);
    data.WriteByteSeq(attackerGuid[6]);
    data.WriteByteSeq(attackerGuid[3]);
    data.WriteByteSeq(victimGuid[4]);
    data.WriteByteSeq(attackerGuid[1]);
    data.WriteByteSeq(attackerGuid[4]);
    data.WriteByteSeq(victimGuid[6]);
    data.WriteByteSeq(attackerGuid[5]);
    data.WriteByteSeq(attackerGuid[7]);
    data.WriteByteSeq(attackerGuid[2]);
    data.WriteByteSeq(victimGuid[1]);
    data.WriteByteSeq(victimGuid[7]);

    SendPacket(&data);
}

void WorldSession::HandleSetAdvancedCombatLogging(WorldPacket& recvData)
{
    TC_LOG_DEBUG("network", "WORLD: Recvd CMSG_SET_ADVANCED_COMBAT_LOGGING");

    recvData.read_skip<bool>();
}
