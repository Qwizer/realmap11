function onSay(cid, words, param)

    local player = Player(cid)
    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end

   	_G.cid = cid
   	_G.player = Player(cid)

	function b(msg)
		return player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
	end

	local f, err = loadstring(param)
	if f then
		local ret, err = pcall(f)
		if not ret then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Lua error:\n'..err)
			return false
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Lua error:\n'..err)
		return false
	end
	return false
end