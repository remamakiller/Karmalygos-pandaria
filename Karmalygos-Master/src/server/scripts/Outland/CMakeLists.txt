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

file(GLOB_RECURSE scripts_AuchenaiCrypts Outland/Auchindoun/AuchenaiCrypts/*.cpp Outland/Auchindoun/AuchenaiCrypts/*.h)
file(GLOB_RECURSE scripts_ManaTombs Outland/Auchindoun/ManaTombs/*.cpp Outland/Auchindoun/ManaTombs/*.h)
file(GLOB_RECURSE scripts_SethekkHalls Outland/Auchindoun/SethekkHalls/*.cpp Outland/Auchindoun/SethekkHalls/*.h)
file(GLOB_RECURSE scripts_ShadowLabyrinth Outland/Auchindoun/ShadowLabyrinth/*.cpp Outland/Auchindoun/ShadowLabyrinth/*.h)
file(GLOB_RECURSE scripts_BlackTemple Outland/BlackTemple/*.cpp Outland/BlackTemple/*.h)
file(GLOB_RECURSE scripts_SerpentShrine Outland/CoilfangReservoir/SerpentShrine/*.cpp Outland/CoilfangReservoir/SerpentShrine/*.h)
file(GLOB_RECURSE scripts_SteamVault Outland/CoilfangReservoir/SteamVault/*.cpp Outland/CoilfangReservoir/SteamVault/*.h)
file(GLOB_RECURSE scripts_TheSlavePens Outland/CoilfangReservoir/TheSlavePens/*.cpp Outland/CoilfangReservoir/TheSlavePens/*.h)
file(GLOB_RECURSE scripts_TheUnderbog Outland/CoilfangReservoir/TheUnderbog/*.cpp Outland/CoilfangReservoir/TheUnderbog/*.h)
file(GLOB_RECURSE scripts_GruulsLair Outland/GruulsLair/*.cpp Outland/GruulsLair/*.h)
file(GLOB_RECURSE scripts_BloodFurnace Outland/HellfireCitadel/BloodFurnace/*.cpp Outland/HellfireCitadel/BloodFurnace/*.h)
file(GLOB_RECURSE scripts_HellfireRamparts Outland/HellfireCitadel/HellfireRamparts/*.cpp Outland/HellfireCitadel/HellfireRamparts/*.h)
file(GLOB_RECURSE scripts_MagtheridonsLair Outland/HellfireCitadel/MagtheridonsLair/*.cpp Outland/HellfireCitadel/MagtheridonsLair/*.h)
file(GLOB_RECURSE scripts_ShatteredHalls Outland/HellfireCitadel/ShatteredHalls/*.cpp Outland/HellfireCitadel/ShatteredHalls/*.h)
file(GLOB_RECURSE scripts_Arcatraz Outland/TempestKeep/Arcatraz/*.cpp Outland/TempestKeep/Arcatraz/*.h)
file(GLOB_RECURSE scripts_Botanica Outland/TempestKeep/Botanica/*.cpp Outland/TempestKeep/Botanica/*.h)
file(GLOB_RECURSE scripts_Eye Outland/TempestKeep/Eye/*.cpp Outland/TempestKeep/Eye/*.h)
file(GLOB_RECURSE scripts_Mechanar Outland/TempestKeep/Mechanar/*.cpp Outland/TempestKeep/Mechanar/*.h)
file(GLOB_RECURSE scripts_WorldBosses Outland/WorldBosses/*.cpp Outland/WorldBosses/*.h)
file(GLOB_RECURSE scripts_Zones Outland/*.cpp Outland/*.h)


source_group(Outland\\Auchindoun\\AuchenaiCrypts FILES ${scripts_AuchenaiCrypts})
source_group(Outland\\Auchindoun\\ManaTombs FILES ${scripts_ManaTombs})
source_group(Outland\\Auchindoun\\SethekkHalls FILES ${scripts_SethekkHalls})
source_group(Outland\\Auchindoun\\ShadowLabyrinth FILES ${scripts_ShadowLabyrinth})
source_group(Outland\\BlackTemple FILES ${scripts_BlackTemple})
source_group(Outland\\CoilfangReservoir\\SerpentShrine FILES ${scripts_SerpentShrine})
source_group(Outland\\CoilfangReservoir\\SteamVault FILES ${scripts_SteamVault})
source_group(Outland\\CoilfangReservoir\\TheSlavePens FILES ${scripts_TheSlavePens})
source_group(Outland\\CoilfangReservoir\\TheUnderbog FILES ${scripts_TheUnderbog})
source_group(Outland\\GruulsLair FILES ${scripts_GruulsLair})
source_group(Outland\\HellfireCitadel\\BloodFurnace FILES ${scripts_BloodFurnace})
source_group(Outland\\HellfireCitadel\\HellfireRamparts FILES ${scripts_HellfireRamparts})
source_group(Outland\\HellfireCitadel\\MagtheridonsLair FILES ${scripts_MagtheridonsLair})
source_group(Outland\\HellfireCitadel\\ShatteredHalls FILES ${scripts_ShatteredHalls})
source_group(Outland\\TempestKeep\\Arcatraz FILES ${scripts_Arcatraz})
source_group(Outland\\TempestKeep\\Botanica FILES ${scripts_Botanica})
source_group(Outland\\TempestKeep\\Eye FILES ${scripts_Eye})
source_group(Outland\\TempestKeep\\Mechanar FILES ${scripts_Mechanar})
source_group(Outland\\WorldBosses FILES ${scripts_WorldBosses})
source_group(Outland\\Zones FILES ${scripts_Zones})


set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  ${scripts_AuchenaiCrypts}
  ${scripts_ManaTombs}
  ${scripts_SethekkHalls}
  ${scripts_ShadowLabyrinth}
  ${scripts_BlackTemple}
  ${scripts_SerpentShrine}
  ${scripts_SteamVault}
  ${scripts_TheSlavePens}
  ${scripts_TheUnderbog}  
  ${scripts_GruulsLair}  
  ${scripts_BloodFurnace}
  ${scripts_HellfireRamparts}
  ${scripts_MagtheridonsLair}
  ${scripts_ShatteredHalls}  
  ${scripts_Arcatraz}
  ${scripts_Botanica}
  ${scripts_Eye}
  ${scripts_Mechanar}  
  ${scripts_WorldBosses}
  ${scripts_Zones}
)

message("  -> Prepared: Outland")
