local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

locations = {
	[1] = Position(32123, 32664, 12),
	[2]	= Position(32168, 32678, 12),
	[3]	= Position(32229, 32708, 12),
	[4]	= Position(32281, 32644, 12),
	[5]	= Position(32344, 32681, 12),
	[6]	= Position(32323, 32605, 12),
	[7]	= Position(32353, 32544, 12),
	[8]	= Position(32307, 32525, 12),
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local vezesUsado = 6874112
	local player = Player(cid)
	
	if itemEx.itemid == 21567 then
		local qStorage =  player:getStorageValue(vezesUsado)
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Charges) == 1 then
			if qStorage < 2 then			
				player:setStorageValue(vezesUsado, qStorage + 1)
				local tile = Tile({x = toPosition.x, y = toPosition.y, z = toPosition.z}) 
				if tile then
					local stone = tile:getItemById(21567)
					if stone then
						stone:transform(1304)
					end
				end
				addEvent(revertItem, 180000, toPosition, 1304, 21567)
				local teleportArea = math.random(8)
				player:teleportTo(locations[teleportArea])
				player:say('Your tinkering caused some kind of magnetic storm that caused you to get disorientated.', TALKTYPE_MONSTER_SAY)	
			end
		end
	end 
end