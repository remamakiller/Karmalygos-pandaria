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

#ifndef DEF_RAMPARTS_H
#define DEF_RAMPARTS_H

uint32 const EncounterCount       = 4;

enum DataTypes
{
    DATA_WATCHKEEPER_GARGOLMAR    = 0,
    DATA_OMOR_THE_UNSCARRED       = 1,
    DATA_VAZRUDEN                 = 2,
    DATA_NAZAN                    = 3
};

enum CreatureIds
{
    NPC_HELLFIRE_SENTRY           = 17517,
    NPC_VAZRUDEN_HERALD           = 17307,
    NPC_VAZRUDEN                  = 17537,
    NPC_NAZAN                     = 17536,
    NPC_LIQUID_FIRE               = 22515,

    // Horde
    NPC_THRALLMAR_INVADER         = 54607,
    NPC_STONE_GUARD_STOKTON       = 54606,

    // Alliance
    NPC_HONOR_HOLD_RECON          = 54746,
    NPC_ADVANCE_SCOUT_CHADWICK    = 54603,
};

enum GameobjectIds
{
    GO_FEL_IRON_CHEST_NORMAL      = 185168,
    GO_FEL_IRON_CHECT_HEROIC      = 185169,

    GO_HELLFIRE_SUPLICE_H         = 209347,
    GO_HELLFIRE_SUPLICE_A         = 209348,
};

#endif
