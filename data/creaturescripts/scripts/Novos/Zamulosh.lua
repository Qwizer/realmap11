local posdotp7 = {x=33643, y=32751, z=11}

function MoveStone7() --creates wall back
local criistal7 = getTileItemById(posdotp7, 1353)
if not criistal7 then 
Game.createItem(1353,1,posdotp7)-- Stone pos
else Game.createItem(1353,1,posdotp7)
end 
return true
end

function RemoveStone7()
    local cristal7 = getTileItemById(posdotp7, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal7 then
        doRemoveItem(cristal7.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "zamulosh") then
		    addEvent(RemoveStone7, 5 * 1000)
     	    addEvent(MoveStone7, 300 * 1000)
		end
	end
	return true
end