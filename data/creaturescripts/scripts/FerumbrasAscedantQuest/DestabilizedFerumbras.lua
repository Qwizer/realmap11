-- Ferumbras Quest feita por Ciroc
function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'destabilized ferumbras' then
		return true
	end
        Game.createMonster('ferumbras mortal shell', Position(33392, 31473, 14))
	return true
end