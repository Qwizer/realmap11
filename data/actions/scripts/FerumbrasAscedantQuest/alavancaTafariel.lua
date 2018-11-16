local config = {
	{position = Position(33464, 32721, 14), itemId = 25197},
	{position = Position(33452, 32724, 14), itemId = 25197},
	{position = Position(33455, 32724, 14), itemId = 25196},
	{position = Position(33458, 32724, 14), itemId = 25195},
	{position = Position(33461, 32724, 14), itemId = 25196},
	{position = Position(33464, 32724, 14), itemId = 25195},
	{position = Position(33467, 32724, 14), itemId = 25197},
	{position = Position(33455, 32727, 14), itemId = 25195},
	{position = Position(33467, 32727, 14), itemId = 25196},
	{position = Position(33452, 32721, 14), itemId = 25194},
	{position = Position(33455, 32721, 14), itemId = 25194},
	{position = Position(33458, 32721, 14), itemId = 25194},
	{position = Position(33461, 32721, 14), itemId = 25194},
	{position = Position(33452, 32727, 14), itemId = 25194},
	{position = Position(33458, 32727, 14), itemId = 25194},
	{position = Position(33461, 32727, 14), itemId = 25194},
	{position = Position(33464, 32727, 14), itemId = 25194}
}

function onUse(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local correct, leverItem = true
	for i = 1, #config do
		leverItem = Tile(config[i].position):getItemById(config[i].itemId)
		if not leverItem then
			correct = false
			break
		end
	end

	position:sendMagicEffect(CONST_ME_TELEPORT)

	local destination
	if not correct then
		destination = Position(33477, 32698, 14)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	destination = Position(33435, 32801, 13)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end