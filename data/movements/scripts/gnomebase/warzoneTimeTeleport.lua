local destination = {
	[3140] = {newPos = {x = 32996, y = 31922, z = 10}, storageTime = 524627},
	[3141] = {newPos = {x = 33011, y = 31943, z = 11}, storageTime = 524628},
	[3142] = {newPos = {x = 32989, y = 31909, z = 12}, storageTime = 524629},
}

function onStepIn(cid, item, position, lastPosition)
	local v = destination[item.uid]
	if(v) then
		local p = Player(cid)
		if getPlayerStorageValue(cid, destination[item.uid].storageTime) <= os.time() then
			p:teleportTo(v.newPos)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			p:teleportTo(lastPosition)
		end
	end
return true
end
