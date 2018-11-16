-- Ferumbras Quest feita por Ciroc
function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
        if player:getStorageValue(cid, 54996) >= os.time() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Is less than 2 days you accessed this boss.')
	else
		doTeleportThing(cid, {x = 33593, y = 32659, z = 14})
	end
        item:transform(item.itemid == 10029 and 10030 or 10029)
	return true
end