function onSay(player, words, param, channel)
	if not player:getGroup():getAccess() then
		return true
	end
	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	if(param == '')then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Caso queira abrir o evento, digite: /eforest on")
		return false
	end
	if(param == "on")then
		if(Game.getStorageValue(configExf.stats) >=1)then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "Enchanted Forest já esta aberto. não é possivel abrir ao mesmo tempo")
			return false
		end
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enchanted Forest iniciado com sucesso!!")
		doStartExf()
	end
	elseif param == "off" then
	if(Game.getStorageValue(configExf.stats) >=1)then
		doCloseExf()
		doBroadcastMessage("The Exchanted Forest event is now closed.")
	else
		doPlayerSendCancel(cid, "O evento não está ocorrendo.")
	end
end
	return false
end