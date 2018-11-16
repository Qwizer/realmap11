local ssacrificee = Position(32790, 32227, 14)
local ssacrificee2 = Position(32784, 32226, 14)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 50150 and player:getStorageValue(Storage.OutfitQuest.BrotherhoodOutfit) >= 2 then
		player:teleportTo(ssacrificee2)
	else
		player:teleportTo(ssacrificee)
		
	end

	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end
