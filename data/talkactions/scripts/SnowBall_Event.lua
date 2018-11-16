function onSay(player, words, param)
	if not isInArena(player) then
		return false
	end

	if param == "atirar" then
		if player:getExhaustion(10107) > 1 then
			return true
		end

		if not SnowBall_Configurations.Ammo_Configurations.Ammo_Infinity then
			if player:getStorageValue(10108) > 0 then
				player:setStorageValue(10108, player:getStorageValue(10108) - 1)
				player:sendCancelMessage("Ainda restam ".. player:getStorageValue(10108) .." bolas de neve.")
			else
				player:sendCancelMessage("Você está sem bolas de neve.")
				return true
			end
		end

		player:setExhaustion(10107, SnowBall_Configurations.Ammo_Configurations.Ammo_Exhaust)
		Event_sendSnowBall(player:getId(), player:getPosition(), SnowBall_Configurations.Ammo_Configurations.Ammo_Distance, player:getDirection())
		return false
	elseif param == "info" then
		local str = "     ## -> Player Infos <- ##\n\nPontos: ".. player:getStorageValue(10109) .."\nBolas de neve: ".. player:getStorageValue(10108)

		str = str .. "\n\n          ## -> Ranking <- ##\n\n"
		for i = 1, 5 do
			if CACHE_GAMEPLAYERS[i] then
				str  = str .. i .. ". " .. Player(CACHE_GAMEPLAYERS[i]):getName() .."\n"
			end
		end
		for pos, players in ipairs(CACHE_GAMEPLAYERS) do
			if player:getId() == players then
				str = str .. "My Ranking Pos: " .. pos
			end
		end

		player:showTextDialog(2111, str)
		return false
	end
end
