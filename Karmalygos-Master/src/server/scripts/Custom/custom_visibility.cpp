#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Object.h"
#include "Player.h"
#include "custom_visibility.h"

class visibility_control_script : public PlayerScript
{
public:
	visibility_control_script() : PlayerScript("visibility_control_script") {}

	uint32 checkTimer = 1000;
	std::list<uint32> ListNpcEntrys;
	std::list<uint32> ListGoEntrys;
	
	void OnLogin(Player* /*player*/) 
	{
		// Creature part
		// Example
		ListNpcEntrys.push_back(1);

		// Gameobject part
		// Example
		ListGoEntrys.push_back(GO_FIRE_SHIELD_COLLISION_WALL);
		ListGoEntrys.push_back(GO_WALL_OF_FIRE);
	}
	
	void OnUpdate(Player* player, uint32 diff) override
	{
		if (checkTimer <= diff)
		{
			// Creature part
			std::list<Creature*> creatures = player->FindNearestCreatures(ListNpcEntrys, 90.0f);
			for (auto itr : creatures)
			{
				player->ExecuteCanNeverSee(itr);
				itr->UpdateObjectVisibility();
				player->UpdateObjectVisibility();
			}

			// Gameobject part
			std::list<GameObject*> gameobjects = player->FindNearestGameObject(ListGoEntrys, 90.0f);
			for (auto itr : gameobjects)
			{
				player->ExecuteCanNeverSee(itr);
				itr->UpdateObjectVisibility();
				player->UpdateObjectVisibility();
			}

			checkTimer = 1000;
		}
		else checkTimer -= diff;
	}
};

void AddSC_custom_visibility()
{
	new visibility_control_script();
}
