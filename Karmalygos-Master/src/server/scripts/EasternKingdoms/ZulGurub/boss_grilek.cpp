#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "zulgurub.h"

enum Yells
{
    SAY_AGGRO           = 0,
    SAY_DEATH           = 1,
    SAY_FIXATE          = 2,
    SAY_KILL            = 3,
    SAY_ROOT            = 4,
    SAY_FIXATE_ANNOUNCE = 5
};

enum Spells
{
    SPELL_AVATAR                 = 96618,
    SPELL_ENTANGLING_ROOTS       = 96633,
    SPELL_PURSUIT                = 96631,
    SPELL_RUPTURE_LINE           = 96619,
    SPELL_RUPTURE_LINE_TRIGGERED = 96620
};

enum Events
{
    EVENT_PURSUIT          = 1,
    EVENT_PURSUIT_END      = 2,
    EVENT_ENTANGLING_ROOTS = 3,
    EVENT_RUPTURE_LINE     = 4
};

enum Phases
{
    PHASE_PURSUIT = 1
};

class boss_grilek : public CreatureScript
{
    public:
        boss_grilek() : CreatureScript("boss_grilek") { }

        struct boss_grilekAI : public BossAI
        {
            boss_grilekAI(Creature* creature) : BossAI(creature, DATA_CACHE_OF_MADNESS_BOSS)
            {
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SAPPED, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);
            }

            void Reset() override
            {
                _Reset();

                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, false);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, false);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                _EnterCombat();
                Talk(SAY_AGGRO);

                events.ScheduleEvent(EVENT_RUPTURE_LINE, 15000);
                events.ScheduleEvent(EVENT_PURSUIT, 17000);
            }

            void JustDied(Unit* /*killer*/) override
            {
                _JustDied();
                Talk(SAY_DEATH);
            }

            void KilledUnit(Unit* /*victim*/) override
            {
                Talk(SAY_KILL);
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_PURSUIT:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            {
                                DoCast(me, SPELL_AVATAR);
                                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
                                me->SetTarget(target->GetGUID());
                                DoCast(target, SPELL_PURSUIT);
                                Talk(SAY_FIXATE);
                                Talk(SAY_FIXATE_ANNOUNCE, target);
                                events.AddPhase(PHASE_PURSUIT);
                                events.ScheduleEvent(EVENT_PURSUIT_END, 15000);
                                events.ScheduleEvent(EVENT_ENTANGLING_ROOTS, 12000);
                            }
                            events.ScheduleEvent(EVENT_PURSUIT, 45000);
                            break;
                        case EVENT_PURSUIT_END:
                            events.RemovePhase(PHASE_PURSUIT);
                            me->getThreatManager().resetAllAggro();
                            me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, false);
                            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, false);
                            break;
                        case EVENT_ENTANGLING_ROOTS:
                            if (events.IsInPhase(PHASE_PURSUIT))
                            {
                                if (me->GetDistance(me->GetVictim()) <= 30)
                                {
                                    DoCastVictim(SPELL_ENTANGLING_ROOTS);
                                    Talk(SAY_ROOT);
                                }
                            }
                            break;
                        case EVENT_RUPTURE_LINE:
                            if (events.IsInPhase(PHASE_PURSUIT))
                                events.ScheduleEvent(EVENT_RUPTURE_LINE, 2000);
                            else
                            {
                                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                    DoCast(target, SPELL_RUPTURE_LINE, true);
                                events.ScheduleEvent(EVENT_RUPTURE_LINE, 17000);
                            }
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            void SpellHitTarget(Unit* target, const SpellInfo* spell) override
            {
                if (target && spell->Id == SPELL_PURSUIT)
                {
                    me->getThreatManager().resetAllAggro();
                    me->getThreatManager().addThreat(target, 100000);
                    me->SetTarget(target->GetGUID());
                    me->GetMotionMaster()->Clear();
                    me->GetMotionMaster()->MoveChase(target);
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<boss_grilekAI>(creature);
        }
};

class spell_grilek_rupture_line : public SpellScriptLoader
{
    public:
        spell_grilek_rupture_line() : SpellScriptLoader("spell_grilek_rupture_line") { }

        class spell_grilek_rupture_line_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_grilek_rupture_line_SpellScript);

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                if (Unit* caster = GetCaster())
                    if (Unit* target = GetHitUnit())
                    {
                        Position casterPos, targetPos;
                        caster->GetPosition(&casterPos);
                        target->GetPosition(&targetPos);
                        float direction = caster->GetAngle(&targetPos);
                        direction += M_PI / 6;
                        float distance = 0;
                        bool right = true;
                        int steps = 8;
                        float x = casterPos.GetPositionX(),
                              y = casterPos.GetPositionY(),
                              z = casterPos.GetPositionZ();
                        while (distance < 45)
                        {
                            caster->CastSpell(x + distance * cosf(direction), y + distance * sinf(direction), z, SPELL_RUPTURE_LINE_TRIGGERED, true);
                            distance += 0.75f;
                            if (--steps <= 0)
                            {
                                steps = 8;
                                right = !right;
                            }
                            if (right)
                                direction -= M_PI / 24;
                            else
                                direction += M_PI / 24;
                        }
                    }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_grilek_rupture_line_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_grilek_rupture_line_SpellScript();
        }
};

void AddSC_boss_grilek()
{
    new boss_grilek();
    new spell_grilek_rupture_line();
}
