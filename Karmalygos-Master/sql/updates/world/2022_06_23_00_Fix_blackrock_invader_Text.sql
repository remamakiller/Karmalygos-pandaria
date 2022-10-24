UPDATE `creature_template` SET `ScriptName` = "npc_blackrock_invader" WHERE `entry` = 42937;
DELETE FROM `creature_text` WHERE `entry` = 42937;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(42937, 0, 0, "Orc KILL $r!", 12, 0, 50, 0, 0, 0, "Blackrock Invader"),
(42937, 0, 1, "Blackrock take forest!", 12, 0, 50, 0, 0, 0, "Blackrock Invader"),
(42937, 0, 2, "The grapes were VERY TASTY!", 12, 0, 50, 0, 0, 0, "Blackrock Invader"),
(42937, 0, 3, "Beg for life!", 12, 0, 50, 0, 0, 0, "Blackrock Invader"),
(42937, 0, 4, "Eat you!", 12, 0, 50, 0, 0, 0, "Blackrock Invader");