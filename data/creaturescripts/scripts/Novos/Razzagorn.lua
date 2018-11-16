local posdotp3 = {x=33433, y=32469, z=14}

function MoveStone3() --creates wall back
local criistal3 = getTileItemById(posdotp3, 1353)
if not criistal3 then
Game.createItem(1353,1,posdotp3)-- Stone pos
else 
Game.createItem(1353,1,posdotp3)
end
return true
end

function RemoveStone3()
    local cristal3 = getTileItemById(posdotp3, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal3 then
        doRemoveItem(cristal3.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "razzagorn") then
		    addEvent(RemoveStone3, 5 * 1000)
     	    addEvent(MoveStone3, 300 * 1000)
		end
	end
	return true
end



