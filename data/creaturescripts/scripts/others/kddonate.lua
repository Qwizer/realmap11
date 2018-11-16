function onKill(creature, target)
    if not target:isPlayer() then
        return true
    end

    local creatureId, player = creature.uid
    for id, damage in pairs(target:getDamageMap()) do
        player = Player(id)
        if player and id ~= creatureId then
            player:setStorageValue(100, math.max(0, player:getStorageValue(100)) + 1)
        end
    end
    return true
end