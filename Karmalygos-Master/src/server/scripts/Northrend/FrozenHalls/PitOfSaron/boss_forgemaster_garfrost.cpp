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

#include "ScriptPCH.h"
#include "pit_of_saron.h"

enum Yells
{
    SAY_AGGRO           = 0,
    SAY_SLAY            = 1,
    SAY_DEATH           = 2,
    SAY_PHASE2          = 3,
    SAY_PHASE3          = 4,

    SAY_TYRANNUS_DEATH  = 0,
};

enum Spells
{
    SPELL_PERMAFROST         = 70326,
    SPELL_THROW_SARONITE     = 68788,
    SPELL_THUNDERING_STOMP   = 68771,
    //SPELL_CHILLING_WAVE      = 68778,
    //SPELL_DEEP_FREEZE        = 70381,
    SPELL_FORGE_MACE         = 68785,
    SPELL_FORGE_BLADE        = 68774,
    SPELL_CHILLING_WAVE      = 68778,
    SPELL_DEEP_FREEZE        = 70381,
    SPELL_PERMAFROST_HELPER  = 68786,
    SPELL_FORGE_BLADE_HELPER = 68774,
};

enum eEvents
{
    EVENT_THROW_SARONITE        = 1,
    EVENT_CHILLING_WAVE         = 2,
    EVENT_DEEP_FREEZE           = 3,
    EVENT_JUMP_FORGE            = 4,
    EVENT_FORGING               = 5,
    EVENT_RESUME_ATTACK         = 6,
};

enum ePhases
{
    PHASE_ONE                   = 1,
    PHASE_TWO                   = 2,
    PHASE_THREE                 = 3
};

enum eMiscData
{
    EQUIP_ID_SWORD              = 49345,
    EQUIP_ID_MACE               = 49344,
    ACHIEV_DOESNT_GO_TO_ELEVEN  = 0,
    POINT_FORGE                 = 1,
};

Position const northForgePos = { 722.5643f, -234.1615f, 527.182f, 2.16421f };
Position const southForgePos = { 639.257f, -210.1198f, 529.015f, 0.523599f };

class boss_garfrost : public CreatureScript
{
    public:
        boss_garfrost() : CreatureScript("boss_garfrost") { }

        struct boss_garfrostAI : public BossAI
        {
            boss_garfrostAI(Creature* creature) : BossAI(creature, DATA_GARFROST) { }

            void InitializeAI() override
            {
                if (!instance || static_cast<InstanceMap*>(me->GetMap())->GetScriptId() != sObjectMgr->GetScriptId(PoSScriptName))
                    me->IsAIEnabled = false;
                else if (!me->isDead())
                    Reset();
            }

            void Reset() override
            {
                events.Reset();
                events.SetPhase(PHASE_ONE);
                SetEquipmentSlots(true);
                _permafrostStack = 0;

                me->GetMap()->SetWorldState(WORLDSTATE_DOESNT_GO_TO_ELEVEN, 1);
                instance->SetBossState(DATA_GARFROST, NOT_STARTED);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                Talk(SAY_AGGRO);
                DoCast(me, SPELL_PERMAFROST);
                events.ScheduleEvent(EVENT_THROW_SARONITE, 7000);

                instance->SetBossState(DATA_GARFROST, IN_PROGRESS);
            }

            void KilledUnit(Unit* victim) override
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_SLAY);
            }

            void JustDied(Unit* /*killer*/) override
            {
                Talk(SAY_DEATH);
                if (Creature* tyrannus = me->GetCreature(*me, instance->GetData64(DATA_TYRANNUS)))
                    tyrannus->AI()->Talk(SAY_TYRANNUS_DEATH);

                instance->SetBossState(DATA_GARFROST, DONE);
            }

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/)
            {
                if (events.IsInPhase(PHASE_ONE) && !HealthAbovePct(66))
                {
                    events.SetPhase(PHASE_TWO);
                    Talk(SAY_PHASE2);
                    events.DelayEvents(8000);
                    DoCast(me, SPELL_THUNDERING_STOMP);
                    events.ScheduleEvent(EVENT_JUMP_FORGE, 1500);
                    return;
                }

                if (events.IsInPhase(PHASE_TWO) && !HealthAbovePct(33))
                {
                    events.SetPhase(PHASE_THREE);
                    Talk(SAY_PHASE3);
                    events.DelayEvents(8000);
                    DoCast(me, SPELL_THUNDERING_STOMP);
                    events.ScheduleEvent(EVENT_JUMP_FORGE, 1500);
                    return;
                }
            }

            void MovementInform(uint32 type, uint32 pointId) override
            {
                if (type != EFFECT_MOTION_TYPE || pointId != POINT_FORGE)
                    return;

                if (events.IsInPhase(PHASE_TWO))
                    DoCast(me, SPELL_FORGE_BLADE);
                if (events.IsInPhase(PHASE_THREE))
                {
                    me->RemoveAurasDueToSpell(SPELL_FORGE_BLADE_HELPER);
                    DoCast(me, SPELL_FORGE_MACE);
                }
                events.ScheduleEvent(EVENT_RESUME_ATTACK, 5000);
            }

            void SpellHitTarget(Unit* target, const SpellInfo* spell) override
            {
                if (spell->Id == SPELL_PERMAFROST_HELPER)
                {
                    if (Aura* aura = target->GetAura(SPELL_PERMAFROST_HELPER))
                        _permafrostStack = std::max<uint32>(_permafrostStack, aura->GetStackAmount());

                    if (_permafrostStack > 10)
                        me->GetMap()->SetWorldState(WORLDSTATE_DOESNT_GO_TO_ELEVEN, 0);
                }
                else if (spell->Id == SPELL_FORGE_BLADE)
                    SetEquipmentSlots(false, EQUIP_ID_SWORD);
                else if (spell->Id == SPELL_FORGE_MACE)
                    SetEquipmentSlots(false, EQUIP_ID_MACE);
            }

            uint32 GetData(uint32 /*type*/) const override
            {
                return _permafrostStack;
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_THROW_SARONITE:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_THROW_SARONITE);
                            events.ScheduleEvent(EVENT_THROW_SARONITE, urand(12500, 20000));
                            break;
                        case EVENT_CHILLING_WAVE:
                            DoCast(me, SPELL_CHILLING_WAVE);
                            events.ScheduleEvent(EVENT_CHILLING_WAVE, 40000, 0, PHASE_TWO);
                            break;
                        case EVENT_DEEP_FREEZE:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_DEEP_FREEZE);
                            events.ScheduleEvent(EVENT_DEEP_FREEZE, 35000, 0, PHASE_THREE);
                            break;
                        case EVENT_JUMP_FORGE:
                            me->AttackStop();
                            if (events.IsInPhase(PHASE_TWO))
                                me->GetMotionMaster()->MoveJump(northForgePos.GetPositionX(), northForgePos.GetPositionY(), northForgePos.GetPositionZ(), 25.0f, 15.0f, POINT_FORGE);
                            else if (events.IsInPhase(PHASE_THREE))
                                me->GetMotionMaster()->MoveJump(southForgePos.GetPositionX(), southForgePos.GetPositionY(), southForgePos.GetPositionZ(), 25.0f, 15.0f, POINT_FORGE);
                            break;
                        case EVENT_RESUME_ATTACK:
                            if (events.IsInPhase(PHASE_THREE))
                                events.ScheduleEvent(EVENT_CHILLING_WAVE, 5000, 0, PHASE_TWO);
                            else if (events.IsInPhase(PHASE_THREE))
                                events.ScheduleEvent(EVENT_DEEP_FREEZE, 10000, 0, PHASE_THREE);
                            AttackStart(me->GetVictim());
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();

                EnterEvadeIfOutOfCombatArea(diff);
            }

        private:
            uint32 _permafrostStack;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_garfrostAI(creature);
        }
};

class spell_garfrost_permafrost : public SpellScriptLoader
{
    public:
        spell_garfrost_permafrost() : SpellScriptLoader("spell_garfrost_permafrost") { }

        class spell_garfrost_permafrost_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_garfrost_permafrost_SpellScript);

            bool Load() override
            {
                prevented = false;
                return true;
            }

            void PreventHitByLoS()
            {
                if (Unit* target = GetHitUnit())
                {
                    Unit* caster = GetCaster();
                    // Temporary Line of Sight Check
                    std::list<GameObject*> blockList;
                    caster->GetGameObjectListWithEntryInGrid(blockList, GO_SARONITE_ROCK, 100.0f);
                    if (!blockList.empty())
                    {
                        for (auto&& go : blockList)
                        {
                            if (!go->IsInvisibleDueToDespawn())
                            {
                                if (go->IsInBetween(caster, target, 4.0f))
                                {
                                    prevented = true;
                                    target->ApplySpellImmune(GetSpellInfo()->Id, IMMUNITY_ID, GetSpellInfo()->Id, true);
                                    PreventHitDefaultEffect(EFFECT_0);
                                    PreventHitDefaultEffect(EFFECT_1);
                                    PreventHitDefaultEffect(EFFECT_2);
                                    PreventHitDamage();
                                    break;
                                }
                            }
                        }
                    }
                }
            }

            void RestoreImmunity()
            {
                if (Unit* target = GetHitUnit())
                {
                    target->ApplySpellImmune(GetSpellInfo()->Id, IMMUNITY_ID, GetSpellInfo()->Id, false);
                    if (prevented)
                        PreventHitAura();
                }
            }

            void Register() override
            {
                BeforeHit += SpellHitFn(spell_garfrost_permafrost_SpellScript::PreventHitByLoS);
                AfterHit += SpellHitFn(spell_garfrost_permafrost_SpellScript::RestoreImmunity);
            }

            bool prevented;
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_garfrost_permafrost_SpellScript();
        }
};

void AddSC_boss_garfrost()
{
    new boss_garfrost();
    new spell_garfrost_permafrost();
}
