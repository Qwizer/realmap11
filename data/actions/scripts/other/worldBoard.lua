function onUse(player, item, fromPosition, target, toPosition, isHotkey)
-- fury gates
    local messageType = nil
    if (player:getClient().os == 3 or
    	player:getClient().os == 5) then
    	messageType = MESSAGE_EVENT_ADVANCE
    end

    if Game.getStorageValue(9710) == 1 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Ab\'dendriel Today.')
    elseif Game.getStorageValue(9711) == 2 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Ankrahmun Today.')
    elseif Game.getStorageValue(9712) == 3 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Carlin Today.')
    elseif Game.getStorageValue(9713) == 4 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Darashia Today.')
    elseif Game.getStorageValue(9714) == 5 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Edron Today.')
    elseif Game.getStorageValue(9715) == 6 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Kazordoon Today.')
    elseif Game.getStorageValue(9716) == 7 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Liberty Bay Today.')
    elseif Game.getStorageValue(9717) == 8 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Port Hope Today.')
    elseif Game.getStorageValue(9718) == 9 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Thais Today.')
    elseif Game.getStorageValue(9719) == 10 then
        player:sendTextMessage(messageType or MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Venore Today.')
    end

	return true
end
