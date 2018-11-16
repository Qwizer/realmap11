-- Ferumbras Quest feita por Ciroc
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(cid, 45598) then
		player:teleportTo(Position(33292, 31453, 12))
        else
		player:setStorageValue(cid, 45598, os.time()+336*3600)
                player:setStorageValue(cid, 54982, -1)
                player:setStorageValue(cid, 54983, -1)
                player:setStorageValue(cid, 54984, -1)
                player:setStorageValue(cid, 54985, -1)
                player:setStorageValue(cid, 54986, -1)
                player:setStorageValue(cid, 54987, -1)
                player:setStorageValue(cid, 54988, 1)
		player:teleportTo(Position(33292, 31453, 12))
	end
	return true
end