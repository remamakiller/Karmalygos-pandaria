/* Fix quest line The Amphitheater of Anguish:
12932
12933
12934
12935
12936
12948
*/

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` in (30014,30007,30017,30019,30020,30023,30022);
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_vladof_the_butcher' WHERE `entry`= 30022;


DELETE FROM `script_waypoint` WHERE `entry`=30023;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30023, 1, 5722.56, -2960.69, 286.276, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30023, 2, 5734.7, -2984.99, 286.276, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30023, 3, 5737.4, -2991.31, 282.575, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30023, 4, 5740.42, -2997.54, 277.263, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30023, 5, 5743.79, -3004.05, 273.57, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30023, 6, 5764.24, -2993.79, 272.944, '');

DELETE FROM `script_waypoint` WHERE `entry`=30017;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 1, 5790.98, -2927.3, 286.277, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 2, 5803, -2953, 286.277, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 3, 5805.18, -2958.51, 282.899, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 4, 5807.04, -2961.45, 280.25, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 5, 5808.86, -2965.14, 277.089, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 6, 5811.7, -2970.82, 273.569, '');
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES (30017, 7, 5789.98, -2980.25, 273.584, '');


DELETE FROM `creature_text` WHERE `Entry`=30017;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES 
(30017, 0, 0, 'Stinkbeard comin\' for you, little ones!', 14, 0, 100, 0, 0, 0, 30688, 0, ''),
(30017, 1, 0,                      '%s becomes enraged!',  2, 0, 100, 0, 0, 0, 24144, 0, 'combat Enrage');

DELETE FROM `creature_template_addon` WHERE `entry`=30022; -- causa crash
-- INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (30022, 0, 0, 0, 1, 0, '50689');


DELETE FROM `creature_queststarter` WHERE `id`=30007 AND `quest`=12954;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (30007, 12954);
DELETE FROM `creature_questender` WHERE `id`=30009 AND `quest`=12954;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (30009, 12954);
