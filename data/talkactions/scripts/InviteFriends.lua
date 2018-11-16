function onSay(player, words, param)
local param = param:lower()
if param == "" or not param then
player:sendCancelMessage("Você precisa digitar o nome de um jogador.") return false
elseif param == "points" then
player:popupFYI("[+] Invite Friend System [+]\n\nvocê tem ["..getInvitePoints(player).."] Friends Points.") return false
elseif hasInviteFriend(player) then
player:sendCancelMessage("Você já agradeceu o jogador ["..getNameFriend(player).."] por te convidar a jogar neste servidor.") return false
elseif not getPlayerGUIDByName(param) then
player:sendCancelMessage("Desculpe, mas o jogador [" .. param .. "] não existe.") return false
elseif player:getLevel() > _invite_friends.level_max or result.getDataInt(db.storeQuery("SELECT `level` FROM `players` WHERE `id` = "..getPlayerGUIDByName(param)), "level") < _invite_friends.level_need then
player:sendCancelMessage((player:getLevel() > _invite_friends.level_max and "Desculpe, mas você precisa ter no maximo level ".._invite_friends.level_max.." para usar este comando." or "Desculpe, mas o jogador ["..param.."] precisa ter no minimo level ".._invite_friends.level_need.." para ser escolhido.")) return false
elseif player:getName():lower() == param then
player:sendCancelMessage("Desculpe, mas você não pode se auto invitar.") return false
end
player:setStorageValue(_invite_friends.storages[2], getPlayerGUIDByName(param))
player:sendTextMessage(25, "Você indicou o jogador "..param..", este sistema é uma forma de agradecer a vocês por trazerem seus amigos para jogar.")
player:getPosition():sendMagicEffect(math.random(28,30))
return false
end