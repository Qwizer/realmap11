local effects = {
    {position = Position(32373, 32239, 7), text = 'TRAINERS', effect = CONST_ME_GROUNDSHAKER},
	{position = Position(32353, 32223, 7), text = 'ARENA PVP', effect = CONST_ME_GROUNDSHAKER},
}
 
function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end