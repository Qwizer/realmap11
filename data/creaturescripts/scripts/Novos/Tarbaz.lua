local posdotp5 = {x=33457, y=32837, z=11}

function MoveStone5() --creates wall back
local criistal5 = getTileItemById(posdotp5, 1353)
if not criistal5 then 
Game.createItem(1353,1,posdotp5)-- Stone pos
else 
Game.createItem(1353,1,posdotp5)
end 
return true
end

function RemoveStone5()
    local cristal5 = getTileItemById(posdotp5, 1353) -- Id do cristal azul que some para dar lugar ao tp
    if cristal5 then
        doRemoveItem(cristal5.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "tarbaz") then
		    addEvent(RemoveStone5, 5 * 1000)
     	    addEvent(MoveStone5, 300 * 1000)
		end
	end
	return true
end