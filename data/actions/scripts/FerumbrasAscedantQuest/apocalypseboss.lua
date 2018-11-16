local config = {
	requiredLevel = 50,
	daily = false,
	centerRazzagornRoomPosition = Position(33423, 32466, 14),
	playerPositions = {
		Position(33386, 32455, 14),
		Position(33387, 32455, 14),
		Position(33388, 32455, 14),
		Position(33389, 32455, 14),
		Position(33390, 32455, 14)
	},
	newPositions = {
		Position(33417, 32467, 14),
		Position(33417, 32467, 14),
		Position(33417, 32467, 14),
		Position(33417, 32467, 14),
		Position(33417, 32467, 14)
	},
	RazzagornPositions = {
		Position(33425, 32466, 14)
	}
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9826 then
		local storePlayers, playerTile = {}

		for i = 1, #config.playerPositions do
			playerTile = Tile(config.playerPositions[i]):getTopCreature()
			if not playerTile or not playerTile:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 5 players.")
				return true
			end

			if playerTile:getLevel() < config.requiredLevel then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "All the players need to be level ".. config.requiredLevel .." or higher.")
				return true
			end

			storePlayers[#storePlayers + 1] = playerTile
		end

		local specs, spec = Game.getSpectators(config.centerRazzagornRoomPosition, false, false, 22, 22, 22, 22)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
				return true
			end

			spec:remove()
		end

		for i = 1, #config.RazzagornPositions do
			Game.createMonster("Razzagorn", config.RazzagornPositions[i])
		end

		local players
		for i = 1, #storePlayers do
			players = storePlayers[i]
			config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
			players:teleportTo(config.newPositions[i])
			config.newPositions[i]:sendMagicEffect(CONST_ME_ENERGYAREA)
			players:setDirection(DIRECTION_EAST)
		end
	elseif item.itemid == 9825 then
		if config.daily then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
			return true
		end
	end

	item:transform(item.itemid == 9826 and 9825 or 9826)
	return true
end