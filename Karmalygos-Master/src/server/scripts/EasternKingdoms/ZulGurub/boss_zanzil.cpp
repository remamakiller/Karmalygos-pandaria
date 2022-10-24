#include "ScriptPCH.h"
#include "zulgurub.h"

enum ScriptTexts
{
    SAY_AGGRO   = 0,
    SAY_DEATH   = 1,
    SAY_GAS     = 2,
    SAY_KILL    = 3,
    SAY_BERSERK = 4,
    SAY_TROLLS  = 5,
};

enum Spells
{
    SPELL_VOODOO_BOLT   = 96346,
    SPELL_ZANZIL_FIRE   = 96914,
    SPELL_ZANZIL_FIRE1  = 96916,
    SPELL_ZANZIL_RES1   = 96319, // zombie
    SPELL_ZANZIL_RES2   = 96316, // berserker

    SPELL_PURSUIT       = 96342,
    SPELL_THUNDERCLAP   = 96340,
    SPELL_KNOCK_AWAY    = 96341,
};

enum Events
{
    EVENT_ZANZIL_FIRE   = 1,
    EVENT_VOODOO_BOLT   = 2,
    EVENT_CAST_ZOMBIE   = 3,
    EVENT_CAST_BERSERK  = 4,
    EVENT_RES_ZOMBIE    = 5,
    EVENT_RES_BERSERK   = 6,
};

enum Adds
{
    NPC_ZANZIL_ZOMBIE       = 52055,
    NPC_ZANZIL_BERSERKER    = 52054,
    NPC_ZANZIL_TOXIC_GAS    = 52062,
};

const Position berserkerPos[3] = 
{
    {-11603.59f, -1233.59f, 81.40f, 5.20f},
    {-11545.00f, -1240.56f, 81.55f, 3.92f},
    {-11541.40f, -1298.15f, 85.25f, 2.33f}
};

const Position zombiePos[4] =
{
    {-11590.67f, -1255.56f, 78.15f, 0.0f},
    {-11539.32f, -1259.71f, 78.98f, 0.0f},
    {-11586.93f, -1331.94f, 79.50f, 0.0f},
    {-11617.71f, -1315.54f, 79.40f, 0.0f}
};


class boss_zanzil : public CreatureScript
{
    public:
        boss_zanzil() : CreatureScript("boss_zanzil") { }

        struct boss_zanzilAI : public BossAI
        {
            boss_zanzilAI(Creature* creature) : BossAI(creature, DATA_ZANZIL)
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
            }

            void Reset() override
            {
                _Reset();

                //for (uint8 i = 0; i < 3; ++i)
                    //me->SummonCreature(NPC_ZANZIL_BERSERKER, berserkerPos[i]);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                Talk(SAY_AGGRO);
                events.ScheduleEvent(EVENT_VOODOO_BOLT, urand(3000, 5000));
                events.ScheduleEvent(EVENT_ZANZIL_FIRE, 6000);
                events.ScheduleEvent(urand(0, 1)? EVENT_CAST_ZOMBIE: EVENT_CAST_BERSERK, 30000);
                DoZoneInCombat();
                instance->SetBossState(DATA_ZANZIL, IN_PROGRESS); 
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
            
            void SpellHit(Unit* /*caster*/, const SpellInfo* spell) override
            {
                if (me->GetCurrentSpell(CURRENT_GENERIC_SPELL))
                    if (me->GetCurrentSpell(CURRENT_GENERIC_SPELL)->m_spellInfo->Id == SPELL_VOODOO_BOLT)
                        for (uint8 i = 0; i < 3; ++i)
                            if (spell->Effects[i].Effect == SPELL_EFFECT_INTERRUPT_CAST)
                                me->InterruptSpell(CURRENT_GENERIC_SPELL);
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
                        case EVENT_VOODOO_BOLT:
                            DoCastVictim(SPELL_VOODOO_BOLT);
                            events.ScheduleEvent(EVENT_VOODOO_BOLT, urand(7000, 10000));
                            break;
                        case EVENT_ZANZIL_FIRE:
                            DoCastVictim(SPELL_ZANZIL_FIRE);
                            events.ScheduleEvent(EVENT_ZANZIL_FIRE, urand(12000, 15000));
                            break;
                        case EVENT_CAST_ZOMBIE:
                            Talk(SAY_TROLLS);
                            DoCast(me, SPELL_ZANZIL_RES1);
                            events.ScheduleEvent(EVENT_RES_ZOMBIE, 3000);
                            events.ScheduleEvent(EVENT_CAST_BERSERK, 45000);
                            break;
                        case EVENT_RES_ZOMBIE:
                        {
                            uint8 pos = urand(0, 3);
                            for (uint8 i = 0; i < 15; ++i)
                                me->SummonCreature(NPC_ZANZIL_ZOMBIE, zombiePos[pos]);
                            break;
                        }
                        case EVENT_CAST_BERSERK:
                            Talk(SAY_BERSERK);
                            DoCast(me, SPELL_ZANZIL_RES2);
                            events.ScheduleEvent(EVENT_RES_BERSERK, 3000);
                            events.ScheduleEvent(EVENT_CAST_ZOMBIE, 45000);
                            break;
                        case EVENT_RES_BERSERK:
                            me->SummonCreature(NPC_ZANZIL_BERSERKER, berserkerPos[urand(0,2)]);
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<boss_zanzilAI>(creature);
        }
};

class npc_zanzil_berserker : public CreatureScript
{
    public:
        npc_zanzil_berserker() : CreatureScript("npc_zanzil_berserker") { }

        struct npc_zanzil_berserkerAI : public ScriptedAI
        {
            npc_zanzil_berserkerAI(Creature* creature) : ScriptedAI(creature) 
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
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
                me->SetSpeed(MOVE_RUN, 0.5f);
            }
            
            bool bSpell;
            uint32 spellTimer;
            uint32 pursuitTimer;

            void Reset() override
            {
                bSpell = true;
                spellTimer = 0;
                pursuitTimer = 3000;
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
            }
            
            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                if (!bSpell)
                {
                    if (spellTimer <= diff)
                    {
                        bSpell = true;
                        spellTimer = 12000;
                    }
                    else
                        spellTimer -= diff;
                }

                if (bSpell)
                    if (Unit* target = me->SelectNearbyTarget())
                    {
                        bSpell = false;
                        DoCast(target, urand(0, 1)? SPELL_KNOCK_AWAY: SPELL_THUNDERCLAP);
                    }

                if (pursuitTimer <= diff)
                {
                    pursuitTimer = 20000;
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
                        DoCast(target, SPELL_PURSUIT);
                }
                else
                    pursuitTimer -= diff;

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetInstanceAI<npc_zanzil_berserkerAI>(creature);
        }
};

class spell_zanzil_pursuit : public SpellScriptLoader
{
    public:
        spell_zanzil_pursuit() : SpellScriptLoader("spell_zanzil_pursuit") { }

        class spell_zanzil_pursuit_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_zanzil_pursuit_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                if (!GetCaster() || !GetHitUnit())
                    return;

                if (GetCaster()->GetEntry() == NPC_ZANZIL_BERSERKER)
                {
                    static_cast<npc_zanzil_berserker::npc_zanzil_berserkerAI*>(GetCaster()->GetAI())->DoResetThreat();
                    GetCaster()->AddThreat(GetHitUnit(), 5000000.0f);
                    GetCaster()->GetAI()->AttackStart(GetHitUnit());
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_zanzil_pursuit_SpellScript::HandleScript, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_zanzil_pursuit_SpellScript();
        }
};

class spell_zanzil_fire : public SpellScriptLoader
{
    public:
        spell_zanzil_fire() : SpellScriptLoader("spell_zanzil_fire") { }

        class spell_zanzil_fire_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_zanzil_fire_AuraScript);
            
            bool Load() override
            {
                count = 0;
                return true;
            }

            void PeriodicTick(AuraEffect const* aurEff)
            {
                if (!GetCaster())
                    return;

                count++;

                if (count > 6)
                {
                    GetCaster()->RemoveAurasDueToSpell(SPELL_ZANZIL_FIRE);
                    return;
                }

                Position pos;
                GetCaster()->GetNearPosition(pos, 4.0f * count, 0.0f);
                GetCaster()->CastSpell(pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), SPELL_ZANZIL_FIRE1, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_zanzil_fire_AuraScript::PeriodicTick, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY);
            }

        private:
            uint8 count;
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_zanzil_fire_AuraScript();
        }
};

class spell_frostburn_formula : public SpellScriptLoader
{
    public:
        spell_frostburn_formula() : SpellScriptLoader("spell_frostburn_formula") { }

        class spell_frostburn_formula_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_frostburn_formula_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                if (!GetCaster() || !GetHitUnit())
                    return;

                SetHitDamage(CalculatePct(GetHitUnit()->GetMaxHealth(), 65));
                GetHitUnit()->CastSpell(GetHitUnit(), SPELL_HYPPOTHERMIA, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_frostburn_formula_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_frostburn_formula_SpellScript();
        }
};

void AddSC_boss_zanzil()
{
    new boss_zanzil();
    new npc_zanzil_berserker();
    new spell_zanzil_pursuit();
    new spell_zanzil_fire();
    new spell_frostburn_formula();
}
