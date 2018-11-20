CITY_WAR_FIRST      = 0
CITY_WAR_EDRON     = 0
CITY_WAR_YALAHAR  = 1
CITY_WAR_DARASHIA      = 2
CITY_WAR_LIBERTYBAY  = 3
CITY_WAR_LAST       = 3
 
CW_RETURNVALUE_NOERROR = 0
CW_RETURNVALUE_LIVEINVITE = 1
CW_RETURNVALUE_INVITERINWAR = 2
CW_RETURNVALUE_INVITEDINWAR = 3
CW_RETURNVALUE_TOOFEWPLAYERS = 4
CW_RETURNVALUE_TOOFEWUNIQUEIPS = 5
 
local function capitalize(self)
    local tmp = self:lower()
    return tmp:sub(1, 1):upper() .. tmp:sub(2)
end
 
local function reduce(list, predicate)
    local ret = list[1]
    for i = 2, #list do
        ret = predicate(ret, list[i])
    end
    return ret
end
 
local function resumeThread(thread, info, ...)
    local suc, tmp = coroutine.resume(thread, ...)
    if not suc then
        error(tmp)
    end
 
    local wait = tonumber(tmp)
    if wait then
        info.id = addEvent(resumeThread, wait, thread, info)
    end
end
 
local function addThread(func, delay, ...)
    local thread = coroutine.create(func)
    local info = { }
    if delay == 0 then
        resumeThread(thread, info, ...)
    else
        info.id = addEvent(resumeThread, delay, thread, info, ...)
    end
    return info
end
 
if not CityWars then
    CityWars = {
        cityWarDuration = 2 * 60 * 60,
        cityWarStorage = 15600,
        rankingLimit = 10, -- How many players should appear in the ranking message
        minGuildSize = 10, -- How many guild members need to be online
        minDifferentIPs = 10, -- Minimum number of unique ips
        inviteItemId = 1949,
        buyInMultiplier = 50000,
        fragLimitMultiplier = 5,
        teamSizeMultiplier = 10,
 
        minGuildRank = 3, -- Minimum guild rank to start/accept/cancel a city war
        removeConditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_INFIGHT},
        -- [invitedName] = { {city = City, invitedPlayer = Player, invitedGuild = Guild, inviterPlayer = Player, inviterGuild = Guild, options = { }} }
        invites = {},
       
        [CITY_WAR_EDRON] = {
            spawns = {
                -- Team 1 position
                [1] = Position(30974, 32641, 7),
                -- Team 2 position
                [2] = Position(30909, 32519, 7),
            },
 
            name = 'edron',
 
            --  [playerId] = {player = player, name = name, team = 1/2, kills = 0, deaths = 0}
            players = { },
 
            -- [team] = {guild = guild, name = name, kills = 0, deaths = 0}
            teams = { }
        },
 
        [CITY_WAR_DARASHIA] = {
            spawns = {
                -- Team 1 position
                [1] = Position(31217, 32552, 7),
                -- Team 2 position
                [2] = Position(31295, 32639, 7),
            },
 
            name = 'darashia',
 
            --  [playerId] = {player = player, name = name, team = 1/2, kills = 0, deaths = 0}
            players = { },
 
            -- [team] = {guild = guild, name = name, kills = 0, deaths = 0}
            teams = { }
        },
 
        [CITY_WAR_LIBERTYBAY] = {
            spawns = {
                -- Team 1 position
                [1] = Position(30740, 32734, 7),
                -- Team 2 position
                [2] = Position(30767, 32567, 7),
            },
 
            name = 'liberty bay',
 
            --  [playerId] = {player = player, name = name, team = 1/2, kills = 0, deaths = 0}
            players = { },
 
            -- [team] = {guild = guild, name = name, kills = 0, deaths = 0}
            teams = { }
        },
 
        [CITY_WAR_YALAHAR] = {
            spawns = {
                -- Team 1 position
                [1] = Position(30925, 32825, 7),
                -- Team 2 position
                [2] = Position(30982, 32827, 7),
            },
 
 
            name = 'yalahar',
 
            --  [playerId] = {player = player, name = name, team = 1/2, kills = 0, deaths = 0}
            players = { },
 
            -- [team] = {guild = guild, name = name, kills = 0, deaths = 0}
            teams = { },
        },
    }
 
    local City = {}
    City.__index = City
 
    for i = CITY_WAR_FIRST, CITY_WAR_LAST do
        setmetatable(CityWars[i], City)
    end
 
    function City:onStart()
        if not self.endEvent then
            self.endEvent = addThread(
                function(city)
                    for i = 10, 1, -1 do
                        city:countdown(i)
                        coroutine.yield(60 * 1000)
                    end
 
                    local winner      
                    if self.teams[1].kills > self.teams[2].kills then
                        winner = 1
                    elseif self.teams[1].kills < self.teams[2].kills then
                        winner = 2
                    end
 
                    city:onEnd(winner)                
                end,
 
                (CityWars.cityWarDuration - 10 * 60) * 1000,
 
                self
            )
        end
    end
 
    function City:onEnd(winner)
        stopEvent(self.endEvent.id)
 
        for k, v in pairs(self.players) do
            if v.player and v.player:getStorageValue(CityWars.cityWarStorage) > 0 then
                v.player:teleportTo(v.player:getTown():getTemplePosition())
                v.player:addHealth(v.player:getMaxHealth())
                v.player:addMana(v.player:getMaxMana())
                v.player:setStorageValue(CityWars.cityWarStorage, -1)
                v.player:unregisterEvent('CityWarDeath')
                for _, cond in ipairs(CityWars.removeConditions) do
                    v.player:removeCondition(cond, CONDITIONID_DEFAULT)
                end
            end
        end    
 
        self:broadcastMessage(self:getRank())
 
        if not winner then
            self:broadcastMessage('The war has ended, it is a draw!')
 
            local guild1 = Guild(self.teams[1].id)
            local guild2 = Guild(self.teams[2].id)
            if guild1 then
                guild1:setBankBalance(guild1:getBankBalance() + self.options.buyIn)
            end
            if guild2 then
                guild2:setBankBalance(guild2:getBankBalance() + self.options.buyIn)
            end
        else
            self:broadcastMessage('The war has ended, "' .. self.teams[winner].name .. '" have won the war and taken home the prize of ' .. (2 * self.options.buyIn) .. ' gold coins.')
 
            local winnerGuild = Guild(self.teams[winner].id)
            if winnerGuild then
                winnerGuild:setBankBalance(winnerGuild:getBankBalance() + 2 * self.options.buyIn)
            end
        end    
 
        self.players = { }
        self.teams = { }
        self.options = { }
        self.endEvent = nil
    end
 
    function City:onCancel(player)
        if player:getGuildLevel() < CityWars.minGuildRank then
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Only leaders can cancel an ongoing city war.')
            return false
        end
 
        local registry = self.players[player:getGuid()]
        self:broadcastMessage(player:getName() .. ' has forfeited the war.')
 
        self:onEnd((registry.team == 1) and 2 or 1)
    end
 
    function City:onCastSpell(player, kind)
        if player:getStorageValue(CityWars.cityWarStorage) > 0 then
            if kind == 'ultimateExplosion' and not self.options.ultimateExplosion then
                return false
            elseif kind == 'areaSpell' and self.options.suddenDeathOnly then
                return false
            end
        end
        return true
    end
 
    function City:onScoreUpdated()
        local winner
        for i, team in ipairs(self.teams) do
            if team.kills >= self.options.fragLimit then
                winner = i
                break
            end    
        end
 
        self:broadcastScore()
        if winner then    
            self:onEnd(winner)
        end
    end
 
    function City:onJoin(player)
        local registry = self.players[player:getGuid()]
        local team = self.teams[registry.team]
        if team.players < self.options.teamSize then
            if player:getStorageValue(CityWars.cityWarStorage) < 0 then
                team.players = team.players + 1
 
                player:registerEvent('CityWarDeath')
                player:setStorageValue(CityWars.cityWarStorage, 1)
                player:teleportTo(self.spawns[registry.team])
            end
        else
            player:sendTextMessage('Your guild has reached the team limit! You may not join them right now.')
        end
    end
 
    function City:onDeath(player, registry, killer)
        if player:getStorageValue(CityWars.cityWarStorage) > 0 then        
            player:teleportTo(self.spawns[registry.team])
            player:addHealth(player:getMaxHealth())
            player:addMana(player:getMaxMana())
            for _, cond in ipairs(CityWars.removeConditions) do
                player:removeCondition(cond, CONDITIONID_DEFAULT)
            end
 
            registry.deaths = registry.deaths + 1
            local team = self.teams[registry.team]
            team.deaths = team.deaths + 1
 
            local killerRegistry
            if killer then
                if not killer:isPlayer() then
                    killer = killer:getMaster()
 
                    if not killer or not killer:isPlayer() then
                        killer = nil
                    end
                end
 
                if killer then
                    local _
                    _, killerRegistry = CityWars.getPlayerWar(killer)      
                end
            end
 
            if killerRegistry and killerRegistry.team ~= registry.team then
                killerRegistry.kills = killerRegistry.kills + 1
            end        
 
            local enemyTeam = self.teams[(registry.team == 1) and 2 or 1]
            enemyTeam.kills = enemyTeam.kills + 1
 
            self:onScoreUpdated()
            return true
        end
 
        return false
    end
 
    function City:onLeave(player)      
        if player:getStorageValue(CityWars.cityWarStorage) > 0 then        
            player:unregisterEvent('CityWarDeath')
            player:setStorageValue(CityWars.cityWarStorage, -1)
            player:teleportTo(player:getTown():getTemplePosition())
            for _, cond in ipairs(CityWars.removeConditions) do
                player:removeCondition(cond, CONDITIONID_DEFAULT)
            end
 
            local registry = self.players[player:getGuid()]
            registry.player = nil
            -- update team's player count
            local team = self.teams[registry.team]
            team.players = team.players - 1        
        end
    end
    City.onLogout = City.onLeave
 
    function City:getName()
        return capitalize(self.name)
    end
 
    function City:addPlayer(player, team)
        local current = self.players[player:getGuid()]
        if not current then
            current = {player = player, team = team, name = player:getName(), kills = 0, deaths = 0}
        else
            -- update player object
            current.player = player
        end
        self.players[player:getGuid()] = current
    end
 
    function City:countdown(minutesLeft)
        self:broadcastMessage('Countdown: ' .. minutesLeft .. ' minutes until the war ends.')
    end
 
    function City:broadcastMessage(msg)
        for k, v in pairs(self.players) do
            if v.player then
                v.player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
            end
        end
    end
 
    local broadcastFormat = 'Score: "%s" (%d) versus "%s" (%d)'
    function City:broadcastScore()
        self:broadcastMessage(broadcastFormat:format(self.teams[1].name, self.teams[1].kills, self.teams[2].name, self.teams[2].kills))
    end
 
    function City:getRank()
        local rank = {}
        for k, v in pairs(self.players) do
            table.insert(rank, {name = v.name, kills = v.kills, deaths = v.deaths, guildName = self.teams[v.team].name})
        end
        table.sort(rank,
            function(a, b)
                if a.kills ~= b.kills then
                    return a.kills > b.kills
                end
                return a.deaths < b.deaths
            end        
        )
        local msg = 'Ranking:'
        for i = 1, CityWars.rankingLimit do
            local player = rank[i]
            if player then            
                msg = msg .. '\n' .. i .. '. ' .. player.name .. ' - ' .. player.kills .. '/' .. player.deaths .. ' From: "' .. player.guildName .. '"'
            end
        end
        return msg
    end
 
    local winFormat = '"%s" has beaten "%s" by %d to %d kills.'
    local drawFormat = 'The city war between "%s" and "%s" resulted in a draw.'
    function City:broadcastResult()
        local msg
        if self.teams[1].kills > self.teams[2].kills then
            msg = winFormat:format(self.teams[1].name, self.teams[2].name, self.teams[1].kills, self.teams[2].kills)
        elseif self.teams[1].kills < self.teams[2].kills then
            msg = winFormat:format(self.teams[2].name, self.teams[1].name, self.teams[2].kills, self.teams[1].kills)
        else
            msg = drawFormat:format(self.teams[1].name, self.teams[2].name)
        end
 
        self:broadcastMessage(msg)
    end
 
    function City:isFree()
        return #self.teams == 0
    end
end
 
function CityWars.getCityByName(name)
    for i = CITY_WAR_FIRST, CITY_WAR_LAST do
        local city = CityWars[i]
        if city.name == name then
            return city
        end
    end
 
    return nil
end
 
function CityWars.getPlayerWar(player, registerPlayer)
    local playerGuild = player:getGuild()
    if not playerGuild then
        return nil
    end
    for i = CITY_WAR_FIRST, CITY_WAR_LAST do
        local city = CityWars[i]
        if not city:isFree() then
            for k, team in ipairs(city.teams) do
               
                if team.id == playerGuild:getId() then
                    local guid = player:getGuid()
                    local registry = city.players[guid]
                    if registerPlayer and (not registry or registry.team ~= k) then
                        registry = {player = player, name = player:getName(), team = k, kills = 0, deaths = 0}
                        city.players[guid] = registry
                    end
                    return city, registry
                end
            end
        end
    end
end
 
function CityWars.isValidGuild(guild)
    local onlineMembers = guild:getMembersOnline()
    if #onlineMembers < CityWars.minGuildSize then
        return CW_RETURNVALUE_TOOFEWPLAYERS
    end
 
    local uniqueIPs = 0
    local addressMap = {}
    for k, v in ipairs(onlineMembers) do
        local ip = v:getIp()
        if ip ~= 0 and not addressMap[ip] then
            addressMap[ip] = true
            uniqueIPs = uniqueIPs + 1
        end
    end
    if uniqueIPs < CityWars.minDifferentIPs then
        return CW_RETURNVALUE_TOOFEWUNIQUEIPS
    end
 
    return CW_RETURNVALUE_NOERROR
end
 
function CityWars.getGuildWar(guild)
    for i = CITY_WAR_FIRST, CITY_WAR_LAST do
        local city = CityWars[i]
        if not city:isFree() then
            for k, team in ipairs(city.teams) do
                if team.id == guild:getId() then
                    return city
                end
            end
        end
    end
end
 
function CityWars.getInvites(guildName)
    return CityWars.invites[guildName]
end
 
function CityWars.onInviteExpired(invite)
    for k, _invite in ipairs(invite.invites) do
        if _invite == invite then
            local player = Player(invite.inviterPlayerName)
            if player then
                local guild = Guild(invite.invitedGuildId)
                local guildName = guild and guild:getName() or 'deleted guild'
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Your city war invite for guild "' .. guildName .. '" has expired.')
            end
 
            if invite.invitedLeaders then
                local guild = Guild(invite.inviterGuildId)
                local guildName = guild and guild:getName() or 'deleted guild'
                for _, leaderName in ipairs(invite.invitedLeaders) do
                    local leader = Player(leaderName)
                    if leader then
                        leader:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You failed to answer the city war invite from guild "' .. guildName .. '" and it is now expired.')
                    end
                end
            end
 
            table.remove(invite.invites, k)
            return
        end
    end
end
 
local optionsFormat = 'City: %s | Buy in: %d gold %s | Frag limit: %d | U.E: %s | S.D only: %s | Team size: %d'
function CityWars.getOptionsString(options)
    return optionsFormat:format(options.city:getName(), options.buyIn, (options.buyIn == 1) and 'coin' or 'coins', options.fragLimit, options.ultimateExplosion and 'enabled' or 'disabled', options.suddenDeathOnly and 'true' or 'false', options.teamSize)
end
 
function CityWars.onInviteAccepted(player, invite)
    for k, _invite in ipairs(invite.invites) do
        if _invite == invite then
            stopEvent(invite.expireEvent)
            table.remove(invite.invites, k)
 
            if not invite.city:isFree() then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, invite.city:getName() .. ' is not free anymore.')
                return false
            end        
 
            local inviterGuild = Guild(invite.inviterGuildId)
            if not inviterGuild then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Inviter guild does not exist anymore.')              
                return false
            elseif CityWars.getGuildWar(inviterGuild) then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'The inviter guild is already in war.')
            end
 
            local invitedGuild = Guild(invite.invitedGuildId)
            if not invitedGuild then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You do not belong to a guild.')              
                return false
            elseif CityWars.getGuildWar(invitedGuild) then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You can not accept a war invite while in another one.')
                return false
            end
 
            local msg
            local start = false
            if inviterGuild:getBankBalance() < invite.options.buyIn then
                msg = 'The guild "' .. inviterGuild:getName() .. '" can not participate in this war due to lack of funds in its guild bank.'
            elseif invitedGuild:getBankBalance() < invite.options.buyIn then
                msg = 'The guild "' .. invitedGuild:getName() .. '" can not participate in this war due to lack of funds in its guild bank.'
            else
                inviterGuild:setBankBalance(inviterGuild:getBankBalance() - invite.options.buyIn)
                invitedGuild:setBankBalance(invitedGuild:getBankBalance() - invite.options.buyIn)
                start = true
                msg = 'A city war between the guilds "' .. inviterGuild:getName() .. '" and "' .. invitedGuild:getName() .. '" has begun!\n' ..
                    CityWars.getOptionsString(invite.options) .. '\n' ..
                    'If you wish to join, head to a temple and read the guild book.'
            end
 
            for _, player in ipairs(inviterGuild:getMembersOnline()) do
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
                if start then
                    invite.city:addPlayer(player, 1)
                end
            end
 
            for _, player in ipairs(invitedGuild:getMembersOnline()) do
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
                if start then
                    invite.city:addPlayer(player, 2)
                end
            end
 
            if start then
                invite.city.teams = {
                    {id = invite.inviterGuildId, name = inviterGuild:getName(), kills = 0, deaths = 0, players = 0},
                    {id = invite.invitedGuildId, name = invitedGuild:getName(), kills = 0, deaths = 0, players = 0}
                }
                invite.city.options = invite.options
                invite.city:onStart()
            end
 
            return true
        end
    end
    return false
end
 
function CityWars.onInvite(city, inviter, invitedGuild, invitedLeaders, options)
    if CityWars.getGuildWar(inviter:getGuild()) then
        return CW_RETURNVALUE_INVITERINWAR
    end
 
    if CityWars.getGuildWar(invitedGuild) then
        return CW_RETURNVALUE_INVITEDINWAR
    end
 
    local invites = CityWars.invites[invitedGuild:getName()]
    if invites and #invites ~= 0 then
        for _, invite in ipairs(invites) do
            local guild = Guild(invite.inviterGuildId)
            if guild and guild:getId() == inviter:getGuild():getId() then
                return CW_RETURNVALUE_LIVEINVITE
            end
        end
    elseif not invites then
        invites = { }
        CityWars.invites[invitedGuild:getName()] = invites
    end
 
    local invitedLeadersNames = {}
    for k, v in ipairs(invitedLeaders) do
        table.insert(invitedLeadersNames, v:getName())
    end
 
    local invite = {
        city = city,
        invites = invites,
        inviterPlayerName = inviter:getName(),
        inviterGuildId = inviter:getGuild():getId(),
        invitedGuildId = invitedGuild:getId(),
        invitedLeaders = invitedLeadersNames,
        options = options
    }
    invite.expireEvent = addEvent(CityWars.onInviteExpired, 15 * 1000, invite)
    table.insert(invites, invite)
 
    return CW_RETURNVALUE_NOERROR
end