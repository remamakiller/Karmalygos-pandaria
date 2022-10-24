/*
 * Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2016 MaNGOS <http://getmangos.com/>
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

#ifndef SF_ITEM_ENCHANTMENT_MGR_H
#define SF_ITEM_ENCHANTMENT_MGR_H

#include "Common.h"

struct ItemTemplate;

enum class ItemRandomEnchantmentType : uint8
{
    Property = 0,
    Suffix   = 1,
};

void LoadRandomEnchantmentsTable();
uint32 GetItemEnchantMod(int32 entry, ItemRandomEnchantmentType type);
uint32 GenerateEnchSuffixFactor(uint32 itemId);

#endif
