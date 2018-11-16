-- <movevent event="StepIn" fromaid="73400" toaid="73403" script="others/oramond_movements.lua"/>

local action_id = {
	[13510] = {x = 32520, y = 32022, z = 8}, -- kazordoon
	[13511] = {x = 32444, y = 32388, z = 10}, -- kazordoon
	[13512] = {x = 33159, y = 32636, z = 8}, -- ankrahmun 
	[13513] = {x = 32130, y = 31359, z = 12},	 -- ankrahmun
	[13514] = {x = 32103, y = 31329, z = 12},	-- no respawn
	[13515] = {x = 32114, y = 31327, z = 12}, -- no respawn
	[13516] = {x = 32111, y = 31372, z = 14}, -- pra recompensa
	[13517] = {x = 32102, y = 31400, z = 13}, -- fora da recompensa
	[13518] = {x = 32114, y = 31353, z = 13},  -- pro começo
	[13519] = {x = 32090, y = 31320, z = 13}, -- do msg pra recompensa 	
	[13520] = {x = 32272, y = 31382, z = 14}, -- primeiro boss pra segunda alavanca
	[13521] = {x = 32113, y = 31353, z = 13}, -- saindo dos bosses
	
	[13522] = {x = 32337, y = 31289, z = 14}, -- segundo boss pra terceira alavanca 
	[13523] = {x = 32306, y = 31250, z = 14}, -- terceiro boss pra quarta alavanca 
	[13524] = {x = 32203, y = 31284, z = 14}, -- quarto boss pra ultima alavanca do ultimo boss  
	[13525] = {x = 32216, y = 31378, z = 14}, -- saida do World Devourer pra recompensa 
	[13526] = {x = 32162, y = 31295, z = 7}, -- svarground saida  
	[13527] = {x = 32112, y = 31390, z = 11}, -- svarground entrada 
	
	[13528] = {x = 33185, y = 31643, z = 8}, -- lá dentro da quest e vai pra edron
	[13529] = {x = 32113, y = 31358, z = 13}, -- de edron lá pra dentro COORDENADA CERTA
	[13531] = {x = 32113, y = 31358, z = 13}, -- de farmine lá pra dentro COORDENADA CERTA
}

function onStepIn(creature, item, position, fromPosition)
	
	local action = action_id[item.actionid]
	if action then
		local player = creature:getPlayer()
		if player == nil then
			return false
		end
		
		player:teleportTo(action)
	--	player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end
	
	return true
end