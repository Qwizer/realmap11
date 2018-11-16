local config = {
    whitelist = {
        'Lucas Rush', 'Pai The Brutho', 'Zhiend'
    },
 
    time = 60, -- tempo em minutos
}
 
local muted = Condition(CONDITION_MUTED)
muted:setParameter(CONDITION_PARAM_TICKS, config.time * 60 * 1000)
 
function onSay(player, words, param)
    local found = false
    for _, name in ipairs(config.whitelist) do
        if player:getName():lower() == name:lower() then
            found = true
            break
        end
    end
 
    if not found then
        return false
    end
 	if player:getAccountType() < ACCOUNT_TYPE_SENIORTUTOR then
			return false
		end
    local target = Player(param)
    if not target then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Player not found.")
    else
        if words == '/muteall' then
            target:addCondition(muted)
        elseif words == '/unmuteall' then
            target:removeCondition(CONDITION_MUTED)
        end
    end
 
    return false
end