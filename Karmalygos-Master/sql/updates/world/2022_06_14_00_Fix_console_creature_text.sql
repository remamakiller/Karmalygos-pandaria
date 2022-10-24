DELETE FROM `creature_text` WHERE `entry` IN (29506,32709,32714,32751,32718,19477,32713,32752,32720,32720,24198,62856);
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(29506, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Orland Schaeffer'),
(32709, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Hunaka Greenhoof'),
(32714, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Moon Priestess Nici'),
(32751, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Backbiter'),
(32718, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Disidra Stormglory'),
(19477, 1, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Fleeing Dreghood Warrior'),
(32713, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Juwanamana'),
(32752, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Tabitha'),
(32720, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Violetta'),
(24198, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Plagued Dragonflayer Rune-Caster'),
(62856, 0, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Beast');

DELETE FROM  `creature_text` WHERE `entry`= 19477 and `groupid` = 1;
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(19477, 1, 0, 'Hello again.', NULL, 0, 12, 0, 100, 3, 0, 0, 49455, 'Fleeing Dreghood Warrior');

DELETE FROM  `trinity_string` WHERE `entry`IN (12530,12529);
INSERT INTO `trinity_string`(`entry`, `BroadcastTextID`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `content_loc9`, `content_loc10`, `content_loc11`, `content_female`, `content_female_loc1`, `content_female_loc2`, `content_female_loc3`, `content_female_loc4`, `content_female_loc5`, `content_female_loc6`, `content_female_loc7`, `content_female_loc8`, `content_female_loc9`, `content_female_loc10`, `content_female_loc11`) VALUES 
(12530, 0, 'Karmalygos ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ?????? ??????? ????????? ??? ????????.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12529, 0, 'Karmalygos ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ?????? ??????? ????????? ??? ????????.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
