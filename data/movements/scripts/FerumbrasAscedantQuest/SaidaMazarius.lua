-- Ferumbras Quest feita por Ciroc
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(54982) >= 1 and player:getStorageValue(54988) >= 1 and player:getStorageValue(54983) >= 1 and player:getStorageValue(54984) >= 1 and player:getStorageValue(54985) >= 1 and player:getStorageValue(54986) >= 1 and player:getStorageValue(54987) >= 1 then
		player:teleportTo(Position(33275, 32389, 9))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations, you beat the 7 Ruthless Seven and now you are able to defeat the dreaded Ferumbras.')
	else
		player:teleportTo(Position(33275, 32389, 8))
	end
	return true
end