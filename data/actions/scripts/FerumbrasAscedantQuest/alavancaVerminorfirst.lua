-- Ferumbras Quest feita por Ciroc
function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
		    pos1 = {x = 33201, y = 31475, z = getCreaturePosition(cid).z}            
	            pos2 = {x = 33200, y = 31475, z = getCreaturePosition(cid).z}
		    pos3 = {x = 33199, y = 31475, z = getCreaturePosition(cid).z}
			pos4 = {x = 33198, y = 31475, z = getCreaturePosition(cid).z}
			pos5 = {x = 33197, y = 31475, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1).uid)) then
				    if(isPlayer(getTopCreature(pos2).uid)) then
				        if(isPlayer(getTopCreature(pos3).uid)) then
				            if(isPlayer(getTopCreature(pos4).uid)) then
				                if(isPlayer(getTopCreature(pos5).uid)) then
                                                         doSummonCreature("the lord of the lice", {x=33217, y=31454, z=12}) 
                                                         item:transform(item.itemid == 9825 and 9826 or 9825)                         
					                 doTeleportThing(getTopCreature(pos1).uid, {x = 33208, y = 31434, z = 12})
					                 doTeleportThing(getTopCreature(pos2).uid, {x = 33208, y = 31434, z = 12})
					                 doTeleportThing(getTopCreature(pos3).uid, {x = 33208, y = 31434, z = 12})
					                 doTeleportThing(getTopCreature(pos4).uid, {x = 33208, y = 31434, z = 12})
					                 doTeleportThing(getTopCreature(pos5).uid, {x = 33208, y = 31434, z = 12})
			                        else
                                                         doPlayerSendTextMessage(cid,21,"You need 5 players in certain floors to proceed.")
		                                end
			                    else
                                                         doPlayerSendTextMessage(cid,21,"You need 5 players in certain floors to proceed.")
		                            end
			                else
                                                         doPlayerSendTextMessage(cid,21,"You need 5 players in certain floors to proceed.")
		                        end
			           else
                                                         doPlayerSendTextMessage(cid,21,"You need 5 players in certain floors to proceed.")
		                   end
	                        else
                                                         doPlayerSendTextMessage(cid,21,"You need 5 players in certain floors to proceed.")
		                end
	return true
end