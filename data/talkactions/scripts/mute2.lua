function onSay(player, words, param)

    local storage = 456112

    if words == "/mute2" then
        local mute = param:split(",")

        if mute[1] == nil or mute[1] == " " then
            player:sendCancelMessage("Invalid player specified.")
            return false
        end

        if mute[2] == nil or mute[2] == " " then
            player:sendCancelMessage("Invalid time specified.")
            return false
        end

        local target = Player(mute[1])
        local time = tonumber(mute[2])
        local condition = Condition(CONDITION_MUTED)
        condition:setParameter(CONDITION_PARAM_TICKS, time*60*1000)

        if player:getAccountType() < ACCOUNT_TYPE_TUTOR then
            return false
        end

        if target == nil then
            player:sendCancelMessage("A player with that name is not online.")
            return false
        end

        if target:getAccountType() >= ACCOUNT_TYPE_TUTOR then
            player:sendCancelMessage("Only player can be mutated")
            return false
        end

        target:addCondition(condition)
        target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been muted by " .. player:getName() .. " , to "..time.. " minutes.")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You muted " .. target:getName() .." to "..time.." minutes.")
        target:setStorageValue(storage, 1)
        return false
    end

    if words == "/unmute2" then

        local remove = Player(param)

        if player:getAccountType() < ACCOUNT_TYPE_TUTOR then
            return false
        end

        if remove == nil then
            player:sendCancelMessage("A player with that name is not online.")
            return false
        end

        if remove:getAccountType() >= ACCOUNT_TYPE_TUTOR then
            return false
        end

        if remove:getStorageValue(storage) == 1 then
            remove:removeCondition(CONDITION_MUTED)
            remove:setStorageValue(storage, -1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have unmute" .. remove:getName() ..".")
            remove:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been unmute by " .. player:getName() ..".")
        else
            player:sendCancelMessage("A player " .. remove:getName() .. "is not mutated")
        end
    end

    return false
end