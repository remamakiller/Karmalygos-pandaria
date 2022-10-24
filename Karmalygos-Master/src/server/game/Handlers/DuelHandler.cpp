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
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Log.h"
#include "Opcodes.h"
#include "UpdateData.h"
#include "Player.h"
#include "ObjectAccessor.h"

#define SPELL_DUEL         7266
#define SPELL_MOUNTED_DUEL 62875

void WorldSession::HandleDuelProposedOpcode(WorldPacket& recvPacket)
{
    ObjectGuid guid;

    guid[1] = recvPacket.ReadBit();
    guid[5] = recvPacket.ReadBit();
    guid[4] = recvPacket.ReadBit();
    guid[6] = recvPacket.ReadBit();
    guid[3] = recvPacket.ReadBit();
    guid[2] = recvPacket.ReadBit();
    guid[7] = recvPacket.ReadBit();
    guid[0] = recvPacket.ReadBit();

    recvPacket.ReadByteSeq(guid[4]);
    recvPacket.ReadByteSeq(guid[2]);
    recvPacket.ReadByteSeq(guid[5]);
    recvPacket.ReadByteSeq(guid[7]);
    recvPacket.ReadByteSeq(guid[1]);
    recvPacket.ReadByteSeq(guid[3]);
    recvPacket.ReadByteSeq(guid[6]);
    recvPacket.ReadByteSeq(guid[0]);

    if (Player* player = sObjectAccessor->FindPlayer(guid))
    {
        if (_player->IsMounted())
            _player->CastSpell(player, SPELL_MOUNTED_DUEL, false);
        else
            _player->CastSpell(player, SPELL_DUEL, false);
    }
}

void WorldSession::HandleDuelResponseOpcode(WorldPacket& recvPacket)
{
    bool accepted;
    ObjectGuid guid;
    Player* player;
    Player* plTarget;

    guid[7] = recvPacket.ReadBit();
    guid[1] = recvPacket.ReadBit();
    guid[3] = recvPacket.ReadBit();
    guid[4] = recvPacket.ReadBit();
    guid[0] = recvPacket.ReadBit();
    guid[2] = recvPacket.ReadBit();
    guid[6] = recvPacket.ReadBit();
    accepted = recvPacket.ReadBit();
    guid[5] = recvPacket.ReadBit();

    recvPacket.ReadByteSeq(guid[6]);
    recvPacket.ReadByteSeq(guid[4]);
    recvPacket.ReadByteSeq(guid[5]);
    recvPacket.ReadByteSeq(guid[0]);
    recvPacket.ReadByteSeq(guid[1]);
    recvPacket.ReadByteSeq(guid[2]);
    recvPacket.ReadByteSeq(guid[7]);
    recvPacket.ReadByteSeq(guid[3]);

    if (!GetPlayer()->duel)                                  // ignore accept from duel-sender
        return;

    if (accepted)
    {
        player = GetPlayer();
        plTarget = player->duel->opponent;

        if (player == player->duel->initiator || !plTarget || player == plTarget || player->duel->startTime != 0 || plTarget->duel->startTime != 0)
            return;

        //TC_LOG_DEBUG("network", "WORLD: Received CMSG_DUEL_ACCEPTED");
        TC_LOG_DEBUG("network", "Player 1 is: %u (%s)", player->GetGUIDLow(), player->GetName().c_str());
        TC_LOG_DEBUG("network", "Player 2 is: %u (%s)", plTarget->GetGUIDLow(), plTarget->GetName().c_str());

        time_t now = time(NULL);
        player->duel->startTimer = now;
        plTarget->duel->startTimer = now;

        player->SendDuelCountdown(3000);
        plTarget->SendDuelCountdown(3000);
    }
    else
    {
        // player surrendered in a duel using /forfeit
        if (GetPlayer()->duel->startTime != 0)
        {
            GetPlayer()->DuelComplete(DUEL_SURRENDER);
            return;
        }

        GetPlayer()->DuelComplete(DUEL_INTERRUPTED);
    }
}
