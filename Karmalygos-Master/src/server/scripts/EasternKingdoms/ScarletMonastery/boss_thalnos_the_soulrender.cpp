#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scarlet_monastery.h"

enum Spells
{
    // Thalnos
    SPELL_CHANNEL_SOUL              = 60309, // visual to trigger
    SPELL_RITUAL_OF_SOULD           = 60429, // only aura
    SPELL_RAISE_FALLEN_CRUSADER     = 115139,
    SPELL_SPIRIT_GALE               = 115289,
    SPELL_EVICT_SOUL                = 115297,
    SPELL_SUMMON_EMPOWERING_SPIRITS = 115147,
    SPELL_SPIRIT_GALE_AURA          = 115291, // in area trigger

    // Minions
    SPELL_MIND_ROT                  = 115144,
    SPELL_CLONE_ME                  = 45204, // get ur vision
};

enum Events
{
    EVENT_SPIRIT_GALE               = 1,
    EVENT_RAISE_FALLEN_CRUSADER     = 2,
    EVENT_EVICT_SOUL                = 3,
    EVENT_CHANNELED_SOUL            = 4,
    EVENT_EMPOWERING_SPIRITS        = 5
};

enum Yells
{
    TALK_INTO                       = 0,
    TALK_SLAY                       = 1,
    TALK_EVICT                      = 2,
    TALK_SPIRITS                    = 3,
    TALK_DEATH                      = 4,
    TALK_EVICTED_SOUL_ANN           = 5,
    TALK_EMPOWERED_SPIRIT_ANN       = 6,
    TALK_INTRO_ANN                  = 7,
};

class boss_thalnos_the_soulrender : public CreatureScript
{
    public:
        boss_thalnos_the_soulrender() : CreatureScript("boss_thalnos_the_soulrender") { }

        struct boss_thalnos_the_soulrenderAI : public BossAI
        {
            boss_thalnos_the_soulrenderAI(Creature* creature) : BossAI(creature, BOSS_THALNOS_THE_SOULRENDER) { }

            bool IntroAnn;
            uint64 victimGUID;
            uint32 zombieAliveCount;

            void InitializeAI() override
            {
                me->setActive(true);
                IntroAnn = false;
                Reset();
            }

            void Reset() override
            {
                _Reset();
                DespawnSummoned();
                events.Reset();
                me->setRegeneratingHealth(true);
                me->SetReactState(REACT_AGGRESSIVE);
                victimGUID       = 0;
                zombieAliveCount = 0;
                me->GetMap()->SetWorldState(WORLDSTATE_EMPOWERED_SPIRITUALIST, 0);

                if (instance)
                {
                    instance->SetData(BOSS_THALNOS_THE_SOULRENDER, NOT_STARTED);
                    me->RemoveAllAreasTrigger();
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIRIT_GALE_AURA);
                }
            }

            void JustDied(Unit* killer) override
            {
                _JustDied();
                DespawnSummoned();
                Talk(TALK_DEATH);
                if (instance)
                {
                    instance->SetData(BOSS_THALNOS_THE_SOULRENDER, DONE);
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                    me->RemoveAllAreasTrigger();
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIRIT_GALE_AURA);
                }
            }

            void DespawnSummoned()
            {
                std::list<Creature*> NpcList;
                GetCreatureListWithEntryInGrid(NpcList, me, NPC_FALLEN_CRUSADER, 200.0f);
                GetCreatureListWithEntryInGrid(NpcList, me, NPC_EMPOWERED_ZOMBIE, 200.0f);
                GetCreatureListWithEntryInGrid(NpcList, me, NPC_EVICTED_SOUL, 200.0f);
                for (auto&& itr : NpcList)
                    itr->DespawnOrUnsummon();
            }

            void EnterEvadeMode() override
            {
                BossAI::EnterEvadeMode();
                DespawnSummoned();
                if (instance)
                {
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                    instance->SetData(BOSS_THALNOS_THE_SOULRENDER, FAIL);
                    me->RemoveAllAreasTrigger();
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIRIT_GALE_AURA);
                }
                summons.DespawnAll();
            }

            void JustSummoned(Creature* summon) override
            {
                if (summon->GetEntry() == NPC_EMPOWERED_ZOMBIE)
                {
                    if (++zombieAliveCount > 2)
                        me->GetMap()->SetWorldState(WORLDSTATE_EMPOWERED_SPIRITUALIST, 1);
                }

                summon->setActive(true);
                summon->SetInCombatWithZone();
            }

            void SummonedCreatureDies(Creature* summon, Unit* /*killer*/) override
            {
                if (summon->GetEntry() == NPC_EMPOWERED_ZOMBIE)
                {
                    if (--zombieAliveCount < 3)
                        me->GetMap()->SetWorldState(WORLDSTATE_EMPOWERED_SPIRITUALIST, 0);
                }
            }

            void EnterCombat(Unit* /*who*/) override
            {
                _EnterCombat();
                Talk(TALK_INTO);
                if (instance)
                {
                    instance->SetData(BOSS_THALNOS_THE_SOULRENDER, IN_PROGRESS);
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
                }
                events.ScheduleEvent(EVENT_SPIRIT_GALE, 1500);
                events.ScheduleEvent(EVENT_RAISE_FALLEN_CRUSADER, urand(6500, 7000));
                events.ScheduleEvent(EVENT_EMPOWERING_SPIRITS, urand(40000, 42000));
                events.ScheduleEvent(EVENT_EVICT_SOUL, urand(25000, 26000));
            }

            void DoAction(int32 actionId) override
            {
                if (actionId == ACTION_REMOVE_RAISE)
                    me->RemoveChanneledCast(victimGUID);
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
                        case EVENT_SPIRIT_GALE:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 150.0f, true))
                                me->CastSpell(target, SPELL_SPIRIT_GALE, false);
                            events.ScheduleEvent(EVENT_SPIRIT_GALE, urand(7500,13000));
                            break;
                        case EVENT_RAISE_FALLEN_CRUSADER:
                            Talk(TALK_SLAY);
                            if (Unit* vict = me->GetVictim())
                            {
                                victimGUID = vict->GetGUID();
                                me->PrepareChanneledCast(me->GetAngle(vict), SPELL_RAISE_FALLEN_CRUSADER);
                            }
                            break;
                        case EVENT_EVICT_SOUL:
                            Talk(TALK_EVICT);
                            Talk(TALK_EVICTED_SOUL_ANN);
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, NonTankTargetSelector(me)))
                                me->CastSpell(target, SPELL_EVICT_SOUL, false);
                            else if (Unit* target = me->GetVictim())
                                me->CastSpell(target, SPELL_EVICT_SOUL, false);

                            events.ScheduleEvent(EVENT_EVICT_SOUL, urand(25000, 26000));
                            break;
                        case EVENT_EMPOWERING_SPIRITS:
                            Talk(TALK_SPIRITS);
                            Talk(TALK_EMPOWERED_SPIRIT_ANN);
                            DoCastAOE(SPELL_SUMMON_EMPOWERING_SPIRITS);
                            events.ScheduleEvent(EVENT_EMPOWERING_SPIRITS, urand(40000, 42000));
                            events.ScheduleEvent(EVENT_RAISE_FALLEN_CRUSADER, 20 * IN_MILLISECONDS);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_thalnos_the_soulrenderAI(creature);
        }
};

// Evicted Soul 59974
struct npc_evicted_soul : public ScriptedAI
{
    npc_evicted_soul(Creature* creature) : ScriptedAI(creature)
    {
        instance = creature->GetInstanceScript();
    }

    EventMap events;
    InstanceScript* instance;

    void IsSummonedBy(Unit* summoner) override
    {
        if (Player* itr = me->FindNearestPlayer(VISIBLE_RANGE))
        {
            itr->CastSpell(me, SPELL_CLONE_ME, true); // coppy
            me->CombatStart(itr);
        }
    }

    void UpdateAI(uint32 diff) override
    {
        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        DoMeleeAttackIfReady();
    }
};

// Fallen Crusader 59884
struct npc_fallen_crusader : public ScriptedAI
{
    npc_fallen_crusader(Creature* creature) : ScriptedAI(creature)
    {
        instance = creature->GetInstanceScript();
    }

    uint32 mindroot_timer;
    EventMap events;
    InstanceScript* instance;

    void IsSummonedBy(Unit* summoner) override
    {
        mindroot_timer = urand(3500, 4200);
    }

    void UpdateAI(uint32 diff) override
    {
        if (mindroot_timer <= diff)
        {
            if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0, 150.0f, true))
                DoCast(target, SPELL_MIND_ROT);

            mindroot_timer = urand(3500, 4200);
        }
        else
            mindroot_timer -= diff;

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        DoMeleeAttackIfReady();
    }
};

// Empowering Spirit 59893
struct npc_empowering_spirit : public ScriptedAI
{
    npc_empowering_spirit(Creature* creature) : ScriptedAI(creature)
    {
        instance = creature->GetInstanceScript();
    }

    uint32 zombie_timer;
    bool check;
    Creature* zombie;
    EventMap events;
    InstanceScript* instance;

    void IsSummonedBy(Unit* summoner) override
    {
        if (!IsHeroic())
        {
            me->SetMaxHealth(3100);
            me->SetHealth(3100);
            me->SetLevel(30);
        }

        zombie_timer = 5000;
    }

    void UpdateAI(uint32 diff) override
    {
        if (zombie_timer <= diff)
        {
            if (Creature* thalnos = ObjectAccessor::GetCreature(*me, me->GetInstanceScript() ? me->GetInstanceScript()->GetData64(BOSS_THALNOS_THE_SOULRENDER) : 0))
                thalnos->SummonCreature(NPC_EMPOWERED_ZOMBIE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), TEMPSUMMON_MANUAL_DESPAWN);

            me->DespawnOrUnsummon();
        }
        else zombie_timer -= diff;

        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        DoMeleeAttackIfReady();
    }
};

// Empowered Zombie 59930
struct npc_empowered_zombie : public ScriptedAI
{
    npc_empowered_zombie(Creature* creature) : ScriptedAI(creature)
    {
        instance = creature->GetInstanceScript();
    }

    uint32 combat_timer;
    EventMap events;
    InstanceScript* instance;

    void UpdateAI(uint32 /*diff*/) override
    {
        if (me->HasUnitState(UNIT_STATE_CASTING))
            return;

        DoMeleeAttackIfReady();
    }
};

// Raise Fallen Crusader 115139
class spell_raise_fallen_crusader : public AuraScript
{
    PrepareAuraScript(spell_raise_fallen_crusader);

    void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Creature* owner = GetOwner()->ToCreature())
            owner->AI()->DoAction(ACTION_REMOVE_RAISE);
    }

    void Register() override
    {
        OnEffectRemove += AuraEffectRemoveFn(spell_raise_fallen_crusader::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
    }
};

// 220. Summoned by 115290 - Spirit Gale
class sat_spirit_gale : public IAreaTriggerAura
{
    bool CheckTriggering(WorldObject* triggering) override
    {
        return triggering->ToPlayer() && triggering->ToPlayer()->IsAlive() && !triggering->ToPlayer()->HasAura(SPELL_SPIRIT_GALE_AURA);
    }

    void OnTriggeringApply(WorldObject* triggering) override
    {
        if (Player* pItr = triggering->ToPlayer())
            m_caster->CastSpell(pItr, SPELL_SPIRIT_GALE_AURA, true);
    }

    void OnTriggeringRemove(WorldObject* triggering) override
    {
        if (Player* pItr = triggering->ToPlayer())
            pItr->RemoveAurasDueToSpell(SPELL_SPIRIT_GALE_AURA);
    }
};

void AddSC_boss_thalnos_the_soulrender()
{
    new boss_thalnos_the_soulrender();
    new creature_script<npc_evicted_soul>("npc_evicted_soul");
    new creature_script<npc_fallen_crusader>("npc_fallen_crusader");
    new creature_script<npc_empowering_spirit>("npc_empowering_spirit");
    new creature_script<npc_empowered_zombie>("npc_empowered_zombie");

    new aura_script<spell_raise_fallen_crusader>("spell_raise_fallen_crusader");
    new atrigger_script<sat_spirit_gale>("sat_spirit_gale");
}