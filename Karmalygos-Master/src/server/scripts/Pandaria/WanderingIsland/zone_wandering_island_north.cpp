#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedEscortAI.h"
#include "SpellScript.h"

class npc_master_shang_xi : public CreatureScript
{
    enum master_shang
    {

        SPELL_MASTERS_FLAME         = 114610,
        SPELL_CREATE_MASTERS_FLAME  = 114611,
        SPELL_SNATCH_MASTERS_FLAME  = 114746,

        ITEM_MASTERS_FLAME          = 80212,

        QUEST_LESSONS_OF_BURNING_SCROLL = 29408,
    };

    public:
        npc_master_shang_xi() : CreatureScript("npc_master_shang_xi") { }

        bool OnQuestAccept(Player* /*player*/, Creature* creature, Quest const* quest) override
        {
            if (quest->GetQuestId() == QUEST_LESSONS_OF_BURNING_SCROLL) // The Lesson of the Burning Scroll
            {
                creature->AddAura(SPELL_MASTERS_FLAME, creature);
                creature->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
            }

            return true;
        }

        struct npc_master_shang_xi_AI : public ScriptedAI
        {
            npc_master_shang_xi_AI(Creature* creature) : ScriptedAI(creature)
            {
                resetTimer = 10000;
            }

            uint32 resetTimer;

            void SpellHit(Unit* caster, const SpellInfo* spell) override
            {
                if (spell->Id == SPELL_SNATCH_MASTERS_FLAME) // Snatch Master's Flame
                {
                    if (caster->GetTypeId() == TYPEID_PLAYER)
                    {
                        if (caster->ToPlayer()->GetQuestStatus(QUEST_LESSONS_OF_BURNING_SCROLL) == QUEST_STATUS_INCOMPLETE)
                        {
                            me->CastSpell(caster, SPELL_CREATE_MASTERS_FLAME, true);
                            me->RemoveAurasDueToSpell(SPELL_MASTERS_FLAME);
                            me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                            Talk(0);
                        }
                    }
                }
            }

            void MoveInLineOfSight(Unit* who) override
            {
                Player * const player = who->ToPlayer();
                if (!player)
                    return;

                if (player->GetQuestStatus(QUEST_LESSONS_OF_BURNING_SCROLL) == QUEST_STATUS_INCOMPLETE && !player->HasItemCount(ITEM_MASTERS_FLAME) && !me->HasAura(SPELL_MASTERS_FLAME))
                    me->AddAura(SPELL_MASTERS_FLAME, me);
            }

            void UpdateAI(uint32 diff) override
            {
                // In case noone used spellclick - reset questgiver flag in periodic way
                if (me->HasFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
                    return;

                if (resetTimer <= diff)
                {
                    me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    resetTimer = 10000;
                }
                else
                    resetTimer -= diff;
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_master_shang_xi_AI(creature);
        }
};

class go_wandering_weapon_rack : public GameObjectScript
{
    public:
        go_wandering_weapon_rack() : GameObjectScript("go_wandering_weapon_rack") { }

        bool OnGossipHello(Player* player, GameObject* /*go*/) override
        {
            if (player->GetQuestStatus(30027) == QUEST_STATUS_INCOMPLETE && !player->HasItemCount(73209))
            {
                player->AddItem(73209, 1);
            }
            else if (player->GetQuestStatus(30033) == QUEST_STATUS_INCOMPLETE && (!player->HasItemCount(76392) || !player->HasItemCount(76390)))
            {
                player->AddItem(76392, 1);
                player->AddItem(76390, 1);
            }
            else if (player->GetQuestStatus(30034) == QUEST_STATUS_INCOMPLETE && !player->HasItemCount(73211))
            {
                player->AddItem(73211, 1);
            }
            else if (player->GetQuestStatus(30035) == QUEST_STATUS_INCOMPLETE && (!player->HasItemCount(76393) || !player->HasItemCount(73207)))
            {
                player->AddItem(76393, 1);
                player->AddItem(73207, 1);
            }
            else if (player->GetQuestStatus(30036) == QUEST_STATUS_INCOMPLETE && (!player->HasItemCount(73212) || !player->HasItemCount(73208)))
            {
                player->AddItem(73212, 1);
                player->AddItem(73208, 1);
            }
            else if (player->GetQuestStatus(30037) == QUEST_STATUS_INCOMPLETE && (!player->HasItemCount(73213) || !player->HasItemCount(76391)))
            {
                player->AddItem(73213, 1);
                player->AddItem(76391, 1);
            }
            else if (player->GetQuestStatus(30038) == QUEST_STATUS_INCOMPLETE && !player->HasItemCount(73210))
            {
                player->AddItem(73210, 1);
            }

            return true;
        }
};

class npc_training_target : public CreatureScript
{
    public:
        npc_training_target() : CreatureScript("npc_training_target") { }

        struct npc_training_targetAI : public ScriptedAI
        {
            uint32 resetTimer;

            npc_training_targetAI(Creature* creature) : ScriptedAI(creature)
            {
                SetCombatMovement(false);
            }

            void Reset() override
            {
                me->SetReactState(REACT_PASSIVE);
                // disable rotate
                me->SetControlled(true, UNIT_STATE_STUNNED);
                // imune to knock aways like blast wave
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);

                resetTimer = 5000;
            }

            void EnterEvadeMode() override
            {
                if (_EnterEvadeMode())
                    Reset();
            }

            void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/) override
            {
                resetTimer = 5000;
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                if (!me->HasUnitState(UNIT_STATE_STUNNED))
                    me->SetControlled(true, UNIT_STATE_STUNNED);

                if (resetTimer <= diff)
                {
                    EnterEvadeMode();
                    resetTimer = 5000;
                }
                else
                    resetTimer -= diff;
            }

            void MoveInLineOfSight(Unit* /*who*/) override { }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_training_targetAI(creature);
        }
};

// NPC 56661 - The Way of the Tushui
class npc_aysa_lake_escort : public CreatureScript
{
    public:
        npc_aysa_lake_escort() : CreatureScript("npc_aysa_lake_escort") { }

        struct npc_aysa_lake_escortAI : public npc_escortAI
        {
            npc_aysa_lake_escortAI(Creature* creature) : npc_escortAI(creature) { }

            uint32 IntroTimer;

            void Reset() override
            {
                me->SetReactState(REACT_PASSIVE);
                IntroTimer = 2500;
            }

            void MovementInform(uint32 type, uint32 pointId) override
            {
                npc_escortAI::MovementInform(type, pointId);

                if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
                    return;

                switch (pointId)
                {
                    case 10:
                        me->GetMotionMaster()->MoveJump(1227.11f, 3489.73f, 100.37f, 10, 20, 11);
                        break;
                    case 11:
                        me->GetMotionMaster()->MoveJump(1236.68f, 3456.68f, 102.58f, 10, 20, 12);
                        break;
                    case 12:
                        Start(false, true);
                        break;
                    default:
                        break;
                }
            }

            void WaypointReached(uint32 waypointId) override
            {
                if (waypointId == 4)
                    me->DespawnOrUnsummon(500);
            }

            void UpdateAI(uint32 diff) override
            {
                if (IntroTimer)
                {
                    if (IntroTimer <= diff)
                    {
                        Talk(0);
                        IntroTimer = 0;
                        me->GetMotionMaster()->MoveJump(1216.78f, 3499.44f, 91.15f, 10, 20, 10);
                    }
                    else
                        IntroTimer -= diff;
                }

                npc_escortAI::UpdateAI(diff);
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_aysa_lake_escortAI(creature);
        }
};

// NPC 54567
class npc_aysa : public CreatureScript
{
    enum
    {
        QUEST_WAY_OF_THE_TUSHUI = 29414,
        NPC_AYSA_LAKE_ESCORT    = 56661,
        NPC_MASTER_LI_FEI       = 54856,
        SPELL_MEDITATION_BAR    = 116421,
        NPC_TROUBLEMAKER        = 59637,

        SAY_INTRO               = 0,
        SAY_END
    };

    enum eEvents
    {
        EVENT_START = 1,
        EVENT_SPAWN_MOBS = 2,
        EVENT_PROGRESS = 3,
        EVENT_END = 4,
    };

    public:
        npc_aysa() : CreatureScript("npc_aysa") { }

        bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
        {
            if (quest->GetQuestId() == QUEST_WAY_OF_THE_TUSHUI)
                if (Creature* tempSummon = creature->SummonCreature(NPC_AYSA_LAKE_ESCORT, *creature, TEMPSUMMON_MANUAL_DESPAWN, 0, player->GetGUID()))
                    tempSummon->SetPhaseMask(1, true);

            return true;
        }

        struct npc_aysaAI : public ScriptedAI
        {
            npc_aysaAI(Creature* creature) : ScriptedAI(creature)
            {
                if (me->GetAreaId() == 5848) // Cave of Meditation
                    events.ScheduleEvent(EVENT_START, 600); //Begin script
                inCombat = false;
                timer = 0;
                lifeiGUID = 0;
                me->SetReactState(REACT_DEFENSIVE);
                me->setFaction(2263);
            }

            EventMap events;
            std::vector<Player*> playersInvolved;

            uint64 lifeiGUID;

            bool inCombat;
            uint32 timer;

            void DamageTaken(Unit* /*attacker*/, uint32& damage) override
            {
                if (me->HealthBelowPctDamaged(5, damage))
                {
                    DespawnLifei();
                    damage = 0;
                    me->SetFullHealth();
                    me->SetReactState(REACT_DEFENSIVE);

                    std::list<Creature*> unitlist;
                    GetCreatureListWithEntryInGrid(unitlist, me, NPC_TROUBLEMAKER, 50.0f);
                    for (auto&& creature: unitlist)
                        me->Kill(creature);

                    events.ScheduleEvent(EVENT_START, 20000);
                    events.CancelEvent(EVENT_SPAWN_MOBS);
                    events.CancelEvent(EVENT_PROGRESS);
                    events.CancelEvent(EVENT_END);
                }
            }

            void UpdatePlayerList()
            {
                playersInvolved.clear();

                std::list<Player*> PlayerList;
                GetPlayerListInGrid(PlayerList, me, 20.0f);

                for (auto&& player: PlayerList)
                    if (!player->IsGameMaster() && player->GetQuestStatus(QUEST_WAY_OF_THE_TUSHUI) == QUEST_STATUS_INCOMPLETE)
                        playersInvolved.push_back(player);
            }

            Creature* GetLifei()
            {
                if (lifeiGUID != 0)
                    return Creature::GetCreature(*me, lifeiGUID);
                else
                {
                    TempSummon * temp = me->SummonCreature(NPC_MASTER_LI_FEI, 1130.162231f, 3435.905518f, 105.496597f, 0.0f, TEMPSUMMON_MANUAL_DESPAWN);
                    temp->GetMotionMaster()->Clear();
                    temp->GetMotionMaster()->MoveRandom(10.0f);
                    lifeiGUID = temp->GetGUID();
                    return temp;
                }
            }

            void DespawnLifei()
            {
                if (lifeiGUID)
                {
                    if (Creature* lifei = GetLifei())
                    {
                        lifei->DespawnOrUnsummon();
                        lifeiGUID = 0;
                    }
                }
            }

            void UpdateAI(uint32 diff) override
            {
                events.Update(diff);
                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_START: //Begin script if playersInvolved is not empty
                        {
                            UpdatePlayerList();
                            if (playersInvolved.empty())
                                events.ScheduleEvent(EVENT_START, 600); // reschedule
                            else
                            {
                                Talk(SAY_INTRO);
                                me->SetReactState(REACT_PASSIVE);
                                timer = 0;
                                events.ScheduleEvent(EVENT_SPAWN_MOBS, 5000); //spawn mobs
                                events.ScheduleEvent(EVENT_PROGRESS, 1000); //update time
                                events.ScheduleEvent(EVENT_END, 90000); //end quest
                            }
                            break;
                        }
                        case EVENT_SPAWN_MOBS: //Spawn 3 mobs
                        {
                            UpdatePlayerList();

                            auto const maxSize = std::min<size_t>(playersInvolved.size(), 5);
                            auto const maxSpawns = std::max<size_t>(maxSize * 3, 3);

                            for (size_t i = 0; i < maxSpawns; ++i)
                                if (TempSummon* temp = me->SummonCreature(NPC_TROUBLEMAKER, 1171.71f, 3443.82f, 104.20f, 3.3f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000))
                                {
                                    temp->AddThreat(me, 250.0f);

                                    temp->SetInCombatWith(me);
                                    me->SetInCombatWith(me);
                                    temp->GetMotionMaster()->MoveChase(me);
                                }

                            events.ScheduleEvent(EVENT_SPAWN_MOBS, 20000); //spawn mobs
                            break;
                        }
                        case EVENT_PROGRESS: //update energy
                        {
                            timer++;

                            uint8 lafeiTalkThreshold[7] = { 25, 30, 42, 54, 66, 78, 85 };

                            for (int i = 0; i < 7; ++i)
                                if (timer == lafeiTalkThreshold[i])
                                {
                                    Creature* lifei = GetLifei();
                                    lifei->AI()->Talk(i);

                                    if (i == 6)
                                    {
                                        lifei->DespawnOrUnsummon(500);
                                        lifeiGUID = 0;
                                    }
                                    break;
                                }

                            UpdatePlayerList();
                            for (auto&& player: playersInvolved)
                            {
                                if (!player->HasAura(SPELL_MEDITATION_BAR))
                                    player->CastSpell(player, SPELL_MEDITATION_BAR);

                                player->SetPower(POWER_ALTERNATE_POWER, timer);
                                player->SetMaxPower(POWER_ALTERNATE_POWER, 90);
                            }

                            events.ScheduleEvent(EVENT_PROGRESS, 1000);
                            break;
                        }
                        case EVENT_END: //script end
                        {
                            if (Creature* lifei = GetLifei())
                            {
                                lifei->DespawnOrUnsummon();
                                lifeiGUID = 0;
                            }

                            events.ScheduleEvent(EVENT_START, 10000);
                            events.CancelEvent(EVENT_SPAWN_MOBS);
                            events.CancelEvent(EVENT_PROGRESS);
                            Talk(SAY_END);
                            me->SetReactState(REACT_DEFENSIVE);

                            UpdatePlayerList();
                            for (auto&& player: playersInvolved)
                            {
                                player->KilledMonsterCredit(NPC_MASTER_LI_FEI, 0);
                                player->RemoveAura(SPELL_MEDITATION_BAR);
                            }
                            break;
                        }
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_aysaAI(creature);
        }
};

class boss_li_fei_fight : public CreatureScript
{
    public:
        boss_li_fei_fight() : CreatureScript("boss_li_fei_fight") { }

        struct boss_li_fei_fightAI : public ScriptedAI
        {
            boss_li_fei_fightAI(Creature* creature) : ScriptedAI(creature) { }

            enum
            {
                EVENT_FEET_OF_FURY      = 1,
                EVENT_SHADOW_KICK       = 2,
                EVENT_SHADOW_KICK_STUN  = 3,

                QUEST_ONLY_THE_WORTHY_SHALL_PASS = 29421,
            };

            EventMap events;

            void Reset() override
            {
                me->SetFullHealth();

                events.Reset();
                events.ScheduleEvent(EVENT_FEET_OF_FURY, 5000);
                events.ScheduleEvent(EVENT_SHADOW_KICK,  1000);
            }

            // Li Fei does not aggro himself
            void MoveInLineOfSight(Unit* /*who*/) override { }

            void DamageTaken(Unit* /*attacker*/, uint32& damage) override
            {
                if (!me->HealthBelowPctDamaged(10, damage))
                    return;

                damage = 0;

                // copy, just to make sure that kill credit that phases players out
                // does not modify this threat list
                auto const threatList = me->getThreatManager().getThreatList();
                for (auto&& hostileRef : threatList)
                {
                    auto unit = hostileRef->getTarget();
                    if (unit && unit->GetTypeId() == TYPEID_PLAYER)
                        unit->ToPlayer()->KilledMonsterCredit(54734, 0);
                }

                // TODO: it seems that spell 106275 is used to display a text message
                // after fight is over

                me->DeleteThreatList();
                me->CombatStop(true);

                Reset();
            }

            void KilledUnit(Unit* victim) override
            {
                // Player managed to die with Blessings of Fire on
                if (auto const player = victim->ToPlayer())
                    player->SetQuestStatus(QUEST_ONLY_THE_WORTHY_SHALL_PASS, QUEST_STATUS_FAILED);
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (auto const eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_FEET_OF_FURY:
                            if (auto const victim = me->GetVictim())
                                me->CastSpell(victim, 108958);
                            events.ScheduleEvent(EVENT_FEET_OF_FURY, 13000);
                            break;
                        case EVENT_SHADOW_KICK:
                            if (auto const victim = me->GetVictim())
                                me->CastSpell(victim, 108936);
                            events.ScheduleEvent(EVENT_SHADOW_KICK_STUN, 2500);
                            events.ScheduleEvent(EVENT_SHADOW_KICK, 30000);
                            break;
                        case EVENT_SHADOW_KICK_STUN:
                            if (auto const victim = me->GetVictim())
                                me->CastSpell(victim, 108944);
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_li_fei_fightAI(creature);
        }
};

// Huo Benediction - 102630
class spell_huo_benediction: public SpellScriptLoader
{
    public:
        spell_huo_benediction() : SpellScriptLoader("spell_huo_benediction") { }

        class spell_huo_benediction_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_huo_benediction_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* target = GetTarget();

                if (!target)
                    return;

                std::list<Creature*> huoList;
                GetCreatureListWithEntryInGrid(huoList, target, 54958, 20.0f);

                for (auto&& huo: huoList)
                    if (huo->ToTempSummon())
                        if (huo->ToTempSummon()->GetOwnerGUID() == target->GetGUID())
                            return;

                // A partir d'ici on sait que le joueur n'a pas encore de Huo
                if (TempSummon* tempHuo = target->SummonCreature(54958, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                {
                    tempHuo->SetExplicitSeerGuid(target->GetGUID());
                    tempHuo->SetOwnerGUID(target->GetGUID());
                    tempHuo->GetMotionMaster()->MoveFollow(target, PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);
                }
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* target = GetTarget();

                if (!target)
                    return;

                std::list<Creature*> huoList;
                GetCreatureListWithEntryInGrid(huoList, target, 54958, 20.0f);

                for (auto&& huo: huoList)
                    if (huo->ToTempSummon())
                        if (huo->ToTempSummon()->GetOwnerGUID() == target->GetGUID())
                            huo->DespawnOrUnsummon();
            }

            void Register() override
            {
                OnEffectApply  += AuraEffectApplyFn (spell_huo_benediction_AuraScript::OnApply,  EFFECT_0, SPELL_AURA_MOD_INCREASE_SPEED, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
                OnEffectRemove += AuraEffectRemoveFn(spell_huo_benediction_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_MOD_INCREASE_SPEED, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_huo_benediction_AuraScript();
        }
};

class AreaTrigger_at_temple_entrance : public AreaTriggerScript
{
    public:
        AreaTrigger_at_temple_entrance() : AreaTriggerScript("AreaTrigger_at_temple_entrance") { }

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*trigger*/) override
        {
            if (player->GetQuestStatus(29423) == QUEST_STATUS_INCOMPLETE)
            {
                player->KilledMonsterCredit(61128, 0);

                std::list<Creature*> huoList;
                GetCreatureListWithEntryInGrid(huoList, player, 54958, 20.0f);

                for (auto&& huo: huoList)
                {
                    if (huo->ToTempSummon())
                    {
                        if (huo->ToTempSummon()->GetOwnerGUID() == player->GetGUID())
                        {
                            huo->GetMotionMaster()->Clear();
                            huo->GetMotionMaster()->MovePoint(1, 950.0f, 3601.0f, 203.0f);
                            huo->DespawnOrUnsummon(5000);
                        }
                    }
                }
            }

            return true;
        }
};

class npc_trainee_nim : public CreatureScript
{
    public:
        npc_trainee_nim() : CreatureScript("npc_trainee_nim") { }

        struct npc_trainee_nimAI : public ScriptedAI
        {
            npc_trainee_nimAI(Creature* creature) : ScriptedAI(creature) { }
            std::set<uint64> guids;

            void MoveInLineOfSight(Unit*  who)
            {
                Player * const player = who->ToPlayer();
                if (!player)
                    return;

                if (player->GetQuestStatus(29409) != QUEST_STATUS_INCOMPLETE)
                    return;

                if (who->GetDistance(me) < 20.f)
                {
                    if (guids.find(player->GetGUID()) == guids.end())
                    {
                        Talk(0, player);
                        guids.insert(player->GetGUID());
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_trainee_nimAI(creature);
        }
};

class spell_lit_brazier_of_flame : public SpellScriptLoader
{
    public:
        spell_lit_brazier_of_flame() : SpellScriptLoader("spell_lit_brazier_of_flame") { }

        class spell_lit_brazier_of_flame_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_lit_brazier_of_flame_SpellScript)

            enum
            {
                QUEST_THE_CHALLENGERS_FIRES = 29664
            };

            SpellCastResult CheckCast()
            {
                auto const caster = GetCaster()->ToPlayer();
                if (!caster)
                    return SPELL_FAILED_DONT_REPORT;
                switch (caster->GetQuestStatus(QUEST_THE_CHALLENGERS_FIRES))
                {
                    case QUEST_STATUS_NONE:
                        return SPELL_FAILED_DONT_REPORT;
                    case QUEST_STATUS_COMPLETE:
                    case QUEST_STATUS_REWARDED:
                        return SPELL_CAST_OK;
                    default:
                        // For spell_area casts only
                        if (GetSpell()->IsTriggered())
                        {
                            auto const killCredit = GetSpellInfo()->Effects[EFFECT_2].MiscValue;
                            if (caster->GetReqKillOrCastCurrentCount(QUEST_THE_CHALLENGERS_FIRES, killCredit) != 0)
                                return SPELL_FAILED_DONT_REPORT;

                        }
                        return SPELL_CAST_OK;
                }
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_lit_brazier_of_flame_SpellScript::CheckCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_lit_brazier_of_flame_SpellScript;
        }
};

class spell_feet_of_fury : public SpellScriptLoader
{
    public:
        spell_feet_of_fury() : SpellScriptLoader("spell_feet_of_fury") { }

        class spell_feet_of_fury_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_feet_of_fury_AuraScript)

            uint64 targetGuid;

            bool Load() override
            {
                targetGuid = 0;
                return true;
            }

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                auto const caster = GetCaster();
                if (!caster)
                    return;

                if (auto const target = caster->GetVictim())
                    targetGuid = target->GetGUID();
            }

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();

                if (targetGuid == 0)
                    return;

                auto const caster = GetCaster();
                auto const target = ObjectAccessor::GetUnit(*caster, targetGuid);

                if (!target)
                {
                    targetGuid = 0;
                    return;
                }

                auto const spellId = GetSpellInfo()->Effects[EFFECT_0].TriggerSpell;
                caster->CastSpell(target, spellId, true);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_feet_of_fury_AuraScript::OnApply,  EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_feet_of_fury_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_feet_of_fury_AuraScript;
        }
};

void AddSC_wandering_island_north()
{
    new npc_master_shang_xi();
    new npc_training_target();
	new npc_aysa();
	new boss_li_fei_fight();
	new npc_aysa_lake_escort();
	new npc_trainee_nim();

	new go_wandering_weapon_rack();

    new spell_huo_benediction();
    new spell_lit_brazier_of_flame();
    new spell_feet_of_fury();

	new AreaTrigger_at_temple_entrance();
}
