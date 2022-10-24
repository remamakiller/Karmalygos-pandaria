#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum eZoneGilneas
{
	NPC_WORGEN_ALPHA_C2 = 35167,
	NPC_WORGEN_ALPHA_C1 = 35170,
	NPC_WORGEN_RUNT_C1 = 35188,
	NPC_WORGEN_RUNT_C2 = 35456,

	SPELL_BY_THE_SKIN = 66914,
	SPELL_ENRAGE_8599 = 8599,
	SPELL_GILNEAS_PRISON_PERIODIC_1 = 66894,
	SPELL_GILNEAS_PRISON_PERIODIC_2 = 68218,
};

/* 35077 - QUEST: 14154 - By The Skin of His Teeth - START */
class npc_lord_darius_crowley_35077 : public CreatureScript
{
public:
	npc_lord_darius_crowley_35077() : CreatureScript("npc_lord_darius_crowley_35077") { }

	enum eNpc
	{
		ACTION_START_EVENT = 101,
	};

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
	{
		if (quest->GetQuestId() == 14154)
			if (CAST_AI(npc_lord_darius_crowley_35077AI, creature->AI())->m_playerGUID == 0)
			{
				creature->AI()->SetGUID(player->GetGUID());
				creature->AI()->DoAction(ACTION_START_EVENT);
				creature->CastSpell(player, SPELL_BY_THE_SKIN, true);
			}
		return true;
	}

	struct npc_lord_darius_crowley_35077AI : public ScriptedAI
	{
		npc_lord_darius_crowley_35077AI(Creature* creature) : ScriptedAI(creature), m_summons(me) { Init(); }

		enum eQ14154
		{
			Event120Secounds = 1,
			EventCheckPlayerIsAlive,
			EventSummonNextWave,
			EventHelpPlayer,
		};

		ObjectGuid m_playerGUID;
		EventMap m_events;
		SummonList m_summons;
		uint32 m_phase;

		void Init()
		{
			m_events.Reset();
			m_summons.DespawnAll();
		}

		void JustSummoned(Creature* summoned) override
		{
			m_summons.Summon(summoned);
		}

		void SummonedCreatureDies(Creature* summon, Unit* /*killer*/) override
		{
			m_summons.Despawn(summon);
		}

		void DoAction(int32 /*action*/) override
		{
			m_phase = 1;
			m_events.ScheduleEvent(EventCheckPlayerIsAlive, 1000);
			m_events.ScheduleEvent(EventSummonNextWave, 1000);
			m_events.ScheduleEvent(Event120Secounds, 120000);
			m_events.ScheduleEvent(EventHelpPlayer, 250);
		}

		void SetGUID(uint64 guid, int32 /*type = 0*/) override
		{
			m_playerGUID = guid;
		}

		void DamageTaken(Unit* attacker, uint32& /*damage*/) override
		{
			if (/*Creature* worgen = */attacker->ToCreature())
				if (!me->IsInCombat())
				{
					//me->Attack(worgen, true);
				}
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			while (uint32 eventId = m_events.ExecuteEvent())
			{
				switch (eventId)
				{
				case Event120Secounds:
					Init();
					break;
				case EventCheckPlayerIsAlive: // check every sec player is alive
					if (!m_playerGUID == 0 && m_phase)
						if (Player * player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
							if (!player->IsInWorld() || !player->IsAlive())
								Init();

					m_events.ScheduleEvent(EventCheckPlayerIsAlive, 1000);
					break;
				case EventSummonNextWave:
				{
					for (int i = 0; i < 4; i++)
					{
						uint32 w1 = RAND(NPC_WORGEN_RUNT_C1, NPC_WORGEN_RUNT_C2, NPC_WORGEN_ALPHA_C1, NPC_WORGEN_ALPHA_C2);
						uint32 w2 = RAND(NPC_WORGEN_RUNT_C1, NPC_WORGEN_RUNT_C2, NPC_WORGEN_ALPHA_C1, NPC_WORGEN_ALPHA_C2);
						Creature* creature1 = me->SummonCreature(w1, -1610.39f, 1507.16f, 74.99f, 3.94f, TEMPSUMMON_TIMED_DESPAWN, 120000);
						m_summons.Summon(creature1);
						creature1->AI()->SetGUID(m_playerGUID);
						creature1->AI()->DoAction(1);
						Creature* creature2 = me->SummonCreature(w2, -1718.01f, 1516.81f, 55.40f, 4.6f, TEMPSUMMON_TIMED_DESPAWN, 120000);
						m_summons.Summon(creature2);
						creature2->AI()->SetGUID(m_playerGUID);
						creature2->AI()->DoAction(2);
					}

					m_events.ScheduleEvent(EventSummonNextWave, 30000); // every 30 secounds one wave
					break;
				}
				case EventHelpPlayer:
				{
					if (!me->IsInCombat())
					{
						Creature* creature = nullptr;
						creature = me->FindNearestCreature(NPC_WORGEN_RUNT_C1, 5.0f);
						if (!creature)
							creature = me->FindNearestCreature(NPC_WORGEN_RUNT_C2, 5.0f);
						if (!creature)
							creature = me->FindNearestCreature(NPC_WORGEN_ALPHA_C1, 5.0f);
						if (!creature)
							creature = me->FindNearestCreature(NPC_WORGEN_ALPHA_C2, 5.0f);
						if (creature)
						{
							me->Attack(creature, true);
							// creature->Attack(me, true);
						}
					}

					m_events.ScheduleEvent(EventHelpPlayer, 250);
					break;
				}
				}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lord_darius_crowley_35077AI(creature);
	}
};

// 35124
class npc_tobias_mistmantle_35124 : public CreatureScript
{
public:
	npc_tobias_mistmantle_35124() : CreatureScript("npc_tobias_mistmantle_35124") { }

	struct npc_tobias_mistmantle_35124AI : public ScriptedAI
	{
		npc_tobias_mistmantle_35124AI(Creature* creature) : ScriptedAI(creature) { }

		void UpdateAI(uint32 /*diff*/) override
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_tobias_mistmantle_35124AI(creature);
	}
};

// 35188
class npc_worgen_runt_35188 : public CreatureScript
{
public:
	npc_worgen_runt_35188() : CreatureScript("npc_worgen_runt_35188") {}

	struct npc_worgen_runt_35188AI : public ScriptedAI
	{
		npc_worgen_runt_35188AI(Creature* creature) : ScriptedAI(creature) { Init(); }

		ObjectGuid m_playerGUID;
		EventMap m_events;
		uint32 m_phase;
		Position jump;
		Position JumpW1[3];
		Position LandingW1[3];
		Position LandingW2[4];

		void Init()
		{
			m_phase = 0;
			JumpW1[0] = Position{ -1643.91f, 1482.96f, 63.22f, 3.95f };
			JumpW1[1] = Position{ -1638.83f, 1478.07f, 65.36f, 3.84f };
			JumpW1[2] = Position{ -1631.49f, 1475.02f, 65.64f, 3.84f };

			LandingW1[0] = Position{ -1677.39f, 1455.52f, 52.29f, 4.06f };
			LandingW1[1] = Position{ -1671.89f, 1449.27f, 52.29f, 3.84f };
			LandingW1[2] = Position{ -1664.82f, 1443.62f, 52.29f, 3.84f };

			LandingW2[0] = Position{ -1704.93f, 1469.07f, 52.29f, 5.34f };
			LandingW2[1] = Position{ -1698.90f, 1472.92f, 52.29f, 5.41f };
			LandingW2[2] = Position{ -1703.37f, 1470.66f, 52.29f, 5.49f };
			LandingW2[3] = Position{ -1700.37f, 1473.32f, 52.29f, 5.41f };
		}

		void DoAction(int32 action) override
		{
			if (!m_playerGUID == 0)
			{
				m_events.ScheduleEvent(1, 500);
				m_phase = action;
				me->SetSpeed(MOVE_RUN, frand(1.2f, 1.6f));
			}
		}

		void SetGUID(uint64 guid, int32 /*type*/) override
		{
			m_playerGUID = guid;
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type == POINT_MOTION_TYPE || type == EFFECT_MOTION_TYPE)
				m_phase = pointId;
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			uint32 eventId = m_events.ExecuteEvent();
			switch (eventId)
			{
			case 1:
			{
				m_events.ScheduleEvent(1, 500);
				DoWalk();
				break;
			}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void DoWalk()
		{
			switch (m_phase)
			{
			case 1:
			{
				m_phase = 3;
				uint8 rol = urand(0, 2);
				jump = JumpW1[rol];
				me->GetMotionMaster()->MovePoint(11 + rol, jump);
				break;
			}
			case 2:
				m_phase = 3;
				jump = Position{ -1717.73f, 1486.27f, 57.23f, 5.45f };
				me->GetMotionMaster()->MovePoint(21, jump);
				break;
			case 11:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[0], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 12:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[1], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 13:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[2], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 21:
			{
				m_phase = 5;
				uint8 rol = urand(0, 3);
				jump = LandingW2[rol];
				me->GetMotionMaster()->MoveJump(jump, frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			}
			case 25:
				m_phase = 6;
				if (!m_playerGUID == 0)
					if (Player * player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						if (player->IsInWorld() || player->IsAlive())
						{
							Position pos;
							player->GetNearPosition(pos, frand(2.0f, 4.0f), frand(3.14f, 6.28f));
							me->GetMotionMaster()->MovePoint(26, pos);
						}
				break;
			case 26:
				m_phase = 7;
				me->SetHomePosition(me->GetPosition());
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_worgen_runt_35188AI(creature);
	}
};

// 35456
class npc_worgen_runt_35456 : public CreatureScript
{
public:
	npc_worgen_runt_35456() : CreatureScript("npc_worgen_runt_35456") { }

	struct npc_worgen_runt_35456AI : public ScriptedAI
	{
		npc_worgen_runt_35456AI(Creature* creature) : ScriptedAI(creature) { Init(); }

		ObjectGuid m_playerGUID;
		EventMap m_events;
		uint32 m_phase;
		Position jump;
		Position JumpW1[3];
		Position LandingW1[3];
		Position LandingW2[4];

		void Init()
		{
			m_phase = 0;
			JumpW1[0] = Position{ -1643.91f, 1482.96f, 63.22f, 3.95f };
			JumpW1[1] = Position{ -1638.83f, 1478.07f, 65.36f, 3.84f };
			JumpW1[2] = Position{ -1631.49f, 1475.02f, 65.64f, 3.84f };

			LandingW1[0] = Position{ -1677.39f, 1455.52f, 52.29f, 4.06f };
			LandingW1[1] = Position{ -1671.89f, 1449.27f, 52.29f, 3.84f };
			LandingW1[2] = Position{ -1664.82f, 1443.62f, 52.29f, 3.84f };

			LandingW2[0] = Position{ -1704.93f, 1469.07f, 52.29f, 5.34f };
			LandingW2[1] = Position{ -1698.90f, 1472.92f, 52.29f, 5.41f };
			LandingW2[2] = Position{ -1703.37f, 1470.66f, 52.29f, 5.49f };
			LandingW2[3] = Position{ -1700.37f, 1473.32f, 52.29f, 5.41f };
		}

		void DoAction(int32 action) override
		{
			if (!m_playerGUID == 0)
			{
				m_events.ScheduleEvent(1, 500);
				m_phase = action;
				me->SetSpeed(MOVE_RUN, frand(1.2f, 1.6f));
			}
		}

		void SetGUID(uint64 guid, int32 /*type*/) override
		{
			m_playerGUID = guid;
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type == POINT_MOTION_TYPE || type == EFFECT_MOTION_TYPE)
				m_phase = pointId;
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			uint32 eventId = m_events.ExecuteEvent();
			switch (eventId)
			{
			case 1:
			{
				m_events.ScheduleEvent(1, 500);
				DoWalk();
				break;
			}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void DoWalk()
		{
			switch (m_phase)
			{
			case 1:
			{
				m_phase = 3;
				uint8 rol = urand(0, 2);
				jump = JumpW1[rol];
				me->GetMotionMaster()->MovePoint(11 + rol, jump);
				break;
			}
			case 2:
				m_phase = 3;
				jump = Position{ -1717.73f, 1486.27f, 57.23f, 5.45f };
				me->GetMotionMaster()->MovePoint(21, jump);
				break;
			case 11:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[0], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 12:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[1], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 13:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[2], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 21:
			{
				m_phase = 5;
				uint8 rol = urand(0, 3);
				jump = LandingW2[rol];
				me->GetMotionMaster()->MoveJump(jump, frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			}
			case 25:
				m_phase = 6;
				if (!m_playerGUID == 0)
					if (Player * player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						if (player->IsInWorld() || player->IsAlive())
						{
							Position pos;
							player->GetNearPosition(pos, frand(2.0f, 4.0f), frand(3.14f, 6.28f));
							me->GetMotionMaster()->MovePoint(26, pos);
						}
				break;
			case 26:
				m_phase = 7;
				me->SetHomePosition(me->GetPosition());
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_worgen_runt_35456AI(creature);
	}
};

// 35170
class npc_worgen_alpha_35170 : public CreatureScript
{
public:
	npc_worgen_alpha_35170() : CreatureScript("npc_worgen_alpha_35170") {}

	struct npc_worgen_alpha_35170AI : public ScriptedAI
	{
		npc_worgen_alpha_35170AI(Creature* creature) : ScriptedAI(creature) { Init(); }

		ObjectGuid m_playerGUID;
		EventMap m_events;
		uint32 m_phase;
		Position jump;
		Position JumpW1[3];
		Position LandingW1[3];
		Position LandingW2[4];

		void Init()
		{
			m_phase = 0;
			JumpW1[0] = Position{ -1643.91f, 1482.96f, 63.22f, 3.95f };
			JumpW1[1] = Position{ -1638.83f, 1478.07f, 65.36f, 3.84f };
			JumpW1[2] = Position{ -1631.49f, 1475.02f, 65.64f, 3.84f };

			LandingW1[0] = Position{ -1677.39f, 1455.52f, 52.29f, 4.06f };
			LandingW1[1] = Position{ -1671.89f, 1449.27f, 52.29f, 3.84f };
			LandingW1[2] = Position{ -1664.82f, 1443.62f, 52.29f, 3.84f };

			LandingW2[0] = Position{ -1704.93f, 1469.07f, 52.29f, 5.34f };
			LandingW2[1] = Position{ -1698.90f, 1472.92f, 52.29f, 5.41f };
			LandingW2[2] = Position{ -1703.37f, 1470.66f, 52.29f, 5.49f };
			LandingW2[3] = Position{ -1700.37f, 1473.32f, 52.29f, 5.41f };
		}

		void DoAction(int32 action) override
		{
			if (!m_playerGUID == 0)
			{
				m_events.ScheduleEvent(1, 500);
				m_phase = action;
				me->SetSpeed(MOVE_RUN, frand(1.2f, 1.6f));
			}
		}

		void SetGUID(uint64 guid, int32 /*type*/) override
		{
			m_playerGUID = guid;
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type == POINT_MOTION_TYPE || type == EFFECT_MOTION_TYPE)
				m_phase = pointId;
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			uint32 eventId = m_events.ExecuteEvent();
			switch (eventId)
			{
			case 1:
			{
				m_events.ScheduleEvent(1, 500);
				DoWalk();
				break;
			}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void DoWalk()
		{
			switch (m_phase)
			{
			case 1:
			{
				m_phase = 3;
				uint8 rol = urand(0, 2);
				jump = JumpW1[rol];
				me->GetMotionMaster()->MovePoint(11 + rol, jump);
				break;
			}
			case 2:
				m_phase = 3;
				jump = Position{ -1717.73f, 1486.27f, 57.23f, 5.45f };
				me->GetMotionMaster()->MovePoint(21, jump);
				break;
			case 11:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[0], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 12:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[1], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 13:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[2], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 21:
			{
				m_phase = 5;
				uint8 rol = urand(0, 3);
				jump = LandingW2[rol];
				me->GetMotionMaster()->MoveJump(jump, frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			}
			case 25:
				m_phase = 6;
				if (!m_playerGUID == 0)
					if (Player * player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						if (player->IsInWorld() || player->IsAlive())
						{
							Position pos;
							player->GetNearPosition(pos, frand(2.0f, 4.0f), frand(3.14f, 6.28f));
							me->GetMotionMaster()->MovePoint(26, pos);
						}
				break;
			case 26:
				m_phase = 7;
				me->SetHomePosition(me->GetPosition());
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_worgen_alpha_35170AI(creature);
	}
};

// 35167
class npc_worgen_alpha_35167 : public CreatureScript
{
public:
	npc_worgen_alpha_35167() : CreatureScript("npc_worgen_alpha_35167") {}

	struct npc_worgen_alpha_35167AI : public ScriptedAI
	{
		npc_worgen_alpha_35167AI(Creature* creature) : ScriptedAI(creature) { Init(); }

		ObjectGuid m_playerGUID;
		EventMap m_events;
		uint32 m_phase;
		Position jump;
		Position JumpW1[3];
		Position LandingW1[3];
		Position LandingW2[4];

		void Init()
		{
			m_phase = 0;
			JumpW1[0] = Position{ -1643.91f, 1482.96f, 63.22f, 3.95f };
			JumpW1[1] = Position{-1638.83f, 1478.07f, 65.36f, 3.84f };
			JumpW1[2] = Position{-1631.49f, 1475.02f, 65.64f, 3.84f };

			LandingW1[0] = Position{-1677.39f, 1455.52f, 52.29f, 4.06f };
			LandingW1[1] = Position{-1671.89f, 1449.27f, 52.29f, 3.84f };
			LandingW1[2] = Position{-1664.82f, 1443.62f, 52.29f, 3.84f };

			LandingW2[0] = Position{-1704.93f, 1469.07f, 52.29f, 5.34f };
			LandingW2[1] = Position{-1698.90f, 1472.92f, 52.29f, 5.41f };
			LandingW2[2] = Position{-1703.37f, 1470.66f, 52.29f, 5.49f };
			LandingW2[3] = Position{-1700.37f, 1473.32f, 52.29f, 5.41f };
		}

		void DoAction(int32 action) override
		{
			if (!m_playerGUID == 0)
			{
				m_events.ScheduleEvent(1, 500);
				m_phase = action;
				me->SetSpeed(MOVE_RUN, frand(1.2f, 1.6f));
			}
		}

		void SetGUID(uint64 guid, int32 /*type = 0*/) override
		{
			m_playerGUID = guid;
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type == POINT_MOTION_TYPE || type == EFFECT_MOTION_TYPE)
				m_phase = pointId;
		}

		void UpdateAI(uint32 diff) override
		{
			m_events.Update(diff);

			uint32 eventId = m_events.ExecuteEvent();
			switch (eventId)
			{
			case 1:
			{
				m_events.ScheduleEvent(1, 500);
				DoWalk();
				break;
			}
			}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}

		void DoWalk()
		{
			switch (m_phase)
			{
			case 1:
			{
				m_phase = 3;
				uint8 rol = urand(0, 2);
				jump = JumpW1[rol];
				me->GetMotionMaster()->MovePoint(11 + rol, jump);
				break;
			}
			case 2:
				m_phase = 3;
				jump = Position{ -1717.73f, 1486.27f, 57.23f, 5.45f };
				me->GetMotionMaster()->MovePoint(21, jump);
				break;
			case 11:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[0], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 12:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[1], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 13:
				m_phase = 4;
				me->GetMotionMaster()->MoveJump(LandingW1[2], frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			case 21:
			{
				m_phase = 5;
				uint8 rol = urand(0, 3);
				jump = LandingW2[rol];
				me->GetMotionMaster()->MoveJump(jump, frand(20.0f, 25.0f), frand(15.0f, 20.0f), 25);
				break;
			}
			case 25:
				m_phase = 6;
				if (!m_playerGUID == 0)
					if (Player * player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
						if (player->IsInWorld() || player->IsAlive())
						{
							Position pos;
							player->GetNearPosition(pos, frand(2.0f, 4.0f), frand(3.14f, 6.28f));
							me->GetMotionMaster()->MovePoint(26, pos);
						}
				break;
			case 26:
				m_phase = 7;
				me->SetHomePosition(me->GetPosition());
				break;
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_worgen_alpha_35167AI(creature);
	}
};

// 35112
class npc_king_genn_greymane_35112 : public CreatureScript
{
public:
	npc_king_genn_greymane_35112() : CreatureScript("npc_king_genn_greymane_35112") { }

	struct npc_king_genn_greymane_35112AI : public ScriptedAI
	{
		npc_king_genn_greymane_35112AI(Creature* creature) : ScriptedAI(creature) {}

		void Reset() override
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_king_genn_greymane_35112AI(creature);
	}
};

// 35115
class npc_lord_godfrey_35115 : public CreatureScript
{
public:
	npc_lord_godfrey_35115() : CreatureScript("npc_lord_godfrey_35115") { }

	struct npc_lord_godfrey_35115AI : public ScriptedAI
	{
		npc_lord_godfrey_35115AI(Creature* creature) : ScriptedAI(creature) {}

		void Reset() override
		{
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE);
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_lord_godfrey_35115AI(creature);
	}
};


class spell_gilneas_prison_periodic_dummy : public SpellScriptLoader
{
public:
	spell_gilneas_prison_periodic_dummy() : SpellScriptLoader("spell_gilneas_prison_periodic_dummy") { }

private:
	class spell_script_impl : public SpellScript
	{
		PrepareSpellScript(spell_script_impl)

		void ExtraEffect(SpellEffIndex effIndex)
		{
			PreventHitDefaultEffect(effIndex);
			Unit* caster = GetCaster();

			if (caster)
			{
				caster->RemoveAura(SPELL_GILNEAS_PRISON_PERIODIC_1);
				caster->RemoveAura(SPELL_GILNEAS_PRISON_PERIODIC_2);

				if (Player * player = caster->ToPlayer())
					player->FailQuest(14154);
			}
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_script_impl::ExtraEffect, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_script_impl();
	}
};
/* QUEST - 14154 - By The Skin of His Teeth - END */

struct npc_rampaging_worgen : public ScriptedAI
{
    npc_rampaging_worgen(Creature* creature) : ScriptedAI(creature) { }

    void DamageTaken(Unit* attacker, uint32& damage) override
    {
        if (attacker->GetTypeId() != TYPEID_PLAYER && !HealthAbovePct(75))
            damage = 0;

        if (!HealthAbovePct(10) && !me->HasAura(8599))
        {
            Talk(0);
            DoCast(me, 8599);
        }
    }
};

void AddSC_gilneas()
{
	new npc_king_genn_greymane_35112();
	new npc_tobias_mistmantle_35124();
	new npc_lord_darius_crowley_35077();
	new npc_worgen_runt_35188();
	new npc_worgen_alpha_35170();
	new npc_worgen_runt_35456();
	new npc_worgen_alpha_35167();
	new npc_lord_godfrey_35115();
	new spell_gilneas_prison_periodic_dummy();
	new creature_script<npc_rampaging_worgen>("npc_rampaging_worgen");
}
