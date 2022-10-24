#include "throne_of_the_four_winds.h"

#define MAX_ENCOUNTER 2

class instance_throne_of_the_four_winds : public InstanceMapScript
{
    public:
        instance_throne_of_the_four_winds() : InstanceMapScript("instance_throne_of_the_four_winds", 754) { }

        struct instance_throne_of_the_four_winds_InstanceMapScript: public InstanceScript
        {
            instance_throne_of_the_four_winds_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
            {
                SetBossNumber(MAX_ENCOUNTER);

                uiConclaveofWind    = 0;
                uiAnshal            = 0;
                uiNezir             = 0;
                uiRohash            = 0;
                uiAlakir            = 0;
                memset(uiHeartOfWind, 0, sizeof(uiHeartOfWind));
                bSlipstreamsSpawned = false;
            }

            void Update(uint32 /*diff*/) override
            {
                if (GetBossState(DATA_ALAKIR) == DONE)
                {
                    Map::PlayerList const& players = instance->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                        if (Player* player = itr->GetSource())
                            if (player->IsAlive() && player->GetExactDist2d(&conclaveHomePositions[4]) < 100 && !player->HasAura(SPELL_EYE_OF_THE_STORM))
                                player->CastSpell(player, SPELL_EYE_OF_THE_STORM, true);
                }
            }

            void OnPlayerEnter(Player* /*player*/) override
            {
                if (!bSlipstreamsSpawned && GetBossState(DATA_CONCLAVE_OF_WIND) == DONE)
                {
                    bSlipstreamsSpawned = true;
                    for (uint32 i = 0; i < 4; ++i)
                        instance->SummonCreature(NPC_SLIPSTREAM, conclaveHomePositions[i]);
                }
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                    case BOSS_ANSHAL:
                        uiAnshal = creature->GetGUID();
                        break;
                    case BOSS_NEZIR:
                        uiNezir = creature->GetGUID();
                        break;
                    case BOSS_ROHASH:
                        uiRohash = creature->GetGUID();
                        break;
                    case BOSS_ALAKIR:
                        uiAlakir = creature->GetGUID();
                        if (GetBossState(DATA_CONCLAVE_OF_WIND) == DONE)
                            creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
                        break;
                }
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                switch (go->GetEntry())
                {
                    case GO_WIND_DRAFTEFFECT_CENTER:
                        if (GetBossState(DATA_ALAKIR) == DONE)
                            go->SetGoState(GO_STATE_ACTIVE);
                        break;
                    case GO_FLOOR_ALAKIR:
                        if (GetBossState(DATA_ALAKIR) == DONE)
                            go->SetDestructibleState(GO_DESTRUCTIBLE_DESTROYED);
                        break;
                    case GO_HEART_OF_WIND_10N:
                        uiHeartOfWind[0] = go->GetGUID();
                        break;
                    case GO_HEART_OF_WIND_25N:
                        uiHeartOfWind[1] = go->GetGUID();
                        break;
                    case GO_HEART_OF_WIND_10H:
                        uiHeartOfWind[2] = go->GetGUID();
                        break;
                    case GO_HEART_OF_WIND_25H:
                        uiHeartOfWind[3] = go->GetGUID();
                        break;
                    default:
                        break;
                }
            }

            uint64 GetData64(uint32 type) const override
            {
                switch (type)
                {
                    case DATA_CONCLAVE_OF_WIND:
                        return uiConclaveofWind;
                    case DATA_ALAKIR:
                        return uiAlakir;
                    case DATA_HEART_OF_WIND_10N:
                        return uiHeartOfWind[0];
                    case DATA_HEART_OF_WIND_25N:
                        return uiHeartOfWind[1];
                    case DATA_HEART_OF_WIND_10H:
                        return uiHeartOfWind[2];
                    case DATA_HEART_OF_WIND_25H:
                        return uiHeartOfWind[3];
                    default:
                        return 0;
                }
                return 0;
            }

            bool SetBossState(uint32 type, EncounterState state) override
            {
                if (!InstanceScript::SetBossState(type, state))
                    return false;

                if (type == DATA_CONCLAVE_OF_WIND && state == DONE)
                {
                    bSlipstreamsSpawned = true;
                    for (uint32 i = 0; i < 4; ++i)
                        instance->SummonCreature(NPC_SLIPSTREAM, conclaveHomePositions[i]);
                }

                return true;
            }

            bool CheckRequiredBosses(uint32 bossId, Player const* player = NULL) const override
            {
                if (player && player->IsGameMaster())
                    return true;

                if (bossId == DATA_ALAKIR)
                    return GetBossState(DATA_CONCLAVE_OF_WIND) == DONE;

                return true;
            }

            std::string GetSaveData() override
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << "T W " << GetBossSaveData();

                OUT_SAVE_INST_DATA_COMPLETE;
                return saveStream.str();
            }

            void Load(const char* in) override
            {
                if (!in)
                {
                    OUT_LOAD_INST_DATA_FAIL;
                    return;
                }

                OUT_LOAD_INST_DATA(in);

                char dataHead1, dataHead2;

                std::istringstream loadStream(in);
                loadStream >> dataHead1 >> dataHead2;

                if (dataHead1 == 'T' && dataHead2 == 'W')
                {
                    for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                    {
                        uint32 tmpState;
                        loadStream >> tmpState;
                        if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                            tmpState = NOT_STARTED;
                        SetBossState(i, EncounterState(tmpState));
                    }
                }
                else OUT_LOAD_INST_DATA_FAIL;

                OUT_LOAD_INST_DATA_COMPLETE;
            }

            private:
                uint64 uiConclaveofWind;
                uint64 uiAnshal;
                uint64 uiNezir;
                uint64 uiRohash;
                uint64 uiAlakir;
                uint64 uiHeartOfWind[MAX_DIFFICULTY];
                bool bSlipstreamsSpawned;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_throne_of_the_four_winds_InstanceMapScript(map);
        }
};

void AddSC_instance_throne_of_the_four_winds()
{
    new instance_throne_of_the_four_winds();
}
