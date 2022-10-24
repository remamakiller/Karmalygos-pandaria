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

file(GLOB_RECURSE scripts_Ahnkahet Northrend/AzjolNerub/Ahnkahet/*.cpp Northrend/AzjolNerub/Ahnkahet/*.h)
file(GLOB_RECURSE scripts_AzjolNerub Northrend/AzjolNerub/AzjolNerub/*.cpp Northrend/AzjolNerub/AzjolNerub/*.h)
file(GLOB_RECURSE scripts_ObsidianSanctum Northrend/ChamberOfAspects/ObsidianSanctum/*.cpp Northrend/ChamberOfAspects/ObsidianSanctum/*.h)
file(GLOB_RECURSE scripts_RubySanctum Northrend/ChamberOfAspects/RubySanctum/*.cpp Northrend/ChamberOfAspects/RubySanctum/*.h)
file(GLOB_RECURSE scripts_TrialOfTheChampion Northrend/CrusadersColiseum/TrialOfTheChampion/*.cpp Northrend/CrusadersColiseum/TrialOfTheChampion/*.h)
file(GLOB_RECURSE scripts_TrialOfTheCrusader Northrend/CrusadersColiseum/TrialOfTheCrusader/*.cpp Northrend/CrusadersColiseum/TrialOfTheCrusader/*.h)
file(GLOB_RECURSE scripts_DraktharonKeep Northrend/DraktharonKeep/*.cpp Northrend/DraktharonKeep/*.h)
file(GLOB_RECURSE scripts_ForgeOfSouls Northrend/FrozenHalls/ForgeOfSouls/*.cpp Northrend/FrozenHalls/ForgeOfSouls/*.h)
file(GLOB_RECURSE scripts_HallsOfReflection Northrend/FrozenHalls/HallsOfReflection/*.cpp Northrend/FrozenHalls/HallsOfReflection/*.h)
file(GLOB_RECURSE scripts_PitOfSaron Northrend/FrozenHalls/PitOfSaron/*.cpp Northrend/FrozenHalls/PitOfSaron/*.h)
file(GLOB_RECURSE scripts_Gundrak Northrend/Gundrak/*.cpp Northrend/Gundrak/*.h)
file(GLOB_RECURSE scripts_IcecrownCitadel Northrend/IcecrownCitadel/*.cpp Northrend/IcecrownCitadel/*.h)
file(GLOB_RECURSE scripts_Naxxramas Northrend/Naxxramas/*.cpp  Northrend/Naxxramas/*.h)
file(GLOB_RECURSE scripts_EyeOfEternity Northrend/Nexus/EyeOfEternity/*.cpp Northrend/Nexus/EyeOfEternity/*.h)
file(GLOB_RECURSE scripts_Nexus Northrend/Nexus/Nexus/*.cpp Northrend/Nexus/Nexus/*.h)
file(GLOB_RECURSE scripts_Oculus Northrend/Nexus/Oculus/*.cpp Northrend/Nexus/Oculus/*.h)
file(GLOB_RECURSE scripts_HallsOfLightning Northrend/Ulduar/HallsOfLightning/*.cpp Northrend/Ulduar/HallsOfLightning/*.h)
file(GLOB_RECURSE scripts_HallsOfStone Northrend/Ulduar/HallsOfStone/*.cpp Northrend/Ulduar/HallsOfStone/*.h)
file(GLOB_RECURSE scripts_Ulduar Northrend/Ulduar/Ulduar/*.cpp Northrend/Ulduar/Ulduar/*.h)
file(GLOB_RECURSE scripts_UtgardeKeep Northrend/UtgardeKeep/UtgardeKeep/*.cpp Northrend/UtgardeKeep/UtgardeKeep/*.h)
file(GLOB_RECURSE scripts_UtgardePinnacle Northrend/UtgardeKeep/UtgardePinnacle/*.cpp Northrend/UtgardeKeep/UtgardePinnacle/*.h)
file(GLOB_RECURSE scripts_VaultOfArchavon Northrend/VaultOfArchavon/*.cpp Northrend/VaultOfArchavon/*.h)
file(GLOB_RECURSE scripts_VioletHold Northrend/VioletHold/*.cpp Northrend/VioletHold/*.h)
file(GLOB_RECURSE scripts_Northrend Northrend/*.cpp Northrend/*.h)


source_group(Northrend\\AzjolNerub\\Ahnkahet FILES ${scripts_Ahnkahet})
source_group(Northrend\\AzjolNerub\\AzjolNerub FILES ${scripts_AzjolNerub})
source_group(Northrend\\ChamberOfAspects\\ObsidianSanctum FILES ${scripts_ObsidianSanctum})
source_group(Northrend\\ChamberOfAspects\\RubySanctum FILES ${scripts_RubySanctum})
source_group(Northrend\\CrusadersColiseum\\TrialOfTheChampion FILES ${scripts_TrialOfTheChampion})
source_group(Northrend\\CrusadersColiseum\\TrialOfTheCrusader FILES ${scripts_TrialOfTheCrusader})
source_group(Northrend\\DraktharonKeep FILES ${scripts_DraktharonKeep})
source_group(Northrend\\FrozenHalls\\ForgeOfSouls FILES ${scripts_ForgeOfSouls})
source_group(Northrend\\FrozenHalls\\HallsOfReflection FILES ${scripts_HallsOfReflection})
source_group(Northrend\\FrozenHalls\\PitOfSaron FILES ${scripts_PitOfSaron})
source_group(Northrend\\Gundrak FILES ${scripts_Gundrak})
source_group(Northrend\\IcecrownCitadel FILES ${scripts_IcecrownCitadel})
source_group(Northrend\\Naxxramas FILES ${scripts_Naxxramas})
source_group(Northrend\\Nexus\\EyeOfEternity FILES ${scripts_EyeOfEternity})
source_group(Northrend\\Nexus\\Nexus FILES ${scripts_Nexus})
source_group(Northrend\\Nexus\\Oculus FILES ${scripts_Oculus})
source_group(Northrend\\Ulduar\\HallsOfLightning FILES ${scripts_HallsOfLightning})
source_group(Northrend\\Ulduar\\HallsOfStone FILES ${scripts_HallsOfStone})
source_group(Northrend\\Ulduar\\Ulduar FILES ${scripts_Ulduar})
source_group(Northrend\\UtgardeKeep\\UtgardeKeep FILES ${scripts_UtgardeKeep})
source_group(Northrend\\UtgardeKeep\\UtgardePinnacle FILES ${scripts_UtgardePinnacle})
source_group(Northrend\\VaultOfArchavon FILES ${scripts_VaultOfArchavon})
source_group(Northrend\\VioletHold FILES ${scripts_VioletHold})
source_group(Northrend\\Zones FILES ${scripts_Northrend})


set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  ${scripts_Ahnkahet}
  ${scripts_AzjolNerub}
  ${scripts_ObsidianSanctum}
  ${scripts_RubySanctum}
  ${scripts_TrialOfTheChampion}
  ${scripts_TrialOfTheCrusader}  
  ${scripts_DraktharonKeep}  
  ${scripts_ForgeOfSouls}
  ${scripts_HallsOfReflection}
  ${scripts_PitOfSaron}  
  ${scripts_Gundrak}  
  ${scripts_IcecrownCitadel}  
  ${scripts_Naxxramas}  
  ${scripts_EyeOfEternity}
  ${scripts_Nexus}
  ${scripts_Oculus}  
  ${scripts_HallsOfLightning}
  ${scripts_HallsOfStone}
  ${scripts_Ulduar}  
  ${scripts_UtgardeKeep}
  ${scripts_UtgardePinnacle}  
  ${scripts_VaultOfArchavon}  
  ${scripts_VioletHold}  
  ${scripts_Northrend}
)
message("  -> Prepared: Northrend")
