local config = {
	{storageKey11 = 210001, teleportPosition = Position(33032, 32400, 7)}, -- posiçaão do teleporte de entrada Darashia noroeste
	{storageKey11 = 210002, teleportPosition = Position(33215, 32273, 7)}, -- posiçaão do teleporte de entrada Darashia norte
	{storageKey11 = 210016, teleportPosition = Position(33255, 32678, 7)} -- {x = 33255, y = 32678, z = 7}
}
                                                                   -- SAIDA DA ISLE
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	for i = 1, #config do
		local table = config[i]
		if player:getStorageValue(table.storageKey11) >= 1 then
			player:teleportTo(table.teleportPosition)
			table.teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(table.storageKey11, 0)
			return true
		end
	end

	player:teleportTo(player:getTown():getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
