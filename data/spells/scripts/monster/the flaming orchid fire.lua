local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(20, 10000, -10)
combat:setCondition(condition)

arr = {
{3}
}

local area = createCombatArea(arr)
combat:setArea(area)
combat:setCondition(condition)


function onCastSpell(creature, var)
return combat:execute(creature, var)
end