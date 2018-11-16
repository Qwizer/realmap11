local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local vezesUsado = 6874114
	local player = Player(cid)
	
	if player:getOutfit().lookType == 307 then
		local qStorage =  player:getStorageValue(vezesUsado)
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Nests) == 1 then
			if qStorage < 4 then			
				player:setStorageValue(vezesUsado, qStorage + 1)
				local tile = Tile({x = toPosition.x, y = toPosition.y, z = toPosition.z}) 
				if tile then
					local stone = tile:getItemById(21559)
					if stone then
						stone:transform(21560)
					end
				end
				addEvent(revertItem, 180000, toPosition, 21559, 21560)
			end
		end
	end 
end