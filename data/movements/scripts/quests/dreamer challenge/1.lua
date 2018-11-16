local sacrificee = Position(32844, 32228, 14)
local sacrificee2 = Position(32835, 32225, 14)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 50149 and player:getStorageValue(Storage.OutfitQuest.NightmareOutfit) >= 2 then
		player:teleportTo(sacrificee2)
	else
		player:teleportTo(sacrificee)
		
	end

	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end
