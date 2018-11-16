-- <talkaction words="!cast" separator=" " script="start_cast.lua"/>

function onSay(player, words, param)
	
	if param == 'on' then
		if player:startLiveCast() then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have started casting your gameplay.")
		else
			player:sendCancelMessage("You're already casting your gameplay.")
		end
	elseif param == 'off' then
		if player:stopLiveCast() then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have stopped casting your gameplay.")
		else
			player:sendCancelMessage("You're not casting your gameplay.")
		end
	end
	
	return false
end