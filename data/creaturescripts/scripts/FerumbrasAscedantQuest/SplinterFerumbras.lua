-- Ferumbras Quest feita por Ciroc
function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'ferumbras soul splinter' then
		return true
	end
	--clean arena of monsters
	local spectators, spectator = Game.getSpectators(Position(33392, 31475, 14), false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		end
	end
	Game.createMonster('destabilized ferumbras', Position(33392, 31473, 14))
	return true
end
