-- <movevent event="StepIn" fromaid="73400" toaid="73403" script="others/oramond_movements.lua"/>

local action_id = {
	[13415] = {x = 33506, y = 31577, z = 8}, -- krailos
	[13416] = {x = 33503, y = 31580, z = 7}, -- krailos
	[13417] = {x = 33622, y = 31789, z = 13}, -- oramond sea 
	[13418] = {x = 32234, y = 32919, z = 9},	-- liberty bay quaras
	[13419] = {x = 32235, y = 32921, z = 8},	-- liberty bay quaras
	[13420] = {x = 32247, y = 32893, z = 9}, -- liberty bay quaras
	[13421] = {x = 32244, y = 32892, z = 8}, -- liberty bay quaras
	[13422] = {x = 32262, y = 32913, z = 9}, -- liberty bay quaras
	[13423] = {x = 32264, y = 32911, z = 8}, -- liberty bay quaras
	[13424] = {x = 32271, y = 32872, z = 9}, -- liberty bay quaras
	[13425] = {x = 32272, y = 32872, z = 8}, -- liberty bay quaras
	[13426] = {x = 31376, y = 32776, z = 7}, -- treiners
	[13427] = {x = 31247, y = 32787, z = 7}, -- treiners
	[13428] = {x = 33545, y = 31861, z = 7}, -- oramond sea   
}

function onStepIn(creature, item, position, fromPosition)
	
	local action = action_id[item.actionid]
	if action then
		local player = creature:getPlayer()
		if player == nil then
			return false
		end
		
		player:teleportTo(action)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end
	
	return true
end