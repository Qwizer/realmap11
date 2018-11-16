local function resetWarzone(info)
    info.locked = false
    local spectators = Game.getSpectators(info.center, false, true, 0, info.rangeX, 0, info.rangeY)
    for i = 1, #spectators do
        spectators[i]:teleportTo(info.exit)
    end
end
 
function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local info = warzoneConfig.findByName(creature:getName())
    if not info then
        return true
    end
 
    info.locked = true
    local spectators = Game.getSpectators(info.center, false, true, 0, info.rangeX, 0, info.rangeY)
    for i = 1, #spectators do
        spectators[i]:setStorageValue(info.storage, os.time() + info.interval)
        spectators[i]:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have one minute to loot the boss and leave the room.")
    end
 
    addEvent(resetWarzone, 60 * 1000, info)
 
    return true
end