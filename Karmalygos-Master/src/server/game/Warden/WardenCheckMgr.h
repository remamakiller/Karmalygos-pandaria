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

#ifndef SF_WARDENCHECKMGR_H
#define SF_WARDENCHECKMGR_H

#include <map>
#include "Cryptography/BigNumber.h"

enum WardenActions
{
    WARDEN_ACTION_LOG           = 0,
    WARDEN_ACTION_LOG_GM        = 2,
    WARDEN_ACTION_ITEMLOG       = 5,
    WARDEN_ACTION_KICK          = 10,
    WARDEN_ACTION_BAN           = 20,

    MAX_WARDEN_ACTION
};

struct WardenCheck
{
    uint8 Type;
    BigNumber Data;
    uint32 Address;                                         // PROC_CHECK, MEM_CHECK, PAGE_CHECK
    uint8 Length;                                           // PROC_CHECK, MEM_CHECK, PAGE_CHECK
    std::string Str;                                        // LUA, MPQ, DRIVER
    std::string Comment;
    uint16 CheckId;
    enum WardenActions Action;
    std::string Group;
    LocaleConstant Locale;
    bool Negative;
};

struct WardenCheckResult
{
    BigNumber Result;                                       // MEM_CHECK
};

class WardenCheckMgr
{
    friend class ACE_Singleton<WardenCheckMgr, ACE_Null_Mutex>;
    WardenCheckMgr();
    ~WardenCheckMgr();

    public:
        // We have a linear key without any gaps, so we use vector for fast access
        typedef std::vector<WardenCheck*> CheckContainer;
        typedef std::map<uint32, WardenCheckResult*> CheckResultContainer;

        WardenCheck* GetWardenDataById(uint16 Id);
        WardenCheckResult* GetWardenResultById(uint16 Id);
        CheckContainer const& GetWardenData() const { return CheckStore; }

        std::vector<uint16> MemChecksIdPool[TOTAL_LOCALES];
        std::vector<uint16> OtherChecksIdPool[TOTAL_LOCALES];

        void LoadWardenChecks(bool reload = false);

        ACE_RW_Mutex _checkStoreLock;

    private:
        CheckContainer CheckStore;
        CheckResultContainer CheckResultStore;
};

#define sWardenCheckMgr ACE_Singleton<WardenCheckMgr, ACE_Null_Mutex>::instance()

#endif
