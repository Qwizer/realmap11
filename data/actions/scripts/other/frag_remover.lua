function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

	if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
		player:setSkull(SKULL_NONE)
		player:setSkullTime(0)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skull has been removed!")
		db.query("UPDATE `player_deaths` SET `unjustified` = 0 WHERE `unjustified` = 1 AND `killed_by` = " .. db.escapeString(player:getName()))
		item:remove(1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only remove red or black skulls!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	
	return true
end 