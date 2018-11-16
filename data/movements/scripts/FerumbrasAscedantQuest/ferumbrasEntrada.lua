-- Ferumbras Quest feita por Ciroc
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(45790) >= 1 and player:getLevel() >= 150 then
		player:teleportTo(Position(33322, 32320, 12))
	else
		player:teleportTo(Position(33275, 32389, 8))
		player:sendCancelMessage("You need to give 30 demonic essences to npc Mazarius to pass here.")
	end
	return true
end