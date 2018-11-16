if not warzoneConfig then
    warzoneConfig = {
        -- Warzone 
        [45700] = {  -- action do movement
            center = Position(33117, 31956, 11),   -- centro da room do boss
            rangeX = 27, rangeY = 25,
 
            boss = "Gnomevil",   -- nome do boss 
            teleportTo = Position(33106, 31955, 11),   -- Local onde o player será teleportado dentro da room
            locked = false,
 
            storage = 790014,    -- storage 
            interval = 10 * 60 * 60,
 
            exit = Position(33001, 31900, 9)   -- Exit padrão
        },
		
		
		-- Warzone 
        [45702] = {  -- action do movement
            center = Position(33110, 31965, 10), -- centro da room do boss
            rangeX = 26, rangeY = 25,
 
            boss = "Deathstrike",   -- nome do boss 
            teleportTo = Position(33096, 31955, 10),   -- Local onde o player será teleportado dentro da room
            locked = false,
 
            storage = 790015,    -- storage 
            interval = 10 * 60 * 60,
 
            exit = Position(33001, 31900, 9)   -- Exit padrão
        },
		
		-- Warzone 
        [45701] = {  -- action do movement
            center = Position(33090, 31910, 12), 
            rangeX = 20, rangeY = 20,
 
            boss = "Abyssador",   -- nome do boss 
            teleportTo = Position(33083, 31904, 12),  -- Local onde o player será teleportado dentro da room
            locked = false,
 
            storage = 790016,    -- storage 
            interval = 10 * 60 * 60,
 
            exit = Position(33001, 31900, 9)   -- Exit padrão
        }
		
		
    }
 
    warzoneConfig.findByName = function(name, last)
        local i, v = next(warzoneConfig, last)
        if type(v) == 'table' and v.boss == name then
            return v
        elseif not i then
            return nil
        end
        return warzoneConfig.findByName(name, i)
    end
end
 
local function filter(list, f, i)
    if i < #list then
        if f(list[i]) then
            return list[i], filter(list, f, i + 1)
        else
            return filter(list, f, i + 1)
        end
    elseif list[i] and f(list[i]) then
        return list[i]
    end
end
 
function onStepIn(creature, item, pos, fromPosition)
    if not creature:isPlayer() then
        creature:teleportTo(fromPosition)
        return false
    end
 
    local info = warzoneConfig[item:getActionId()]
    if not info then
        return false
    end
 
    if  creature:getStorageValue(info.storage) > os.time() then
        creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have already cleared this warzone in the last ten hours.")
        creature:teleportTo(fromPosition)
        return false
    end
 
    if info.locked then
        creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Please, wait a minute until the room is cleared.")
        creature:teleportTo(fromPosition)
        return false
    end
 
    creature:teleportTo(info.teleportTo)
    local spectators = Game.getSpectators(info.center, false, false, 0, info.rangeX, 0, info.rangeY)
    if not filter(spectators, function(c) return c:isMonster() end, 1) then
        local boss = Game.createMonster(info.boss, info.center)
        boss:registerEvent('WarzoneBossDeath')
    end
 
    return true
end