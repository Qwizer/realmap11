local config = {
	bossPosition = {
		Position(32624, 32880, 14)
	},
	monster_name = "mounted thorn knight",
	time = 3
}


function onKill(player, target)
	local monster = target:getMonster()
	if monster:getName():lower() == config.monster_name then
        for i = 1, #config.bossPosition do
            Game.createMonster("the shielded thorn knight", config.bossPosition[i])
            Game.createMonster("thorn steed", config.bossPosition[i])
        end
    
    elseif monster:getName():lower() == "the shielded thorn knight" then
        for i = 1, #config.bossPosition do
            local monster = Game.createMonster("the enraged thorn knight", config.bossPosition[i])
            monster:setReward(true)
        end
	end
    return true
end