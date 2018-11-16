local t = {
waitingroom = {x = 32300, y = 32026, z = 12},
}

function onStepIn(cid, item, position, lastPosition)
local player = Player(cid)
if not player then
    return false
end
if (player:getLevel() < 150) then
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'You need level 150 to join this event.')
       player:teleportTo(lastPosition, true)
       return false
end
doTeleportThing(cid, t.waitingroom)
doSendMagicEffect(t.waitingroom, CONST_ME_TELEPORT)



if (getGlobalStorageValue(25002) < 0) then
setGlobalStorageValue(25002,1)
setPlayerStorageValue(cid, 25001, 1)
broadcastMessage("Player "..getCreatureName(cid).." joined Last man standing event!", MESSAGE_STATUS_WARNING)

else

setGlobalStorageValue(25002,getGlobalStorageValue(25002)+1)
setPlayerStorageValue(cid, 25001, 1)

broadcastMessage("Player "..getCreatureName(cid).." joined Last man standing event!", MESSAGE_STATUS_WARNING)
end
end