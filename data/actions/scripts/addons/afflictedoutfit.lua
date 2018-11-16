
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local hasOutfit = player

	-- Plgue Mask
	if item.itemid == 13925 then
		if not hasOutfit then
			return false
		end

		player:addOutfitAddon(430, 2)
		player:addOutfitAddon(431, 2)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:say('You gained a plague mask for your outfit.', TALKTYPE_MONSTER_SAY, false, player)
		item:remove()

	-- Plague Bell
	elseif item.itemid == 13926 then
		if not hasOutfit then
			return false
		end

		player:addOutfitAddon(430, 1)
		player:addOutfitAddon(431, 1)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:say('You gained a plague bell for your outfit.', TALKTYPE_MONSTER_SAY, false, player)
		item:remove()

	end
	return true
end
