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

#ifndef SF_SPELL_H
#define SF_SPELL_H

#include "GridDefines.h"
#include "SharedDefines.h"
#include "ObjectMgr.h"
#include "SpellInfo.h"
#include "PathGenerator.h"

class Unit;
class Player;
class GameObject;
class DynamicObject;
class WorldObject;
class Aura;
class SpellScript;
class ByteBuffer;
class AuraEffect;
enum class SpellModDropPhase;

#define SPELL_CHANNEL_UPDATE_INTERVAL (1 * IN_MILLISECONDS)

enum SpellCastFlags
{
    CAST_FLAG_NONE               = 0x00000000,
    CAST_FLAG_PENDING            = 0x00000001,              // aoe combat log?
    CAST_FLAG_HAS_TRAJECTORY     = 0x00000002,
    CAST_FLAG_UNKNOWN_3          = 0x00000004,
    CAST_FLAG_UNKNOWN_4          = 0x00000008,              // ignore AOE visual
    CAST_FLAG_UNKNOWN_5          = 0x00000010,
    CAST_FLAG_PROJECTILE         = 0x00000020,
    CAST_FLAG_UNKNOWN_7          = 0x00000040,
    CAST_FLAG_UNKNOWN_8          = 0x00000080,
    CAST_FLAG_UNKNOWN_9          = 0x00000100,
    CAST_FLAG_UNKNOWN_10         = 0x00000200,
    CAST_FLAG_UNKNOWN_11         = 0x00000400,
    CAST_FLAG_POWER_LEFT_SELF    = 0x00000800,
    CAST_FLAG_UNKNOWN_13         = 0x00001000,
    CAST_FLAG_UNKNOWN_14         = 0x00002000,
    CAST_FLAG_UNKNOWN_15         = 0x00004000,
    CAST_FLAG_UNKNOWN_16         = 0x00008000,
    CAST_FLAG_UNKNOWN_17         = 0x00010000,
    CAST_FLAG_ADJUST_MISSILE     = 0x00020000,
    CAST_FLAG_UNKNOWN_19         = 0x00040000,
    CAST_FLAG_VISUAL_CHAIN       = 0x00080000,
    CAST_FLAG_UNKNOWN_21         = 0x00100000,
    CAST_FLAG_RUNE_LIST          = 0x00200000,
    CAST_FLAG_UNKNOWN_23         = 0x00400000,
    CAST_FLAG_UNKNOWN_24         = 0x00800000,
    CAST_FLAG_UNKNOWN_25         = 0x01000000,
    CAST_FLAG_UNKNOWN_26         = 0x02000000,
    CAST_FLAG_IMMUNITY           = 0x04000000,
    CAST_FLAG_UNKNOWN_28         = 0x08000000,
    CAST_FLAG_UNKNOWN_29         = 0x10000000,
    CAST_FLAG_UNKNOWN_30         = 0x20000000,
    CAST_FLAG_HEAL_PREDICTION    = 0x40000000,
    CAST_FLAG_NO_COOLDOWN        = 0x80000000
};

enum SpellRangeFlag
{
    SPELL_RANGE_DEFAULT             = 0,
    SPELL_RANGE_MELEE               = 1,     //melee
    SPELL_RANGE_RANGED              = 2      //hunter range and ranged weapon
};

struct SpellDestination
{
    SpellDestination();
    SpellDestination(float x, float y, float z, float orientation = 0.0f, uint32 mapId = MAPID_INVALID);
    SpellDestination(Position const& pos);
    SpellDestination(WorldObject const& wObj);

    void Relocate(Position const& pos);
    void RelocateOffset(Position const& offset);

    WorldLocation _position;
    uint64 _transportGUID;
    Position _transportOffset;
};

struct SpellLogEnergyzeHelper
{
    uint32 Value;
    float Multiplier;
    uint8 PowerType;
    ObjectGuid Guid;
};

struct SpellLogExtraAttacksHelper
{
    uint32 Count;
    ObjectGuid Guid;
};

struct SpellLogHelper
{
    std::list<ObjectGuid> Targets;
    std::list<SpellLogEnergyzeHelper> Energizes;
    std::list<SpellLogExtraAttacksHelper> ExtraAttacks;
    std::list<uint32> PetFeed;
    std::list<uint32> CreatedItems;

    SpellLogHelper()
    {
        Targets.clear();
        Energizes.clear();
        ExtraAttacks.clear();
        PetFeed.clear();
        CreatedItems.clear();
    }

    void AddTarget(ObjectGuid guid)
    {
        Targets.push_back(guid);
    }

    void AddCreatedItem(uint32 id)
    {
        CreatedItems.push_back(id);
    }

    void AddPetFeed(uint32 entry)
    {
        PetFeed.push_back(entry);
    }

    void AddEnergize(SpellLogEnergyzeHelper energize)
    {
        Energizes.push_back(energize);
    }
    void AddEnergize(ObjectGuid guid, float mult, uint32 val, uint8 type)
    {
        SpellLogEnergyzeHelper helper;
        helper.Value = val;
        helper.PowerType = type;
        helper.Guid = guid;
        helper.Multiplier = mult;

        AddEnergize(helper);
    }

    void AddExtraAttacks(SpellLogExtraAttacksHelper attExtra)
    {
        ExtraAttacks.push_back(attExtra);
    }
    void AddExtraAttacks(ObjectGuid guid, uint32 count)
    {
        SpellLogExtraAttacksHelper helper;
        helper.Count = count;
        helper.Guid = guid;

        AddExtraAttacks(helper);
    }
};

class SpellCastTargets
{
    public:
        SpellCastTargets();
        SpellCastTargets(Unit* caster, uint32 targetMask, uint64 targetGuid, uint64 itemTargetGuid, uint64 srcTransportGuid, uint64 destTransportGuid, Position srcPos, Position destPos, float elevation, float missileSpeed, std::string targetString);
        ~SpellCastTargets();

        void Read(ByteBuffer& data, Unit* caster);
        void Write(ByteBuffer& data);

        void Initialize(uint32 flags, uint64 target, uint64 itemTarget, uint64 dest, WorldLocation destPos, uint64 src, WorldLocation srcPos)
        {
            m_targetMask = flags;
            m_objectTargetGUID = target;
            m_itemTargetGUID = itemTarget;

            // dest
            m_dst._transportGUID = dest;
            m_dst._position = destPos;
            if (dest)
                m_dst._transportOffset = destPos;

            // src
            m_src._transportGUID = src;
            m_src._position = srcPos;
            if (src)
                m_src._transportOffset = srcPos;
        }

        uint32 GetTargetMask() const { return m_targetMask; }
        void SetTargetMask(uint32 newMask) { m_targetMask = newMask; }

        void SetTargetFlag(SpellCastTargetFlags flag) { m_targetMask |= flag; }

        uint64 GetUnitTargetGUID() const;
        Unit* GetUnitTarget() const;
        void SetUnitTarget(Unit* target);

        uint64 GetGOTargetGUID() const;
        GameObject* GetGOTarget() const;
        void SetGOTarget(GameObject* target);

        uint64 GetCorpseTargetGUID() const;
        Corpse* GetCorpseTarget() const;

        WorldObject* GetObjectTarget() const;
        uint64 GetObjectTargetGUID() const;
        void RemoveObjectTarget();

        uint64 GetItemTargetGUID() const { return m_itemTargetGUID; }
        Item* GetItemTarget() const { return m_itemTarget; }
        uint32 GetItemTargetEntry() const { return m_itemTargetEntry; }
        void SetItemTarget(Item* item);
        void SetTradeItemTarget(Player* caster);
        void UpdateTradeSlotItem();

        SpellDestination const* GetSrc() const;
        Position const* GetSrcPos() const;
        void SetSrc(float x, float y, float z);
        void SetSrc(Position const& pos);
        void SetSrc(WorldObject const& wObj);
        void ModSrc(Position const& pos);
        void RemoveSrc();

        SpellDestination const* GetDst() const;
        WorldLocation const* GetDstPos() const;
        void SetDst(float x, float y, float z, float orientation, uint32 mapId = MAPID_INVALID);
        void SetDst(Position const& pos);
        void SetDst(WorldObject const& wObj);
        void SetDst(SpellDestination const& spellDest);
        void SetDst(SpellCastTargets const& spellTargets);
        void ModDst(Position const& pos);
        void ModDst(SpellDestination const& spellDest);
        void RemoveDst();

        bool HasSrc() const { return GetTargetMask() & TARGET_FLAG_SOURCE_LOCATION; }
        bool HasDst() const { return GetTargetMask() & TARGET_FLAG_DEST_LOCATION; }
        bool HasTraj() const { return m_speed != 0; }

        float GetElevation() const { return m_elevation; }
        void SetElevation(float elevation) { m_elevation = elevation; }
        float GetSpeed() const { return m_speed; }
        void SetSpeed(float speed) { m_speed = speed; }

        float GetDist2d() const { return m_src._position.GetExactDist2d(&m_dst._position); }
        float GetSpeedXY() const { return m_speed * std::cos(m_elevation); }
        float GetSpeedZ() const { return m_speed * std::sin(m_elevation); }

        void Update(Unit* caster);
        void OutDebug() const;

        void ClearExtraTargets()
        {
            m_extraTargets.clear();
            m_targetMask &= ~TARGET_FLAG_EXTRA_TARGETS;
        }

        void AddExtraTarget(uint64 guid, WorldLocation pos)
        {
            SpellDestination extraTarget;
            extraTarget._position = pos;
            extraTarget._transportGUID = guid;

            m_extraTargets.push_back(extraTarget);

            m_targetMask |= TARGET_FLAG_EXTRA_TARGETS;
        }

        size_t GetExtraTargetsCount() const { return m_extraTargets.size(); }
        std::list<SpellDestination> const & GetExtraTargets() const { return m_extraTargets; }

        std::string const& GetTargetString() { return m_strTarget; }

    private:
        uint32 m_targetMask;

        // objects (can be used at spell creating and after Update at casting)
        WorldObject* m_objectTarget;
        Item* m_itemTarget;

        // object GUID/etc, can be used always
        uint64 m_objectTargetGUID;
        uint64 m_itemTargetGUID;
        uint32 m_itemTargetEntry;

        SpellDestination m_src;
        SpellDestination m_dst;
        std::list<SpellDestination> m_extraTargets;

        float m_elevation, m_speed;
        std::string m_strTarget;
};

struct SpellValue
{
    explicit  SpellValue(SpellInfo const* proto);
    int32     EffectBasePoints[MAX_SPELL_EFFECTS];
    uint32    MaxAffectedTargets;
    float     RadiusMod;
    uint8     AuraStackAmount;
    bool      HealingBonusDone = true;
    float     Multiplier = 1.0f;
    SpellCastFlags SpellGoFlags = CAST_FLAG_NONE;
};

enum SpellState
{
    SPELL_STATE_NULL      = 0,
    SPELL_STATE_PREPARING = 1,
    SPELL_STATE_CASTING   = 2,
    SPELL_STATE_FINISHED  = 3,
    SPELL_STATE_IDLE      = 4,
    SPELL_STATE_DELAYED   = 5,
	SPELL_STATE_QUEUED    = 6
};

enum SpellEffectHandleMode
{
    SPELL_EFFECT_HANDLE_LAUNCH,
    SPELL_EFFECT_HANDLE_LAUNCH_TARGET,
    SPELL_EFFECT_HANDLE_HIT,
    SPELL_EFFECT_HANDLE_HIT_TARGET
};

struct SpellResearchInfo
{
    SpellResearchInfo() : type(0), itemId(0), count(0) { }
    SpellResearchInfo(uint32 _type, uint32 _itemId, uint8 _count) : type(_type), itemId(_itemId), count(_count) { }

    uint8 type;
    uint32 itemId;
    uint32 count;
};

struct SpellResearchData
{
    uint32 KeystoneItemId;
    uint32 KeystoneCount;
    uint32 FragmentCurrencyId;
    uint32 FragmentCount;
};

class Spell
{
    friend void Unit::SetCurrentCastedSpell(Spell* pSpell);
    friend class SpellScript;
    friend void AuraEffect::HandleAuraModSchoolImmunity(AuraApplication const* aurApp, uint8 mode, bool apply) const;
    public:

        void EffectNULL(SpellEffIndex effIndex);
        void EffectUnused(SpellEffIndex effIndex);
        void EffectDistract(SpellEffIndex effIndex);
        void EffectPull(SpellEffIndex effIndex);
        void EffectSchoolDMG(SpellEffIndex effIndex);
        void EffectEnvironmentalDMG(SpellEffIndex effIndex);
        void EffectInstaKill(SpellEffIndex effIndex);
        void EffectDummy(SpellEffIndex effIndex);
        void EffectTeleportUnits(SpellEffIndex effIndex);
        void EffectApplyAura(SpellEffIndex effIndex);
        void EffectSendEvent(SpellEffIndex effIndex);
        void EffectPowerBurn(SpellEffIndex effIndex);
        void EffectPowerDrain(SpellEffIndex effIndex);
        void EffectHeal(SpellEffIndex effIndex);
        void EffectBind(SpellEffIndex effIndex);
        void EffectHealthLeech(SpellEffIndex effIndex);
        void EffectQuestComplete(SpellEffIndex effIndex);
        void EffectCreateItem(SpellEffIndex effIndex);
        void EffectCreateItem2(SpellEffIndex effIndex);
        void EffectCreateRandomItem(SpellEffIndex effIndex);
        void EffectPersistentAA(SpellEffIndex effIndex);
        void EffectEnergize(SpellEffIndex effIndex);
        void EffectOpenLock(SpellEffIndex effIndex);
        void EffectSummonChangeItem(SpellEffIndex effIndex);
        void EffectProficiency(SpellEffIndex effIndex);
        void EffectApplyAreaAura(SpellEffIndex effIndex);
        void EffectSummonType(SpellEffIndex effIndex);
        void EffectLearnSpell(SpellEffIndex effIndex);
        void EffectDispel(SpellEffIndex effIndex);
        void EffectDualWield(SpellEffIndex effIndex);
        void EffectPickPocket(SpellEffIndex effIndex);
        void EffectAddFarsight(SpellEffIndex effIndex);
        void EffectUntrainTalents(SpellEffIndex effIndex);
        void EffectHealMechanical(SpellEffIndex effIndex);
        void EffectJump(SpellEffIndex effIndex);
        void EffectJumpDest(SpellEffIndex effIndex);
        void EffectLeapBack(SpellEffIndex effIndex);
        void EffectQuestClear(SpellEffIndex effIndex);
        void EffectTeleUnitsFaceCaster(SpellEffIndex effIndex);
        void EffectLearnSkill(SpellEffIndex effIndex);
        void EffectPlayMovie(SpellEffIndex effIndex);
        void EffectTradeSkill(SpellEffIndex effIndex);
        void EffectEnchantItemPerm(SpellEffIndex effIndex);
        void EffectEnchantItemTmp(SpellEffIndex effIndex);
        void EffectTameCreature(SpellEffIndex effIndex);
        void EffectSummonPet(SpellEffIndex effIndex);
        void EffectLearnPetSpell(SpellEffIndex effIndex);
        void EffectWeaponDmg(SpellEffIndex effIndex);
        void EffectForceCast(SpellEffIndex effIndex);
        void EffectTriggerSpell(SpellEffIndex effIndex);
        void EffectTriggerMissileSpell(SpellEffIndex effIndex);
        void EffectThreat(SpellEffIndex effIndex);
        void EffectHealMaxHealth(SpellEffIndex effIndex);
        void EffectInterruptCast(SpellEffIndex effIndex);
        void EffectSummonObjectWild(SpellEffIndex effIndex);
        void EffectScriptEffect(SpellEffIndex effIndex);
        void EffectSanctuary(SpellEffIndex effIndex);
        void EffectAddComboPoints(SpellEffIndex effIndex);
        void EffectDuel(SpellEffIndex effIndex);
        void EffectStuck(SpellEffIndex effIndex);
        void EffectSummonPlayer(SpellEffIndex effIndex);
        void EffectActivateObject(SpellEffIndex effIndex);
        void EffectApplyGlyph(SpellEffIndex effIndex);
        void EffectEnchantHeldItem(SpellEffIndex effIndex);
        void EffectSummonObject(SpellEffIndex effIndex);
        void EffectSummonRaidMarker(SpellEffIndex effIndex);
        void EffectResurrect(SpellEffIndex effIndex);
        void EffectParry(SpellEffIndex effIndex);
        void EffectBlock(SpellEffIndex effIndex);
        void EffectLeap(SpellEffIndex effIndex);
        void EffectTransmitted(SpellEffIndex effIndex);
        void EffectDisEnchant(SpellEffIndex effIndex);
        void EffectInebriate(SpellEffIndex effIndex);
        void EffectFeedPet(SpellEffIndex effIndex);
        void EffectDismissPet(SpellEffIndex effIndex);
        void EffectReputation(SpellEffIndex effIndex);
        void EffectForceDeselect(SpellEffIndex effIndex);
        void EffectSelfResurrect(SpellEffIndex effIndex);
        void EffectSkinning(SpellEffIndex effIndex);
        void EffectCharge(SpellEffIndex effIndex);
        void EffectChargeDest(SpellEffIndex effIndex);
        void EffectProspecting(SpellEffIndex effIndex);
        void EffectMilling(SpellEffIndex effIndex);
        void EffectRenamePet(SpellEffIndex effIndex);
        void EffectForcePlayerInteraction(SpellEffIndex effIndex);
        void EffectSendTaxi(SpellEffIndex effIndex);
        void EffectSummonCritter(SpellEffIndex effIndex);
        void EffectKnockBack(SpellEffIndex effIndex);
        void EffectPullTowards(SpellEffIndex effIndex);
        void EffectDispelMechanic(SpellEffIndex effIndex);
        void EffectResurrectPet(SpellEffIndex effIndex);
        void EffectDestroyAllTotems(SpellEffIndex effIndex);
        void EffectDurabilityDamage(SpellEffIndex effIndex);
        void EffectSkill(SpellEffIndex effIndex);
        void EffectTaunt(SpellEffIndex effIndex);
        void EffectDurabilityDamagePCT(SpellEffIndex effIndex);
        void EffectModifyThreatPercent(SpellEffIndex effIndex);
        void EffectResurrectNew(SpellEffIndex effIndex);
        void EffectAddExtraAttacks(SpellEffIndex effIndex);
        void EffectSpiritHeal(SpellEffIndex effIndex);
        void EffectSkinPlayerCorpse(SpellEffIndex effIndex);
        void EffectStealBeneficialBuff(SpellEffIndex effIndex);
        void EffectUnlearnSpecialization(SpellEffIndex effIndex);
        void EffectHealPct(SpellEffIndex effIndex);
        void EffectEnergizePct(SpellEffIndex effIndex);
        void EffectTriggerRitualOfSummoning(SpellEffIndex effIndex);
        void EffectSummonRaFFriend(SpellEffIndex effIndex);
        void EffectUnlockGuildVaultTab(SpellEffIndex effIndex);
        void EffectKillCreditPersonal(SpellEffIndex effIndex);
        void EffectKillCredit(SpellEffIndex effIndex);
        void EffectQuestFail(SpellEffIndex effIndex);
        void EffectQuestStart(SpellEffIndex effIndex);
        void EffectRedirectThreat(SpellEffIndex effIndex);
        void EffectGameObjectDamage(SpellEffIndex effIndex);
        void EffectGameObjectRepair(SpellEffIndex effIndex);
        void EffectGameObjectSetDestructionState(SpellEffIndex effIndex);
        void EffectActivateRune(SpellEffIndex effIndex);
        void EffectCreateTamedPet(SpellEffIndex effIndex);
        void EffectDiscoverTaxi(SpellEffIndex effIndex);
        void EffectTitanGrip(SpellEffIndex effIndex);
        void EffectEnchantItemPrismatic(SpellEffIndex effIndex);
        void EffectPlayMusic(SpellEffIndex effIndex);
        void EffectSpecCount(SpellEffIndex effIndex);
        void EffectActivateSpec(SpellEffIndex effIndex);
        void EffectPlaySound(SpellEffIndex effIndex);
        void EffectRemoveAura(SpellEffIndex effIndex);
        void EffectDamageFromMaxHealthPCT(SpellEffIndex effIndex);
        void EffectCastButtons(SpellEffIndex effIndex);
        void EffectRechargeManaGem(SpellEffIndex effIndex);
        void EffectGiveCurrency(SpellEffIndex effIndex);
        void EffectDestroyItem(SpellEffIndex effIndex);
        void EffectResurrectWithAura(SpellEffIndex effIndex);
        void EffectCreateAreaTrigger(SpellEffIndex effIndex);
        void EffectRemoveTalent(SpellEffIndex effIndex);
        void EffectHealBattlePet(SpellEffIndex effIndex);
        void EffectBattlePetsUnlock(SpellEffIndex effIndex);
        void EffectUncageBattlePet(SpellEffIndex effIndex);
        void EffectPlaySceneId(SpellEffIndex effIndex);
        void EffectPlayScenePackage(SpellEffIndex effIndex);
        void EffectRandomizeDigsite(SpellEffIndex effIndex);
        void EffectBonusRoll(SpellEffIndex effIndex);
        void EffectPlayerChoice(SpellEffIndex effIndex);
		void EffectDespawnDynamicObject(SpellEffIndex effIndex);
		void EffectDespawnAreatrigger(SpellEffIndex effIndex);

        typedef std::set<Aura*> UsedSpellMods;

        Spell(Unit* caster, SpellInfo const* info, TriggerCastFlags triggerFlags, uint64 originalCasterGUID = 0, bool skipCheck = false);
        ~Spell();

        void InitExplicitTargets(SpellCastTargets const& targets);
        void SelectExplicitTargets();

        void SelectSpellTargets();
        void SelectEffectImplicitTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType, uint32& processedEffectMask);
        void SelectImplicitChannelTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType);
        void SelectImplicitNearbyTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType, uint32 effMask);
        void SelectImplicitConeTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType, uint32 effMask);
        void SelectImplicitAreaTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType, uint32 effMask);
        void SelectImplicitRecipientTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType, uint32 effMask);
        void SelectImplicitCasterDestTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType);
        void SelectImplicitTargetDestTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType);
        void SelectImplicitDestDestTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType);
        void SelectImplicitCasterObjectTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType);
        void SelectImplicitTargetObjectTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType);
        void SelectImplicitChainTargets(SpellEffIndex effIndex, SpellImplicitTargetInfo const& targetType, WorldObject* target, uint32 effMask);
        void SelectImplicitTrajTargets(SpellEffIndex effIndex);
        bool SelectImplicitRaidTargetsIfNeed(SpellEffIndex effIndex);

        void SelectEffectTypeImplicitTargets(uint8 effIndex);

        uint32 GetSearcherTypeMask(SpellTargetObjectTypes objType, ConditionList* condList);
        template<class SEARCHER> void SearchTargets(SEARCHER& searcher, uint32 containerMask, Unit* referer, Position const* pos, float radius);

        WorldObject* SearchNearbyTarget(float range, SpellImplicitTargetInfo const& targetType, ConditionList* condList = NULL);
        void SearchAreaTargets(std::list<WorldObject*>& targets, float range, Position const* position, Unit* referer, SpellImplicitTargetInfo const& targetType, ConditionList* condList);
        void SearchChainTargets(std::list<WorldObject*>& targets, uint32 chainTargets, WorldObject* target, SpellImplicitTargetInfo const& targetType, ConditionList* condList, bool isChainHeal);

        GameObject* SearchSpellFocus();

        void prepare(SpellCastTargets const* targets, AuraEffect const* triggeredByAura = NULL, uint32 gcdAtCast = 0);
        void cancel();
        void update(uint32 difftime);
        void cast(bool skipCheck = false);
        void finish(bool ok = true);
        void TakePower();
        //void TakeAmmo();

        void TakeRunePower(bool didHit);
        void TakeReagents();
        void TakeCastItem();

        SpellCastResult CheckCast(bool strict);
        SpellCastResult CheckPetCast(Unit* target);

        // handlers
        void handle_immediate();
        uint64 handle_delayed(uint64 t_offset);
        // handler helpers
        void _handle_immediate_phase();
        void _handle_finish_phase();

        SpellCastResult CheckItems();
        SpellCastResult CheckRange(bool strict);
        SpellCastResult CheckPower();
        SpellCastResult CheckRuneCost(uint32 runeCostID);
        SpellCastResult CheckCasterAuras() const;

        SpellCastResult GetCastResult() const { return m_castResult; }

        bool CanBreakAura(AuraType auraType) const;

        int32 CalculateDamage(uint8 i, Unit const* target) const
        {
            Unit* caster = m_originalCaster ? m_originalCaster : m_caster;
            return caster->CalculateSpellDamage(target, m_spellInfo, i, &m_spellValue->EffectBasePoints[i], m_CastItem);
        }

        bool HaveTargetsForEffect(uint8 effect) const;
        void Delayed();
        void DelayedChannel();
        uint32 getState() const { return m_spellState; }
        void setState(uint32 state) { m_spellState = state; }

        void DoCreateItem(uint32 i, uint32 itemtype);

        bool CheckEffectTarget(Unit const* target, uint32 eff) const;
        bool CanAutoCast(Unit* target);
        void CheckSrc() { if (!m_targets.HasSrc()) m_targets.SetSrc(*m_caster); }
        void CheckDst() { if (!m_targets.HasDst()) m_targets.SetDst(*m_caster); }

        static void SendCastResult(Player* caster, SpellInfo const* spellInfo, uint8 cast_count, SpellCastResult result, SpellCustomErrors customError = SPELL_CUSTOM_ERROR_NONE, Opcodes opcode = SMSG_CAST_FAILED);
        void SendCastResult(SpellCastResult result);
        void SendPetCastResult(SpellCastResult result);
        void SendSpellStart();
        void SendSpellGo();
        void SendSpellCooldown();
        void SendLogExecute();
        void ExecuteLogEffectTakeTargetPower(uint8 effIndex, Unit* target, uint32 powerType, uint32 powerTaken, float gainMultiplier);
        void ExecuteLogEffectExtraAttacks(uint8 effIndex, Unit* victim, uint32 attCount);
        void ExecuteLogEffectInterruptCast(uint8 effIndex, Unit* victim, uint32 spellId);
        void ExecuteLogEffectDurabilityDamage(uint8 effIndex, Unit* victim, int32 itemId, int32 slot);
        void ExecuteLogEffectOpenLock(uint8 effIndex, Object* obj);
        void ExecuteLogEffectCreateItem(uint8 effIndex, uint32 entry);
        void ExecuteLogEffectDestroyItem(uint8 effIndex, uint32 entry);
        void ExecuteLogEffectSummonObject(uint8 effIndex, WorldObject* obj);
        void ExecuteLogEffectUnsummonObject(uint8 effIndex, WorldObject* obj);
        void ExecuteLogEffectResurrect(uint8 effIndex, Unit* target);
        void SendInterrupted(uint8 result);
        void SendChannelUpdate(uint32 time);
        void SendChannelStart(uint32 duration);
        void SendResurrectRequest(Player* target);
        static void SendResurrectRequest(Unit* caster, Player* target, uint32 spellId);

        void HandleEffects(Unit* pUnitTarget, Item* pItemTarget, GameObject* pGOTarget, Corpse* corpse, uint32 i, SpellEffectHandleMode mode);
        void HandleThreatSpells();

        SpellInfo const* const m_spellInfo;
        Item* m_CastItem;
        uint64 m_castItemGUID;
        uint8 m_cast_count;
        uint32 m_glyphIndex;
        uint32 m_preCastSpell;
        SpellCastTargets m_targets;
        int8 m_comboPointGain;
        SpellCustomErrors m_customError;
        SpellResearchData const* m_researchData;

        UsedSpellMods m_appliedMods;
        SpellModDropPhase m_dropModsPhase;

        int32 GetCastTime() const { return m_casttime; }
        int32 GetChannelTime() const { return m_channelTime; }
        int32 GetCurrentCastTimer() const { return m_timer; }
        bool IsAutoRepeat() const { return m_autoRepeat; }
        void SetAutoRepeat(bool rep) { m_autoRepeat = rep; }
        void ReSetTimer() { m_timer = m_casttime > 0 ? m_casttime : 0; }
        bool IsNextMeleeSwingSpell() const;
        bool IsTriggered() const { return _triggeredCastFlags & TRIGGERED_FULL_MASK; }
        bool IsChannelActive() const { return m_caster->GetUInt32Value(UNIT_FIELD_CHANNEL_SPELL) != 0; }
        bool IsAutoActionResetSpell() const;
        bool IsCritForTarget(Unit* target) const;

        bool IsDeletable() const { return !m_referencedFromCurrentSpell && !m_executedCurrently; }
        void SetReferencedFromCurrent(bool yes) { m_referencedFromCurrentSpell = yes; }
        bool IsInterruptable() const { return !m_executedCurrently; }
        void SetExecutedCurrently(bool yes) {m_executedCurrently = yes;}
        uint64 GetDelayStart() const { return m_delayStart; }
        void SetDelayStart(uint64 m_time) { m_delayStart = m_time; }
        uint64 GetDelayMoment() const { return m_delayMoment; }

        bool IsNeedSendToClient() const;

        CurrentSpellTypes GetCurrentContainer() const;

        Unit* GetCaster() const { return m_caster; }
        Unit* GetOriginalCaster() const { return m_originalCaster; }
        SpellInfo const* GetSpellInfo() const { return m_spellInfo; }
        int32 GetPowerCost() const { return m_powerCost; }
        int32 GetPowerEntryIndex() const { return m_powerEntryIndex; }
        Powers GetPowerType() const { return m_powerType; }

        void UpdatePointers();                              // must be used at call Spell code after time delay (non triggered spell cast/update spell call/etc)

        void CleanupTargetList();

        void SetContext(CustomSpellValues const& values);
        void SetSpellValue(SpellValueMod mod, int32 value);

        DiminishingLevels GetDiminishingLevel() const { return m_diminishLevel; }
        uint32 GetSpellGoTime() const { return m_spellGoTime; }

        void DropSpellModChargeOnCast(Aura* spellMod)
        {
            auto it = m_appliedMods.find(spellMod);
            if (it != m_appliedMods.end())
            {
                m_removedButUsedMods.insert(spellMod->GetId());
                m_appliedMods.erase(it);
                spellMod->ModCharges(-1);
            }
        }

        bool IsSpellModUsedOnCast(uint32 spellId) const
        {
            return m_removedButUsedMods.find(spellId) != m_removedButUsedMods.end();
        }

        SpellInfo const* TriggeredByAuraSpell() const { return m_triggeredByAuraSpell; }

        bool IsSuccessfulInterrupt() const { return m_successfulInterrupt; }

        bool IsSpellRedirecterd() const { return m_redirect; }

        static void ApplySmartHeal(Unit const* caster, std::list<WorldObject*>& targets, uint32 count, bool ignoreLos = false, Position const* losPos = nullptr);

    protected:
        bool HasGlobalCooldown() const;
        void TriggerGlobalCooldown();
        void CancelGlobalCooldown();

        void SendLoot(uint64 guid, LootType loottype);

        Unit* const m_caster;

        SpellValue* const m_spellValue;

        uint64 m_originalCasterGUID;                        // real source of cast (aura caster/etc), used for spell targets selection
                                                            // e.g. damage around area spell trigered by victim aura and damage enemies of aura caster
        Unit* m_originalCaster;                             // cached pointer for m_originalCaster, updated at Spell::UpdatePointers()

        Spell** m_selfContainer;                            // pointer to our spell container (if applicable)

        //Spell data
        SpellSchoolMask m_spellSchoolMask;                  // Spell school (can be overwrite for some spells (wand shoot for example)
        WeaponAttackType m_attackType;                      // For weapon based attack
        Powers m_powerType;                                 // Can be different for same SpellInfo.
        int32 m_powerCost = 0;                              // Calculated spell cost initialized only in Spell::prepare
        int32 m_powerEntryIndex = -1;                            // Needs to apply spell mods
        int32 m_casttime;                                   // Calculated spell cast time initialized only in Spell::prepare
        int32 m_channelTime = 0;
        uint32 m_spellGoTime = 0;
        bool m_canReflect;                                  // can reflect this spell?
        bool m_autoRepeat;
        bool m_redirect = false;
        uint8 m_runesState;

        uint8 m_delayAtDamageCount;
        bool isDelayableNoMore()
        {
            if (m_delayAtDamageCount >= 2)
                return true;

            m_delayAtDamageCount++;
            return false;
        }

        // Delayed spells system
        uint64 m_delayStart;                                // time of spell delay start, filled by event handler, zero = just started
        uint64 m_delayMoment;                               // moment of next delay call, used internally
        bool m_immediateHandled;                            // were immediate actions handled? (used by delayed spells only)
        bool m_instantSpellDelayed = false;
        bool m_darkSimulacrum = false;

        // These vars are used in both delayed spell system and modified immediate spell system
        bool m_referencedFromCurrentSpell;                  // mark as references to prevent deleted and access by dead pointers
        bool m_executedCurrently;                           // mark as executed to prevent deleted and access by dead pointers
        bool m_needComboPoints;
        uint8 m_applyMultiplierMask;
        float m_damageMultipliers[MAX_SPELL_EFFECTS];

        // Current targets, to be used in SpellEffects (MUST BE USED ONLY IN SPELL EFFECTS)
        Unit* unitTarget;
        Item* itemTarget;
        GameObject* gameObjTarget;
        Corpse* corpseTarget;
        WorldLocation* destTarget;
        int32 damage;
        SpellEffectHandleMode effectHandleMode;
        // used in effects handlers
        Aura* m_spellAura;

        // this is set in Spell Hit, but used in Apply Aura handler
        DiminishingLevels m_diminishLevel;
        DiminishingGroup m_diminishGroup;

        // -------------------------------------------
        GameObject* focusObject;

        // Damage and healing in effects need just calculate
        int32 m_damage = 0;             // Damge   in effects count here
        int32 m_unmitigatedDamage = 0;  // Unmitigated damage
        int32 m_healing = 0;            // Healing in effects count here
        int32 m_final_damage = 0;       // Final damage in effects count here
        int32 m_absorbed_damage = 0;    // Final absorbed damage in effects count here
        int32 m_dispelCount = 0;
        SpellMissInfo m_missInfo = SPELL_MISS_NONE;

        // ******************************************
        // Spell trigger system
        // ******************************************
        uint32 m_procAttacker;                // Attacker trigger flags
        uint32 m_procVictim;                  // Victim   trigger flags
        uint32 m_procEx;
        void   prepareDataForTriggerSystem(AuraEffect const* triggeredByAura);

        // *****************************************
        // Spell target subsystem
        // *****************************************
        // Targets store structures and data
    public:
        struct TargetInfo
        {
            uint64 targetGUID;
            uint64 timeDelay;
            SpellMissInfo missCondition:8;
            SpellMissInfo reflectResult:8;
            uint32 effectMask;
            bool   processed:1;
            bool   alive:1;
            bool   crit:1;
            bool   scaleAura:1;
            int32  damage;
            int32  unmitigatedDamage;
        };

        TargetInfo const* GetTargetInfo(uint64 guid) const;
        std::list<Spell::TargetInfo> const& GetUnitTargets() const { return m_UniqueTargetInfo; }

        // If spell isn't updated yet m_targets.GetUnitTarget() can access invalid pointer
        Unit* GetExplTargetUnit() const;

    private:
        std::list<TargetInfo> m_UniqueTargetInfo;
        uint32 m_channelTargetEffectMask;                        // Mask req. alive targets

        struct GOTargetInfo
        {
            uint64 targetGUID;
            uint64 timeDelay;
            uint32 effectMask;
            bool   processed:1;
        };
        std::list<GOTargetInfo> m_UniqueGOTargetInfo;

        struct CorpseTargetInfo
        {
            uint64 targetGUID;
            uint64 timeDelay;
            uint8  effectMask : 8;
            bool   processed : 1;
        };
        std::list<CorpseTargetInfo> m_uniqueCorpseTargetInfo;

        struct ItemTargetInfo
        {
            Item*  item;
            uint32 effectMask;
        };
        std::list<ItemTargetInfo> m_UniqueItemInfo;

        struct ReflectTargetInfo
        {
            uint64 targetGUID;
            uint64 timeDelay;
            bool processed;
        };

        std::list<ReflectTargetInfo> m_reflectTargetInfo;

        SpellDestination m_destTargets[MAX_SPELL_EFFECTS];

        uint64 CaluclateFlyTimeForTarget(Unit* target);

        void AddUnitTarget(Unit* target, uint32 effectMask, bool checkIfValid = true, bool implicit = true);
        void AddGOTarget(GameObject* target, uint32 effectMask);
        void AddCorpseTarget(Corpse* target, uint32 effectMask);
        void AddItemTarget(Item* item, uint32 effectMask);
        void AddDestTarget(SpellDestination const& dest, uint32 effIndex);
        int32 GetHealTargetCap() const;

        void DoAllEffectOnTarget(TargetInfo* target);
        SpellMissInfo DoSpellHitOnUnit(Unit* unit, uint32 effectMask, bool scaleAura, bool delayed);
        void DoTriggersOnSpellHit(Unit* unit, uint32 effMask);
        void DoAllEffectOnTarget(GOTargetInfo* target);
        void DoAllEffectOnTarget(CorpseTargetInfo* target);
        void DoAllEffectOnTarget(ItemTargetInfo* target);
        bool UpdateChanneledTargetList();
        bool IsValidDeadOrAliveTarget(Unit const* target) const;
        void HandleLaunchPhase();
        void DoTriggersOnCast(ProcPhase phase);
        void HandleAfterCast();
        void DoAllEffectOnLaunchTarget(TargetInfo& targetInfo, float* multiplier);

        void FinishTargetProcessing();

        // Scripting system
        void LoadScripts();
        void CallScriptOnSpellStartHandlers();
        void CallScriptBeforeCastHandlers();
        void CallScriptOnCastHandlers();
        void CallScriptAfterCastHandlers();
        SpellCastResult CallScriptCheckCastHandlers();
        SpellCastResult CallScriptCheckAutoCastHandlers();
        void PrepareScriptHitHandlers();
        bool CallScriptEffectHandlers(SpellEffIndex effIndex, SpellEffectHandleMode mode);
        void CallScriptBeforeHitHandlers();
        void CallScriptOnHitHandlers();
        void CallScriptAfterHitHandlers();
        void CallScriptObjectAreaTargetSelectHandlers(std::list<WorldObject*>& targets, SpellEffIndex effIndex);
        void CallScriptObjectTargetSelectHandlers(WorldObject*& target, SpellEffIndex effIndex);
        void CallScriptDestinationTargetSelectHandlers(SpellDestination& target, SpellEffIndex effIndex);
        bool CheckScriptEffectImplicitTargets(uint32 effIndex, uint32 effIndexToCheck);
        std::list<SpellScript*> m_loadedScripts;

        struct HitTriggerSpell
        {
            SpellInfo const* triggeredSpell;
            SpellInfo const* triggeredByAura;
            // uint8 triggeredByEffIdx          This might be needed at a later stage - No need known for now
            int32 chance;
        };

        bool CanExecuteTriggersOnHit(uint32 effMask, SpellInfo const* triggeredByAura = NULL) const;
        void PrepareTriggersExecutedOnHit();
        typedef std::list<HitTriggerSpell> HitTriggerSpellList;
        HitTriggerSpellList m_hitTriggerSpells;

        // effect helpers
        void SummonGuardian(uint32 i, uint32 entry, SummonPropertiesEntry const* properties, uint32 numSummons);
        TempSummon* SummonTotem(uint32 entry, SummonPropertiesEntry const* properties, uint32 duration, bool visibleBySummonerOnly = false);
        void CalculateJumpSpeeds(uint8 i, float dist, float & speedxy, float & speedz);

        SpellCastResult CanOpenLock(uint32 effIndex, uint32 lockid, SkillType& skillid, int32& reqSkillValue, int32& skillValue);
        // -------------------------------------------

        uint32 m_spellState;
        int32 m_timer;

        TriggerCastFlags _triggeredCastFlags;

        // if need this can be replaced by Aura copy
        // we can't store original aura link to prevent access to deleted auras
        // and in same time need aura data and after aura deleting.
        SpellInfo const* m_triggeredByAuraSpell;

        bool m_skipCheck;
        uint32 m_auraScaleMask;
        std::unique_ptr<PathGenerator> m_preGeneratedPath;

        typedef std::map<uint32, SpellLogHelper> LogHelperMap;
        LogHelperMap m_effectExecuteData;
        SpellCastResult m_castResult = SPELL_CAST_OK;

        // Some spell mods must be dropped on cast and removed from m_appliedMods.
        // But at some times we need to know about was spell affected with this spell mods(i.e.no proc from spell that already was consume modifier)
        std::set<uint32> m_removedButUsedMods;

        int32 m_additionalChannelDuration = 0;
        bool m_successfulInterrupt = false;

#ifdef MAP_BASED_RAND_GEN
        int32 irand(int32 min, int32 max)       { return int32 (m_caster->GetMap()->mtRand.randInt(max - min)) + min; }
        uint32 urand(uint32 min, uint32 max)    { return m_caster->GetMap()->mtRand.randInt(max - min) + min; }
        int32 rand32()                          { return m_caster->GetMap()->mtRand.randInt(); }
        double rand_norm()                      { return m_caster->GetMap()->mtRand.randExc(); }
        double rand_chance()                    { return m_caster->GetMap()->mtRand.randExc(100.0); }
#endif
};

namespace Trinity
{
    struct WorldObjectSpellTargetCheck
    {
        Unit* _caster;
        Unit* _referer;
        SpellInfo const* _spellInfo;
        SpellTargetSelectionCategories _category;
        SpellTargetCheckTypes _targetSelectionType;
        ConditionSourceInfo* _condSrcInfo;
        ConditionList* _condList;

        WorldObjectSpellTargetCheck(Unit* caster, Unit* referer, SpellInfo const* spellInfo,
            SpellTargetSelectionCategories category, SpellTargetCheckTypes selectionType, ConditionList* condList);
        ~WorldObjectSpellTargetCheck();
        bool operator()(WorldObject* target);
    };

    struct WorldObjectSpellNearbyTargetCheck : public WorldObjectSpellTargetCheck
    {
        float _range;
        Unit const* _caster;
        WorldObjectSpellNearbyTargetCheck(float range, Unit* caster, SpellInfo const* spellInfo,
            SpellTargetSelectionCategories category, SpellTargetCheckTypes selectionType, ConditionList* condList);
        bool operator()(WorldObject* target);
    };

    struct WorldObjectSpellAreaTargetCheck : public WorldObjectSpellTargetCheck
    {
        float _range;
        Position const* _position;
        WorldObjectSpellAreaTargetCheck(float range, Position const* position, Unit* caster,
            Unit* referer, SpellInfo const* spellInfo, SpellTargetSelectionCategories category, SpellTargetCheckTypes selectionType, ConditionList* condList);
        bool operator()(WorldObject* target);
    };

    struct WorldObjectSpellConeTargetCheck : public WorldObjectSpellAreaTargetCheck
    {
        float _coneAngle, _coneOffset;
        WorldObjectSpellConeTargetCheck(float coneAngle, float coneOffset, float range, Unit* caster,
            SpellInfo const* spellInfo, SpellTargetSelectionCategories category, SpellTargetCheckTypes selectionType, ConditionList* condList);
        bool operator()(WorldObject* target);
    };

    struct WorldObjectSpellTrajTargetCheck : public WorldObjectSpellAreaTargetCheck
    {
        WorldObjectSpellTrajTargetCheck(float range, Position const* position, Unit* caster, SpellInfo const* spellInfo);
        bool operator()(WorldObject* target);
    };
}

typedef void(Spell::*pEffect)(SpellEffIndex effIndex);

class SpellEvent : public BasicEvent
{
    public:
        SpellEvent(Spell* spell);
        virtual ~SpellEvent();

        virtual bool Execute(uint64 e_time, uint32 p_time);
        virtual void Abort(uint64 e_time);
        virtual bool IsDeletable() const;
        Spell* GetSpell() const { return m_Spell; }
    protected:
        Spell* m_Spell;
};

class MissileData
{
public:
    bool Initialized() { return m_spellId != 0; }

    void Initialize(Spell const* spell, float dist);

    void Update(uint32 currentTime, Unit* caster, AuraEffect const* eff);

    bool CheckTarget(WorldObject const* target, float dist);

private:
    uint32 m_spellId = 0;
    uint32 m_timer = 0;
    uint32 m_currentTime = 0;
    uint32 m_prevTime = 0;
    Position m_srcPos;
    Position m_destPos;
    Position m_currentPos;
    Position m_prevPos;
    float m_calculatedDist = 0.0f;
    float m_totalDist = 0.0f;
    float m_currentDist = 0.0f;
    float m_speed = 0.0f;
    bool m_reversed = false;
    bool m_done = false;
    std::set<uint64> m_affectedTargets;
};

#endif
