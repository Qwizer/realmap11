function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
	local storageQuest = 50731

	if player:getStorageValue(storageQuest) >= 0 then
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			player:teleportTo({x = 32325, y = 32088, z = 7})
    end
    return true
end