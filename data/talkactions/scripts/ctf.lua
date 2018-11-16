--[[
File: ctf.lua (talkactions)

<talkaction words="/ctf" separator=" " script="ctf.lua" />
]]

function onSay(player, words, param)
	local access = player:getGroup():getAccess()
	local god = player:getAccountType() >= ACCOUNT_TYPE_GOD 

	local p = param:split(',')
	if p[1] == 'start' then
		if not access then
			return true
		elseif not god then
			return false
		end

		captureTheFlag.start()
	elseif p[1] == 'close' then
		if not access then
			return true
		elseif not god then
			return false
		end

		captureTheFlag.close()
	elseif p[1] == 'round' then
		if not access then
			return true
		elseif not god then
			return false
		end

		captureTheFlag.round()
	--[[
	elseif p[1] == 'item' then
		local item = Game.createItem(tonumber(p[2]), 1, player:getPosition())
		item:setActionId(tonumber(p[3]))
	]]
	end
	return false
end
