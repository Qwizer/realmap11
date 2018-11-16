-- 

function onThink(interval, lastExecution)
	local messages = {
	"[SEGURANÇA]: Nunca use a mesma senha de outros servidores, pois você estará facilitando a vida dos hackers.",
	"[SEGURANÇA]: Proteja sua senha. Use-a apenas em nosso website oficial."
}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE) 
    return true
end

