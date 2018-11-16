function onUse(cid, item)

if getGlobalStorageValue(configExf.stats) == 1 then
	doTeleportThing(cid, configExf.templepos)
	doCloseExf()
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You won The Exchanted Forest event and have found a Master Surprise Bag!")
	doBroadcastMessage(getPlayerName(cid) .. " has won The Exchanted Forest event.")
	doPlayerAddItem(cid, configExf.prize)
else
	doPlayerSendCancel(cid, "Sorry, the event is closed")
end

return true
end