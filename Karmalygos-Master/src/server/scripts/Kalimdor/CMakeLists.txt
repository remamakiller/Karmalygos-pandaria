# Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/
# Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


file(GLOB_RECURSE scripts_BlackfathomDeeps Kalimdor/BlackfathomDeeps/*.cpp Kalimdor/BlackfathomDeeps/*.h)
file(GLOB_RECURSE scripts_BattleForMountHyjal Kalimdor/CavernsOfTime/BattleForMountHyjal/*.cpp Kalimdor/CavernsOfTime/BattleForMountHyjal/*.h)
file(GLOB_RECURSE scripts_CullingOfStratholme Kalimdor/CavernsOfTime/CullingOfStratholme/*.cpp Kalimdor/CavernsOfTime/CullingOfStratholme/*.h)
file(GLOB_RECURSE scripts_DragonSoul Kalimdor/CavernsOfTime/DragonSoul/*.cpp Kalimdor/CavernsOfTime/DragonSoul/*.h)
file(GLOB_RECURSE scripts_EndTime Kalimdor/CavernsOfTime/EndTime/*.cpp Kalimdor/CavernsOfTime/EndTime/*.h)
file(GLOB_RECURSE scripts_EscapeFromDurnholdeKeep Kalimdor/CavernsOfTime/EscapeFromDurnholdeKeep/*.cpp Kalimdor/CavernsOfTime/EscapeFromDurnholdeKeep/*.h)
file(GLOB_RECURSE scripts_HourofTwilight Kalimdor/CavernsOfTime/HourofTwilight/*.cpp Kalimdor/CavernsOfTime/HourofTwilight/*.h)
file(GLOB_RECURSE scripts_TheBlackMorass Kalimdor/CavernsOfTime/TheBlackMorass/*.cpp Kalimdor/CavernsOfTime/TheBlackMorass/*.h)
file(GLOB_RECURSE scripts_WellofEternity Kalimdor/CavernsOfTime/WellofEternity/*.cpp Kalimdor/CavernsOfTime/WellofEternity/*.h)
file(GLOB_RECURSE scripts_DireMaul Kalimdor/DireMaul/*.cpp Kalimdor/DireMaul/*.h)
file(GLOB_RECURSE scripts_Firelands Kalimdor/Firelands/*.cpp Kalimdor/Firelands/*.h)
file(GLOB_RECURSE scripts_HallsOfOrigination Kalimdor/HallsOfOrigination/*.cpp Kalimdor/HallsOfOrigination/*.h)
file(GLOB_RECURSE scripts_LostCityOfTheTolvir Kalimdor/LostCityOfTheTolvir/*.cpp Kalimdor/LostCityOfTheTolvir/*.h)
file(GLOB_RECURSE scripts_Maraudon Kalimdor/Maraudon/*.cpp Kalimdor/Maraudon/*.h)
file(GLOB_RECURSE scripts_OnyxiasLair Kalimdor/OnyxiasLair/*.cpp Kalimdor/OnyxiasLair/*.h)
file(GLOB_RECURSE scripts_RagefireChasm Kalimdor/RagefireChasm/*.cpp Kalimdor/RagefireChasm/*.h)
file(GLOB_RECURSE scripts_RazorfenDowns Kalimdor/RazorfenDowns/*.cpp Kalimdor/RazorfenDowns/*.h)
file(GLOB_RECURSE scripts_RazorfenKraul Kalimdor/RazorfenKraul/*.cpp Kalimdor/RazorfenKraul/*.h)
file(GLOB_RECURSE scripts_RuinsOfAhnQiraj Kalimdor/RuinsOfAhnQiraj/*.cpp Kalimdor/RuinsOfAhnQiraj/*.h)
file(GLOB_RECURSE scripts_TempleOfAhnQiraj Kalimdor/TempleOfAhnQiraj/*.cpp Kalimdor/TempleOfAhnQiraj/*.h)
file(GLOB_RECURSE scripts_TheVortexPinnacle Kalimdor/TheVortexPinnacle/*.cpp Kalimdor/TheVortexPinnacle/*.h)
file(GLOB_RECURSE scripts_ThroneoftheFourWinds Kalimdor/ThroneoftheFourWinds/*.cpp Kalimdor/ThroneoftheFourWinds/*.h)
file(GLOB_RECURSE scripts_WailingCaverns Kalimdor/WailingCaverns/*.cpp Kalimdor/WailingCaverns/*.h)
file(GLOB_RECURSE scripts_ZulFarrak Kalimdor/ZulFarrak/*.cpp Kalimdor/ZulFarrak/*.h)
file(GLOB_RECURSE scripts_WorldBosses Kalimdor/WorldBosses/*.cpp Kalimdor/WorldBosses/*.h)
file(GLOB_RECURSE scripts_Zones Kalimdor/*.cpp Kalimdor/*.h)

source_group(Kalimdor/BlackfathomDeeps FILES ${scripts_BlackfathomDeeps})
source_group(Kalimdor/CavernsOfTime/BattleForMountHyjal FILES ${scripts_BattleForMountHyjal})
source_group(Kalimdor/CavernsOfTime/CullingOfStratholme FILES ${scripts_CullingOfStratholme})
source_group(Kalimdor/CavernsOfTime/DragonSoul FILES ${scripts_DragonSoul})
source_group(Kalimdor/CavernsOfTime/EndTime FILES ${scripts_EndTime})
source_group(Kalimdor/CavernsOfTime/EscapeFromDurnholdeKeep FILES ${scripts_EscapeFromDurnholdeKeep})
source_group(Kalimdor/CavernsOfTime/HourofTwilight FILES ${scripts_HourofTwilight})
source_group(Kalimdor/CavernsOfTime/TheBlackMorass FILES ${scripts_TheBlackMorass})
source_group(Kalimdor/CavernsOfTime/WellofEternity FILES ${scripts_WellofEternity})
source_group(Kalimdor/DireMaul FILES ${scripts_DireMaul})
source_group(Kalimdor/Firelands FILES ${scripts_Firelands})
source_group(Kalimdor/HallsOfOrigination FILES ${scripts_HallsOfOrigination})
source_group(Kalimdor/LostCityOfTheTolvir FILES ${scripts_LostCityOfTheTolvir})
source_group(Kalimdor/Maraudon FILES ${scripts_Maraudon})
source_group(Kalimdor/OnyxiasLair FILES ${scripts_OnyxiasLair})
source_group(Kalimdor/RagefireChasm FILES ${scripts_RagefireChasm})
source_group(Kalimdor/RazorfenDowns FILES ${scripts_RazorfenDowns})
source_group(Kalimdor/RazorfenKraul FILES ${scripts_RazorfenKraul})
source_group(Kalimdor/RuinsOfAhnQiraj FILES ${scripts_RuinsOfAhnQiraj})
source_group(Kalimdor/TempleOfAhnQiraj FILES ${scripts_TempleOfAhnQiraj})
source_group(Kalimdor/TheVortexPinnacle FILES ${scripts_TheVortexPinnacle})
source_group(Kalimdor/ThroneoftheFourWinds FILES ${scripts_ThroneoftheFourWinds})
source_group(Kalimdor/WailingCaverns FILES ${scripts_WailingCaverns})
source_group(Kalimdor/ZulFarrak FILES ${scripts_ZulFarrak})
source_group(Kalimdor/WorldBosses FILES ${scripts_WorldBosses})
source_group(Kalimdor\\Zones FILES ${scripts_Zones})

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  ${scripts_BlackfathomDeeps}
  ${scripts_BattleForMountHyjal}
  ${scripts_CullingOfStratholme}
  ${scripts_DragonSoul}
  ${scripts_EndTime}
  ${scripts_EscapeFromDurnholdeKeep}
  ${scripts_HourofTwilight}
  ${scripts_TheBlackMorass}
  ${scripts_WellofEternity}
  ${scripts_DireMaul}
  ${scripts_Firelands}
  ${scripts_HallsOfOrigination}
  ${scripts_LostCityOfTheTolvir}
  ${scripts_Maraudon}
  ${scripts_OnyxiasLair}
  ${scripts_RagefireChasm}
  ${scripts_RazorfenDowns}
  ${scripts_RazorfenKraul}
  ${scripts_RuinsOfAhnQiraj}
  ${scripts_TempleOfAhnQiraj}
  ${scripts_TheVortexPinnacle}
  ${scripts_ThroneoftheFourWinds}
  ${scripts_WailingCaverns}
  ${scripts_ZulFarrak}
  ${scripts_WorldBosses}
  ${scripts_Zones}
)


message("  -> Prepared: Kalimdor")
