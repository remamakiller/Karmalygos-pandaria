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

#ifndef DEF_BLACKWING_LAIR_H
#define DEF_BLACKWING_LAIR_H

uint32 const EncounterCount     = 8;

#define BRLScriptName "instance_blackwing_lair"
#define MAX_TYPES 8

enum BWLEncounter
{
    BOSS_RAZORGORE              = 0,
    BOSS_VAELASTRAZ             = 1,
    BOSS_BROODLORD              = 2,
    BOSS_FIREMAW                = 3,
    BOSS_EBONROC                = 4,
    BOSS_FLAMEGOR               = 5,
    BOSS_CHROMAGGUS             = 6,
    BOSS_NEFARIAN               = 7
};

enum CreatureIds
{
    NPC_RAZORGORE               = 12435,
    NPC_BLACKWING_DRAGON        = 12422,
    NPC_BLACKWING_TASKMASTER    = 12458,
    NPC_BLACKWING_LEGIONAIRE    = 12416,
    NPC_BLACKWING_WARLOCK       = 12459,
    NPC_VAELASTRAZ              = 13020,
    NPC_BROODLORD               = 12017,
    NPC_FIRENAW                 = 11983,
    NPC_EBONROC                 = 14601,
    NPC_FLAMEGOR                = 11981,
    NPC_CHROMAGGUS              = 14020,
    NPC_VICTOR_NEFARIUS         = 10162,
    NPC_NEFARIAN                = 11583
};

enum BWLData64
{
    DATA_RAZORGORE_THE_UNTAMED = 1,
    DATA_VAELASTRAZ_THE_CORRUPT,
    DATA_BROODLORD_LASHLAYER,
    DATA_FIRENAW,
    DATA_EBONROC,
    DATA_FLAMEGOR,
    DATA_CHROMAGGUS,
    DATA_LORD_VICTOR_NEFARIUS,
    DATA_NEFARIAN,
};

enum BWLEvents
{
    EVENT_RAZOR_SPAWN       = 1,
    EVENT_RAZOR_PHASE_TWO   = 2,
    EVENT_RESPAWN_NEFARIUS  = 3
};

enum BWLMisc
{
    // Razorgore Egg Event
    ACTION_PHASE_TWO            = 1,
    DATA_EGG_EVENT
};

enum BLWGameObjects
{
    GO_PORTCULLIS_RAZORGORE_ENT = 176964,
    GO_PORTCULLIS_RAZORGORE     = 176965, // razorgore exit
    GO_PORTCULLIS_LASHLAYER     = 179365,
    GO_PORTCULLIS_FLAMEGOR      = 179115,
    GO_PORTCULLIS_CHROMAGGUS    = 179117,
    GO_PORTCULLIS_NEFARIAN      = 176966,
    GO_BLACK_DRAGON_EGG         = 177807,
};

#endif