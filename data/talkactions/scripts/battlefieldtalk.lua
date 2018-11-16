function onSay(player, words, param, channel)
	if not player:getGroup():getAccess() then
		return true
	end
	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	if(param == '')then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Caso queira abrir o evento, digite: /battlefield on")
		return false
	end
	if(param == "on")then
		if(Game.getStorageValue(6486214892) >=1)then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "O Battlefield ja esta aberto.")
			return false
		end
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Battlefield Started!")
		startBF()
	end
	return false
end