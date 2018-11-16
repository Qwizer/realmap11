function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if (Monster(creature) ~= nil) then
        local mt = MonsterType(creature:getName())
        if mt:useRewardChest() then
            if primaryType ~= COMBAT_HEALING then
                if attacker == nil then
                    return false
                end
                if attacker:getMaster() or not attacker:isPlayer() then
                    return false
                end
            end
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end