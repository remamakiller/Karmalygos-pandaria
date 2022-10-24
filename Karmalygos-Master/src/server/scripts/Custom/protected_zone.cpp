#include <Chat.h>

enum ForbiddenAreas : uint16
{
	ZONE_TIMELESS_ISLE			= 6757,	// Timeless Isle
	ZONE_ISLE_OF_GIANT			= 6661, // IsleofGiants
	ZONE_ISLE_OF_THUNDER		= 6507, // IsleofThunder
};
     
 class protected_zone : public PlayerScript
 {
 public:
     protected_zone() : PlayerScript("protected_zone") {}
	   
	 void OnUpdateZone(Player* player, uint32 newZone, uint32 /*newArea*/)
	 {
		 switch (newZone)
		 {
			 case ZONE_TIMELESS_ISLE:
			 case ZONE_ISLE_OF_GIANT:
			 case ZONE_ISLE_OF_THUNDER:
			 {
					 if (player->GetTeamId() == TEAM_ALLIANCE)
						 player->TeleportTo(0, -8833.07f, 622.778f, 93.9317f, 0.6771f);
					 else if (player->GetTeamId() == TEAM_HORDE)
						 player->TeleportTo(1, 1569.97f, -4397.41f, 16.0472f, 0.543025f);

					 ChatHandler(player->GetSession()).PSendSysMessage("|cffFF0000No puede entrar a una zona prohibida|r");

				 break;
			 }
			 default:
				 break;
		 }
	 }
 };

   
 void AddSC_protected_zone()
 {
     new protected_zone();
 }