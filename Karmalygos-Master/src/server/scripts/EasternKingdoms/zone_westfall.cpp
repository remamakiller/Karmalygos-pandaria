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

// Wake Harvest Golem 79436
class spell_westfall_wake_harvest_golem : public SpellScript
{
    PrepareSpellScript(spell_westfall_wake_harvest_golem);

    void HandleHit(SpellEffIndex effIndex)
    {
        if (Player* caster = GetCaster()->ToPlayer())
            caster->KilledMonsterCredit(GetSpellInfo()->Effects[EFFECT_1].MiscValue);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_westfall_wake_harvest_golem::HandleHit, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

enum eCrate
{
	QUEST_LIVIN_THE_LIFE = 26228
};

class npc_crate_mine : public CreatureScript
{
public:
	npc_crate_mine() : CreatureScript("npc_crate_mine") {}

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_crate_mineAI(creature);
	}

	struct npc_crate_mineAI : public ScriptedAI
	{
		npc_crate_mineAI(Creature* creature) : ScriptedAI(creature) {}

		uint8 Phase;
		uint32 EntryTime;
		uint64 PlayerGUID;
		uint64 Shadowy1GUID;
		uint64 GlubtoklGUID;

		bool bSummoned;

		void Reset() override
		{
			Phase = 0;
			EntryTime = 1000;
			bSummoned = false;
			PartySummoned();
		}

		void PartySummoned()
		{
			if (!bSummoned)
			{
				if (Creature* glubtok1 = me->SummonCreature(42492, -9848.11f, 1395.29f, 37.70f, 0.56f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 85000))
					if (Creature* shadowy1 = me->SummonCreature(42515, -9826.083f, 1406.738f, 36.885f, 3.56f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 85000))
					{
						GlubtoklGUID = glubtok1->GetGUID();
						Shadowy1GUID = shadowy1->GetGUID();

						bSummoned = true;
						EntryTime = 250;
					}
			}
		}

		void UpdateAI(uint32 diff) override
		{
			if (EntryTime <= diff)
			{
				if (bSummoned)
				{
					//if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
					if (Creature* glubtok1 = ObjectAccessor::GetCreature(*me, GlubtoklGUID))
						if (Creature* shadowy1 = ObjectAccessor::GetCreature(*me, Shadowy1GUID))
						{
							switch (Phase)
							{
							case 0:
							{
								EntryTime = 2500;
								Phase++;
								break;
							}
							case 1:
							{
								shadowy1->SetWalk(true);
								shadowy1->GetMotionMaster()->MovePoint(0, -9840.526f, 1399.37f, 37.177f);
								EntryTime = 7000;
								Phase++;
								break;
							}
							case 2:
							{
								glubtok1->AI()->Talk(0);
								EntryTime = 5000;
								Phase++;
								break;
							}
							case 3:
							{
								shadowy1->AI()->Talk(0);
								EntryTime = 8500;
								Phase++;
								break;
							}
							case 4:
							{
								glubtok1->AI()->Talk(1);
								EntryTime = 4000;
								Phase++;
								break;
							}
							case 5:
							{
								shadowy1->AI()->Talk(1);
								EntryTime = 6500;
								Phase++;
								break;
							}
							case 6:
							{
								shadowy1->AI()->Talk(2);
								EntryTime = 6500;
								Phase++;
								break;
							}
							case 7:
							{
								glubtok1->AI()->Talk(2);
								EntryTime = 4000;
								Phase++;
								break;
							}
							case 8:
							{
								shadowy1->AI()->Talk(3);
								EntryTime = 7000;
								Phase++;
								break;
							}
							case 9:
							{
								glubtok1->AI()->Talk(3);
								EntryTime = 7000;
								Phase++;
								break;
							}
							case 10:
							{
								glubtok1->AI()->Talk(4);
								EntryTime = 6000;
								Phase++;
								break;
							}
							case 11:
							{
								shadowy1->AI()->Talk(4);
								EntryTime = 6000;
								Phase++;
								break;
							}
							case 12:
							{
								shadowy1->AI()->Talk(5);
								EntryTime = 6000;
								Phase++;
								break;
							}
							case 13:
							{
								me->DespawnOrUnsummon(5000);
								glubtok1->CastSpell(glubtok1, 64446, true);
								glubtok1->DespawnOrUnsummon(1000);
								shadowy1->CastSpell(shadowy1, 64446, true);
								shadowy1->DespawnOrUnsummon(1000);

								std::list<Player*> players;
								me->GetPlayerListInGrid(players, 50.0f);

								for (std::list<Player*>::const_iterator itr = players.begin(); itr != players.end(); ++itr)
									(*itr)->GroupEventHappens(QUEST_LIVIN_THE_LIFE, me);

								Phase = 0;
							}
							break;
							default:
								break;
							}
						}
				}
			}
			else EntryTime -= diff;
		}
	};
};

void AddSC_westfall()
{
    new spell_script<spell_westfall_wake_harvest_golem>("spell_westfall_wake_harvest_golem");
	new npc_crate_mine();
}
