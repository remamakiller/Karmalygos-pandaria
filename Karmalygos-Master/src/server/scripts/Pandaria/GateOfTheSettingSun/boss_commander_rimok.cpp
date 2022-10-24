#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "gate_of_the_setting_sun.h"

enum eSpells
{
    // Commander Rimok
    SPELL_VISCOUS_FLUID           = 107078,
    SPELL_VISCOUS_FLUID_SPAWN     = 107077,
    SPELL_FRENZIED_ASSAULT        = 107120,

    // Add Generator
    SPELL_PERIODIC_SPAWN_SWARMER  = 115052,
    SPELL_PERIODIC_SPAWN_SABOTEUR = 116621,

    // Saboteur
    SPELL_BOMBARD                 = 120559
};

enum eEvents
{
    EVENT_FRENZIED_ASSAULT        = 1,
    EVENT_FRENZIED_ASSAULT_REMOVE = 2,
    EVENT_SWARM                   = 3,
};

enum eTalks
{
    SAY_AGGRO = 0,
    SAY_DEATH = 1,
    SAY_SLAY  = 3
};

class boss_commander_rimok : public CreatureScript
{
    public:
        boss_commander_rimok() : CreatureScript("boss_commander_rimok") { }

        struct boss_commander_rimokAI : public BossAI
        {
            boss_commander_rimokAI(Creature* creature) : BossAI(creature, DATA_RIMOK) { }

            uint64 targetGUID;
            uint8 getType;

            void Reset() override
            {
                _Reset();
                me->SetReactState(REACT_PASSIVE);
                getType = 4;
            }

            void InitializeAI() override
            {
                me->SetReactState(REACT_PASSIVE);
                me->SetVisible(false);
                getType = 4;
            }

            void EnterCombat(Unit* /*who*/) override
            {
                _EnterCombat();
                me->SetReactState(REACT_AGGRESSIVE);
                Talk(SAY_AGGRO);

                if (instance)
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);

                events.ScheduleEvent(EVENT_FRENZIED_ASSAULT, 6 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_SWARM, 3 * IN_MILLISECONDS);
            }

            void KilledUnit(Unit* victim) override
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(SAY_SLAY);
            }

            void EnterEvadeMode() override
            {
                BossAI::EnterEvadeMode();
                if (instance)
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
            }

            void JustReachedHome() override
            {
                if (instance)
                    instance->SetBossState(DATA_RIMOK, FAIL);

                summons.DespawnAll();
            }

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/) override { }

            void JustSummoned(Creature* summon) override
            {
                summons.Summon(summon);
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
                        case EVENT_FRENZIED_ASSAULT:
                            if (Unit* vict = me->GetVictim())
                            {
                                targetGUID = vict->GetGUID();
                                me->PrepareChanneledCast(me->GetAngle(vict), SPELL_FRENZIED_ASSAULT);
                            }
                            
                            events.ScheduleEvent(EVENT_FRENZIED_ASSAULT_REMOVE, 7500);
                            events.ScheduleEvent(EVENT_FRENZIED_ASSAULT, urand(20, 21) * IN_MILLISECONDS);
                            break;
                        case EVENT_SWARM:
                            SendSwarmJoinToBattle(getType == SPECIAL ? IN_PROGRESS : SPECIAL);
                            events.ScheduleEvent(EVENT_SWARM, urand(10, 18) * IN_MILLISECONDS);
                            break;
                        case EVENT_FRENZIED_ASSAULT_REMOVE:
                            me->RemoveChanneledCast(targetGUID);
                            // fxd: should be use at end of assault
                            DoCast(me, SPELL_VISCOUS_FLUID);
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            void SendSwarmJoinToBattle(uint8 m_type)
            {
                std::list<Creature*> AddGenerator;
                GetCreatureListWithEntryInGrid(AddGenerator, me, NPC_ADD_GENERATOR, 100.0f);

                for (auto&& itr : AddGenerator)
                    itr->AI()->DoAction(m_type);

                m_type = m_type == SPECIAL ? IN_PROGRESS : SPECIAL;
            }

            void JustDied(Unit* /*killer*/) override
            {
                _JustDied();
                Talk(SAY_DEATH);

                if (instance)
                {
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                    instance->SetData(DATA_CORNER_C, DONE);
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_commander_rimokAI(creature);
        }
};

class npc_krikthik_swarmer : public CreatureScript
{
    public:
        npc_krikthik_swarmer() : CreatureScript("npc_krikthik_swarmer") { }

        struct npc_krikthik_swarmerAI : public ScriptedAI
        {
            npc_krikthik_swarmerAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset() override
            {
                attackTimer = 2000;
            }

            void UpdateAI(uint32 diff) override
            {
                if (attackTimer)
                {
                    if (attackTimer <= diff)
                    {
                        DoZoneInCombat();
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                            AttackStart(target);

                        attackTimer = 0;
                    }
                    else attackTimer -= diff;
                }

                DoMeleeAttackIfReady();
            }

        private:
            uint32 attackTimer;
        };

        CreatureAI* GetAI(Creature* creature) const override
        { 
            return new npc_krikthik_swarmerAI(creature);
        }
};

class npc_krikthik_saboteur : public CreatureScript
{
    public:
        npc_krikthik_saboteur() : CreatureScript("npc_krikthik_saboteur") { }

        struct npc_krikthik_saboteurAI : public ScriptedAI
        {
            npc_krikthik_saboteurAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset() override
            {
                attackTimer = 2000;
                checkTimer = urand(17500, 22500);
            }

            void UpdateAI(uint32 diff) override
            {
                if (attackTimer)
                {
                    if (attackTimer <= diff)
                    {
                        DoZoneInCombat();
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                            AttackStart(target);

                        attackTimer = 0;
                    }
                    else attackTimer -= diff;
                }

                if (checkTimer <= diff)
                {
                    me->CastSpell(me, SPELL_BOMBARD, false);
                    checkTimer = urand(7500, 12500);
                }
                else checkTimer -= diff;

                DoMeleeAttackIfReady();
            }

        private:
            uint32 attackTimer;
            uint32 checkTimer;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_krikthik_saboteurAI(creature);
        }
};

class npc_add_generator : public CreatureScript
{
    public:
        npc_add_generator() : CreatureScript("npc_add_generator") { }

        struct npc_add_generatorAI : public ScriptedAI
        {
            npc_add_generatorAI(Creature* creature) : ScriptedAI(creature), summons(creature)
            {
                instance = creature->GetInstanceScript();
            }

            void Reset() override
            {
                me->RemoveAurasDueToSpell(SPELL_PERIODIC_SPAWN_SWARMER);
                me->RemoveAurasDueToSpell(SPELL_PERIODIC_SPAWN_SABOTEUR);
                summons.DespawnAll();
            }

            void DoAction(int32 action) override
            {
                switch (action)
                {
                    case NOT_STARTED:
                    case FAIL:
                        summons.DespawnAll();
                        // no break
                    case DONE:               
                        me->RemoveAurasDueToSpell(SPELL_PERIODIC_SPAWN_SWARMER);
                        me->RemoveAurasDueToSpell(SPELL_PERIODIC_SPAWN_SABOTEUR);
                        summons.DespawnAll();
                        break;
                    case SPECIAL: // Only one must spawn saboteurs
                        me->CastSpell(me, SPELL_PERIODIC_SPAWN_SABOTEUR, true);
                        break;
                    case IN_PROGRESS:
                        me->CastSpell(me, SPELL_PERIODIC_SPAWN_SWARMER, true);
                        break;
                    default:
                        break;
                }
            }

            void JustSummoned(Creature* summon) override
            {
                summons.Summon(summon);

                float x = me->GetPositionX();
                float y = me->GetPositionY() - 10;
                float z = me->GetMap()->GetHeight(x, y, 400.0f);
                summon->GetMotionMaster()->MoveJump(x, y, z, 10, 20);
            }

        private:
            InstanceScript* instance;
            SummonList summons;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_add_generatorAI(creature);
        }
};

class PlayerTargetSelector
{
    public:
        PlayerTargetSelector() { }

        bool operator()(WorldObject* object)
        {
            return object && object->ToPlayer();
        }
};

class spell_rimok_saboteur_bombard : public SpellScriptLoader
{
    public:
        spell_rimok_saboteur_bombard() : SpellScriptLoader("spell_rimok_saboteur_bombard") { }

        class spell_rimok_saboteur_bombard_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_rimok_saboteur_bombard_AuraScript);

            void OnPeriodic(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();

                if (Unit* caster = GetCaster())
                {
                    if (InstanceScript* instance = caster->GetInstanceScript())
                    {
                        Map::PlayerList const &PlayerList = instance->instance->GetPlayers();

                        if (PlayerList.isEmpty())
                            return;

                        Map::PlayerList::const_iterator it = PlayerList.begin();
                        for (uint8 i = 0; i < urand(0, PlayerList.getSize() - 1); ++i, ++it);

                        if (it == PlayerList.end())
                            return;

                        if (Player* player = it->GetSource())
                            caster->CastSpell(player, GetSpellInfo()->Effects[0].TriggerSpell, true);
                    }
                }
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_rimok_saboteur_bombard_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        class spell_bombard_rimok_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_bombard_rimok_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                targets.remove_if (PlayerTargetSelector());
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_bombard_rimok_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_bombard_rimok_SpellScript();
        }

        AuraScript* GetAuraScript() const override
        {
            return new spell_rimok_saboteur_bombard_AuraScript();
        }
};

class spell_rimok_viscous_fluid : public SpellScriptLoader
{
    public:
        spell_rimok_viscous_fluid() : SpellScriptLoader("spell_rimok_viscous_fluid") { }

        class spell_rimok_viscous_fluid_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_rimok_viscous_fluid_AuraScript);

            void OnPeriodic(AuraEffect const* /*aurEff*/)
            {
                if (Creature* owner = GetOwner()->ToCreature())
                    if (owner->isMoving())
                        PreventDefaultAction();
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_rimok_viscous_fluid_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_rimok_viscous_fluid_AuraScript();
        }
};

void AddSC_boss_commander_rimok()
{
    new boss_commander_rimok();
    new npc_krikthik_swarmer();
    new npc_krikthik_saboteur();
    new npc_add_generator();
    new spell_rimok_saboteur_bombard();
    new spell_rimok_viscous_fluid();
}
