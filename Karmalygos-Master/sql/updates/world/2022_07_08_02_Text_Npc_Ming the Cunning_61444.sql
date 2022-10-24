/* Ming the Cunning */
DELETE FROM creature_text WHERE  `entry` = 61444;
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(61444, 0, 0, 'Clan Harthak will show all why they are the truest of mogu!', 14, 0, 0, 15, 0, 27947, 'Ming the Cunning intro'),
(61444, 1, 0, 'Our clan is the true clan! No interloper can change that!', 14, 0, 0, 0, 0, 27948, 'Ming retire'),
(61444, 2, 0, 'This is the might of Harthak.', 14, 0, 0, 0, 0, 27957, 'Ming kill target'),
(61444, 3, 0, 'Only the dogs of Clan Gurthan would point fingers at others for their own failures! Your clan is the most desperate. It must\'ve been you!', 14, 0, 0, 0, 0, 27955, 'Ming postcombat #1'),
(61444, 4, 0, 'Our clan holds true to the ways set forth by the ancients. We deserve the king\'s favor above all others!', 14, 0, 50, 0, 0, 27950, 'Ming idle #1'),
(61444, 4, 1, 'These other clans aren\'t worthy of your time, great king!', 14, 0, 50, 0, 0, 27949, 'Ming idle #2'),
(61444, 5, 0, '|TInterfaceIconsinv_elemental_primal_air.blp:20|tMing the Cunning summons a |cFFFF0000|Hspell:119981|h[Whirling Dervish]|h|r!', 41, 0, 100, 15, 0, 0, 'Ming the Cunning'),
(61444, 6, 0, '|TInterfaceIconsspell_druid_ursolsvortex.blp:20|tMing the Cunning creates a |cFFFF0000|Hspell:120100|h[Magnetic Field]|h|r!', 41, 0, 100, 15, 0, 0, 'Ming the cunning magnetic field');
