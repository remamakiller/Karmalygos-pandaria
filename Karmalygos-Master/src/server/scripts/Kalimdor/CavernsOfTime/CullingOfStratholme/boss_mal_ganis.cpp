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

/* Script Data Start
SDName: Boss mal_ganis
SDCategory:
Script Data End */

#include "ScriptPCH.h"
#include "culling_of_stratholme.h"

enum Spells
{
    SPELL_CARRION_SWARM                         = 52720, // A cresting wave of chaotic magic splashes over enemies in front of the caster, dealing 3230 to 3570 Shadow damage and 380 to 420 Shadow damage every 3 sec. for 15 sec.
    SPELL_CARRION_SWARM_H                       = 58852,
    SPELL_MIND_BLAST                            = 52722, // Inflicts 4163 to 4837 Shadow damage to an enemy.
    SPELL_MIND_BLAST_H                          = 58850,
    SPELL_SLEEP                                 = 52721, // Puts an enemy to sleep for up to 10 sec. Any damage caused will awaken the target.
    SPELL_SLEEP_H                               = 58849,
    SPELL_VAMPIRIC_TOUCH                        = 52723, // Heals the caster for half the damage dealt by a melee attack.
    SPELL_KILL_CREDIT                           = 58630  // Non-existing spell as encounter credit, created in spell_dbc
};

enum Yells
{
    SAY_INTRO_1                                 = 0,
    SAY_INTRO_2                                 = 1,
    SAY_AGGRO                                   = 2,
    SAY_KILL                                    = 3,
    SAY_SLAY                                    = 4,
    SAY_SLEEP                                   = 5,
    SAY_30HEALTH                                = 6,
    SAY_15HEALTH                                = 7,
    SAY_ESCAPE_SPEECH_1                         = 8,
    SAY_ESCAPE_SPEECH_2                         = 9,
    SAY_OUTRO                                   = 10,
};

enum CombatPhases
{
    COMBAT,
    OUTRO
};

enum Npcs
{
    NPC_MALGANIS_KILL_CREDIT                    = 31006,
};

class boss_mal_ganis : public CreatureScript
{
    public:
        boss_mal_ganis() : CreatureScript("boss_mal_ganis") { }

        struct boss_mal_ganisAI : public ScriptedAI
        {
            boss_mal_ganisAI(Creature* creature) : ScriptedAI(creature)
            {
                instance = creature->GetInstanceScript();
            }

            uint32 uiCarrionSwarmTimer;
            uint32 uiMindBlastTimer;
            uint32 uiVampiricTouchTimer;
            uint32 uiSleepTimer;

            uint8 uiOutroStep;
            uint32 uiOutroTimer;

            bool bYelled;
            bool bYelled2;

            CombatPhases Phase;

            InstanceScript* instance;

            void Reset() override
            {
                 bYelled = false;
                 bYelled2 = false;
                 Phase = COMBAT;
                 uiCarrionSwarmTimer = 6000;
                 uiMindBlastTimer = 11000;
                 uiVampiricTouchTimer = urand(10000, 15000);
                 uiSleepTimer = urand(15000, 20000);
                 uiOutroTimer = 1000;

                 if (instance)
                     instance->SetData(DATA_MAL_GANIS_EVENT, NOT_STARTED);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                Talk(SAY_AGGRO);
                if (instance)
                    instance->SetData(DATA_MAL_GANIS_EVENT, IN_PROGRESS);
            }

            void DamageTaken(Unit* attacker, uint32& damage) override
            {
                if (damage >= me->GetHealth() && attacker != me)
                    damage = me->GetHealth() - 1;
            }

            void UpdateAI(uint32 diff) override
            {
                switch (Phase)
                {
                    case COMBAT:
                        if (!UpdateVictim())
                            return;

                        if (me->HasUnitState(UNIT_STATE_CASTING))
                            return;

                        if (!bYelled && HealthBelowPct(30))
                        {
                            Talk(SAY_30HEALTH);
                            bYelled = true;
                        }

                        if (!bYelled2 && HealthBelowPct(15))
                        {
                            Talk(SAY_15HEALTH);
                            bYelled2 = true;
                        }

                        if (HealthBelowPct(1))
                        {
                            // Handle Escape Event: Don't forget to add Player::RewardPlayerAndGroupAtEvent
                            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                            uiOutroStep = 1;
                            Phase = OUTRO;
                            return;
                        }

                        if (Creature* pArthas = me->GetCreature(*me, instance ? instance->GetData64(DATA_ARTHAS) : 0))
                            if (pArthas->isDead())
                            {
                                EnterEvadeMode();
                                me->DespawnOrUnsummon();
                                if (instance)
                                    instance->SetData(DATA_MAL_GANIS_EVENT, FAIL);
                            }

                        if (uiCarrionSwarmTimer <= diff)
                        {
                            DoCastVictim(DUNGEON_MODE(SPELL_CARRION_SWARM, SPELL_CARRION_SWARM_H));
                            uiCarrionSwarmTimer = 7000;
                        } else uiCarrionSwarmTimer -= diff;

                        if (uiMindBlastTimer <= diff)
                        {
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                DoCast(target, DUNGEON_MODE(SPELL_MIND_BLAST, SPELL_MIND_BLAST_H));
                            uiMindBlastTimer = 6000;
                        } else uiMindBlastTimer -= diff;

                        if (uiVampiricTouchTimer <= diff)
                        {
                            DoCast(me, SPELL_VAMPIRIC_TOUCH);
                            uiVampiricTouchTimer = 20000;
                        } else uiVampiricTouchTimer -= diff;

                        if (uiSleepTimer <= diff)
                        {
                            Talk(SAY_SLEEP);
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
                                DoCast(target, DUNGEON_MODE(SPELL_SLEEP, SPELL_SLEEP_H));
                            uiSleepTimer = urand(15000, 20000);
                        } else uiSleepTimer -= diff;

                        DoMeleeAttackIfReady();
                        break;
                    case OUTRO:
                        if (uiOutroTimer <= diff)
                        {
                            switch (uiOutroStep)
                            {
                                case 1:
                                    Talk(SAY_ESCAPE_SPEECH_1);
                                    me->GetMotionMaster()->MoveTargetedHome();
                                    ++uiOutroStep;
                                    uiOutroTimer = 8000;
                                    break;
                                case 2:
                                    me->SetTarget(instance ? instance->GetData64(DATA_ARTHAS) : 0);
                                    me->HandleEmoteCommand(29);
                                    Talk(SAY_ESCAPE_SPEECH_2);
                                    ++uiOutroStep;
                                    uiOutroTimer = 9000;
                                    break;
                                case 3:
                                    Talk(SAY_OUTRO);
                                    ++uiOutroStep;
                                    uiOutroTimer = 16000;
                                    break;
                                case 4:
                                    me->HandleEmoteCommand(33);
                                    ++uiOutroStep;
                                    uiOutroTimer = 500;
                                    break;
                                case 5:
                                    if (instance)
                                    {
                                        Map::PlayerList const& PlList = instance->instance->GetPlayers();
                                        if (!PlList.isEmpty())
                                            for (auto&& ref : PlList)
                                                if (Player* player = ref.GetSource())
                                                    player->KilledMonsterCredit(NPC_MALGANIS_KILL_CREDIT, 0);
                                    }
                                    me->SetVisible(false);
                                    me->Kill(me);
                                    break;

                            }
                        } else uiOutroTimer -= diff;
                        break;
                }
            }

            void JustDied(Unit* /*killer*/) override
            {
                if (instance)
                {
                    instance->SetData(DATA_MAL_GANIS_EVENT, DONE);

                    DoCast(me, SPELL_KILL_CREDIT);
                }
            }

            void KilledUnit(Unit* victim) override
            {
                if (victim->GetTypeId() != TYPEID_PLAYER)
                    return;

                Talk(SAY_SLAY);
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_mal_ganisAI (creature);
        }
};

void AddSC_boss_mal_ganis()
{
    new boss_mal_ganis();
}
