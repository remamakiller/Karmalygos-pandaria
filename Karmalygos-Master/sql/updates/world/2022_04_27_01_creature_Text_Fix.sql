/*SQL_SCRIPT SCARFACE*/
/*23.4.2022*/

/*Text for Creature(Stormwind Infantry) Entry 49869*/
delete from `creature_text` where `entry` = '49869';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(49869, 0, 0, 'I need a heal!', '', 0, 12, 0, 100, 0, 0, 0, 49898, 'Infanterist'),
(49869, 0, 1, 'HELP!', '', 0, 12, 0, 100, 0, 0, 0, 49897, 'Infanterist'),
(49869, 0, 2, 'Make yourself useful and heal me!', '', 0, 12, 0, 100, 0, 0, 0, 49896, 'Infanterist'),
(49869, 0, 3, 'I could use a heal, brother!', '', 0, 12, 0, 100, 0, 0, 0, 49895, 'Infanterist');

/*Text for Creature(Blackrock Invader) Entry 42937*/
delete from `creature_text` where `entry` = '42937';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(42937, 0, 0, 'Orc KILL human!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 1, 'Blackrock take forest!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 2, 'The grapes were VERY TASTY!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 3, 'Eat you!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 4, 'Beg for life!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text');

/*Text for Creature(Blackrock Spy) Entry 49874*/
delete from `creature_text` where `entry` = '49874';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(49874, 0, 0, 'Orc KILL human!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(49874, 0, 1, 'Blackrock take forest!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(49874, 0, 2, 'The grapes were VERY TASTY!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text');

/*Text for Creature(Scarlet Warrior) Entry 1535*/
delete from `creature_text` where `entry` = '1535';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(1535, 0, 0, 'The light condemns all who harbor evil. Now you will die!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(1535, 0, 1, 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(1535, 0, 2, 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(1535, 1, 0, '%s attempts to run away in fear!', '', 0, 16, 0, 100, 0, 0, 0, 0, 'combat Flee');

