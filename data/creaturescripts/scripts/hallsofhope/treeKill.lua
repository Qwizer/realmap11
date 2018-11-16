function onKill(creature, target)
	local hp = (creature:getHealth()/creature:getMaxHealth())*100
	local player = creature:getPlayer()
	local targetMonster = target:getMonster()
    local pos = target:getPosition()

    local mobs = {
        'unbound blightwalker',
        'unbound demon',
        'unbound defiler',
        'unbound demon outcast'
	}
	
	if targetMonster:getName():lower() ~= "possessed tree" then
		return true
	end
	
	if not player then
		return true
    end
    
    local spectators, spectator = Game.getSpectators(Position(32625, 32880, 14), false, false, 9, 9, 9, 9)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() and spectator:getName():lower() == "possessed tree" then
			spectator:remove()
			Game.createMonster(mobs[math.random(#mobs)], pos, false, true)
			return true
		end
	end

end