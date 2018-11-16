local posdotp = {x=33582, y=32681, z=14}

function MoveStone() --creates wall back
local criistal1 = getTileItemById(posdotp, 1353)
   if not criistal1 then 
    Game.createItem(1353,1,posdotp)-- Stone pos
	else 
	Game.createItem(1353,1,posdotp)
   end 
   return true
end

function RemoveStone()
    local cristal = getTileItemById(posdotp, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal then
        doRemoveItem(cristal.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "mazoran") then
		    addEvent(RemoveStone, 5 * 1000)
     	    addEvent(MoveStone, 300 * 1000)
		end
	end
	return true
end


