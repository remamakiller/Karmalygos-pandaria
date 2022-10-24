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

#ifndef DEF_PINNACLE_H
#define DEF_PINNACLE_H

enum InstanceData
{
    DATA_SVALA_SORROWGRAVE_EVENT,
    DATA_GORTOK_PALEHOOF_EVENT,
    DATA_SKADI_THE_RUTHLESS_EVENT,
    DATA_KING_YMIRON_EVENT
};
enum InstanceData64
{
    DATA_SVALA,
    DATA_SVALA_SORROWGRAVE,
    DATA_GORTOK_PALEHOOF,
    DATA_SKADI_THE_RUTHLESS,
    DATA_GRAUF,
    DATA_KING_YMIRON,
    DATA_NPC_FRENZIED_WORGEN,
    DATA_NPC_RAVENOUS_FURBOLG,
    DATA_NPC_MASSIVE_JORMUNGAR,
    DATA_NPC_FEROCIOUS_RHINO,
    DATA_NPC_ORB,
    DATA_GORTOK_PALEHOOF_SPHERE,
    DATA_FLAME_BRAZIER_1,
    DATA_FLAME_BRAZIER_2,
    DATA_DOODAD_UTGARDE_MIRROR_FX01,
};

enum eCreatures
{
    NPC_SVALA_SORROWGRAVE           = 26668,
    NPC_GORTOK_PALEHOOF             = 26687,
    NPC_SKADI_RUTHLESS              = 26693,
    NPC_KING_YMIRON                 = 26861,
    NPC_FRENZIED_WORGEN             = 26683,
    NPC_RAVENOUS_FURBOLG            = 26684,
    NPC_MASSIVE_JORMUNGAR           = 26685,
    NPC_FEROCIOUS_RHINO             = 26686,
    NPC_SVALA                       = 29281,
    NPC_PALEHOOF_ORB                = 26688,
    NPC_FLAME_BRAZIER               = 27273,
    NPC_RITUAL_TARGET               = 27327,

    // Skadi
    NPC_GRAUF                       = 26893,
    NPC_YMIRJAR_WARRIOR             = 26690,
    NPC_YMIRJAR_WITCH_DOCTOR        = 26691,
    NPC_YMIRJAR_HARPOONER           = 26692,
    NPC_TRIGGER_RESET               = 23472,
    NPC_TRIGGER2                    = 19871,
    NPC_WORLD_TRIGGER               = 22515,
    NPC_COMBAT_TRIGGER              = 38667,
};

enum Worldstates
{
    WORLDSTATE_KINGS_BANE = 6428,
};

template<class AI>
CreatureAI* GetInstanceAI(Creature* creature)
{
    if (InstanceMap* instance = creature->GetMap()->ToInstanceMap())
        if (instance->GetInstanceScript())
            if (instance->GetScriptId() == sObjectMgr->GetScriptId("instance_utgarde_pinnacle"))
                return new AI(creature);
    return NULL;
}

#endif
