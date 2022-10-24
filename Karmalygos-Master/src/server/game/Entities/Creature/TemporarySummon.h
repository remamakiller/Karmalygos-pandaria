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
#ifndef TRINITYCORE_TEMPSUMMON_H
#define TRINITYCORE_TEMPSUMMON_H

#include "Creature.h"

enum SummonerType
{
    SUMMONER_TYPE_CREATURE      = 0,
    SUMMONER_TYPE_GAMEOBJECT    = 1,
    SUMMONER_TYPE_MAP           = 2
};

/// Stores data for temp summons
struct TempSummonData
{
    uint32 entry;        ///< Entry of summoned creature
    Position pos;        ///< Position, where should be creature spawned
    TempSummonType type; ///< Summon type, see TempSummonType for available types
    uint32 time;         ///< Despawn time, usable only with certain temp summon types
};

class TempSummon : public Creature
{
    public:
        explicit TempSummon(SummonPropertiesEntry const* properties, Unit* owner, bool isWorldObject);
        virtual ~TempSummon() { }
        void Update(uint32 time);
        bool Create(uint32 guidlow, Map* map, uint32 phaseMask, uint32 entry, uint32 vehId, uint32 team, float x, float y, float z, float ang, CreatureData const* data = nullptr);
        virtual void InitStats(uint32 lifetime);
        virtual void InitSummon();
        virtual void UnSummon(uint32 msTime = 0);
        void RemoveFromWorld();
        void SetTempSummonType(TempSummonType type);
        void SaveToDB(uint32 /*mapid*/, uint16 /*spawnMask*/, uint32 /*phaseMask*/) { }
        Unit* GetSummoner() const;
        Creature* GetSummonerCreatureBase() const;
        uint64 GetSummonerGUID() const { return m_summonerGUID; }
        TempSummonType const& GetSummonType() { return m_type; }
        uint32 GetTimer() { return m_timer; }

        const SummonPropertiesEntry* const m_Properties;

        bool IsMinorGuardian() const;
        bool IsWarBanner() const { return m_Properties && m_Properties->Type == SUMMON_TYPE_WARBANNER; }

        Player* GetSpellHasteOwner() const;

        uint32 GetBaseAttackTimer() const;

        // Some summons have to have 0 in UNIT_FIELD_SUMMONED_BY (This confirmed by sniffs at least for wild imps and grimoire pets).
        // Otherwise this summon will share gcd and cooldown with our main pet for same spells, if any.
        bool IsSummonedByHidden() const { return m_hideSummonedBy; }
        void HideSummonedBy() { m_hideSummonedBy = true; }

        void SetVisibleBySummonerOnly(bool visibleBySummonerOnly) { m_visibleBySummonerOnly = visibleBySummonerOnly; }
        bool IsVisibleBySummonerOnly() const { return m_visibleBySummonerOnly; }

    protected:
        int32  m_slot = -1;
        bool   m_hideSummonedBy = false;
    private:
        TempSummonType m_type;
        uint32 m_timer;
        uint32 m_lifetime;
        uint64 m_summonerGUID;
        bool m_visibleBySummonerOnly;
};

class Minion : public TempSummon
{
    public:
        Minion(SummonPropertiesEntry const* properties, Unit* owner, bool isWorldObject);
        void InitStats(uint32 duration);
        void RemoveFromWorld();
        Unit* GetOwner() const { return m_owner; }
        float GetFollowAngle() const { return m_followAngle; }
        void SetFollowAngle(float angle) { m_followAngle = angle; }
        bool IsPetGhoul() const {return GetEntry() == 26125;} // Ghoul may be guardian or pet
        bool IsSpiritWolf() const {return GetEntry() == 29264;} // Spirit wolf from feral spirits
        bool IsGuardianPet() const;
    protected:
        Unit* const m_owner;
        float m_followAngle;
};

class Guardian : public Minion
{
    public:
        Guardian(SummonPropertiesEntry const* properties, Unit* owner, bool isWorldObject);
        void InitStats(uint32 duration);
        bool InitStatsForLevel(uint8 level);
        void InitSummon();

        bool UpdateStats(Stats stat);
        bool UpdateAllStats();
        void UpdateResistances(uint32 school);
        void UpdateArmor();
        void UpdateMaxHealth();
        void UpdateMaxPower(Powers power);
        void UpdateAttackPowerAndDamage(bool ranged = false);
        void UpdateDamagePhysical(WeaponAttackType attType);

        int32 GetBonusDamage() const { return m_bonusSpellDamage; }
        void SetBonusDamage(int32 damage);

        void Regenerate() override;
        void Regenerate(Powers power);

    protected:
        int32   m_bonusSpellDamage;
        float   m_statFromOwner[MAX_STATS];

        float   m_powerFraction = 0.0f;
        uint32  m_regenTimerCount = 0;
};

class Puppet : public Minion
{
    public:
        Puppet(SummonPropertiesEntry const* properties, Unit* owner);
        void InitStats(uint32 duration);
        void InitSummon();
        void Update(uint32 time);
        void RemoveFromWorld();
};

class ForcedUnsummonDelayEvent : public BasicEvent
{
public:
    ForcedUnsummonDelayEvent(TempSummon& owner) : BasicEvent(), m_owner(owner) { }
    bool Execute(uint64 e_time, uint32 p_time);

private:
    TempSummon& m_owner;
};
#endif
