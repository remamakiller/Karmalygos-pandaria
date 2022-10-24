UPDATE `creature_template` SET `mindmg`=7052, `maxdmg`=11989, `flags_extra`= 64 WHERE `entry` in (61305,61306,61307);


-- 30602
UPDATE `creature_template` SET `npcflag`= 3 WHERE `entry`= 59806;

DELETE FROM `smart_scripts` WHERE `entryorguid`=60802 AND `source_type`=0;


DELETE FROM `spell_script_names` WHERE `spell_id` in (75651,75627);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(75651, 'spell_thousand_needles_speedbarge_diving_helm_check'),
(75627, 'spell_thousand_needles_speedbarge_diving_helm_effect');