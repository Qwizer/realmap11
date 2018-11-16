function sort_descending(t)
    local tmp = {}
    for k, v in pairs(t) do
        table.insert(tmp, {k, v})
    end
    table.sort(tmp, function(a, b) return a[2] > b[2] end)
    return tmp
end

function table.find(t, v)
    for i,x in pairs(t) do
        if x == v then
            return true
        end
    end
end

function Player:addItemRewardBag(itemid, count)
    local rewardbag = self:getDepotChest(99)
    return rewardbag:addItem(itemid, count)
end

function MonsterType:getBossReward(chance, unique)
    local ret = {}
    local function randomItem(lootBlock, chance)
        local randvalue = math.random(0, 100000) / (getConfigInfo("rateLoot") * chance)
        if randvalue < lootBlock.chance then
            if (ItemType(lootBlock.itemId):isStackable()) then
                return (randvalue%lootBlock.maxCount) + 1
            else
                return 1
            end
        end
    end
    local lootBlockList = self:getLoot()
    for _, loot in pairs(lootBlockList) do
        local rd = randomItem(loot, chance)
        if rd then
            if loot.uniquedrop then
                if unique then
                    table.insert(ret, {loot, rd})
                end
            else
                table.insert(ret, {loot, rd})
            end
        end
    end
    return ret
end

BossLoot = {}
BossUids = {}

function BossLoot:new(boss)
    if not table.find(BossUids, boss:getId()) then
        table.insert(BossUids, boss:getId())
        return setmetatable({creature=boss}, {__index = BossLoot})
    end
end

function BossLoot:updateDamage()
    if self.creature then
        local tmp = {}
        local totaldmg = 0
        for killer, damage in pairs(self.creature:getDamageMap()) do
            totaldmg = totaldmg+damage.total
            tmp[killer] = damage.total
        end
        self.players = sort_descending(tmp)
        self.totaldmg = totaldmg
    else
        error("Creature not found.")
    end
end

function BossLoot:setRewards()
    if self.totaldmg and self.creature then
        if getConfigInfo("rateLoot") > 0 then
            local mt = MonsterType(self.creature:getName())
            for i, playertab in ipairs(self.players) do
                local loot
                if i == 1 then
                    loot = mt:getBossReward(playertab[2] / self.totaldmg, true)
                else
                    loot = mt:getBossReward(playertab[2] / self.totaldmg, false)
                end
                table.insert(self.players[i], loot)
            end
        end
    else
        error("Error")
    end
end

function BossLoot:addRewards()
    if self.players and self.players[1] and self.players[1][3] then
        for i, playertab in ipairs(self.players) do
            local player = Player(playertab[1])
            if player then
                local str = "The following items are available in your reward chest: "
                for i, lootTable in ipairs(playertab[3]) do
                    local item = player:addItemRewardBag(lootTable[1].itemId, math.ceil(lootTable[2]))
                    if item then
                        str = str .. item:getNameDescription() .. ", "
                    end
                end
                str = str:sub(1, #str-2)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, str)
            end
        end
    else
        error("Error")
    end
end

function onKill(creature, target)
    if (Monster(target) ~= nil) then
        local mt = MonsterType(target:getName())
        if mt:useRewardChest() then
            local loot = BossLoot:new(target)
            if loot then
                local corpse = Item(Game.createItem(MonsterType(target:getName()):getCorpseId(), 1, target:getPosition()))
                corpse:decay()
                target:setDropLoot(false)
                loot:updateDamage()
                loot:setRewards()
                loot:addRewards()
                corpse:setAttribute('aid', 21584)
            end
        end
    end
end