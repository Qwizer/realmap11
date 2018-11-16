function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if player:getItemCount(25521) >= 1 and player:getStorageValue(25521) == -1 then 
		player:addMount(87)
		player:setStorageValue(25521, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have acquired the Rift Runner mount.')
		item:remove()
	end
    return player:sendCancelMessage('Sorry not possible')
end