function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	if(isMonster(target)) then
	local killAmount = player:getStorageValue(6874118)
		if target:getName():lower() == "drillworm" and killAmount < 6 and player:getStorageValue(Storage.SpikeTaskQuest.Gnomargery.Kill) == 1 then
			 player:setStorageValue(6874118, killAmount + 1)
			 player:say("matei", TALKTYPE_SAY)
		end	 
	end
 	return true
end