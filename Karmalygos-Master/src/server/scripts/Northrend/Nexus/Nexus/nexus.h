/*
 * Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2016 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2006-2014 ScriptDev2 <https://github.com/scriptdev2/scriptdev2/>
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

#ifndef DEF_NEXUS_H
#define DEF_NEXUS_H

enum eTypes
{
    DATA_MAGUS_TELESTRA_EVENT,
    DATA_ANOMALUS_EVENT,
    DATA_ORMOROK_EVENT,
    DATA_KERISTRASZA_EVENT,

    DATA_ANOMALUS,
    DATA_KERISTRASZA,
    DATA_COMMANDER,

    ANOMALUS_CONTAINMET_SPHERE,
    ORMOROKS_CONTAINMET_SPHERE,
    TELESTRAS_CONTAINMET_SPHERE
};

enum Npcs
{
    NPC_ANOMALUS                    = 26763,
    NPC_KERISTRASZA                 = 26723,
    NPC_ALLIANCE_BERSERKER          = 26800,
    NPC_ALLIANCE_RANGER             = 26802,
    NPC_ALLIANCE_CLERIC             = 26805,
    NPC_ALLIANCE_COMMANDER          = 27949,
    NPC_HORDE_BERSERKER             = 26799,
    NPC_HORDE_RANGER                = 26801,
    NPC_HORDE_CLERIC                = 26803,
    NPC_HORDE_COMMANDER             = 27947,
    NPC_COMMANDER_STOUTBEARD        = 26796,
    NPC_COMMANDER_KOLURG            = 26798
};

enum GameObjects
{
    GO_ANOMALUS_CONTAINMENT_SPHERE  = 188527,
    GO_ORMOROKS_CONTAINMENT_SPHERE  = 188528,
    GO_TELESTRAS_CONTAINMENT_SPHERE = 188526,
};

#endif
