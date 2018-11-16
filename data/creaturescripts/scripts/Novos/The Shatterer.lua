local posdotp6 = {x=33392, y=32400, z=14}

function MoveStone6() --creates wall back
 local criistal6 = getTileItemById(posdotp6, 1353)
 if not criistal6 then 
Game.createItem(1353,1,posdotp6)-- Stone pos
else 
Game.createItem(1353,1,posdotp6)
end 
return true 
end

function RemoveStone6()
    local cristal6 = getTileItemById(posdotp6, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal6 then
        doRemoveItem(cristal6.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "the shatterer") then
		    addEvent(RemoveStone6, 5 * 1000)
     	    addEvent(MoveStone6, 300 * 1000)
		end
	end
	return true
end