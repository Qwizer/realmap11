local config = {
maxMultiClients = 3,
level = 999,
ignoreIps = {}
}

function onLogin(cid)

local number
local playersOnline = Game.getPlayers()
local player = Player(cid)

for _, pid in pairs(playersOnline) do
	if getPlayerLevel(pid) < config.level then
		local pip = getPlayerIp(pid)
			if cid ~= pid and getPlayerIp(cid) == pip and not isInArray(config.ignoreIps, Game.convertIpToString(getPlayerIp(cid))) then
				number = (number or 0) + 1
				if number > config.maxMultiClients then
				return false
				end
			end
	end
end

return true
end