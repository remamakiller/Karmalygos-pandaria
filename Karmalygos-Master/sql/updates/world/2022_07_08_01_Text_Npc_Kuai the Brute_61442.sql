/* Kuai the Brute */
DELETE FROM creature_text WHERE  `entry` = 61442;
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(61442, 0, 0, 'Clan Gurthan will show our King and the rest of you power-hungry imposters why we are the rightful ones at his side!', 14, 0, 0, 15, 0, 27932, 'Kuai the Brute intro'),
(61442, 1, 0, 'We will never surrender our right to rule the destiny of our people!', 14, 0, 0, 0, 0, 27933, 'Kuai retire'),
(61442, 2, 0, 'The glory of Gurthan!', 14, 0, 0, 0, 0, 27942, 'Kuai kill target'),
(61442, 3, 0, 'Who allowed these outsiders inside our halls? Only Clan Harthak or Clan Kargesh would stoop to such treachery!', 14, 0, 0, 0, 0, 27940, 'Kuai postcombat #1'),
(61442, 4, 0, 'A well-scripted exchange; but we are not fooled. Your clans are clearly in league with one another. For the glory of our king, our empire, we will put you all down!', 14, 0, 0, 0, 0, 27941, 'Kuai postcombat #2'),
(61442, 5, 0, 'We are the greatest!', 14, 0, 50, 0, 0, 27934, 'Kuai idle #1'),
(61442, 5, 1, 'These other clans are nothing!', 14, 0, 50, 0, 0, 27935, 'Kuai idle #2'),
(61442, 6, 0, '|TInterfaceIconsspell_shaman_earthquake.blp:20|tKuai the Brute uses his |cFFFF0000|Hspell:119922|h[Shockwave]|h|r ability!', 41, 0, 100, 15, 0, 0, 'Kuai the Brute');
