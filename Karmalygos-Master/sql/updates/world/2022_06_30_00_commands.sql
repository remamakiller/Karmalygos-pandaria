DELETE FROM `command` WHERE `name`='account password';
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('account password', 0, 'Syntax: .account password $old_password $new_password $new_password [$email]\r\n\r\nChange your account password. You may need to check the actual security mode to see if email input is necessary.');
DELETE FROM `command` WHERE `name`='server info';
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('server info', 0, 'Syntax: .server info\r\n\r\nDisplay server version and the number of connected players.');



