UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 3, `AIName` = 'SmartAI' WHERE `entry` = 55368;

DELETE FROM `creature_template` WHERE `entry` IN (55380);
INSERT INTO `creature_template`(`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `VignetteID`, `TrackingQuestID`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(55380, 0, 0, 0, 0, 0, 0, 0, 43669, 43256, 0, 0, 'Estatua de jade sospechosa', NULL, 'Inspect', 0, 90, 90, 4, 0, 35, 35, 1, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 18414);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (55381, 55380);
INSERT INTO `smart_scripts`(`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55381, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 55381, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak'),
(55381, 0, 1, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 55381, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak'),
(55380, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 55380, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak');


DELETE FROM `creature` WHERE `guid` IN (582664);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(582664, 55380, 870, 0, 0, 1, 67108865, 0, 0, 1514.21, -1275.23, 246.188, 3.33544, 300, 0, 0, 0, 393941, 0, 0, 0, 0, 0, 0, 0);




UPDATE `creature_template` SET `npcflag` = 1, `AIName` = 'SmartAI' WHERE `entry` = 55378;