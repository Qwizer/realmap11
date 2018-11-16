-- <movevent event="StepIn" fromaid="73400" toaid="73403" script="others/oramond_movements.lua"/>

local action_id = {
	[13400] = {x = 33634, y = 31891, z = 6},
	[13401] = {x = 33488, y = 31987, z = 7},
	[13402] = {x = 33632, y = 31661, z = 12},
	[13403] = {x = 33682, y = 31939, z = 9},	
	[13404] = {x = 33678, y = 32461, z = 7},	
	[13405] = {x = 32942, y = 31594, z = 8},
	[13406] = {x = 33143, y = 31528, z = 2},
	[13407] = {x = 33626, y = 31897, z = 6},
	[13408] = {x = 33651, y = 31943, z = 7},
	[13409] = {x = 33662, y = 31936, z = 9},
	[13410] = {x = 33612, y = 31640, z = 14},
	[13411] = {x = 33787, y = 31736, z = 12},
	[13412] = {x = 33626, y = 31639, z = 15},
	[13413] = {x = 33623, y = 31627, z = 14},
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