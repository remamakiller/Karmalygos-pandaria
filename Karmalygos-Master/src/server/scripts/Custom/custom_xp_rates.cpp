#include "Player.h"
#include "ScriptMgr.h"
#include "Chat.h"
#include "World.h"
#include "boost/date_time.hpp"
#include "Config.h"

class custom_xp_rates : public PlayerScript
{
public:
	custom_xp_rates() : PlayerScript("custom_xp_rates") { }

	void OnGiveXP(Player* player, uint32& amount, Unit* victim) override
	{
		boost::gregorian::date date(boost::gregorian::day_clock::local_day());
		auto day = date.day_of_week();

		if (player->getLevel() < 90)
		{
			if (day == boost::date_time::Saturday || day == boost::date_time::Sunday)
				amount = amount * 4;

			else if (day >= boost::date_time::Monday && day <= boost::date_time::Friday)
				amount = amount * 3;
		}
	}

	void OnLogin(Player* player)
	{
		boost::gregorian::date date(boost::gregorian::day_clock::local_day());
		auto day = date.day_of_week();

		if (player->getLevel() < 90)
		{
			if (day == boost::date_time::Saturday || day == boost::date_time::Sunday)
				ChatHandler(player->GetSession()).PSendSysMessage("La ganancia de XP estara x4 durante el fin de semana.");

			else if (day >= boost::date_time::Monday && day <= boost::date_time::Friday)
				ChatHandler(player->GetSession()).PSendSysMessage("La ganancia de XP estara x3 durante la semana.");
		}
	}
};

void AddSC_custom_xp_rates()
{
	new custom_xp_rates();
}
