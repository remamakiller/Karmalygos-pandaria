/*Creature (Entry: 57284) has invalid unit_class (0) in creature_template.*/
UPDATE `creature_template` SET `unit_class`=1 WHERE `entry`=57284;

/*Table `creature_queststarter` and `creature_questender` has creature entry for quest , but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER*/
UPDATE `creature_template` SET `npcflag`=82 WHERE `entry`=56065;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=190000;
