local gates = {
	[9710] = {value = 1, position = Position(32680, 31720, 7)},
	[9711] = {value = 2, position = Position(33264, 32841, 7)},
	[9712] = {value = 3, position = Position(32263, 31847, 7)},
	[9713] = {value = 4, position = Position(33300, 32372, 7)},
	[9714] = {value = 5, position = Position(33221, 31921, 7)},
	[9715] = {value = 6, position = Position(32574, 31981, 7)},
	[9716] = {value = 7, position = Position(32348, 32695, 7)},
	[9717] = {value = 8, position = Position(32531, 32715, 7)},
	[9718] = {value = 9, position = Position(32268, 32162, 7)},
	[9719] = {value = 10, position = Position(32834, 32082, 7)},
	[9720] = {value = 11, position = Position(32369, 32241, 7)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	local destination = Position(33290, 31786, 13)
	local exit = Position(32369, 32241, 7) --temporary fix
	if not player then
		return true
	end

	if isInArray({9710, 9711, 9712, 9713, 9714, 9715, 9716, 9717, 9718, 9719}, item.actionid) then
		local gate = gates[item.actionid]
		if not gate then
			return true
		end

		position:sendMagicEffect(CONST_ME_TELEPORT)

		if gates.value == 11 then

		end

		if player:getLevel() < 60 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have to be at least level 60 to enter this gate.')
			player:teleportTo(gate.position)
			gate.position:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		else
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_FIREAREA)
		end

		
	elseif isInArray({9720}, item.actionid) then
		player:teleportTo(exit)
		exit:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
