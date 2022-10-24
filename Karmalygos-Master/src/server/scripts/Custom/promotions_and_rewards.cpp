#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Language.h"
#include "Chat.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "DatabaseEnv.h"
#include "WorldSession.h"

class npc_promotion_blue_equip : public CreatureScript
{
public:
    npc_promotion_blue_equip() : CreatureScript("npc_promotion_blue_equip") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
               	
		QueryResult result = LoginDatabase.PQuery("SELECT counter FROM account WHERE id = %u", player->GetSession()->GetAccountId());

		Field* fields = result->Fetch();
		uint32 counter = fields[0].GetUInt32();

		if (counter == 0 && player->getLevel() < 85)
		{
			if (player->getClass() == CLASS_WARRIOR)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_WARRIOR_ARMS_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_WARRIOR_FURY_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_WARRIOR_PROTECT_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
			}
			if (player->getClass() == CLASS_PALADIN)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_PALADIN_RET_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_PALADIN_PROTECT_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_PALADIN_HOLY_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
			}
			if (player->getClass() == CLASS_SHAMAN)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_SHAMAN_HEAL_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_SHAMAN_ELEMENTAL_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_SHAMAN_ENHANCEMENT_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
			}
			if (player->getClass() == CLASS_PRIEST)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_PRIEST_HEAL_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_PRIEST_SHADOW_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			}
			if (player->getClass() == CLASS_DRUID)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_DRUID_CASTER_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_DRUID_HEAL_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(LANG_PROMOTION_DRUID_FERAL_PVP), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
			}
			if (player->getClass() == CLASS_MONK)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "DPS ", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "HEAL", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
			}
			if (player->getClass() == CLASS_WARLOCK)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "DPS", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			}
			if (player->getClass() == CLASS_HUNTER)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "DPS", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);				
			}
			if (player->getClass() == CLASS_MAGE)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "DPS", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			}
			if (player->getClass() == CLASS_ROGUE)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "DPS", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			}
			if (player->getClass() == CLASS_DEATH_KNIGHT)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "DPS", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			}
		
		}    

		if (counter == 1)
		{

			if (player->GetTeamId() == TEAM_ALLIANCE)
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teletransporte a Ventormenta", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
			}
			else
			{
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teletransporte a Orgrimmar", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
			}

		}

        player->SEND_GOSSIP_MENU(1, creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
		TaskScheduler scheduler;
		if (action == GOSSIP_ACTION_INFO_DEF + 7)
		{
			player->TeleportTo(1, 1365.477051f, -4372.168945f, 26.070314f, 0.167605f);
			LoginDatabase.PExecute("UPDATE `account` SET `counter` = 2 WHERE `id` = %u", player->GetSession()->GetAccountId());
		}

		if (action == GOSSIP_ACTION_INFO_DEF + 8)
		{
			player->TeleportTo(0, -9093.825195f, 412.933624f, 92.118713f, 0.679353f);
			LoginDatabase.PExecute("UPDATE `account` SET `counter` = 2 WHERE `id` = %u", player->GetSession()->GetAccountId());
		}

        if (action > GOSSIP_ACTION_INFO_DEF && action < 1007)
        {
            // Level
            player->GiveLevel(85);

            // Equipment specs
            switch (player->getClass())
            {
                case CLASS_MAGE:
                    player->LearnSpell(193759, false);
                    break;
                case CLASS_MONK:
                    player->LearnSpell(126892, false);
                    break;
                case CLASS_DRUID:
                    player->LearnSpell(193753, false);
                    break;
                case CLASS_SHAMAN:
                case CLASS_HUNTER:
                    player->LearnSpell(8737, false);
                    break;

                case CLASS_WARRIOR:
                case CLASS_PALADIN:
                    player->LearnSpell(750, false);
                    break;

                default:
                    break;
            }

            // Bags
            for (int slot = INVENTORY_SLOT_BAG_START; slot < INVENTORY_SLOT_BAG_END; slot++)
                if (Item* bag = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                    player->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);

            for (int slot = INVENTORY_SLOT_BAG_START; slot < INVENTORY_SLOT_BAG_END; slot++)
                player->EquipNewItem(slot, 10050, true);

            // Money
            player->ModifyMoney(10000000);

            // Ridding
            player->LearnSpell(33388, false);
            player->LearnSpell(33391, false);
            player->LearnSpell(34090, false);
            player->LearnSpell(34091, false);
            player->LearnSpell(90265, false);
            player->LearnSpell(54197, false);
            player->LearnSpell(90267, false);
            
			//Mount 
			if (player->GetTeamId() == TEAM_ALLIANCE)
			{
				player->LearnSpell(32292, false);
			}
			else
			{
				player->LearnSpell(32297, false);
			}


            // Worgen misc
            if (player->getRace() == RACE_WORGEN)
            {
                player->LearnSpell(68992, false);
				player->CastSpell(player, 1645, true);
            }

            // Goblin misc
            if (player->getRace() == RACE_GOBLIN)
                player->LearnSpell(69046, false);
           
			switch (player->getClass())
			{
			case CLASS_WARLOCK:
			{
				switch (action)
				{
				case 1001: // PvP listo
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58155, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58157, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58153, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71265, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58158, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57921, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58154, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58485, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56380, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1 					
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 65167, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);  //barita
					break;
				}
				}
				break;
			}

			case CLASS_HUNTER:
			{
				switch (action)
				{
				case 1001: // PvP
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58123, true);       //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57931, true);		  //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58124, true);  //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58191, true);		  //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58121, true);	  //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71264, true);	  //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58125, true);	  //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57916, true);	  //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58122, true);		  //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58199, true);		  //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56412, true);	  //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 71209, true);	  //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58181, true);  //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56317, true);	  //arma
					break;
				}
				}
				break;
			}

			case CLASS_MAGE:
			{
				switch (action)
				{
				case 1001: // PvP listo
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58155, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58157, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58153, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71265, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58158, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57921, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58154, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58485, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56380, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1 									
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 65167, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita
					break;
				}
				}
				break;
			}

			case CLASS_ROGUE:
			{
				switch (action)
				{
				case 1001: // PvP
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58133, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57931, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58134, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58191, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58131, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71130, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58138, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57918, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58132, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58482, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56412, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 71209, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58181, true);	    //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56302, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 56302, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}
				}
				break;
			}

			case CLASS_WARRIOR:
			{
				switch (action)
				{
				case 1001: // Armas
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58098, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57930, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58100, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58190, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58096, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71261, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58099, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57913, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58097, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58195, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58185, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 56299, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58180, true);	    //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56342, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}

				case 1002: // Furi
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58098, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57930, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58100, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58190, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58096, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71261, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58099, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57913, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58097, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58195, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58185, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 56299, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58180, true);	    //abalorio1	
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56342, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 56342, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}

				case 1003: // Proteccion
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58098, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57930, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58100, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58190, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58096, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71261, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58099, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57913, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58097, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58195, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58185, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 56299, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58180, true);	    //abalorio1	
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56346, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 57926, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}
				}

				break;
			}

			case CLASS_PALADIN:
			{
				switch (action)
				{
				case 1001: // Represion
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58098, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57930, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58100, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58190, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58096, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71261, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58099, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57913, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58097, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58195, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58185, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 56299, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58180, true);	    //abalorio1	
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56342, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}

				case 1002: // Proteccion
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58098, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57930, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58100, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58190, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58096, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71261, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58099, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57913, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58097, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58195, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58185, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 56299, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58180, true);	    //abalorio1	
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56346, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 57926, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}

				case 1003: // Sagrado
				{

					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58108, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57934, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58109, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58194, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58106, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71260, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58110, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57915, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58107, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58198, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58184, true);  //abalorio1  
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56312, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 56322, true);
					// player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita						
					break;
				}
				}

				break;
			}

			case CLASS_PRIEST:
			{
				switch (action)
				{
				case 1001: // HEAL
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58161, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57934, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58162, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58194, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58159, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71266, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58163, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57922, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58160, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58486, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58184, true);  //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56424, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita	
					break;
				}

				case 1002: // Sombras
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58155, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58157, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58153, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71265, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58163, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57921, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58154, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58485, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58188, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58189, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 65167, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita
					break;
				}

				case 1003: // Disciplina
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58161, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57934, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58162, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58194, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58159, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71266, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58163, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57922, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58160, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58486, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58184, true);  //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56424, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita
					break;
				}
				}
				break;
			}

			case CLASS_SHAMAN:
			{
				switch (action)
				{
				case 1001: // Restauracion
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58128, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57934, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58129, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58194, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58126, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71263, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58130, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57917, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58127, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58481, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 57872, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 57925, true);
					// player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    
					break;
				}

				case 1002: // Elemental
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 56352, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 56359, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58126, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 69568, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58130, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 69561, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58127, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 72850, true);      //palos 
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1 
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 57872, true);
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 56402, true);
					// player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    
					break;
				}

				case 1003: // Mejora
				{

					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58123, true);       //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57931, true);		  //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58124, true);  //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58191, true);		  //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58121, true);	  //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71264, true);	  //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58125, true);	  //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57916, true);	  //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58122, true);		  //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58199, true);		  //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56412, true);	  //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 71209, true);	  //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58181, true);  //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56396, true);   //arma1
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 56396, true);	  //arma2

					break;
				}
				}

				break;
			}

			case CLASS_DRUID:
			{
				switch (action)
				{
				case 1001: // Equilibrio
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 56321, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58151, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 63471, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 56297, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 63439, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57919, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 56408, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58484, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1  
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 65167, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita
					break;
				}

				case 1002: // Restauracion
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58150, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58151, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58139, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71262, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58152, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57919, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58140, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58484, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1 
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56424, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita
					break;
				}

				case 1003: // Feral
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58133, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57931, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58134, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58191, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58131, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71130, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58138, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57918, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58132, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58482, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56412, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 71209, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58181, true);	    //abalorio1
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56382, true);     //arma1						
					break;
				}
				}

				break;
			}

			case CLASS_MONK:
			{
				switch (action)
				{
				case 1001: // DPS
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58133, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57931, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58134, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58191, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58131, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71130, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58138, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57918, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58132, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58482, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 56412, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 71209, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58181, true);	    //abalorio1	
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56396, true);   //arma1
					player->EquipNewItem(EQUIPMENT_SLOT_OFFHAND, 56396, true);	  //arma2
					break;
				}

				case 1002: // Heal
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58150, true);      //cabesa
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57933, true);      //cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58151, true); //hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58193, true);      //espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58139, true);     //pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71262, true);    //muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58152, true);     //manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57919, true);     //cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58140, true);      //pantalones
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58484, true);      //palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58189, true);   //anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 58188, true);   //anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58183, true);  //abalorio1 
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56424, true);  //arma
				   // player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 71151, true);    //barita
					break;
				}

				}
				break;
			}
			case CLASS_DEATH_KNIGHT:
			{
				switch (action)
				{
				case 1001: // DPS
				{
					player->EquipNewItem(EQUIPMENT_SLOT_HEAD, 58098, true);         //cabesa  
					player->EquipNewItem(EQUIPMENT_SLOT_NECK, 57930, true);			//cuello
					player->EquipNewItem(EQUIPMENT_SLOT_SHOULDERS, 58100, true);	//hombros
					player->EquipNewItem(EQUIPMENT_SLOT_BACK, 58190, true);			//espalda
					player->EquipNewItem(EQUIPMENT_SLOT_CHEST, 58096, true);		//pecho
					player->EquipNewItem(EQUIPMENT_SLOT_WRISTS, 71261, true);		//muñecas
					player->EquipNewItem(EQUIPMENT_SLOT_HANDS, 58099, true);		//manos
					player->EquipNewItem(EQUIPMENT_SLOT_WAIST, 57913, true);		//cintura
					player->EquipNewItem(EQUIPMENT_SLOT_LEGS, 58097, true);			//pantalone
					player->EquipNewItem(EQUIPMENT_SLOT_FEET, 58195, true);			//palos
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER1, 58185, true);		//anillo1
					player->EquipNewItem(EQUIPMENT_SLOT_FINGER2, 56299, true);		//anillo2
					player->EquipNewItem(EQUIPMENT_SLOT_TRINKET1, 58180, true);	    //abalorio1	
					if (player->GetTeamId() == TEAM_ALLIANCE)
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69861, true);
					}
					else
					{
						player->EquipNewItem(EQUIPMENT_SLOT_TRINKET2, 69862, true);
					}
					player->EquipNewItem(EQUIPMENT_SLOT_MAINHAND, 56342, true);
					//player->EquipNewItem(EQUIPMENT_SLOT_RANGED, 61348, true);
					break;
				}

				}
				break;
			}
			break;
			}
		
            player->SaveToDB();
            player->CLOSE_GOSSIP_MENU();

			// Account portection1
			QueryResult result1 = CharacterDatabase.PQuery("SELECT level FROM characters WHERE account = %u ORDER BY level DESC LIMIT 1", player->GetSession()->GetAccountId());
			QueryResult resultp1 = LoginDatabase.PQuery("SELECT counter FROM account WHERE id = %u", player->GetSession()->GetAccountId());

			Field* fieldsp = resultp1->Fetch();
			uint32 counterpoll = fieldsp[0].GetUInt32();

			Field* fields = result1->Fetch();
			uint32 lvl = fields[0].GetUInt32();
			
		    LoginDatabase.PExecute("UPDATE `account` SET `counter` = 1 WHERE `id` = %u", player->GetSession()->GetAccountId());
			

            // Account protection2
            std::string ip_address;
            QueryResult result = LoginDatabase.PQuery(
                "SELECT last_ip FROM account WHERE id = %u",
                player->GetSession()->GetAccountId());

            if (result)
            {
                Field* fields = result->Fetch();
                ip_address = fields[0].GetCString();

                CharacterDatabase.PExecute("INSERT INTO promotions_rewarded (account, ip) VALUES ( %u, '%s')", player->GetSession()->GetAccountId(), fields[0].GetCString());
            }			           
        }
        return true;
    }

    bool AccountRewarded(Player* player)
    {
        std::string ip_address;
        QueryResult result = LoginDatabase.PQuery(
            "SELECT last_ip FROM account WHERE id = %u",
            player->GetSession()->GetAccountId());

        if (result)
        {
            Field* fields = result->Fetch();
            ip_address = fields[0].GetCString();

            QueryResult result1 = CharacterDatabase.PQuery("SELECT `account` FROM `promotions_rewarded` WHERE `account` = %u OR `ip` = '%s'", player->GetSession()->GetAccountId(), fields[0].GetCString());
            if (result1)
            {
                Field * pField = result1->Fetch();
                uint32 account = pField[0].GetUInt32();
                if (account)
                    return true;
            }
            return false;
        }
        return false;
    }
};

void AddSC_promotions_and_rewards()
{   
    new npc_promotion_blue_equip();
}
