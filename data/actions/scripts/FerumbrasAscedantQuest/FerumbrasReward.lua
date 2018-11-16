-- Ferumbras Quest feita por Ciroc
function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
        if player:getStorageValue(cid, 45598) >= os.time() then
		player:addItem(25172, 5)
                player:setStorageValue(cid, 45598, os.time()+336*3600)
                player:setStorageValue(cid, 54982, -1)
                player:setStorageValue(cid, 54983, -1)
                player:setStorageValue(cid, 54984, -1)
                player:setStorageValue(cid, 54985, -1)
                player:setStorageValue(cid, 54986, -1)
                player:setStorageValue(cid, 54987, -1)
                player:setStorageValue(cid, 54988, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations, you got your reward.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already got your reward.')
	end
	if player:getStorageValue(45599) <= 0 then
		player:addItem(2160, 10)
		player:addItem(25393, 4)
		player:addItem(25387, 4)
		player:addItem(25431, 1)
		player:addOutfitAddon(845, 0)
		player:addOutfitAddon(846, 0)
		player:setStorageValue(45599, 1)
        end
	return true
end