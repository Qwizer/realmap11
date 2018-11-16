local config = {
promotion = 1, -- promotion level, default = 1 . Ignore if you don't have new vocations.
minLevel = 20, -- Level needed to buy promotion
cost = 100, -- Promotion cost in gp
premium = "no"  -- is premium needed to buy promotion?
}
 
local disabledVocations = {0}
 

function onSay(cid, words, param)
if(isInArray(disabledVocations, getPlayerVocation(cid)) == TRUE) then
doPlayerSendCancel(cid, "Your vocation cannot buy promotion.")

elseif(config.premium == TRUE and isPremium(cid) == FALSE) then
doPlayerSendCancel(cid, "Voce precisa ser donate para comprar promotion.")
elseif(getPlayerPromotionLevel(cid) >= config.promotion) then
doPlayerSendCancel(cid, "You are already promoted.")
elseif(getPlayerLevel(cid) < config.minLevel) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need level " .. config.minLevel .. " to get promotion.")
elseif(doPlayerRemoveMoney(cid, config.cost) ~= TRUE) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You do not have enought money! (Promotion cost " .. config.cost .. " gp.")
else
setPlayerPromotionLevel(cid, config.promotion)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have been succesful promoted to " .. getVocationInfo(getPlayerVocation(cid)).name .. ".")
end
return TRUE
end