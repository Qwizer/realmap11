local t = {
depot = {x = 33082, y = 31905, z = 12},
}

function onStepIn(cid, item, position, lastPosition)
if not isPlayer(cid) then
        return false
    end
doTeleportThing(cid, t.depot)
doSendMagicEffect(t.depot, CONST_ME_TELEPORT)


end