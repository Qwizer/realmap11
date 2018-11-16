-- Ferumbras Quest feita por Ciroc
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(54982) >= 1 and player:getStorageValue(54988) >= 1 and player:getStorageValue(54983) >= 1 and player:getStorageValue(54984) >= 1 and player:getStorageValue(54985) >= 1 and player:getStorageValue(54986) >= 1 and player:getStorageValue(54987) >= 1 then
		player:teleportTo(Position(33278, 32392, 9))
	else
		player:teleportTo(Position(33278, 32392, 8))
	end
	return true
end