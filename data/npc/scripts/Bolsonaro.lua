local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
 
local config = {
    attackRadius = {x = 7, y = 5, targetDistance = 1, walkDistance = 7},
    attackPK = {value = true, skulls = {SKULL_WHITE, SKULL_RED}},
    attackMonster = {value = true, ignore = {"Rat", "Cave Rat"}, ignoreSummon = true},
    damageValue = {min = 100, max = 200}
}
 
-- Do not touch
local targetId = 0
local masterPosition
 
function Creature.isAttackable(self)
    if not self:isNpc() then
        if self:isPlayer() and not self:getGroup():getAccess() then
            if config.attackPK.value and isInArray(config.attackPK.skulls, self:getSkull()) then
                return true
            end
        end
 
        if self:isMonster() and config.attackMonster.value then
            local master = self:getMaster()
            if (config.attackMonster.ignoreSummon and master and not master:isPlayer()) or not isInArray(config.attackMonster.ignore, self:getName()) then
                return true
            end
        end
 
    end
 
    return false
end
 
function Npc.searchTarget(self)
    local attackRadius = config.attackRadius
    for _, spectator in ipairs(Game.getSpectators(self:getPosition(), false, false, attackRadius.x, attackRadius.x, attackRadius.y, attackRadius.y)) do
        if spectator:isAttackable() then
            targetId = spectator:getId()
        end
    end
end
 
function onThink()
    local npc = Npc()
    local target = Creature(targetId)
 
    -- If we have not a target, then we shall search for one
    if not target then
        npc:searchTarget()
        return
    end
 
    -- Let's get target offset position
    local npcPosition = npc:getPosition()
    local targetPosition = target:getPosition()
    local offsetX = npcPosition.x - targetPosition.x
    local offsetY = npcPosition.y - targetPosition.y
 
    -- Target is out of reach, search for new one
    local radius = config.attackRadius
    if math.abs(offsetX) > radius.x or math.abs(offsetY) > radius.y then
        npc:searchTarget()
        return
    end
 
    -- Back to spawn position
    if npcPosition:getDistance(masterPosition) >= radius.walkDistance then
        npcPosition:sendMagicEffect(CONST_ME_TELEPORT)
        npc:teleportTo(masterPosition)
        return
    end
 
    -- If target is found
    local npcId = npc:getId()
    doTargetCombatHealth(npcId, targetId, COMBAT_FIREDAMAGE, -config.damageValue.min, -config.damageValue.max, CONST_ME_HITBYFIRE)
    npcPosition:sendDistanceEffect(targetPosition, CONST_ANI_FIRE)
    doNpcSetCreatureFocus(targetId)
 
    -- Follow Target
    local distance = radius.targetDistance
    local path = npc:getPathTo(targetPosition, 0, distance, true, true)
    if path and npcPosition:getDistance(targetPosition) > distance then
        doMoveCreature(npcId, path[1])
    end
 
    npcHandler:onThink()                    
end
 
function onCreatureAppear(self)
    if self == Npc() and not masterPosition then
        masterPosition = self:getPosition()
    end
       
    npcHandler:onCreatureAppear(self)        
end