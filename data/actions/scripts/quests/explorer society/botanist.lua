function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 4138 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 17 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 18)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4870)
		target:remove()
	elseif target.itemid == 4149 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 20 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 21)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4871)
		target:remove()
	elseif target.itemid == 4142 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 23 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 24)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4872)
		target:remove()
	elseif target.itemid == 5659 and target.uid == 3152 then
		if player:getStorageValue(53051) < 1 then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:transform(5937)
			player:setStorageValue(53051, 1)	
			player:say("You successfully took a sample of the rare griffinclaw flower.", TALKTYPE_ORANGE_1)
		else
			toPosition:sendMagicEffect(CONST_ME_POFF)
			player:say("You already took a sample of the rare griffinclaw flower.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end