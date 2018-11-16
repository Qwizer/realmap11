local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

local hotPositions = {
	[1] = Position(32138, 32613, 14),
	[2] = Position(32137, 32612, 14),
	[3] = Position(32142, 32609, 14),
	[4] = Position(32138, 32609, 14),
	[5] = Position(32136, 32611, 14),
	[6] = Position(32267, 32702, 14),
	[7] = Position(32264, 32704, 14),
	[8] = Position(32265, 32698, 14),
	[9] = Position(32335, 32520, 14),
	[10] = Position(32338, 32518, 14),
	[11] = Position(32332, 32518, 14)
}

local function getDistanceBetween(pos1, pos2)
 return math.abs(pos1-pos2)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local found = false
	local vezesUsado = 6874117
	local player = Player(cid)			
	local qStorage =  player:getStorageValue(vezesUsado)
	if player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Temperature) == 1 then
		if qStorage < 1 then
			for i=1, #hotPositions do
				if (getDistanceBetween(player:getPosition().x, hotPositions[i].x) == 1 and getDistanceBetween(player:getPosition().y, hotPositions[i].y) == 1) then
					found = true
				end
			end
			if found then
				player:setStorageValue(vezesUsado, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Whew! That was that hot, it melted the thermometer! At least you've found the hot spot!")
				item:remove()
			else
				player:say('This is not the hot spot!', TALKTYPE_MONSTER_SAY)	
			end
		end
	end 
end