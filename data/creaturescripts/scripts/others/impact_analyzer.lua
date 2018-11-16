--
-- Created by IntelliJ IDEA.
-- User: jlcvp
-- Date: 11/08/17
-- Time: 11:30
--
local TYPE_HEALING = 1
local TYPE_DAMAGE = 2

local function sendImpactToClient(self, impactType)
    local player = Player(self)
    if player ~= nil then
        if impactType == TYPE_HEALING then
            if healingImpact[self][1] ~= 0 then
                player:sendHealingImpact(healingImpact[self][1])
                healingImpact[self] = nil
            end
        else
            if damageImpact[self][1] ~= 0 then
                player:sendDamageImpact(damageImpact[self][1])
                damageImpact[self] = nil
            end
        end
    end
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

    local player, casterPlayer = creature:getPlayer(), attacker:getPlayer()
    local k, secondsToGetHealing, currentTime = casterPlayer:getId(), 2, os.time()

    if casterPlayer then
        if primaryType == COMBAT_HEALING and player then -- probably a healing (self damage isn't counted)
            -- if time table is null then insert current time
            if healingImpact[k] == nil then
                healingImpact[k] = healingImpact[k] or {0, currentTime}
            end

            healingImpact[k][1] = healingImpact[k][1] + primaryDamage -- damage row

            if currentTime - healingImpact[k][2] > secondsToGetHealing then
                sendImpactToClient(casterPlayer:getId(), TYPE_HEALING) -- sending to client as secondToGetHealing passed
            end

        elseif primaryType ~= COMBAT_HEALING then
            if damageImpact[k] == nil then
                damageImpact[k] = damageImpact[k] or {0, currentTime }
            end

            damageImpact[k][1] = damageImpact[k][1] + math.abs(primaryDamage)

            if currentTime - damageImpact[k][2] > secondsToGetHealing then
                sendImpactToClient(casterPlayer:getId(), TYPE_DAMAGE)
            end
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end