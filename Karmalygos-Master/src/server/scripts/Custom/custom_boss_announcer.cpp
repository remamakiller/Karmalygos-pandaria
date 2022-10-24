#include "ScriptMgr.h"
#include "Player.h"
#include "Creature.h"
#include "Chat.h"

class boss_announcer : public PlayerScript
{
public:
	boss_announcer() : PlayerScript("boss_announcer") {}

	void OnCreatureKill(Player* killer, Creature* killed)
	{
		if (killed->isWorldBoss())
		{
			std::string msg;

			msg += "|CFF64FF64El Jefe de Mundo |CFFFFFFFF[";
			msg += killed->GetName();
			msg += "]|r";
			msg += "|CFF64FF64 fue eliminado por|r ";
			msg += ChatHandler(killer->GetSession()).GetNameLink();
			msg += "|CFF64FF64 y su grupo.|r";
			sWorld->SendServerMessage(SERVER_MSG_STRING, msg.c_str(), 0);
		}
	}
};

class monk_quest : public PlayerScript
{
public:
	monk_quest() : PlayerScript("monk_quest") {}

	void OnLevelChanged(Player* player, uint8 oldLevel)
	{
		if (player->getClass() == CLASS_MONK)
		{
			if (oldLevel >= 19)
			{
				if (player->GetQuestStatus(31856) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31856))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 29)
			{
				if (player->GetQuestStatus(31855) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31855))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 39)
			{
				if (player->GetQuestStatus(31857) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31857))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 49)
			{
				if (player->GetQuestStatus(31858) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31858))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 59)
			{
				if (player->GetQuestStatus(31859) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31859))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 69)
			{
				if (player->GetQuestStatus(31860) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31860))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 79)
			{
				if (player->GetQuestStatus(31861) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31861))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
			if (oldLevel >= 89)
			{
				if (player->GetQuestStatus(31989) == QUEST_STATUS_NONE)
				{
					if (Quest const* quest = sObjectMgr->GetQuestTemplate(31989))
					{
						player->AddQuest(quest, player);
						player->PlayerTalkClass->SendQuestGiverQuestDetails(quest, player->GetGUID(), true, true);
					}
				}
			}
		}	
	}
};

void AddSC_custom_boss_announcer()
{
	new boss_announcer;
	new monk_quest;
}