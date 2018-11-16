function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
	local storageQuest = 50736

	if player:getStorageValue(storageQuest) >= 1 then
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			player:teleportTo({x = 32340, y = 32088, z = 7})
			else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the permission to use this portal.")
			creature:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end
    return true
end