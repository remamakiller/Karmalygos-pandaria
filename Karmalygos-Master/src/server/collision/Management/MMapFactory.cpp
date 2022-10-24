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

#include "MMapFactory.h"
#include "World.h"
#include "Config.h"
#include "DisableMgr.h"

namespace MMAP
{
    // ######################## MMapFactory ########################
    // our global singleton copy
    MMapManager* g_MMapManager = NULL;

    MMapManager* MMapFactory::createOrGetMMapManager()
    {
        if (g_MMapManager == NULL)
            g_MMapManager = new MMapManager();

        return g_MMapManager;
    }

    bool MMapFactory::IsPathfindingEnabled()
    {
        return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS);
    }
    bool MMapFactory::IsPathfindingEnabledInMap(uint32 mapId)
    {
        return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_MAP, mapId, NULL);
    }
    bool MMapFactory::IsPathfindingEnabledInZone(uint32 zoneId)
    {
        return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_ZONE, zoneId, NULL);
    }
    bool MMapFactory::IsPathfindingEnabledInArea(uint32 areaId)
    {
        return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_AREA, areaId, NULL);
    }
    bool MMapFactory::IsPathfindingEnabledForCreature(uint32 entry)
    {
        return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_CREATURE, entry, NULL);
    }
    bool MMapFactory::IsPathfindingEnabled(uint32 mapId, uint32 zoneId, uint32 areaId, uint32 entry)
    {
        return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_MAP, mapId, NULL)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_ZONE, zoneId, NULL)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_AREA, areaId, NULL)
            && !DisableMgr::IsDisabledFor(DISABLE_TYPE_MMAP_CREATURE, entry, NULL);
    }

    void MMapFactory::clear()
    {
        if (g_MMapManager)
        {
            delete g_MMapManager;
            g_MMapManager = NULL;
        }
    }
}