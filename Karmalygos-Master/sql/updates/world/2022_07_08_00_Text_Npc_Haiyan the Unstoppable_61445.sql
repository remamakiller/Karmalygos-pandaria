/* Haiyan the Unstoppable */
DELETE FROM creature_text WHERE  `entry` = 61445;
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(61445, 0, 0, 'Clan Kargesh will demonstrate why only the strong deserve to stand at our King\'s side!', 14, 0, 0, 15, 0, 28246, 'Haiyan the Unstoppable intro'),
(61445, 1, 0, 'Impossible! Our might is the greatest in all the empire!', 14, 0, 0, 0, 0, 28247, 'Haiyan retire'),
(61445, 2, 0, 'For Kargesh!', 14, 0, 0, 0, 0, 28256, 'Haiyan kill target'),
(61445, 3, 0, 'Clan Gurthan is right! Only the honorless Clan Harthak could bring in a lesser race to do their bidding. You must be traitors!', 14, 0, 0, 0, 0, 28254, 'Haiyan postcombat #1'),
(61445, 4, 0, 'The mogu cannot reclaim our rightful glory without our clan\'s strength!', 14, 0, 50, 0, 0, 28248, 'Haiyan idle #1'),
(61445, 4, 1, 'These pathetic clans are beneath you, my king. They sully the great legacy of our people!', 14, 0, 50, 0, 0, 28249, 'Haiyan idle #2'),
(61445, 5, 0, '|TInterfaceIconsspell_fire_fireball.blp:20|tHaiyan the Unstoppable begins casting |cFFFF0000|Hspell:120167|h[Conflagrate]|h|r!', 41, 0, 100, 15, 0, 0, 'Haiyan the Unstoppable'),
(61445, 6, 0, '|TInterfaceIconsspell_fire_meteorstorm.blp:20|tHaiyan the Unstoppable targets |cFFFF0000%t|r with a |cFFFF0000|Hspell:120195|h[Meteor]|h|r!', 41, 0, 100, 15, 0, 0, 'Haiyan the Unstoppable to Player');
