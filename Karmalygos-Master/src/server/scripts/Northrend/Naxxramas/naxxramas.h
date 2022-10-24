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

#ifndef DEF_NAXXRAMAS_H
#define DEF_NAXXRAMAS_H

uint32 const EncounterCount     = 15;

enum Encounter
{
    BOSS_ANUBREKHAN,
    BOSS_FAERLINA,
    BOSS_MAEXXNA,
    BOSS_NOTH,
    BOSS_HEIGAN,
    BOSS_LOATHEB,
    BOSS_PATCHWERK,
    BOSS_GROBBULUS,
    BOSS_GLUTH,
    BOSS_THADDIUS,
    BOSS_RAZUVIOUS,
    BOSS_GOTHIK,
    BOSS_HORSEMEN,
    BOSS_SAPPHIRON,
    BOSS_KELTHUZAD
};

enum Data
{
    DATA_HEIGAN_ERUPT,
    DATA_GOTHIK_GATE,
    DATA_SAPPHIRON_BIRTH,

    DATA_HORSEMEN0,
    DATA_HORSEMEN1,
    DATA_HORSEMEN2,
    DATA_HORSEMEN3,
    DATA_ABOMINATION_KILLED,
};

enum Data64
{
    DATA_FAERLINA,
    DATA_THANE,
    DATA_LADY,
    DATA_BARON,
    DATA_SIR,
    DATA_THADDIUS,
    DATA_HEIGAN,
    DATA_FEUGEN,
    DATA_STALAGG,
    DATA_KELTHUZAD,
    DATA_KELTHUZAD_PORTAL01,
    DATA_KELTHUZAD_PORTAL02,
    DATA_KELTHUZAD_PORTAL03,
    DATA_KELTHUZAD_PORTAL04,
    DATA_KELTHUZAD_TRIGGER,
};

enum CreaturesIds
{
    NPC_FAERLINA                = 15953,
    NPC_THANE                   = 16064,
    NPC_LADY                    = 16065,
    NPC_BARON                   = 30549,
    NPC_SIR                     = 16063,
    NPC_THADDIUS                = 15928,
    NPC_HEIGAN                  = 15936,
    NPC_FEUGEN                  = 15930,
    NPC_STALAGG                 = 15929,
    NPC_SAPPHIRON               = 15989,
    NPC_KEL_THUZAD              = 15990,
    NPC_CRYPT_GUARD             = 16573,
    NPC_NAXXRAMAS_FOLLOWER      = 16505,
    NPC_FOLLOWER_WORSHIPPER     = 16506,
    NPC_DK_UNDERSTUDY           = 16803
};

enum GameObjectsIds
{
    GO_HORSEMEN_CHEST_HERO      = 193426,
    GO_HORSEMEN_CHEST           = 181366,
    GO_GOTHIK_GATE              = 181170,
    GO_KELTHUZAD_PORTAL01       = 181402,
    GO_KELTHUZAD_PORTAL02       = 181403,
    GO_KELTHUZAD_PORTAL03       = 181404,
    GO_KELTHUZAD_PORTAL04       = 181405,
    GO_KELTHUZAD_TRIGGER        = 181444,
    GO_ROOM_ANUBREKHAN          = 181126,
    GO_PASSAGE_ANUBREKHAN       = 181195,
    GO_PASSAGE_FAERLINA         = 194022,
    GO_ROOM_MAEXXNA             = 181209,
    GO_ROOM_NOTH                = 181200,
    GO_PASSAGE_NOTH             = 181201,
    GO_ROOM_HEIGAN              = 181202,
    GO_PASSAGE_HEIGAN           = 181203,
    GO_ROOM_LOATHEB             = 181241,
    GO_ROOM_GROBBULUS           = 181123,
    GO_PASSAGE_GLUTH            = 181120,
    GO_ROOM_THADDIUS            = 181121,
    GO_ROOM_GOTHIK              = 181124,
    GO_PASSAGE_GOTHIK           = 181125,
    GO_ROOM_HORSEMEN            = 181119,
    GO_PASSAGE_SAPPHIRON        = 181225,
    GO_ROOM_KELTHUZAD           = 181228,
    GO_ARAC_PORTAL              = 181575,
    GO_PLAG_PORTAL              = 181577,
    GO_MILI_PORTAL              = 181578,
    GO_CONS_PORTAL              = 181576,
    GO_ARAC_EYE_RAMP            = 181212,
    GO_PLAG_EYE_RAMP            = 181211,
    GO_MILI_EYE_RAMP            = 181210,
    GO_CONS_EYE_RAMP            = 181213,
    GO_ARAC_EYE_RAMP_BOSS       = 181233,
    GO_PLAG_EYE_RAMP_BOSS       = 181231,
    GO_MILI_EYE_RAMP_BOSS       = 181230,
    GO_CONS_EYE_RAMP_BOSS       = 181232,
    GO_CONS_NOX_TESLA_FEUGEN    = 181477,
    GO_CONS_NOX_TESLA_STALAGG   = 181478,
    GO_BIRTH                    = 181356,
    GO_ORB_OF_NAXXRAMAS         = 202278,
};

enum SpellIds
{
    SPELL_ERUPTION              = 29371,
    SPELL_SLIME                 = 28801
};

enum Worldstates
{
    WORLDSTATE_HUNDRED_CLUB           = 6414,
    WORLDSTATE_SAFETY_DANCE           = 6319,
    WORLDSTATE_MOMMA_SAID_KNOCK_U_OUT = 6323,
    WORLDSTATE_SHOCKING               = 6433,
    WORLDSTATE_SPORE_LOSER            = 6436,
    WORLDSTATE_GO_DOWN_TOGETHER       = 6431,
    WORLDSTATE_JUST_CANT_GET_ENOUGH   = 6438,
};

const std::map<uint32, uint32> invPortalType =
{
    { BOSS_THADDIUS, GO_CONS_PORTAL },
    { BOSS_MAEXXNA,  GO_ARAC_PORTAL },
    { BOSS_LOATHEB,  GO_PLAG_PORTAL },
    { BOSS_HORSEMEN, GO_MILI_PORTAL },
};
/*
template<class AI>
CreatureAI* GetNaxxramasAI(Creature* creature)
{
    if (InstanceMap* instance = creature->GetMap()->ToInstanceMap())
        if (instance->GetInstanceScript())
            if (instance->GetScriptId() == sObjectMgr->GetScriptId(NaxxramasScriptName))
                return new AI(creature);

    return NULL;
}
*/

#endif
