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

#ifndef TRINITY_DBCSTORES_H
#define TRINITY_DBCSTORES_H

#include "Common.h"
#include "DBCStore.h"
#include "DBCStructure.h"
#include "SharedDefines.h"
#include <list>


typedef std::list<uint32> SimpleFactionsList;
SimpleFactionsList const* GetFactionTeamList(uint32 faction);

char const* GetPetName(uint32 petfamily, uint32 dbclang);
SpellEffectEntry const* GetSpellEffectEntry(uint32 spellId, uint32 effect, uint32 difficulty);
uint32 GetTalentSpellCost(uint32 spellId);
TalentSpellPos const* GetTalentSpellPos(uint32 spellId);

char const* GetRaceName(uint8 race, uint8 locale);
char const* GetClassName(uint8 class_, uint8 locale);

WMOAreaTableEntry const* GetWMOAreaTableEntryByTripple(int32 rootid, int32 adtid, int32 groupid);

uint32 GetVirtualMapForMapAndZone(uint32 mapid, uint32 zoneId);

const std::string* GetRandomCharacterName(uint8 race, uint8 gender);

enum ContentLevels
{
    CONTENT_1_60    = 0,
    CONTENT_61_70   = 1,
    CONTENT_71_80   = 2,
    CONTENT_81_85   = 3,
    CONTENT_86_90   = 4,
    MAX_CONTENT
};

uint32 GetMaxLevelForExpansion(uint32 expansion);

ContentLevels GetContentLevelsForMapAndZone(uint32 mapid, uint32 zoneId);

bool IsTotemCategoryCompatiableWith(uint32 itemTotemCategoryId, uint32 requiredTotemCategoryId);

void Zone2MapCoordinates(float &x, float &y, uint32 zone);
void Map2ZoneCoordinates(float &x, float &y, uint32 zone);
uint32 GetClassBySkillId(uint32 skillId);
uint32 GetSkillIdByClass(uint32 classId);

typedef std::map<uint32/*pair32(map, diff)*/, MapDifficulty> MapDifficultyMap;
MapDifficulty const* GetMapDifficultyData(uint32 mapId, Difficulty difficulty);
MapDifficulty const* GetDownscaledMapDifficultyData(uint32 mapId, Difficulty &difficulty);

uint32 GetLiquidFlags(uint32 liquidType);

PvPDifficultyEntry const* GetBattlegroundBracketByLevel(uint32 mapid, uint32 level);
PvPDifficultyEntry const* GetBattlegroundBracketById(uint32 mapid, BattlegroundBracketId id);

CharStartOutfitEntry const* GetCharStartOutfitEntry(uint8 race, uint8 class_, uint8 gender);

typedef std::vector<std::pair<int32, int32> > DigsitePOIPolygon;
typedef std::map<uint32 /*digsiteId*/, DigsitePOIPolygon> DigsitePOIPolygonContainer;
DigsitePOIPolygon const* GetDigsitePOIPolygon(uint32 digsiteId);

uint32 GetPowerIndexByClass(uint32 powerType, uint32 classId);
LFGDungeonEntry const* GetLFGDungeon(uint32 mapId, Difficulty difficulty);

uint32 GetDefaultMapLight(uint32 mapId);

uint32 GetQuestUniqueBitFlag(uint32 questId);

extern DBCStorage <AnimKitEntry>                 sAnimKitStore;
extern DBCStorage <AchievementEntry>             sAchievementStore;
extern DBCStorage <AchievementCriteriaEntry>     sAchievementCriteriaStore;
extern DBCStorage <AreaTableEntry>               sAreaTableStore;
extern DBCStorage <AreaGroupEntry>               sAreaGroupStore;
extern DBCStorage <AreaPOIEntry>                 sAreaPOIStore;
extern DBCStorage <AreaTriggerEntry>             sAreaTriggerStore;
extern DBCStorage <ArmorLocationEntry>           sArmorLocationStore;
extern DBCStorage <AuctionHouseEntry>            sAuctionHouseStore;
extern DBCStorage <BankBagSlotPricesEntry>       sBankBagSlotPricesStore;
extern DBCStorage <BannedAddOnsEntry>            sBannedAddOnsStore;
extern DBCStorage <BarberShopStyleEntry>         sBarberShopStyleStore;
extern DBCStorage <BattlemasterListEntry>        sBattlemasterListStore;
extern DBCStorage <ChatChannelsEntry>            sChatChannelsStore;
extern DBCStorage <CharStartOutfitEntry>         sCharStartOutfitStore;
extern DBCStorage <CharTitlesEntry>              sCharTitlesStore;
extern DBCStorage <ChrClassesEntry>              sChrClassesStore;
extern DBCStorage <ChrRacesEntry>                sChrRacesStore;
extern DBCStorage <ChrPowerTypesEntry>           sChrPowerTypesStore;
extern DBCStorage <ChrSpecializationEntry>       sChrSpecializationStore;
extern DBCStorage <CinematicSequencesEntry>      sCinematicSequencesStore;
extern DBCStorage <CreatureDisplayInfoEntry>     sCreatureDisplayInfoStore;
extern DBCStorage <CreatureImmunitiesEntry>      sCreatureImmunitiesStore;
extern DBCStorage <CreatureFamilyEntry>          sCreatureFamilyStore;
extern DBCStorage <CreatureModelDataEntry>       sCreatureModelDataStore;
extern DBCStorage <CreatureSpellDataEntry>       sCreatureSpellDataStore;
extern DBCStorage <CreatureTypeEntry>            sCreatureTypeStore;
extern DBCStorage <CurrencyTypesEntry>           sCurrencyTypesStore;
extern DBCStorage <CriteriaEntry>                sCriteriaStore;
extern DBCStorage <CriteriaTreeEntry>            sCriteriaTreeStore;
extern DBCStorage <DestructibleModelDataEntry>   sDestructibleModelDataStore;
extern DBCStorage <DungeonEncounterEntry>        sDungeonEncounterStore;
extern DBCStorage <DurabilityCostsEntry>         sDurabilityCostsStore;
extern DBCStorage <DurabilityQualityEntry>       sDurabilityQualityStore;
extern DBCStorage <EmotesEntry>                  sEmotesStore;
extern DBCStorage <EmotesTextEntry>              sEmotesTextStore;
extern DBCStorage <FactionEntry>                 sFactionStore;
extern DBCStorage <FactionTemplateEntry>         sFactionTemplateStore;
extern DBCStorage <GameObjectDisplayInfoEntry>   sGameObjectDisplayInfoStore;
extern DBCStorage <GemPropertiesEntry>           sGemPropertiesStore;
extern DBCStorage <GlyphPropertiesEntry>         sGlyphPropertiesStore;
extern DBCStorage <GlyphSlotEntry>               sGlyphSlotStore;

extern DBCStorage <GtBarberShopCostBaseEntry>    sGtBarberShopCostBaseStore;
extern DBCStorage <GtBattlePetTypeDamageModEntry>sGtBattlePetTypeDamageModStore;
extern DBCStorage <GtBattlePetXpEntry>           sGtBattlePetXpStore;
extern DBCStorage <GtCombatRatingsEntry>         sGtCombatRatingsStore;
extern DBCStorage <GtChanceToMeleeCritBaseEntry> sGtChanceToMeleeCritBaseStore;
extern DBCStorage <GtChanceToMeleeCritEntry>     sGtChanceToMeleeCritStore;
extern DBCStorage <GtChanceToSpellCritBaseEntry> sGtChanceToSpellCritBaseStore;
extern DBCStorage <GtChanceToSpellCritEntry>     sGtChanceToSpellCritStore;
extern DBCStorage <GtItemSocketCostPerLevelEntry>sGtItemSocketCostPerLevelStore;
extern DBCStorage <GtNPCManaCostScalerEntry>     sGtNPCManaCostScalerStore;
extern DBCStorage <GtOCTClassCombatRatingScalarEntry> sGtOCTClassCombatRatingScalarStore;
extern DBCStorage <gtOCTHpPerStaminaEntry>       sGtOCTHpPerStaminaStore;
extern DBCStorage <GtRegenMPPerSptEntry>         sGtRegenMPPerSptStore;
extern DBCStorage <GtSpellScalingEntry>          sGtSpellScalingStore;
extern DBCStorage <GtOCTBaseHPByClassEntry>      sGtOCTBaseHPByClassStore;
extern DBCStorage <GtOCTBaseMPByClassEntry>      sGtOCTBaseMPByClassStore;
extern DBCStorage <GuildPerkSpellsEntry>         sGuildPerkSpellsStore;
extern DBCStorage <HolidaysEntry>                sHolidaysStore;
extern DBCStorage <ImportPriceArmorEntry>        sImportPriceArmorStore;
extern DBCStorage <ImportPriceQualityEntry>      sImportPriceQualityStore;
extern DBCStorage <ImportPriceShieldEntry>       sImportPriceShieldStore;
extern DBCStorage <ImportPriceWeaponEntry>       sImportPriceWeaponStore;
extern DBCStorage <ItemPriceBaseEntry>           sItemPriceBaseStore;
extern DBCStorage <ItemReforgeEntry>             sItemReforgeStore;
extern DBCStorage <ItemArmorQualityEntry>        sItemArmorQualityStore;
extern DBCStorage <ItemArmorShieldEntry>         sItemArmorShieldStore;
extern DBCStorage <ItemArmorTotalEntry>          sItemArmorTotalStore;
extern DBCStorage <ItemClassEntry>               sItemClassStore;
extern DBCStorage <ItemBagFamilyEntry>           sItemBagFamilyStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageAmmoStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageOneHandStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageOneHandCasterStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageRangedStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageThrownStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageTwoHandStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageTwoHandCasterStore;
extern DBCStorage <ItemDamageEntry>              sItemDamageWandStore;
extern DBCStorage <ItemDisplayInfoEntry>         sItemDisplayInfoStore;
extern DBCStorage <ItemDisenchantLootEntry>      sItemDisenchantLootStore;
extern DBCStorage <ItemLimitCategoryEntry>       sItemLimitCategoryStore;
extern DBCStorage <ItemNameDescriptionEntry>     sItemNameDescriptionStore;
extern DBCStorage <ItemRandomPropertiesEntry>    sItemRandomPropertiesStore;
extern DBCStorage <ItemRandomSuffixEntry>        sItemRandomSuffixStore;
extern DBCStorage <ItemSetEntry>                 sItemSetStore;
extern DBCStorage <ItemSpecEntry>                sItemSpecStore;
extern DBCStorage <ItemSpecOverrideEntry>        sItemSpecOverrideStore;
extern DBCStorage <LFGDungeonEntry>              sLFGDungeonStore;
extern DBCStorage <LiquidTypeEntry>              sLiquidTypeStore;
extern DBCStorage <LockEntry>                    sLockStore;
extern DBCStorage <MailTemplateEntry>            sMailTemplateStore;
extern DBCStorage <MapEntry>                     sMapStore;
extern DBCStorage <ModifierTreeEntry>            sModifierTreeStore;
extern DBCStorage <MountCapabilityEntry>         sMountCapabilityStore;
extern DBCStorage <MountTypeEntry>               sMountTypeStore;
extern DBCStorage <NameGenEntry>                 sNameGenStore;
extern DBCStorage <PhaseEntry>                   sPhaseStore;
//extern DBCStorage <MapDifficultyEntry>           sMapDifficultyStore; -- use GetMapDifficultyData insteed
extern MapDifficultyMap                          sMapDifficultyMap;
extern DBCStorage <MovieEntry>                   sMovieStore;
extern DBCStorage <OverrideSpellDataEntry>       sOverrideSpellDataStore;
extern DBCStorage <PlayerConditionEntry>         sPlayerConditionStore;
extern DBCStorage <QuestSortEntry>               sQuestSortStore;
extern DBCStorage <QuestXPEntry>                 sQuestXPStore;
extern DBCStorage <QuestFactionRewEntry>         sQuestFactionRewardStore;
extern DBCStorage <QuestPOIPointEntry>           sQuestPOIPointStore;
extern DBCStorage <RandomPropertiesPointsEntry>  sRandomPropertiesPointsStore;
extern DBCStorage <ResearchBranchEntry>          sResearchBranchStore;
extern DBCStorage <ResearchProjectEntry>         sResearchProjectStore;
extern DBCStorage <ResearchSiteEntry>            sResearchSiteStore;
extern DBCStorage <ScalingStatDistributionEntry> sScalingStatDistributionStore;
extern DBCStorage <ScalingStatValuesEntry>       sScalingStatValuesStore;
extern DBCStorage <ScenarioEntry>                sScenarioStore;
extern DBCStorage <ScenarioStepEntry>            sScenarioStepStore;
extern DBCStorage <SkillRaceClassInfoEntry>      sSkillRaceClassInfoStore;
extern DBCStorage <SkillTiersEntry>              sSkillTiersStore;
extern DBCStorage <SkillLineEntry>               sSkillLineStore;
extern DBCStorage <SkillLineAbilityEntry>        sSkillLineAbilityStore;
extern DBCStorage <SoundEntriesEntry>            sSoundEntriesStore;
extern DBCStorage <SpellCastTimesEntry>          sSpellCastTimesStore;
extern DBCStorage <SpellCategoryEntry>           sSpellCategoryStore;
extern DBCStorage <SpellDurationEntry>           sSpellDurationStore;
extern DBCStorage <SpellFocusObjectEntry>        sSpellFocusObjectStore;
extern DBCStorage <SpellItemEnchantmentEntry>    sSpellItemEnchantmentStore;
extern DBCStorage <SpellItemEnchantmentConditionEntry> sSpellItemEnchantmentConditionStore;
extern SpellCategoryStore                        sSpellsByCategoryStore;
extern ClassBySkillIdStore                       sClassBySkillIdStore;
extern SpellEffectScallingByEffectId             sSpellEffectScallingByEffectId;
extern DBCStorage <SpecializationSpellsEntry>    sSpecializationSpellsStore;
extern DBCStorage <SpellRadiusEntry>             sSpellRadiusStore;
extern DBCStorage <SpellRangeEntry>              sSpellRangeStore;
extern DBCStorage <SpellRuneCostEntry>           sSpellRuneCostStore;
extern DBCStorage <SpellShapeshiftEntry>         sSpellShapeshiftStore;
extern DBCStorage <SpellShapeshiftFormEntry>     sSpellShapeshiftFormStore;
extern DBCStorage <SpellEntry>                   sSpellStore;
extern DBCStorage <SpellMiscEntry>               sSpellMiscStore;
extern DBCStorage <SpellEffectScalingEntry>      sSpellEffectScalingStore;
extern DBCStorage <SpellAuraOptionsEntry>        sSpellAuraOptionsStore;
extern DBCStorage <SpellAuraRestrictionsEntry>   sSpellAuraRestrictionsStore;
extern DBCStorage <SpellCastingRequirementsEntry> sSpellCastingRequirementsStore;
extern DBCStorage <SpellCategoriesEntry>         sSpellCategoriesStore;
extern DBCStorage <SpellClassOptionsEntry>       sSpellClassOptionsStore;
extern DBCStorage <SpellCooldownsEntry>          sSpellCooldownsStore;
extern DBCStorage <SpellEffectEntry>             sSpellEffectStore;
extern DBCStorage <SpellEquippedItemsEntry>      sSpellEquippedItemsStore;
extern DBCStorage <SpellInterruptsEntry>         sSpellInterruptsStore;
extern DBCStorage <SpellLevelsEntry>             sSpellLevelsStore;
extern DBCStorage <SpellPowerEntry>              sSpellPowerStore;
extern DBCStorage <SpellProcsPerMinuteEntry>     sSpellProcsPerMinuteStore;
extern DBCStorage <SpellProcsPerMinuteModEntry>  sSpellProcsPerMinuteModStore;
extern DBCStorage <SpellTargetRestrictionsEntry> sSpellTargetRestrictionsStore;
extern DBCStorage <SpellTotemsEntry>             sSpellTotemsStore;
extern DBCStorage <SpellScalingEntry>            sSpellScalingStore;
extern DBCStorage <SummonPropertiesEntry>        sSummonPropertiesStore;
extern DBCStorage <TalentEntry>                  sTalentStore;
extern DBCStorage <TaxiNodesEntry>               sTaxiNodesStore;
extern DBCStorage <TaxiPathEntry>                sTaxiPathStore;
extern TaxiMask                                  sTaxiNodesMask;
extern TaxiMask                                  sOldContinentsNodesMask;
extern TaxiMask                                  sHordeTaxiNodesMask;
extern TaxiMask                                  sAllianceTaxiNodesMask;
extern TaxiMask                                  sDeathKnightTaxiNodesMask;
extern TaxiPathSetBySource                       sTaxiPathSetBySource;
extern TaxiPathNodesByPath                       sTaxiPathNodesByPath;
extern DBCStorage <TotemCategoryEntry>           sTotemCategoryStore;
extern DBCStorage <UnitPowerBarEntry>            sUnitPowerBarStore;
extern DBCStorage <VehicleEntry>                 sVehicleStore;
extern DBCStorage <VehicleSeatEntry>             sVehicleSeatStore;
extern DBCStorage <WMOAreaTableEntry>            sWMOAreaTableStore;
//extern DBCStorage <WorldMapAreaEntry>           sWorldMapAreaStore; -- use Zone2MapCoordinates and Map2ZoneCoordinates
extern DBCStorage <WorldMapOverlayEntry>         sWorldMapOverlayStore;
extern DBCStorage <WorldSafeLocsEntry>           sWorldSafeLocsStore;

void LoadDBCStores(const std::string& dataPath, uint32& availableDbcLocales);

SkillRaceClassInfoEntry const* GetSkillRaceClassInfo(uint32 skill, uint32 race, uint32 classId);
std::vector<SkillLineAbilityEntry const*> const* GetAbilitiesBySkill(uint32 skill);

namespace dbc
{
    void FillItemSpecOverride(uint32 itemId, std::set<Specializations>& specs);
    void FillSpellPowers(uint32 spellId, std::vector<SpellPowerEntry const*>& powers);

    std::vector<uint32> const* GetSpecializetionSpells(uint32 specializationId);

    typedef std::array<uint32, MAX_TALENT_TABS> TalentTabs;
    TalentTabs GetClassSpecializations(uint8 classId);
}

#endif
