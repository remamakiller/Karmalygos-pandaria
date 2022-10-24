#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "temple_of_the_jade_serpent.h"

static const float fountainTriggerPos[4][3] =
{
    { 1022.743f, -2544.295f, 173.7757f },
    { 1023.314f, -2569.695f, 176.0339f },
    { 1059.943f, -2581.648f, 176.1427f },
    { 1075.231f, -2561.335f, 173.8758f },
};

static const float hydrolanceLeftTrigger[5][3] =
{
    { 1061.411f, -2570.721f, 174.2403f },
    { 1058.921f, -2573.487f, 174.2403f },
    { 1055.910f, -2575.674f, 174.2403f },
    { 1052.511f, -2577.188f, 174.2403f },
    { 1048.871f, -2577.961f, 174.2403f },
};

static const float hydrolanceRightTrigger[5][3] =
{
    { 1035.333f, -2573.693f, 174.2403f },
    { 1032.795f, -2570.971f, 174.2403f },
    { 1030.878f, -2567.781f, 174.2403f },
    { 1029.667f, -2564.263f, 174.2403f },
    { 1029.213f, -2560.569f, 174.2403f },
};

class boss_wase_mari : public CreatureScript
{
    public:
        boss_wase_mari() : CreatureScript("boss_wase_mari") { }

        enum eTexts
        {
            TALK_BOSS_EMOTE_AGGRO   = 0,
            TALK_AGGRO              = 1,
            TALK_CALL_WATER         = 2,
            TALK_PHASE_SWITCH       = 3,
            TALK_PHASE_SWITCH_EMOTE = 4,
            TALK_DEATH_1            = 5,
            TALK_DEATH_2            = 6,
            TALK_DEATH_3            = 7,
            TALK_KILL_PLAYER        = 8
        };

        enum eEvents
        {
            EVENT_CALL_WATER        = 1,
            EVENT_HYDROLANCE        = 2,
            EVENT_HYDROLANCE_START  = 3,
            EVENT_SWITCH_PHASE_TWO  = 4,
            EVENT_DONE              = 5,
            EVENT_TALK_DEATH        = 6,
            EVENT_SUMMON_TRIGGERS   = 7,
            EVENT_BUBBLE_BRUST      = 8
        };

        enum eSpells
        {
            SPELL_WATER_BUBBLE_WISE       = 106062,
            SPELL_CALL_WATER              = 106526,
            SPELL_CORRUPTED_FOUTAIN       = 106518,
            SPELL_HYDROLANCE_PRECAST      = 115220,
            SPELL_HYDROLANCE_DMG_BOTTOM   = 106267,
            SPELL_HYDROLANCE_VISUAL       = 106055,
            SPELL_HYDROLANCE_DMG          = 106105,
            SPELL_WASH_AWAY               = 106331,
            SPELL_WASH_AWAY_548           = 106329,
            SPELL_RELEASED_FROM_SHA       = 106770,
            SPELL_CLEANSING_WATERS        = 106771,
            SPELL_CLAIMING_WATERS         = 115622,
            SPELL_QUIET_SUICIDE           = 115372,
            SPELL_BLESSING_OF_WATERSPEKER = 121483,
            SPELL_KNEEL                   = 115368,
            SPELL_WASH_AWAY_COSMETIC      = 115575,
            SPELL_BUBBLE_BRUST            = 106612,
            SPELL_PURIFIED_WATER          = 118714,
            SPELL_DRY                     = 128437, // achiev req spell, will remove by any ability that`s make achiev fail
        };

        enum eTimers
        {
            TIMER_HYDROLANCE_START  = 10000,
            TIMER_WASH_AWAY         = 125
        };

        enum hydrolancePhase
        {
            HYDROLANCE_BOTTOM = 1,
            HYDROLANCE_LEFT   = 2,
            HYDROLANCE_RIGHT  = 3
        };

        enum eActions
        {
            ACTION_LIVING_WATER_DEAD = 0,
            ACTION_HYDROLANCE        = 1,
            ACTION_WASH_AWAY         = 2
        };

        struct boss_wise_mari_AI : public BossAI
        {
            boss_wise_mari_AI(Creature* creature) : BossAI(creature, DATA_WISE_MARI) { }

            bool fightWon, canDead;
            uint8 phase, foutainCount;
            uint32 hydrolancePhase;
            uint64 foutainTrigger[4];

            EventMap cosmeticEvents;

            void InitializeAI() override
            {
                canDead = false;
                fightWon = false;
                me->setActive(true);
                Reset();
            }

            void Reset() override
            {
                hydrolancePhase = 0;
                foutainCount    = 0;

                _Reset();
                events.Reset();
                cosmeticEvents.ScheduleEvent(EVENT_SUMMON_TRIGGERS, 0.5 * IN_MILLISECONDS);
                me->RemoveAurasDueToSpell(SPELL_WATER_BUBBLE_WISE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                me->SetReactState(REACT_PASSIVE);
                me->SetFloatValue(UNIT_FIELD_BOUNDING_RADIUS, 16.5f);
                me->SetFloatValue(UNIT_FIELD_COMBAT_REACH, 16.5f);

                if (instance)
                    instance->SetData(DATA_WISE_MARI, NOT_STARTED);
            }

            void EnterCombat(Unit* /*who*/) override
            {
                DoCast(me, SPELL_DRY);
                me->PrepareChanneledCast(me->GetOrientation());
                phase = 1;
                hydrolancePhase = HYDROLANCE_BOTTOM;
                _EnterCombat();
                Talk(TALK_AGGRO);
                Talk(TALK_BOSS_EMOTE_AGGRO);
                me->SetInCombatWithZone();
                me->CastSpell(me, SPELL_WATER_BUBBLE_WISE, true);
                events.ScheduleEvent(EVENT_CALL_WATER, 8 * IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_HYDROLANCE_START, TIMER_HYDROLANCE_START);

                if (instance)
                {
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
                    instance->SetData(DATA_WISE_MARI, IN_PROGRESS);
                }

                if (Creature* stalker = me->FindNearestCreature(NPC_WISE_STALKER, 100.0f, true))
                {
                    if (stalker->IsAIEnabled)
                        stalker->AI()->DoAction(1);
                }
                else
                    if (Creature* stalker = me->SummonCreature(NPC_WISE_STALKER, me->GetPositionX(), me->GetPositionY(), me->GetPositionY(), TEMPSUMMON_MANUAL_DESPAWN))
                        if (stalker->IsAIEnabled)
                            stalker->AI()->DoAction(1);
                    
            }

            void KilledUnit(Unit* victim) override
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    Talk(TALK_KILL_PLAYER);
            }

            void DamageTaken(Unit* attacker, uint32& damage) override
            {
                if (me->GetHealth() <= damage)
                {
                    if (!fightWon)
                        damage = 0;

                    if (!canDead)
                    {
                        canDead = true;
                        _JustDied();
                        if (instance)
                        {
                            instance->SetData(DATA_WISE_MARI, DONE);
                            instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                        }

                        me->CastStop(SPELL_WASH_AWAY);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                        me->SetFacingTo(me->GetAngle(1049.362f, -2552.748f));
                        me->RemoveAura(SPELL_WASH_AWAY);
                        me->CastSpell(me, SPELL_KNEEL, false);
                        me->CastSpell(me, SPELL_RELEASED_FROM_SHA, false);
                        me->CastSpell(me, SPELL_CLEANSING_WATERS, false);
                        me->CastSpell(me, SPELL_CLAIMING_WATERS, false);
                        cosmeticEvents.ScheduleEvent(EVENT_TALK_DEATH, 1 * IN_MILLISECONDS);

                        if (Creature* stalker = me->FindNearestCreature(NPC_WISE_STALKER, 100.0f))
                           if (stalker->IsAIEnabled)
                               stalker->AI()->DoAction(2);
                    }
                }
            }

            void EnterEvadeMode() override
            {
                BossAI::EnterEvadeMode();
                if (instance)
                {
                    instance->SetData(DATA_WISE_MARI, FAIL);
                    instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);
                }

                std::list<Creature*> dropletList;
                GetCreatureListWithEntryInGrid(dropletList, me, NPC_CORRUPT_DROPLET, 100.0f);

                for (auto&& itr : dropletList)
                    if (itr->IsSummon())
                        itr->DespawnOrUnsummon();

                if (Creature* stalker = me->FindNearestCreature(NPC_WISE_STALKER, 100.0f))
                    if (stalker->IsAIEnabled)
                        stalker->AI()->DoAction(2);

                _DespawnAtEvade();
            }

            void DoAction(int32 actionId) override
            {
                switch (actionId)
                {
                    case ACTION_LIVING_WATER_DEAD:
                        ++foutainCount;

                        if (foutainCount == 4)
                            cosmeticEvents.ScheduleEvent(EVENT_BUBBLE_BRUST, urand(4, 6) * IN_MILLISECONDS);
                        else
                            events.ScheduleEvent(EVENT_CALL_WATER, urand(12, 16) * IN_MILLISECONDS);
                        break;
                    case ACTION_HYDROLANCE:
                        events.ScheduleEvent(EVENT_HYDROLANCE, 0.25 * IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_HYDROLANCE_START, urand(8, 12) * IN_MILLISECONDS);
                        break;
                    case ACTION_WASH_AWAY:
                        events.Reset();
                        events.ScheduleEvent(EVENT_SWITCH_PHASE_TWO, 0.5 * IN_MILLISECONDS);
                        break;
                }
            }

            void UpdateAI(uint32 diff) override
            {
                cosmeticEvents.Update(diff);
                while (uint32 eventId = cosmeticEvents.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_DONE:
                        {
                            fightWon = true;

                            if (InstanceScript* instance = me->GetInstanceScript())
                            {
                                instance->DoCastSpellOnPlayers(SPELL_BLESSING_OF_WATERSPEKER);
                                instance->DoAddAuraOnPlayers(SPELL_PURIFIED_WATER);
                            }

                            if (Player* originalCaster = me->FindNearestPlayer(50.0f))
                            {
                                me->SetLootRecipient(originalCaster);
                                me->CastSpell(me, SPELL_QUIET_SUICIDE, false, NULL, NULL, originalCaster->GetGUID());
                            }
                            break;
                        }
                        case EVENT_TALK_DEATH:
                            Talk(TALK_DEATH_1);
                            cosmeticEvents.ScheduleEvent(EVENT_DONE, 9 * IN_MILLISECONDS);
                            break;
                        case EVENT_SUMMON_TRIGGERS:
                        {
                            for (int i = 0; i < 4; i++)
                            {
                                if (Creature* trigger = me->SummonCreature(NPC_FOUNTAIN_TRIGGER, FountainTriggerSummonPosition[i]))
                                    foutainTrigger[i] = trigger->GetGUID();
                            }

                            break;
                        }
                        case EVENT_BUBBLE_BRUST:
                            me->CastSpell(me, SPELL_BUBBLE_BRUST, false);
                            break;
                    }
                }

                events.Update(diff);

                if (!UpdateVictim())
                    return;

                if (me->GetUInt32Value(UNIT_FIELD_TARGET))
                    me->SetUInt32Value(UNIT_FIELD_TARGET, 0);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_CALL_WATER:
                        {
                            Talk(TALK_CALL_WATER);
                            if (Creature* trigger = Unit::GetCreature(*me, foutainTrigger[foutainCount]))
                            {
                                me->CastSpell(trigger, SPELL_CALL_WATER, false);
                                trigger->AddAura(SPELL_CORRUPTED_FOUTAIN, trigger);
                            }
                            break;
                        }
                        case EVENT_HYDROLANCE_START:
                        {
                            float facing = 0.00f;
                            switch (hydrolancePhase)
                            {
                                case HYDROLANCE_BOTTOM:
                                {
                                    std::list<Creature*> trigger;
                                    me->GetCreatureListWithEntryInGrid(trigger, NPC_HYDROCALINE_TRIGGER, 50.0f);

                                        for (auto&& itr : trigger)
                                            itr->CastSpell(itr, SPELL_HYDROLANCE_PRECAST, true);

                                    facing = 1.23f;
                                    break;
                                }
                                case HYDROLANCE_RIGHT:
                                {
                                    for (int i = 0; i < 5; i++)
                                        me->CastSpell(hydrolanceRightTrigger[i][0], hydrolanceRightTrigger[i][1], hydrolanceRightTrigger[i][2], SPELL_HYDROLANCE_PRECAST, true);

                                    facing = 3.55f;
                                    break;
                                }
                                case HYDROLANCE_LEFT:
                                {
                                    for (int i = 0; i < 5; i++)
                                        me->CastSpell(hydrolanceLeftTrigger[i][0], hydrolanceLeftTrigger[i][1], hydrolanceLeftTrigger[i][2], SPELL_HYDROLANCE_PRECAST, true);

                                    facing = 5.25f;
                                    break;
                                }
                            }

                            me->CastSpell(me, SPELL_HYDROLANCE_VISUAL, false);
                            me->UpdatePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), facing);
                            me->SetFacingTo(facing);
                            break;
                        }
                        case EVENT_HYDROLANCE:
                        {
                            switch (hydrolancePhase)
                            {
                                case HYDROLANCE_BOTTOM:
                                {
                                    std::list<Creature*> trigger;
                                    me->GetCreatureListWithEntryInGrid(trigger, NPC_HYDROCALINE_TRIGGER, 50.0f);

                                        for (auto&& itr : trigger)
                                            itr->CastSpell(itr->GetPositionX(), itr->GetPositionY(), itr->GetPositionZ(), SPELL_HYDROLANCE_DMG_BOTTOM, true);
                                }
                                break;
                                case HYDROLANCE_RIGHT:
                                    for (int i = 0; i < 5; i++)
                                        me->CastSpell(hydrolanceRightTrigger[i][0], hydrolanceRightTrigger[i][1], hydrolanceRightTrigger[i][2], SPELL_HYDROLANCE_DMG, true);
                                    break;
                                case HYDROLANCE_LEFT:
                                    for (int i = 0; i < 5; i++)
                                        me->CastSpell(hydrolanceLeftTrigger[i][0], hydrolanceLeftTrigger[i][1], hydrolanceLeftTrigger[i][2], SPELL_HYDROLANCE_DMG, true);
                                    break;
                                }

                                if (hydrolancePhase == HYDROLANCE_RIGHT)
                                    hydrolancePhase = HYDROLANCE_BOTTOM;
                                else
                                    hydrolancePhase++;
                                break;
                        }
                        case EVENT_SWITCH_PHASE_TWO:
                        {
                            Talk(TALK_PHASE_SWITCH);
                            Talk(TALK_PHASE_SWITCH_EMOTE);
                            me->RemoveAurasDueToSpell(SPELL_WATER_BUBBLE_WISE);

                            DoCast(me, SPELL_WASH_AWAY, true);
                            //DoCast(me, SPELL_WASH_AWAY_COSMETIC, true);
                            break;
                        }
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_wise_mari_AI(creature);
        }
};

class npc_corrupt_living_water : public CreatureScript
{
    public:
        npc_corrupt_living_water() : CreatureScript("npc_corrupt_living_water") { }

        enum eSpells
        {
            SPELL_SUMMON_CORRUPT_DROPLET = 106762,
            SPELL_SHA_RESIDUE            = 106653
        };

        enum eTalks
        {
            TALK_RISE = 0
        };

        enum eActions
        {
            ACTION_LIVING_WATER_DEAD = 0
        };

        struct npc_corrupt_living_water_AI : public ScriptedAI
        {
            npc_corrupt_living_water_AI(Creature* creature) : ScriptedAI(creature) { }

            InstanceScript* instance;
            bool canDead;
            uint64 targetGUID;
            float x, y;

            void InitializeAI() override
            {
                instance = me->GetInstanceScript();
                canDead = false;
                x = 0.0f; y = 0.0f;

                if (me->GetEntry() == NPC_CORRUPT_WATER_WISE)
                    Talk(TALK_RISE);
            }

            void JustDied(Unit* /*killer*/) override
            {
                if (me->GetEntry() == NPC_CORRUPT_WATER_WISE)
                {
                    if (Creature* wise = Unit::GetCreature(*me, instance->GetData64(DATA_WISE_MARI)))
                       if (wise->IsAIEnabled)
                           wise->AI()->DoAction(ACTION_LIVING_WATER_DEAD);
                }
            }

            void JustSummoned(Creature* summon) override
            {
                summon->SetInCombatWithZone();

                if (Player* itr = me->FindNearestPlayer(100.0f))
                    summon->Attack(itr, true);
            }

            void DamageTaken(Unit* attacker, uint32& damage) override
            {
                if (me->GetHealth() <= damage)
                {
                    damage = 0;
                    if (!canDead)
                    {
                        canDead = true;
                        for (int i = 0; i < 3; i++)
                            me->CastSpell((Unit*)NULL, SPELL_SUMMON_CORRUPT_DROPLET, true);

                        me->CastSpell((Unit*)NULL, SPELL_SHA_RESIDUE, true);
                        attacker->Kill(me);
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_corrupt_living_water_AI(creature);
        }
};

class npc_wise_stalker : public CreatureScript
{
    public:
        npc_wise_stalker() : CreatureScript("npc_wise_stalker") { }

        enum eActions
        {
            ACTION_START_COMBAT = 1,
            ACTION_STOP_COMBAT  = 2
        };

        enum eSpells
        {
            SPELL_CORRUPTED_WATERS = 115165
        };

        struct npc_wise_stalker_AI : public ScriptedAI
        {
            npc_wise_stalker_AI(Creature* creature) : ScriptedAI(creature) { }

            void DoAction(int32 actionId) override
            {
                switch (actionId)
                {
                    case ACTION_START_COMBAT:
                        me->CastSpell(me, SPELL_CORRUPTED_WATERS, false);
                        break;
                    case ACTION_STOP_COMBAT:
                        me->RemoveAura(SPELL_CORRUPTED_WATERS);
                        break;
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_wise_stalker_AI(creature);
        }
};

class spell_wise_hydrolance_pulse : public SpellScriptLoader
{
    public:
        spell_wise_hydrolance_pulse() : SpellScriptLoader("spell_wise_hydrolance_pulse") { }

        enum eSpells
        {
            SPELL_HYDROLANCE_PULSE = 106104
        };

        enum eActions
        {
            ACTION_HYDROLANCE = 1
        };

        class spell_wise_hydrolance_pulse_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_wise_hydrolance_pulse_AuraScript);

            uint8 tickCnt;

            bool Load() override
            {
                tickCnt = 0;
                return true;
            }

            void HandlePeriodic(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();
                Unit* owner = GetCaster();

                if (!owner)
                    return;

                float x, y, z;
                z = owner->GetPositionZ();
                switch (tickCnt)
                {
                    case 0:
                        owner->GetNearPoint2D(x, y, 0.0f, owner->GetOrientation());
                        owner->CastSpell(x, y, z, SPELL_HYDROLANCE_PULSE, false);
                        break;
                    default:
                        owner->GetNearPoint2D(x, y, tickCnt * 2, owner->GetOrientation());
                        owner->CastSpell(x, y, z, SPELL_HYDROLANCE_PULSE, false);
                        break;
                }
                ++tickCnt;
            }

            void OnRemove(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
            {
                Creature* owner = GetOwner()->ToCreature();
                if (!owner)
                    return;

                if (owner->IsAIEnabled)
                    owner->AI()->DoAction(ACTION_HYDROLANCE);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_wise_hydrolance_pulse_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
                OnEffectRemove += AuraEffectRemoveFn(spell_wise_hydrolance_pulse_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_wise_hydrolance_pulse_AuraScript();
        }
};

class spell_wise_hydrolance: public SpellScriptLoader
{
    public:
        spell_wise_hydrolance() : SpellScriptLoader("spell_wise_hydrolance") { }

        enum eSpells
        {
            SPELL_HYDROLANCE_PULSE = 106098
        };

        class spell_wise_hydrolance_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_wise_hydrolance_SpellScript);

            void HandleAfterCast()
            {
                if (Unit* caster = GetCaster())
                    caster->CastSpell(caster, SPELL_HYDROLANCE_PULSE, false);
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_wise_hydrolance_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_wise_hydrolance_SpellScript();
        }
};

class spell_wise_bubble_brust : public SpellScriptLoader
{
    public:
        spell_wise_bubble_brust() : SpellScriptLoader("spell_wise_bubble_brust") { }

        enum eActions
        {
            ACTION_WASH_AWAY = 2
        };

        class spell_wise_bubble_brust_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_wise_bubble_brust_SpellScript);

            void HandleAfterCast()
            {
                if (Unit* caster = GetCaster())
                    if (caster->IsAIEnabled)
                        caster->GetAI()->DoAction(ACTION_WASH_AWAY);
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_wise_bubble_brust_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_wise_bubble_brust_SpellScript();
        }
};

class CorruptedWatersTargetSelector
{
    public:
        CorruptedWatersTargetSelector() { }

        bool operator()(WorldObject* object)
        {
            if (object->GetTypeId() == TYPEID_PLAYER)
            {
                if (Player* plr = object->ToPlayer())
                {
                    Position pos;
                    plr->GetPosition(&pos);

                    if ((plr->GetDistance(roomCenter) < 20.00f && roomCenter.HasInArc(M_PI, &pos)) || (!roomCenter.HasInArc(M_PI, &pos) && plr->GetDistance(roomCenter) < 14.00f))
                    {
                        if (plr->GetPositionZ() > 174.05f && plr->GetPositionZ() < 174.23f)
                            return false;
                    }

                    if (plr->GetDistance(roomCenter) < 30.00f && plr->GetPositionZ() > 170.19f && plr->GetPositionZ() < 170.215f)
                        return false;
                }

                return true;
            }

            return true;
        }
};

class spell_tjs_corrupted_waters_damage: public SpellScriptLoader
{
    public:
        spell_tjs_corrupted_waters_damage() : SpellScriptLoader("spell_tjs_corrupted_waters_damage") { }

        class spell_tjs_corrupted_waters_damage_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_tjs_corrupted_waters_damage_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                targets.remove_if (CorruptedWatersTargetSelector());
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_tjs_corrupted_waters_damage_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_tjs_corrupted_waters_damage_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_tjs_corrupted_waters_damage_SpellScript();
        }
};

class spell_tjs_sha_residue : public SpellScriptLoader
{
    public:
        spell_tjs_sha_residue() : SpellScriptLoader("spell_tjs_sha_residue") { }

        class spell_tjs_sha_residue_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_tjs_sha_residue_AuraScript)

            void HandleEffectCalcPeriodic(AuraEffect const* /*aurEff*/, bool& isPeriodic, int32& amplitude)
            {
                amplitude = 1 * IN_MILLISECONDS;
            }

            void Register() override
            {
                DoEffectCalcPeriodic += AuraEffectCalcPeriodicFn(spell_tjs_sha_residue_AuraScript::HandleEffectCalcPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_tjs_sha_residue_AuraScript();
        }
};

// Wash Away 106331
class spell_wash_away_tjs : public SpellScriptLoader
{
    public:
        spell_wash_away_tjs() : SpellScriptLoader("spell_wash_away_tjs") { }

        class spell_wash_away_tjs_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_wash_away_tjs_AuraScript);

            void OnTrigger(AuraEffect const* /*aurEff*/)
            {
                Unit* owner = GetOwner()->ToUnit();

                if (!owner)
                    return;

                float facing = owner->GetOrientation();

                facing += M_PI / 40;

                if (facing > M_PI * 2)
                    facing -= M_PI * 2;

                owner->SetFacingTo(Position::NormalizeOrientation(facing));
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_wash_away_tjs_AuraScript::OnTrigger, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_wash_away_tjs_AuraScript();
        }
};

class WashAwayTargetSelector
{
    public:
        WashAwayTargetSelector() { }

        bool operator()(WorldObject* object)
        {
            return object && object->ToPlayer() && object->ToPlayer()->GetPositionZ() > 174.7f;
        }
};

// Wash Away 106334
class spell_tjs_wash_away_proc : public SpellScriptLoader
{
    public:
        spell_tjs_wash_away_proc() : SpellScriptLoader("spell_tjs_wash_away_proc") { }

        class spell_tjs_wash_away_proc_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_tjs_wash_away_proc_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                targets.remove_if(WashAwayTargetSelector());
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_tjs_wash_away_proc_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_CONE_ENEMY_110);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_tjs_wash_away_proc_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_CONE_ENEMY_110);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_tjs_wash_away_proc_SpellScript();
        }
};

void AddSC_boss_wise_mari()
{
    new boss_wase_mari();
    new npc_corrupt_living_water();
    new npc_wise_stalker();
    new spell_wise_hydrolance_pulse();
    new spell_wise_hydrolance();
    new spell_wise_bubble_brust();
    new spell_tjs_sha_residue();
    new spell_tjs_corrupted_waters_damage();
    new spell_wash_away_tjs();
    new spell_tjs_wash_away_proc();
}
