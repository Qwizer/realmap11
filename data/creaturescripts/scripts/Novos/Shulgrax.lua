local posdotp4 = {x=33487, y=32780, z=13}

function MoveStone4() --creates wall back
local criistal4 = getTileItemById(posdotp4, 1353)
if not criistal4 then 
Game.createItem(1353,1,posdotp4)-- Stone pos
else 
Game.createItem(1353,1,posdotp4)
end 
return true
end

function RemoveStone4()
    local cristal4 = getTileItemById(posdotp4, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal4 then
        doRemoveItem(cristal4.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "shulgrax") then
		    addEvent(RemoveStone4, 5 * 1000)
     	    addEvent(MoveStone4, 300 * 1000)
		end
	end
	return true
end



