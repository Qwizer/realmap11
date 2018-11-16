local config = {
	bossPosition = {
		Position(32977, 31663, 14)
	},
	monster_name = "the time guardian",
	time = 3
}


function onKill(player, target)
	local monster = target:getMonster()
	if monster:getName():lower() == config.monster_name then
        for i = 1, #config.bossPosition do
            Game.createMonster("the freezing time guardian", config.bossPosition[i])
        end
    
    elseif monster:getName():lower() == "the freezing time guardian" then
        for i = 1, #config.bossPosition do
            local monster = Game.createMonster("the blazing time guardian", config.bossPosition[i])
            monster:setReward(true)
        end
	end
    return true
end