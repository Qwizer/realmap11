-- Ferumbras Quest feita por Ciroc
function onUse(cid, item, fromPosition, itemEx, toPosition)
        pos = getPlayerPosition(cid)
	if(item.itemid == 24838) then
                if(itemEx.itemid == 24830) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54987,1)
                end
                if(itemEx.itemid == 24831) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54988,1)
                end
                if(itemEx.itemid == 24832) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54985,1)
                end
                if(itemEx.itemid == 24833) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54986,1)
                end
		if(itemEx.itemid == 24834) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54982,1)
		end
		if(itemEx.itemid == 24835) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54983,1)
		end
		if(itemEx.itemid == 24836) then
		doTeleportThing(cid, {x=pos.x, y=pos.y, z=pos.z-1})
                setPlayerStorageValue(cid, 54984,1)
		end
	end
	return true
end