/*SQL_GreenArrow*/

ALTER TABLE `currency_transactions`CHANGE COLUMN `unix_time` `unix_time` INT(11) UNSIGNED NOT NULL AFTER `guid`, CHANGE COLUMN `amount_after` `amount_after` BIGINT(50) UNSIGNED NULL DEFAULT NULL AFTER `amount_before`;
ALTER TABLE `currency_transactions` CHANGE COLUMN `amount_before` `amount_before` BIGINT(50) UNSIGNED NULL DEFAULT NULL AFTER `attachments`;
ALTER TABLE `currency_transactions` CHANGE COLUMN `operation` `operation` ENUM('NULL','LOOT_MOB','LOOT_ITEM','MAIL','QUEST_REWARD','TRADE','SELL_ITEM','GUILD_BANK','AUCTION','TRANSMOGRIFICATION','BLACK_MARKET','MAX') NOT NULL COLLATE 'utf8_general_ci' AFTER `unix_time`;