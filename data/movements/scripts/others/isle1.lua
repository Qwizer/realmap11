local portals = {
	[64001] = {210001}, -- noroeste de Darashia
	[64002] = {210002}, -- norte de Darashia
	[64003] = {210016}  --  faltou north de ank AQUI                                  ENTRADA PRA ISLE
}

local pos = Position(33497, 32616, 8) -- ENTRADA DO ISLES (JA NA CAVE)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local storage = portals[item.uid]
	if not storage then
		return true
	end

	player:teleportTo(pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(storage[1], 1)
	return true
end
