-- Thomas Miller
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 3518;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 3518 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3518, 0, 0, 0, 1, 0, 100, 0, 0, 0, 180000, 180000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Thomas Miller - Out Of Combat - Say Text Line 0");

DELETE FROM `creature_text` WHERE `entry` = 3518;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3518, 0, 0, "Freshly baked bread for sale!", "", 0, 12, 7, 100, 0, 0, 0, "Thomas Miller"),
(3518, 0, 1, "Fresh bread for sale!", "", 0, 12, 7, 100, 0, 0, 0, "Thomas Miller"),
(3518, 0, 2, "Warm, wholesome bread!", "", 0, 12, 7, 100, 0, 0, 0, "Thomas Miller"),
(3518, 0, 3, "Rolls, buns and bread. Baked fresh!", "", 0, 12, 7, 100, 0, 0, 0, "Thomas Miller");

DELETE FROM `creature_template_addon` WHERE `entry` = 3518;
DELETE FROM `creature_addon` WHERE `guid` = 188779;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES
(188779, 188779, 257);

UPDATE `creature` SET `position_x` = -8831.28, `position_y` = 543.109, `position_z` = 96.8344 WHERE `guid` = 188779 AND `id` = 3518;

DELETE FROM `waypoint_data` WHERE `id` = 188779;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(188779, 1, -8831.28, 543.109, 96.8344, 1000),
(188779, 2, -8823.8, 554.302, 95.1343, 0),
(188779, 3, -8816.18, 563.58, 94.1516, 0),
(188779, 4, -8812.27, 575.284, 94.8673, 0),
(188779, 5, -8798.45, 588.131, 97.2749, 0),
(188779, 6, -8781.38, 601.002, 97.395, 0),
(188779, 7, -8770.7, 609.208, 97.2416, 0),
(188779, 8, -8761.96, 617.745, 99.1796, 0),
(188779, 9, -8757.63, 628.577, 102.216, 0),
(188779, 10, -8759.15, 642.457, 103.654, 0),
(188779, 11, -8770.64, 661.869, 103.528, 0),
(188779, 12, -8787.04, 680.217, 102.245, 0),
(188779, 13, -8804.12, 683.305, 100.683, 0),
(188779, 14, -8815.72, 680.448, 98.2183, 0),
(188779, 15, -8831.55, 674.228, 98.3358, 0),
(188779, 16, -8843.12, 667.22, 97.8051, 0),
(188779, 17, -8852.2, 659.229, 96.9603, 0),
(188779, 18, -8841.74, 637.862, 95.1661, 0),
(188779, 19, -8834.06, 634.756, 94.3203, 0),
(188779, 20, -8817.96, 641.332, 94.2293, 0),
(188779, 21, -8811.88, 634.469, 94.2293, 0),
(188779, 22, -8813.45, 625.373, 94.1306, 0),
(188779, 23, -8827.66, 620.367, 94.2332, 0),
(188779, 24, -8846.61, 601.6, 92.6069, 0),
(188779, 25, -8859.18, 589.015, 92.709, 0),
(188779, 26, -8874.99, 572.27, 93.4734, 0),
(188779, 27, -8883.26, 572.174, 92.8046, 0),
(188779, 28, -8886.9, 579.094, 92.9168, 0),
(188779, 29, -8889.38, 585.29, 93.3191, 0),
(188779, 30, -8869.45, 596.649, 92.4409, 0),
(188779, 31, -8860.44, 601.856, 92.161, 0),
(188779, 32, -8847.27, 610.523, 92.6533, 0),
(188779, 33, -8837.06, 617.396, 93.0252, 0),
(188779, 34, -8834.75, 618.401, 93.3229, 0),
(188779, 35, -8827.87, 621.207, 94.1001, 0),
(188779, 36, -8809.26, 603.528, 96.2749, 0),
(188779, 37, -8806.62, 593.729, 97.1852, 0),
(188779, 38, -8820.32, 573.328, 94.1915, 0),
(188779, 39, -8830.69, 558.865, 94.8851, 0),
(188779, 40, -8834.06, 549.867, 96.194, 0);
