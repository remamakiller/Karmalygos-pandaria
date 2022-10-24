#include "Player.h"

class custom_check_racials : public PlayerScript
{
public:
	custom_check_racials() : PlayerScript("custom_check_racials") { }

	void OnLogin(Player* player)
	{
		if (player->getRace() == RACE_WORGEN && player->getLevel() == 85)
		{
			if (!player->HasAura(94293 || 68978 || 68996 || 68976 || 68975 || 68992))
				player->CastSpell(player, 1645, true);
		}
	}
};

void AddSC_custom_check_racials()
{
	new custom_check_racials();
}