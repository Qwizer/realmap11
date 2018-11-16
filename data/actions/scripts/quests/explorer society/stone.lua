function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 3015 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 53 and player:getStorageValue(Storage.ExplorerSociety.SpectralStone) == 1 then -- mission taken from Angus
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 54)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	elseif target.uid == 3016 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 54 and player:removeItem(4851, 1) and player:getStorageValue(Storage.ExplorerSociety.SpectralStone) == 1 then -- mission taken from Angus
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 55)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	elseif target.uid == 3016 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 53 and player:getStorageValue(Storage.ExplorerSociety.SpectralStone) == 2 then -- mission taken from Mortimer
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 54)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	elseif target.uid == 3015 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 54 and player:removeItem(4851, 1) and player:getStorageValue(Storage.ExplorerSociety.SpectralStone) == 2 then -- mission taken from Mortimer
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 55)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end