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

/* ScriptData
SDName: Instance_Arcatraz
SD%Complete: 80
SDComment: Mainly Harbringer Skyriss event
SDCategory: Tempest Keep, The Arcatraz
EndScriptData */

#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "arcatraz.h"

#define MAX_ENCOUNTER 9

/* Arcatraz encounters:
1 - Zereketh the Unbound event
2 - Dalliah the Doomsayer event
3 - Wrath-Scryer Soccothrates event
4 - Harbinger Skyriss event, 5 sub-events
*/

class instance_arcatraz : public InstanceMapScript
{
    public:
        instance_arcatraz() : InstanceMapScript("instance_arcatraz", 552) { }

        struct instance_arcatraz_InstanceMapScript : public InstanceScript
        {
            instance_arcatraz_InstanceMapScript(Map* map) : InstanceScript(map) { }

            uint32 m_auiEncounter[MAX_ENCOUNTER];

            uint64 Containment_Core_Security_Field_AlphaGUID;
            uint64 Containment_Core_Security_Field_BetaGUID;
            uint64 Pod_AlphaGUID;
            uint64 Pod_GammaGUID;
            uint64 Pod_BetaGUID;
            uint64 Pod_DeltaGUID;
            uint64 Pod_OmegaGUID;
            uint64 Wardens_ShieldGUID;
            uint64 GoSphereGUID;
            uint64 MellicharGUID;
            uint64 DalliahGUID;
            uint64 SoccothratesGUID;
            uint64 ZerekethGUID;
            uint64 SkyrissGUID;
            uint64 CoreDoorGUID;

            void Initialize() override
            {
                memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

                Containment_Core_Security_Field_AlphaGUID = 0;
                Containment_Core_Security_Field_BetaGUID  = 0;
                Pod_AlphaGUID                             = 0;
                Pod_GammaGUID                             = 0;
                Pod_BetaGUID                              = 0;
                Pod_DeltaGUID                             = 0;
                Pod_OmegaGUID                             = 0;
                Wardens_ShieldGUID                        = 0;
                GoSphereGUID                              = 0;
                MellicharGUID                             = 0;
                DalliahGUID                               = 0;
                SoccothratesGUID                          = 0;
                ZerekethGUID                              = 0;
                SkyrissGUID                               = 0;
                CoreDoorGUID                              = 0;
            }

            bool IsEncounterInProgress() const override
            {
                for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                    if (m_auiEncounter[i] == IN_PROGRESS)
                        return true;

                return false;
            }

            void OnGameObjectCreate(GameObject* go) override
            {
                switch (go->GetEntry())
                {
                    case GO_CONTAINMENT_CORE_SECURITY_FIELD_ALPHA:
                        Containment_Core_Security_Field_AlphaGUID = go->GetGUID();
                        break;
                    case GO_CONTAINMENT_CORE_SECURITY_FIELD_BETA:
                        Containment_Core_Security_Field_BetaGUID = go->GetGUID();
                        break;
                    case GO_POD_ALPHA:
                        Pod_AlphaGUID = go->GetGUID();
                        break;
                    case GO_POD_GAMMA:
                        Pod_GammaGUID = go->GetGUID();
                        break;
                    case GO_POD_BETA:
                        Pod_BetaGUID = go->GetGUID();
                        break;
                    case GO_POD_DELTA:
                        Pod_DeltaGUID = go->GetGUID();
                        break;
                    case GO_POD_OMEGA:
                        Pod_OmegaGUID = go->GetGUID();
                        break;
                    case GO_SEAL_SPHERE:
                        GoSphereGUID = go->GetGUID();
                        break;
                    /*case WARDENS_SHIELD:
                        Wardens_ShieldGUID = go->GetGUID();
                        break;*/
                }
            }

            void OnCreatureCreate(Creature* creature) override
            {
                switch (creature->GetEntry())
                {
                    case NPC_MELLICHAR:
                        MellicharGUID = creature->GetGUID();
                        break;
                    case NPC_ZEREKETH_THE_UNBOUND:
                        ZerekethGUID = creature->GetGUID();
                        break;
                    case NPC_WRATH_SCRYER_SOCCOTHRATE:
                        SoccothratesGUID = creature->GetGUID();
                        break;
                    case NPC_DALLIAH_THE_DOOMSAYER:
                        DalliahGUID = creature->GetGUID();
                        break;
                }
            }

            void SetData(uint32 type, uint32 data) override
            {
                switch (type)
                {
                    case TYPE_ZEREKETH:
                        m_auiEncounter[0] = data;
                        break;
                    case TYPE_DALLIAH:
                        if (data == DONE)
                        {
                            if (GameObject* go = instance->GetGameObject(Containment_Core_Security_Field_BetaGUID))
                                go->UseDoorOrButton();
                        }
                        m_auiEncounter[1] = data;
                        break;
                    case TYPE_SOCCOTHRATES:
                        if (data == DONE)
                        {
                            if (GameObject* go = instance->GetGameObject(Containment_Core_Security_Field_AlphaGUID))
                                go->UseDoorOrButton();
                        }
                        m_auiEncounter[2] = data;
                        break;
                    case TYPE_HARBINGERSKYRISS:
                        if (data == NOT_STARTED || data == FAIL)
                        {
                            m_auiEncounter[4] = NOT_STARTED;
                            m_auiEncounter[5] = NOT_STARTED;
                            m_auiEncounter[6] = NOT_STARTED;
                            m_auiEncounter[7] = NOT_STARTED;
                            m_auiEncounter[8] = NOT_STARTED;
                        }
                        m_auiEncounter[3] = data;
                        break;
                    case TYPE_WARDEN_1:
                        if (data == IN_PROGRESS)
                            if (GameObject* go = instance->GetGameObject(Pod_AlphaGUID))
                                go->UseDoorOrButton();
                        m_auiEncounter[4] = data;
                        break;
                    case TYPE_WARDEN_2:
                        if (data == IN_PROGRESS)
                        {
                            if (GameObject* go = instance->GetGameObject(Pod_BetaGUID))
                                go->UseDoorOrButton();
                        }
                        m_auiEncounter[5] = data;
                        break;
                    case TYPE_WARDEN_3:
                        if (data == IN_PROGRESS)
                        {
                            if (GameObject* go = instance->GetGameObject(Pod_DeltaGUID))
                                go->UseDoorOrButton();
                        }
                        m_auiEncounter[6] = data;
                        break;
                    case TYPE_WARDEN_4:
                        if (data == IN_PROGRESS)
                        {
                            if (GameObject* go = instance->GetGameObject(Pod_GammaGUID))
                                go->UseDoorOrButton();
                        }
                        m_auiEncounter[7] = data;
                        break;
                    case TYPE_WARDEN_5:
                        if (data == IN_PROGRESS)
                        {
                            if (GameObject* go = instance->GetGameObject(Pod_OmegaGUID))
                                go->UseDoorOrButton();
                        }
                        m_auiEncounter[8] = data;
                        break;
                    case TYPE_SHIELD_OPEN:
                        if (data == IN_PROGRESS)
                        {
                            if (GameObject* go = instance->GetGameObject(Wardens_ShieldGUID))
                                go->UseDoorOrButton();
                        }
                        break;
                }
            }

            uint32 GetData(uint32 type) const override
            {
                switch (type)
                {
                    case TYPE_HARBINGERSKYRISS: return m_auiEncounter[3];
                    case TYPE_WARDEN_1:         return m_auiEncounter[4];
                    case TYPE_WARDEN_2:         return m_auiEncounter[5];
                    case TYPE_WARDEN_3:         return m_auiEncounter[6];
                    case TYPE_WARDEN_4:         return m_auiEncounter[7];
                    case TYPE_WARDEN_5:         return m_auiEncounter[8];
                }
                return 0;
            }

            uint64 GetData64(uint32 data) const override
            {
                switch (data)
                {
                    case DATA_MELLICHAR:        return MellicharGUID;
                    case DATA_SPHERE_SHIELD:    return GoSphereGUID;
                    case TYPE_DALLIAH:          return DalliahGUID;
                    case TYPE_SOCCOTHRATES:     return SoccothratesGUID;
                    case TYPE_ZEREKETH:         return ZerekethGUID;
                }
                return 0;
            }
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_arcatraz_InstanceMapScript(map);
        }
};

void AddSC_instance_arcatraz()
{
    new instance_arcatraz;
}

