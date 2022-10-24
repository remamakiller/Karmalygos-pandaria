/* Thunderfoot Fields */

UPDATE `quest_template` SET `PrevQuestID` = 29907 WHERE `ID` = 29877; -- A Poor Grasp of the Basics
UPDATE `quest_template` SET `PrevQuestID` = 29909 WHERE `ID` = 30086; -- The Search for the Hidden Master
UPDATE `quest_template` SET `PrevQuestID` = 29909 WHERE `ID` = 29910; -- Rampaging Rodents
UPDATE `quest_template` SET `PrevQuestID` = 29912 WHERE `ID` = 29913; -- The Meat They'll Eat
UPDATE `quest_template` SET `PrevQuestID` = 29912 WHERE `ID` = 29914; -- Back to the Sty
UPDATE `quest_template` SET `PrevQuestID` = 29915 WHERE `ID` = 29916; -- Piercing Talons AND Slavering Jaws
UPDATE `quest_template` SET `PrevQuestID` = 29915 WHERE `ID` = 29917; -- Lupello
UPDATE `quest_template` SET `PrevQuestID` = 29917 WHERE `ID` = 29918; -- A Lesson in Bravery
UPDATE `quest_template` SET `NextQuestID` = 29913 WHERE `ID` = 29912; -- The Fabulous Miss Fanny
UPDATE `quest_template` SET `NextQuestID` = 29916 WHERE `ID` = 29915; -- A Neighbor's Duty
UPDATE `quest_template` SET `NextQuestID` = 29918 WHERE `ID` = 29916; -- Piercing Talons AND Slavering Jaws
UPDATE `quest_template` SET `NextQuestID` = 29918 WHERE `ID` = 29917; -- Lupello

/* Mudmug's Place */

UPDATE `quest_template` SET `PrevQuestID` = 29918 WHERE `ID` = 29919; -- Great Minds Drink Alike
UPDATE `quest_template` SET `PrevQuestID` = 29919 WHERE `ID` = 29944; -- Leaders Among Breeders
UPDATE `quest_template` SET `PrevQuestID` = 29919 WHERE `ID` = 29945; -- Yellow AND Red Make Orange
UPDATE `quest_template` SET `PrevQuestID` = 29944 WHERE `ID` = 29948; -- Thieves to the Core
UPDATE `quest_template` SET `PrevQuestID` = 29949 WHERE `ID` = 29951; -- Muddy Water
UPDATE `quest_template` SET `PrevQuestID` = 29950 WHERE `ID` = 29952; -- Broken Dreams
UPDATE `quest_template` SET `PrevQuestID` = 30059 WHERE `ID` = 30058; -- Mothallus!
UPDATE `quest_template` SET `NextQuestID` = 29919 WHERE `ID` = 29918; -- A Lesson in Bravery
UPDATE `quest_template` SET `NextQuestID` = 29944 WHERE `ID` = 29919; -- Great Minds Drink Alike
UPDATE `quest_template` SET `NextQuestID` = 30046 WHERE `ID` = 29951; -- Muddy Water
UPDATE `quest_template` SET `NextQuestID` = 30046 WHERE `ID` = 29952; -- Broken Dreams
UPDATE `quest_template` SET `NextQuestID` = 29949 WHERE `ID` = 29947; -- Crouching Carrot Hidden Turnip
UPDATE `quest_template` SET `NextQuestID` = 29949 WHERE `ID` = 29948; -- Thieves to the Core

/* Chen's Masterpiece */

UPDATE `quest_template` SET `PrevQuestID` = 30029 WHERE `ID` = 30028; -- Grain Recovery *
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30048; -- Li Li AND the Grain 
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30049; -- Doesnt Hold Water
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30050; -- Gardener Fran AND the Watering Can
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30052; -- Weed War
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30053; -- Hop Hunting
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30054; -- Enough is Ookin' Enough
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30056; -- The Farmer's Daughter
UPDATE `quest_template` SET `PrevQuestID` = 30048 WHERE `ID` = 30029; -- Wee Little Shenanigans
UPDATE `quest_template` SET `PrevQuestID` = 30048 WHERE `ID` = 30030; -- Out of Sprite
UPDATE `quest_template` SET `PrevQuestID` = 30048 WHERE `ID` = 30031; -- Taste Test
UPDATE `quest_template` SET `PrevQuestID` = 29952 WHERE `ID` = 30046; -- Chen's Resolution
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30050; -- Gardener Fran AND the Watering Can
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30052; -- Weed War
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30053; -- Hop Hunting
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30054; -- Enough is Ookin' Enough
UPDATE `quest_template` SET `PrevQuestID` = -30054 WHERE `ID` = 30055; -- Stormstouts Hop
UPDATE `quest_template` SET `ExclusiveGroup` = -30031 WHERE `ID` = 30029; -- Wee Little Shenanigans
UPDATE `quest_template` SET `ExclusiveGroup` = -30031 WHERE `ID` = 30030; -- Out of Sprite
UPDATE `quest_template` SET `ExclusiveGroup` = -30031 WHERE `ID` = 30031; -- Taste Test
UPDATE `quest_template` SET `PrevQuestID` = -30031 WHERE `ID` = 30032;
UPDATE `quest_template` SET `NextQuestID` = 30073 WHERE `ID` = 30055; -- Stormstouts Hops

/* Stormstout Brewery */

UPDATE `quest_template` SET `PrevQuestID` = 29909 WHERE `ID` = 30087; -- Flag - Kung Fu Intro
UPDATE `quest_template` SET `PrevQuestID` = 30074 WHERE `ID` = 30075; -- Clear the Way
UPDATE `quest_template` SET `PrevQuestID` = 30074 WHERE `ID` = 30076; -- The Fanciest Water
UPDATE `quest_template` SET `PrevQuestID` = 30074 WHERE `ID` = 30077; -- Barrels, Man
UPDATE `quest_template` SET `PrevQuestID` = 30078 WHERE `ID` = 30117; -- Stoneplow Thirsts
UPDATE `quest_template` SET `NextQuestID` = 30078 WHERE `ID` = 30076; -- The Fanciest Water
UPDATE `quest_template` SET `NextQuestID` = 30078 WHERE `ID` = 30077; -- Barrels, Man
UPDATE `quest_template` SET `NextQuestID` = 29872 WHERE `ID` = 30086; -- The Search for the Hidden Master
UPDATE `quest_template` SET `NextQuestID` = 29872 WHERE `ID` = 30087; -- Flag - Kung Fu Intro

/* The Hidden Master */
	
	-- Clever Ashyo
UPDATE `quest_template` SET `PrevQuestID` = 30086 WHERE `ID` = 29871; -- Clever Ashyo

	-- Lin Tenderpaw
UPDATE `quest_template` SET `PrevQuestID` = 30086 WHERE `ID` = 29872; -- Lin Tenderpaw
UPDATE `quest_template` SET `PrevQuestID` = 29984 WHERE `ID` = 29985; -- They Will Be Mist
UPDATE `quest_template` SET `PrevQuestID` = 29984 WHERE `ID` = 29986; -- Fog Wards
UPDATE `quest_template` SET `PrevQuestID` = 29984 WHERE `ID` = 29992; -- Tenderpaw By Name, Tender Paw By Reputation
UPDATE `quest_template` SET `PrevQuestID` = 29989 WHERE `ID` = 29990; -- Training AND Discipline
UPDATE `quest_template` SET `NextQuestID` = 29987 WHERE `ID` = 29992; -- Tenderpaw By Name, Tender Paw By Reputation
UPDATE `quest_template` SET `NextQuestID` = 29990 WHERE `ID` = 29989; -- Unyielding Fists: Trial of Stone

	-- Saving Stoneplow
UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30622; -- The Swarm Begins

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30622 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30360 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30622, 0, 0, 8, 0, 30360, 0, 0, 0, 0, '', 'if player are aliance');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30622 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30241 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30622, 0, 1, 8, 0, 30241, 0, 0, 0, 0, '', 'if player are horde');

UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30623; -- The Mantidote
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30623 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30360 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30623, 0, 0, 8, 0, 30360, 0, 0, 0, 0, '', 'if player are aliance');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30623 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30241 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30623, 0, 1, 8, 0, 30241, 0, 0, 0, 0, '', 'if player are horde');

UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30624; -- It Does You No Good In The Keg (Alianza)
UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30653; -- It Does You No Good In The Keg (Horda)

UPDATE `quest_template` SET `PrevQuestID` = 30623 WHERE `ID` = 30625; -- Students No More
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30625 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30624 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30625, 0, 0, 8, 0, 30624, 0, 0, 0, 0, '', 'if player are aliance');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30625 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30653 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30625, 0, 1, 8, 0, 30653, 0, 0, 0, 0, '', 'if player are horde');

UPDATE `quest_template` SET `PrevQuestID` = 30626 WHERE `ID` = 30627; -- The Savior of Stoneplow
UPDATE `quest_template` SET `NextQuestID` = 30624 WHERE `ID` = 30360; -- Warn Stoneplow (Alianza)
UPDATE `quest_template` SET `NextQuestID` = 30653 WHERE `ID` = 30241; -- Warn Stoneplow (Horda)
UPDATE `quest_template` SET `NextQuestID` = 30627 WHERE `ID` = 30626; -- Retreat!

/* Nesingwary's Safari */

UPDATE `quest_template` SET `PrevQuestID` = 30181 WHERE `ID` = 30184; -- Mushan Mastery: Darkhide
UPDATE `quest_template` SET `PrevQuestID` = 30184 WHERE `ID` = 30185; -- Tortoise Mastery
UPDATE `quest_template` SET `NextQuestID` = 30184 WHERE `ID` = 30181; -- Mushan Mastery
UPDATE `quest_template` SET `NextQuestID` = 30185 WHERE `ID` = 30182; -- Fox Mastery

/* Halfhill Market */

UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31311; -- Way of the Grill
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31470; -- Way of the Wok
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31472; -- Way of the Pot
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31475; -- Way of the Steamer
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31478; -- Way of the Oven
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31479; -- Way of the Brew
UPDATE `quest_template` SET `PrevQuestID` = 31311 WHERE `ID` = 31467; -- Strong as Tiger
UPDATE `quest_template` SET `PrevQuestID` = 31472 WHERE `ID` = 31474; -- The Soup of Contemplation
UPDATE `quest_template` SET `PrevQuestID` = 31470 WHERE `ID` = 31471; -- Agile as Tiger
UPDATE `quest_template` SET `PrevQuestID` = 31475 WHERE `ID` = 31476; -- The Spirit of Cooking
UPDATE `quest_template` SET `PrevQuestID` = 31478 WHERE `ID` = 31477; -- Endurance
UPDATE `quest_template` SET `PrevQuestID` = 31479 WHERE `ID` = 31480; -- Have a Drink
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31467; -- Strong as Tiger
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31471; -- Agile as Tiger
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31474; -- The Soup of Contemplation
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31476; -- The Spirit of Cooking
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31477; -- Endurance
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31480; -- Have a Drink
UPDATE `quest_template` SET `PrevQuestID` = -31480 WHERE `ID` = 31536; -- Preserving Freshness
UPDATE `quest_template` SET `PrevQuestID` = 30252 WHERE `ID` = 30535; -- Learn and Grow Seeds
UPDATE `quest_template` SET `PrevQuestID` = 30522, `NextQuestID` = 30527 WHERE `ID` = 30525; -- Haohan's Vote III: Pure Poison
UPDATE `quest_template` SET `PrevQuestID` = 30525, `NextQuestID` = 30528 WHERE `ID` = 30527; -- Haohan's Vote IV: Melons for Felons
UPDATE `quest_template` SET `PrevQuestID` = 30527, `NextQuestID` = 30529 WHERE `ID` = 30528; -- Haohan's Vote V: Chief Yip-Yip
UPDATE `quest_template` SET `NextQuestID` = 30525 WHERE `ID` = 30522; -- Haohan's Vote II: The Real Culprits
UPDATE `quest_template` SET `PrevQuestID` = 31945 WHERE `ID` = 30258; -- Mung'Mungs Vote I: A Hozen's Problem
UPDATE `quest_template` SET `NextQuestID` = 31946 WHERE `ID` = 30259; -- Mung'Mungs Vote II: Rotten to the Core
UPDATE `quest_template` SET `PrevQuestID` = 30259 WHERE `ID` = 31946; -- Mung'Mungs Vote III: The Great Carrot Caper
UPDATE `quest_template` SET `NextQuestID` = 32198 WHERE `ID` = 32189; -- A Shabby New Face
UPDATE `quest_template` SET `PrevQuestID` = 32189 WHERE `ID` = 32198; -- One Magical, Flying Kingdom's Trash...
UPDATE `quest_template` SET `NextQuestID` = 31947 WHERE `ID` = 30518; -- Farmer Fung's Vote II: On the Loose
UPDATE `quest_template` SET `PrevQuestID` = 30518 WHERE `ID` = 31947; -- Farmer Fung's Vote III: Crazy For Cabbage
UPDATE `quest_template` SET `NextQuestID` = 31949 WHERE `ID` = 31948; -- Nana's Vote II: The Sacred Springs
UPDATE `quest_template` SET `PrevQuestID` = 31948 WHERE `ID` = 31949; -- Nana's Vote III: Witchberry Julep
UPDATE `quest_template` SET `PrevQuestID` = 30528 WHERE `ID` = 30529; -- Growing the Farm III: The Mossy Boulder
UPDATE `quest_template` SET `PrevQuestID` = 30257 WHERE `ID` = 30332; -- Fatty Goatsteak
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 9000 WHERE `ID` = 30260; -- Growing the Farm I: The Weeds (Honored)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 14600 WHERE `ID` = 30258; -- Mung'Mungs Vote I: A Hozen's Problem (Honored +5600)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 21000 WHERE `ID` = 30523; -- Growing the Farm II: The Broken Wagon (Revered)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 25251 WHERE `ID` = 30517; -- Farmer Fung's Vote I: Yak Attack (Revered +4251)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 29499 WHERE `ID` = 30519; -- Nana's Vote I: Nana's Secret Recipe (Revered +8499)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 33600 WHERE `ID` = 30526; -- Lost and Lonely (Revered +12600)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 37800 WHERE `ID` = 30521; -- Haohans Vote I: Bungalow Break-In (Revered +16800)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 42000 WHERE `ID` = 30529; -- Growing the Farm III: The Mossy Boulder (Exalted)
