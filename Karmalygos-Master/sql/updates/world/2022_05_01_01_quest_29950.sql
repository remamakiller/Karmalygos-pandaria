UPDATE `creature_template` SET `ScriptName` = 'npc_day_off_li_li' WHERE `entry` = 56549;

DELETE FROM `creature_text` WHERE `Entry`=56549;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `text`, `text_female`, `textrange`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `comment`) VALUES 
(56549, 0, 0, 'Check out all the cool silk!', '', 0, 12, 0, 100, 0, 0, 0, 55565, ''),
(56549, 1, 0, 'Look at this!', '', 0, 12, 0, 100, 0, 0, 0, 61630, ''),
(56549, 2, 0, 'Hey! Look at the waterfall!', '', 0, 12, 0, 100, 0, 0, 0, 0,'');

DELETE FROM `spell_script_names` WHERE `spell_id`=106276;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (106276, 'spell_summon_li_li');