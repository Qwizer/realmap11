local posdotp2 = {x=33484, y=32326, z=13}

function MoveStone2() --creates wall back
local criistal2 = getTileItemById(posdotp2, 1353)
if not criistal2 then 
Game.createItem(1353,1,posdotp2)-- Stone pos
else 
Game.createItem(1353,1,posdotp2)
end
return true

end

function RemoveStone2()
    local cristal2 = getTileItemById(posdotp2, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal2 then
        doRemoveItem(cristal2.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "ragiaz") then
		    addEvent(RemoveStone2, 5 * 1000)
     	    addEvent(MoveStone2, 300 * 1000)
		end
	end
	return true
end



