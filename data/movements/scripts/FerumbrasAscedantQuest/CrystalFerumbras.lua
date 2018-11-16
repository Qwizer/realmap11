local config = {
	[10773] = {
		corpse = 8967,
		boss = 'Rift Invader',
		effect = CONST_ME_BIGCLOUDS,
		summonPos = Position(33392, 31473, 14),
		summonPos1 = Position(33390, 31469, 14),
		summonPos2 = Position(33394, 31469, 14),
		summonPos3 = Position(33388, 31475, 14),
		summonPos4 = Position(33388, 31471, 14),
		summonPos5 = Position(33396, 31475, 14),
		summonPos6 = Position(33396, 31471, 14),
		summonPos7 = Position(33390, 31477, 14),
		summonPos8 = Position(33394, 31477, 14)
	}
}

function onAddItem(moveitem, tileitem, position)
	local target = config[tileitem.itemid]
	if not target then
		return true
	end

	if target.corpse ~= moveitem.itemid then
		return true
	end
        if tileitem.actionid == 45690 and (getTileItemById({x = 33387, y = 31475, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33387, y = 31475, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,6)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 5 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 6 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        elseif tileitem.actionid == 45691 and (getTileItemById({x = 33387, y = 31471, z = 14}, 17580).uid ~= 0) then
            doTransformItem(getTileItemById({x = 33387, y = 31471, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,6)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 5 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 6 then
		Game.createMonster(target.boss, target.summonPos)
           end
        elseif tileitem.actionid == 45692 and (getTileItemById({x = 33390, y = 31478, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33390, y = 31478, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,6)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 5 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 6 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        elseif tileitem.actionid == 45693 and (getTileItemById({x = 33394, y = 31478, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33394, y = 31478, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,4)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 3 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        elseif tileitem.actionid == 45694 and (getTileItemById({x = 33397, y = 31475, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33397, y = 31475, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,4)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        elseif tileitem.actionid == 45695 and (getTileItemById({x = 33397, y = 31471, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33397, y = 31471, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,6)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 5 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 6 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        elseif tileitem.actionid == 45696 and (getTileItemById({x = 33390, y = 31468, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33390, y = 31468, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,6)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 5 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 6 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        elseif tileitem.actionid == 45697 and (getTileItemById({x = 33394, y = 31468, z = 14}, 17580).uid ~= 0) then
           doTransformItem(getTileItemById({x = 33394, y = 31468, z = 14}, 17580).uid, 17586)
	   local chance = math.random(1,4)
	   if chance < 1 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 2 then
		Game.createMonster(target.boss, target.summonPos)
	   elseif chance < 3 then
	        local spectators, spectator = Game.getSpectators(Position(33392, 31473, 14), false, false, 15, 15, 15, 15)
	        for i = 1, #spectators do
		spectator = spectators[i]
		    if spectator:isMonster() then
		     	spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		    end
	        end
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos1)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos2)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos3)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos4)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos6)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos7)
		Game.createMonster('Ferumbras Soul Splinter', target.summonPos8)
	   elseif chance < 4 then
		Game.createMonster(target.boss, target.summonPos)
	   end
        end
	return true
end