UPDATE `command` SET `security` = 1 WHERE `security` = 0;
UPDATE `command` SET `security` = 0 WHERE `name` IN ('account', 'distance', 'dismount', 'help');
UPDATE `command` SET `security` = 1 WHERE `name` IN ('character reputation', 'character titles');
UPDATE `command` SET `security` = 2 WHERE `name` IN ('ban', 'ban account', 'ban account', 'ban ip', 'ban playeraccount', 'bindsight', 'deserter bg add', 'deserter instance add', 'lookup player email', 'lookup player ip', 'quest reward', 'repairitems', 'revive', 'group disband', 'group list', 'unbindsight');
UPDATE `command` SET `security` = 3 WHERE `name` IN ('modify phaseid', 'modify phase', 'modify');