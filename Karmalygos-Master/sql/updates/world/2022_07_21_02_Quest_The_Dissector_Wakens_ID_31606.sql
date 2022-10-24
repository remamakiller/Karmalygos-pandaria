/*World of Warcraft Quest Guide The Dissector Wakens  ID 31606*/

/*

*/

/*Rik'kal*/
UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 65253;
UPDATE `creature_template_addon` SET `bytes1` = 8 WHERE `entry` = 65253;

UPDATE `creature` SET `position_x` = -1758, `position_y` = 4437.34, `position_z` = 36.4517, `orientation` = 1.57106 WHERE `guid` = 531736;

-- Rik'kal the Dissector SAI
SET @ENTRY := 65253;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,31606,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talk On Quest Accept 31606"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"ActionList On Link"),
(@ENTRY,0,2,0,38,0,100,0,0,1,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stand On Objective Complete"),
(@ENTRY,0,3,0,38,0,100,0,0,1,0,0,33,65253,0,0,0,0,0,7,0,0,0,0,0,0,0,"On Data Set Kill Credit"),
(@ENTRY,0,4,0,38,0,100,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Data Set Talk");

-- Actionlist SAI
SET @ENTRY := 6525300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,1,0,100,0,1000,1000,0,0,12,65273,6,0,0,0,0,8,0,0,0,-1792.39,4455.97,37.007,0,"Summon NPC 65273 On 1s"),
(@ENTRY,9,1,0,1,0,100,0,10000,10000,0,0,12,65273,6,0,0,0,0,8,0,0,0,-1792.39,4455.97,37.007,0,"Summon NPC 65273 On 10s"),
(@ENTRY,9,2,0,1,0,100,0,20000,20000,0,0,12,65274,6,0,0,0,0,8,0,0,0,-1792.39,4455.97,37.007,0,"Summon NPC 65273 On 20s");


/*Rik'kal the Dissector Text*/
DELETE FROM creature_text WHERE entry IN (65253);
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(65253, 0, 0, 'Hold off the Zan\'thik while Rik\'kal the Dissector gathers his strength.', NULL, 0, 41, 0, 100, 0, 0, 0, 0, ''),
(65253, 1, 0, 'My strength returns. Speak to me, Wakener, before I report to the Klaxxi.', NULL, 0, 12, 0, 100, 0, 0, 0, 0, '');

DELETE FROM `locales_creature_text` WHERE `entry` IN (65253);
INSERT INTO `locales_creature_text`(`entry`, `groupid`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`, `text_loc9`, `text_loc10`, `text_loc11`, `text_female_loc1`, `text_female_loc2`, `text_female_loc3`, `text_female_loc4`, `text_female_loc5`, `text_female_loc6`, `text_female_loc7`, `text_female_loc8`, `text_female_loc9`, `text_female_loc10`, `text_female_loc11`) VALUES 
(65253, 0, 0, NULL, NULL, NULL, NULL, NULL, 'Rechace los Zan\'thik mientras Rik\'kal el Dissector recupera sus fuerzas.', 'Rechace los Zan\'thik mientras Rik\'kal el Dissector recupera sus fuerzas.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65253, 1, 0, NULL, NULL, NULL, NULL, NULL, 'Mi fuerza vuelve. Hábleme, Wakener, antes de que yo informe al Klaxxi.', 'Mi fuerza vuelve. Hábleme, Wakener, antes de que yo informe al Klaxxi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- Zan'thik Manipulator SAI
SET @ENTRY := 65274;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,65253,50,0,0,0,0,0,"On Dead Kill Credit"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,53,1,65274,0,0,0,2,1,0,0,0,0,0,0,0,"Move to Fight on Summon");

DELETE FROM `waypoints` WHERE `entry` IN (65274);
INSERT INTO `waypoints`(`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(65274, 1, -1778.72, 4454.7, 36.99, NULL),
(65274, 2, -1766.34, 4452.21, 37, NULL),
(65274, 3, -1758.13, 4440.59, 36.27, NULL);


-- Zan'thik Impaler SAI
SET @ENTRY := 65273;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,65273,0,0,0,2,1,0,0,0,0,0,0,0,"Move to Fight on Summon");

DELETE FROM `waypoints` WHERE `entry` IN (65273);
INSERT INTO `waypoints`(`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(65273, 1, -1778.72, 4454.7, 36.99, NULL),
(65273, 2, -1766.34, 4452.21, 37, NULL),
(65273, 3, -1758.13, 4440.59, 36.27, NULL);


/*Worker Dead Cosmetic*/
UPDATE `creature` SET `unit_flags` = 774 WHERE `guid` = 531775;
UPDATE `creature` SET `unit_flags` = 774 WHERE `guid` = 531776;

UPDATE `creature` SET `dynamicflags` = 96 WHERE `guid` = 531775;
UPDATE `creature` SET `dynamicflags` = 96 WHERE `guid` = 531776;

DELETE FROM `creature_addon` WHERE `guid` IN (531775,531776);
INSERT INTO `creature_addon`(`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (531775, 0, 0, 7, 0, 65, NULL);
INSERT INTO `creature_addon`(`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (531776, 0, 0, 7, 0, 65, NULL);

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 531775;
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 531776;

UPDATE `creature` SET `spawndist` = 0 WHERE `guid` = 531775;
UPDATE `creature` SET `spawndist` = 0 WHERE `guid` = 531776;

DELETE FROM `creature` WHERE `guid` IN (531777,531778,531779,531780,531781,531782);

/*
Spawn en DB puede haberlo captado por el sniff de un spawn temporal.
NPC que deberian ser spawn temporal de una quest.
*/
/*
DELETE FROM creature WHERE guid IN (531777,531778,531779,531780,531781,531782);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `ScriptName`) VALUES 
(531777, 65273, 870, 6138, 6446, 1, 1, 0, 0, -1752.94, 4435.67, 37.9801, 5.75068, 300, 0, 7.786, 0, 1, 0, 1, 0, 0, 0, 0, 0, ''),
(531778, 65273, 870, 6138, 6446, 1, 1, 0, 0, -1758.44, 4435.37, 36.9444, 4.5599, 300, 0, 7.786, 0, 1, 0, 1, 0, 0, 0, 0, 0, ''),
(531779, 65274, 870, 6138, 6446, 1, 1, 0, 0, -1759.59, 4436.77, 37.1425, 1.87622, 300, 0, 7.786, 0, 1, 0, 1, 0, 0, 0, 0, 0, ''),
(531780, 65273, 870, 6138, 6446, 1, 1, 0, 0, -1761.94, 4451.29, 38.5782, 0.299666, 300, 0, 7.786, 0, 1, 0, 1, 0, 0, 0, 0, 0, ''),
(531781, 65273, 870, 6138, 6446, 1, 1, 0, 0, -1758.33, 4442.26, 36.6916, 3.48711, 300, 0, 7.786, 0, 1, 0, 1, 0, 0, 0, 0, 0, ''),
(531782, 65274, 870, 6138, 6446, 1, 1, 0, 0, -1762.67, 4436.18, 37.6136, 0.103591, 300, 0, 7.786, 0, 1, 0, 1, 0, 0, 0, 0, 0, '');
*/

