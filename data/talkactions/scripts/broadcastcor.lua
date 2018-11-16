local color = {
    ['green'] = MESSAGE_INFO_DESCR,
    ['blue'] = MESSAGE_STATUS_CONSOLE_BLUE,
    ['orange'] = MESSAGE_STATUS_CONSOLE_ORANGE,
    ['white'] = MESSAGE_EVENT_ADVANCE,
}
 
 
function onSay(player, words, param)
    if not getPlayerFlagValue(player, PlayerFlag_CanBroadcast) then
        return true
    end
    local split = param:split(",")
 
    if color[split[1]] == nil then
        player:sendCancelMessage("Wrong color")
        return false
    end
 
    broadcastMessage(split[2], color[split[1]])
 
    return false
end