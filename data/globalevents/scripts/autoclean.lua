
local function cleanMake()
	Game.broadcastMessage('Map Cleaned, next clean in 2 hour.', MESSAGE_EVENT_ADVANCE)

	cleanMap()
end

function onThink(interval)
	Game.broadcastMessage('The server will CLEAN all map items within 60 seconds, possibly will have lag for 5 seconds, pick up your items.', MESSAGE_EVENT_ADVANCE)
	addEvent(cleanMake, 60000)
	return true
end