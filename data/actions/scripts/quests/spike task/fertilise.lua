local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local vezesUsado = 6874113
	local player = Player(cid)
	
	if itemEx.itemid == 21565 then		
		local qStorage =  player:getStorageValue(vezesUsado)
		if player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Fertilise) == 1 then
			if qStorage < 3 then			
				player:setStorageValue(vezesUsado, qStorage + 1)
				local tile = Tile({x = toPosition.x, y = toPosition.y, z = toPosition.z}) 
				if tile then
					local stone = tile:getItemById(21565)
					if stone then
						stone:transform(4179)
					end
				end
				addEvent(revertItem, 180000, toPosition, 4179, 21565)
				toPosition:sendMagicEffect(CONST_ME_PLANTATTACK)
			end
		end
	end 
end