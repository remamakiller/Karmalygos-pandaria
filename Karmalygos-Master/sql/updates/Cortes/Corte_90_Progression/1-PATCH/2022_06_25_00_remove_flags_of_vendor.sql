/*Remove flags of vendor to the NPC*/
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry` IN (74022,74020,74021,74027,73674,74010,74012,74019,99020,99628);