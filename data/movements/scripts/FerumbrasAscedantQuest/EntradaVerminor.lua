-- Ferumbras Quest feita por Ciroc
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
        if player:getStorageValue(cid, 54994) >= os.time() then
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Is less than 2 days you accessed this boss.')
	else
		player:teleportTo(Position(33230, 31492, 13))
	end
	return true
end