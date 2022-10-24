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


file(GLOB_RECURSE scripts_GateOfTheSettingSun Pandaria/GateOfTheSettingSun/*.cpp Pandaria/GateOfTheSettingSun/*.h)
file(GLOB_RECURSE scripts_HeartOfFear Pandaria/HeartOfFear/*.cpp Pandaria/HeartOfFear/*.h)
file(GLOB_RECURSE scripts_MogushanPalace Pandaria/MogushanPalace/*.cpp Pandaria/MogushanPalace/*.h)
file(GLOB_RECURSE scripts_MogushanVault Pandaria/MogushanVault/*.cpp Pandaria/MogushanVault/*.h)
file(GLOB_RECURSE scripts_ShadopanMonastery Pandaria/ShadopanMonastery/*.cpp Pandaria/ShadopanMonastery/*.h)
file(GLOB_RECURSE scripts_SiegeOfNiuzaoTemple Pandaria/SiegeOfNiuzaoTemple/*.cpp Pandaria/SiegeOfNiuzaoTemple/*.h)
file(GLOB_RECURSE scripts_SiegeOfOrgrimmar Pandaria/SiegeOfOrgrimmar/*.cpp Pandaria/SiegeOfOrgrimmar/*.h)
file(GLOB_RECURSE scripts_StormstoutBrewery Pandaria/StormstoutBrewery/*.cpp Pandaria/StormstoutBrewery/*.h)
file(GLOB_RECURSE scripts_TempleOfTheJadeSerpent Pandaria/TempleOfTheJadeSerpent/*.cpp Pandaria/TempleOfTheJadeSerpent/*.h)
file(GLOB_RECURSE scripts_TerraceOfEndlessSpring Pandaria/TerraceOfEndlessSpring/*.cpp Pandaria/TerraceOfEndlessSpring/*.h)
file(GLOB_RECURSE scripts_ThroneOfThunder Pandaria/ThroneOfThunder/*.cpp Pandaria/ThroneOfThunder/*.h)
file(GLOB_RECURSE scripts_TimelessIsle Pandaria/TimelessIsle/*.cpp Pandaria/TimelessIsle/*.h)
file(GLOB_RECURSE scripts_WanderingIsland Pandaria/WanderingIsland/*.cpp Pandaria/WanderingIsland/*.h)

file(GLOB_RECURSE scripts_Scenarios_ArenaOfAnnihiliation Pandaria/Scenarios/ArenaOfAnnihiliation/*.cpp Pandaria/Scenarios/ArenaOfAnnihiliation/*.h)
file(GLOB_RECURSE scripts_Scenarios_AssaultOnZanvess Pandaria/Scenarios/AssaultOnZanvess/*.cpp Pandaria/Scenarios/AssaultOnZanvess/*.h)
file(GLOB_RECURSE scripts_Scenarios_BattleOnTheHighSeas Pandaria/Scenarios/BattleOnTheHighSeas/*.cpp Pandaria/Scenarios/BattleOnTheHighSeas/*.h)
file(GLOB_RECURSE scripts_Scenarios_BloodInTheSnow Pandaria/Scenarios/BloodInTheSnow/*.cpp Pandaria/Scenarios/BloodInTheSnow/*.h)
file(GLOB_RECURSE scripts_Scenarios_BrewingStorm Pandaria/Scenarios/BrewingStorm/*.cpp Pandaria/Scenarios/BrewingStorm/*.h)
file(GLOB_RECURSE scripts_Scenarios_BrewmoonFestival Pandaria/Scenarios/BrewmoonFestival/*.cpp Pandaria/Scenarios/BrewmoonFestival/*.h)
file(GLOB_RECURSE scripts_Scenarios_CryptOfForgottenKings Pandaria/Scenarios/CryptOfForgottenKings/*.cpp Pandaria/Scenarios/CryptOfForgottenKings/*.h)
file(GLOB_RECURSE scripts_Scenarios_DaggerInTheDark Pandaria/Scenarios/DaggerInTheDark/*.cpp Pandaria/Scenarios/DaggerInTheDark/*.h)
file(GLOB_RECURSE scripts_Scenarios_DarkHeartOfPandaria Pandaria/Scenarios/DarkHeartOfPandaria/*.cpp Pandaria/Scenarios/DarkHeartOfPandaria/*.h)
file(GLOB_RECURSE scripts_Scenarios_FallOfTheramoreAlliance Pandaria/Scenarios/FallOfTheramoreAlliance/*.cpp Pandaria/Scenarios/FallOfTheramoreAlliance/*.h)
file(GLOB_RECURSE scripts_Scenarios_FallOfTheramoreHorde Pandaria/Scenarios/FallOfTheramoreHorde/*.cpp Pandaria/Scenarios/FallOfTheramoreHorde/*.h)
file(GLOB_RECURSE scripts_Scenarios_GreenstoneVillage Pandaria/Scenarios/GreenstoneVillage/*.cpp Pandaria/Scenarios/GreenstoneVillage/*.h)
file(GLOB_RECURSE scripts_Scenarios_IsleOfThunder Pandaria/Scenarios/IsleOfThunder/*.cpp Pandaria/Scenarios/IsleOfThunder/*.h)
file(GLOB_RECURSE scripts_Scenarios_LittlePatience Pandaria/Scenarios/LittlePatience/*.cpp Pandaria/Scenarios/LittlePatience/*.h)
file(GLOB_RECURSE scripts_Scenarios_ProvingGrounds Pandaria/Scenarios/ProvingGrounds/*.cpp Pandaria/Scenarios/ProvingGrounds/*.h)
file(GLOB_RECURSE scripts_Scenarios_SecretIngridient Pandaria/Scenarios/SecretIngridient/*.cpp Pandaria/Scenarios/SecretIngridient/*.h)
file(GLOB_RECURSE scripts_Scenarios_SecretsOfRagefire Pandaria/Scenarios/SecretsOfRagefire/*.cpp Pandaria/Scenarios/SecretsOfRagefire/*.h)
file(GLOB_RECURSE scripts_Scenarios_UngaIngoo Pandaria/Scenarios/UngaIngoo/*.cpp Pandaria/Scenarios/UngaIngoo/*.h)

file(GLOB_RECURSE scripts_WorldBosses Pandaria/WorldBosses/*.cpp Pandaria/WorldBosses/*.h)
file(GLOB_RECURSE scripts_Zones Pandaria/*.cpp Pandaria/*.h)


source_group(Pandaria\\GateOfTheSettingSun FILES ${scripts_GateOfTheSettingSun})
source_group(Pandaria\\HeartOfFear FILES ${scripts_HeartOfFear})
source_group(Pandaria\\MogushanPalace FILES ${scripts_MogushanPalace})
source_group(Pandaria\\MogushanVault FILES ${scripts_MogushanVault})
source_group(Pandaria\\ShadopanMonastery FILES ${scripts_ShadopanMonastery})
source_group(Pandaria\\SiegeOfNiuzaoTemple FILES ${scripts_SiegeOfNiuzaoTemple})
source_group(Pandaria\\SiegeOfOrgrimmar FILES ${scripts_SiegeOfOrgrimmar})
source_group(Pandaria\\StormstoutBrewery FILES ${scripts_StormstoutBrewery})
source_group(Pandaria\\TempleOfTheJadeSerpent FILES ${scripts_TempleOfTheJadeSerpent})
source_group(Pandaria\\TerraceOfEndlessSpring FILES ${scripts_TerraceOfEndlessSpring})
source_group(Pandaria\\ThroneOfThunder FILES ${scripts_ThroneOfThunder})
source_group(Pandaria\\TimelessIsle FILES ${scripts_TimelessIsle})
source_group(Pandaria\\WanderingIsland FILES ${scripts_WanderingIsland})

source_group(Pandaria\\Scenarios\\ArenaOfAnnihiliation FILES ${scripts_Scenarios_ArenaOfAnnihiliation})
source_group(Pandaria\\Scenarios\\AssaultOnZanvess FILES ${scripts_Scenarios_AssaultOnZanvess})
source_group(Pandaria\\Scenarios\\BattleOnTheHighSeas FILES ${scripts_Scenarios_BattleOnTheHighSeas})
source_group(Pandaria\\Scenarios\\BloodInTheSnow FILES ${scripts_Scenarios_BloodInTheSnow})
source_group(Pandaria\\Scenarios\\BrewingStorm FILES ${scripts_Scenarios_BrewingStorm})
source_group(Pandaria\\Scenarios\\BrewmoonFestival FILES ${scripts_Scenarios_BrewmoonFestival})
source_group(Pandaria\\Scenarios\\CryptOfForgottenKings FILES ${scripts_Scenarios_CryptOfForgottenKings})
source_group(Pandaria\\Scenarios\\DaggerInTheDark FILES ${scripts_Scenarios_DaggerInTheDark})
source_group(Pandaria\\Scenarios\\DarkHeartOfPandaria FILES ${scripts_Scenarios_DarkHeartOfPandaria})
source_group(Pandaria\\Scenarios\\FallOfTheramoreAlliance FILES ${scripts_Scenarios_FallOfTheramoreAlliance})
source_group(Pandaria\\Scenarios\\FallOfTheramoreHorde FILES ${scripts_Scenarios_FallOfTheramoreHorde})
source_group(Pandaria\\Scenarios\\GreenstoneVillage FILES ${scripts_Scenarios_GreenstoneVillage})
source_group(Pandaria\\Scenarios\\IsleOfThunder FILES ${scripts_Scenarios_IsleOfThunder})
source_group(Pandaria\\Scenarios\\LittlePatience FILES ${scripts_Scenarios_LittlePatience})
source_group(Pandaria\\Scenarios\\ProvingGrounds FILES ${scripts_Scenarios_ProvingGrounds})
source_group(Pandaria\\Scenarios\\SecretIngridient FILES ${scripts_Scenarios_SecretIngridient})
source_group(Pandaria\\Scenarios\\SecretsOfRagefire FILES ${scripts_Scenarios_SecretsOfRagefire})
source_group(Pandaria\\Scenarios\\UngaIngoo FILES ${scripts_Scenarios_UngaIngoo})

source_group(Pandaria\\WorldBosses FILES ${scripts_WorldBosses})
source_group(Pandaria\\Zones FILES ${scripts_Zones})


set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  ${scripts_WanderingIsland}  
  ${scripts_TimelessIsle}
  ${scripts_GateOfTheSettingSun}
  ${scripts_MogushanPalace}
  ${scripts_ShadopanMonastery}
  ${scripts_SiegeOfNiuzaoTemple}
  ${scripts_StormstoutBrewery}
  ${scripts_TempleOfTheJadeSerpent}
  ${scripts_HeartOfFear}
  ${scripts_MogushanVault}
  ${scripts_TerraceOfEndlessSpring}
  ${scripts_ThroneOfThunder}
  ${scripts_SiegeOfOrgrimmar}
  
  ${scripts_Scenarios_ArenaOfAnnihiliation}
  ${scripts_Scenarios_AssaultOnZanvess}
  ${scripts_Scenarios_BattleOnTheHighSeas}
  ${scripts_Scenarios_BloodInTheSnow}
  ${scripts_Scenarios_BrewingStorm}  
  ${scripts_Scenarios_BrewmoonFestival}
  ${scripts_Scenarios_CryptOfForgottenKings}
  ${scripts_Scenarios_DaggerInTheDark}
  ${scripts_Scenarios_DarkHeartOfPandaria}
  ${scripts_Scenarios_FallOfTheramoreAlliance}
  ${scripts_Scenarios_FallOfTheramoreHorde}
  ${scripts_Scenarios_GreenstoneVillage}
  ${scripts_Scenarios_IsleOfThunder}
  ${scripts_Scenarios_LittlePatience} 
  ${scripts_Scenarios_ProvingGrounds}
  ${scripts_Scenarios_SecretIngridient}
  ${scripts_Scenarios_SecretsOfRagefire}
  ${scripts_Scenarios_UngaIngoo}
  
  ${scripts_WorldBosses} 
  ${scripts_Zones} 
)
message("  -> Prepared: Pandaria")
