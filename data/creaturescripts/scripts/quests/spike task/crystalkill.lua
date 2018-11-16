function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	if(isMonster(target)) then
	local killAmount = player:getStorageValue(6874115)
		if target:getName():lower() == "crystalcrusher" and killAmount < 6 and player:getStorageValue(Storage.SpikeTaskQuest.Gnombold.Kill) == 1 then
			 player:setStorageValue(6874115, killAmount + 1)
			 player:say("matei", TALKTYPE_SAY)
		end	 
	end
 	return true
end