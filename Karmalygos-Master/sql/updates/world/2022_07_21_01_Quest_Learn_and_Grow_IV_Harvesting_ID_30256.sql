/*World of Warcraft Quest Guide Learn and Grow IV Harvesting  ID 30256*/

/*
NPC
59833-Ripe EZ-Gro Green Cabbage
59987-Parched EZ-Gro Green Cabbage
59991-Growing EZ-Gro Green Cabbage

Item
80314-EZ-Gro Green Cabbage
*/

UPDATE `creature_template` SET `npcflag` = 16777216 WHERE `entry` = 59833;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=59833;
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (59833, 115063, 1, 0);


-- Farmer Yoon SAI
SET @ENTRY := 58646;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,126987,0,0,0,33,64942,0,0,0,0,0,7,0,0,0,0,0,0,0,"On spellhit 126987 - kill credit 64942"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"On spellhit 126987 - talk 0"),
(@ENTRY,0,2,0,64,0,100,0,0,0,0,0,33,70454,0,0,0,0,0,17,0,100,0,0,0,0,0,"[Kill]OnSpeak"),
(@ENTRY,0,3,4,19,0,100,0,30254,0,0,0,33,59985,2,2,0,0,0,7,0,0,0,0,0,0,0,""),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,33,59990,2,2,0,0,0,7,0,0,0,0,0,0,0,""),
(@ENTRY,0,5,0,19,0,100,0,30255,0,0,0,12,59987,7,0,0,0,0,8,0,0,0,-161.232,637.367,165.409,0,"On Quest Accept Summon Green Cabbage"),
(@ENTRY,0,6,0,19,0,100,0,30255,0,0,0,12,59987,7,0,0,0,0,8,0,0,0,-161.734,641.861,165.409,0,"On Quest Accept Summon Green Cabbage"),
(@ENTRY,0,7,0,19,0,100,0,30256,0,0,0,12,59991,7,0,0,0,0,8,0,0,0,-161.232,637.367,165.409,0,"On Quest Accept Summon Green Cabbage"),
(@ENTRY,0,8,0,19,0,100,0,30256,0,0,0,12,59991,7,0,0,0,0,8,0,0,0,-161.734,641.861,165.409,0,"On Quest Accept Summon Green Cabbage"),
(@ENTRY,0,9,0,19,0,100,0,30256,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Quest Accept Talk Event"),
(@ENTRY,0,10,0,20,0,100,0,30256,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talk On Quest Reward");


-- Actionlist SAI
SET @ENTRY := 5864600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,1,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talk 1"),
(@ENTRY,9,1,0,1,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talk 2");


-- Growing EZ-Gro Green Cabbage SAI
SET @ENTRY := 59991;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,5000,5000,0,0,12,59833,2,20000,0,0,0,1,0,0,0,0,0,0,0,"Summon NPC 59833"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Despawn");


DELETE FROM `creature_text` WHERE `entry` IN (58646);
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(58646, 0, 0, 'Mmm, that\'s mighty tasty, $n. I wouldn\'t mind another round of that... or two... hic!', '', 0, 12, 0, 100, 0, 0, 0, 65913, ''),
(58646, 1, 0, 'Those cabbages should be ready any minute now... wait for it...', NULL, 0, 12, 0, 100, 0, 0, 0, 0, ''),
(58646, 2, 0, 'There we go! Ripe for the pickin\'s!', NULL, 0, 12, 0, 100, 0, 0, 0, 0, ''),
(58646, 3, 0, 'Just remember, real crops will take a day to grow, so after you\'ve tilled and cared for your plants, come back the next day to harvest your bounty!', NULL, 0, 12, 0, 100, 1, 0, 0, 0, '');

DELETE FROM `locales_creature_text` WHERE `entry` IN (58646);
INSERT INTO `locales_creature_text`(`entry`, `groupid`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`, `text_loc9`, `text_loc10`, `text_loc11`, `text_female_loc1`, `text_female_loc2`, `text_female_loc3`, `text_female_loc4`, `text_female_loc5`, `text_female_loc6`, `text_female_loc7`, `text_female_loc8`, `text_female_loc9`, `text_female_loc10`, `text_female_loc11`) VALUES 
(58646, 0, 0, '우와... $n 님, 맥주 맛이 정말 좋군요. 한 두잔 더 마셔도 괜찮겠... 딸꾹!', 'Hum, c\'est tout bonnement délicieux, $n. Je ne serais pas contre une autre petite tournée… ou trois… hic !', 'Mmm, das ist wirklich lecker, $n. Noch eine Runde davon wäre mir nicht unrecht... oder auch zwei... hick!', '嗯，口味太棒了，$n。我不会介意再来一杯……或两杯……嗝！', '哼嗯，這味道太棒了，$n。我不介意再多喝個一兩杯...嗝!', 'Mmm, qué sabor tan delicioso, $n. No me importaría probar otra ronda... o dos... ¡hic!', 'Mmm, qué sabor tan delicioso, $n. No me importaría probar otra ronda... o dos... ¡hic!', 'М-м, $n, просто божественный вкус. Я бы не отказался еще от кружечки... или двух... ик!', NULL, NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, NULL),
(58646, 1, 0, NULL, NULL, NULL, NULL, NULL, 'Esos repollos deben estar listos en cualquier minuto ahora... espera por él...', 'Esos repollos deben estar listos en cualquier minuto ahora... espera por él...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58646, 2, 0, NULL, NULL, NULL, NULL, NULL, '¡Allí los tienes! ¡Maduros para la cosecha!', '¡Allí los tienes! ¡Maduros para la cosecha!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58646, 3, 0, NULL, NULL, NULL, NULL, NULL, '¡Simplemente recuerde, las cosechas reales tomarán un día para crecer, para que después de que usted ha cultivado y ha querido sus plantas, regrese el próximo día para cosechar su recompensa!', '¡Simplemente recuerde, las cosechas reales tomarán un día para crecer, para que después de que usted ha cultivado y ha querido sus plantas, regrese el próximo día para cosechar su recompensa!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);




