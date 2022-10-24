/*Change command gm to other security level*/

UPDATE `command` SET `security` = 3 WHERE `name` = 'gm';
UPDATE `command` SET `security` = 3 WHERE `name` = 'gm visible';
UPDATE `command` SET `security` = 1 WHERE `name` = 'gm chat';

UPDATE `command` SET `security` = 1 WHERE `name` = 'gobject near';

UPDATE `command` SET `security` = 3 WHERE `name` = 'group summon';

DELETE FROM `command` WHERE `name` = 'isengard';
DELETE FROM `command` WHERE `name` = 'guard delete';
DELETE FROM `command` WHERE `name` = 'guard global';
DELETE FROM `command` WHERE `name` = 'guard handle';
DELETE FROM `command` WHERE `name` = 'guard player';