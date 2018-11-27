local skills = {
	[31821] = {id=SKILL_SWORD,voc=4},
	[31822] = {id=SKILL_AXE,voc=4},
	[31823] = {id=SKILL_CLUB,voc=4},
	[31824] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW},
	[31825] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_ENERGY},
	[31826] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE},
}

------- CONFIG -----//
local dummies = {31832,31833,31828,31829,31830,31831}
local skill_gain = 1 -- per hit
local gain_stamina = 60

local function start_train(pid,start_pos,itemid,fpos)
	local player = Player(pid)
	if player ~= nil then
		local pos_n = player:getPosition()

	if start_pos:getDistance(pos_n) == 0 and getTilePzInfo(pos_n) then
			if player:getItemCount(itemid) >= 1 then
				local exercise = player:getItemById(itemid,true)

				if exercise:isItem() then
					if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
						local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)

						if charges_n >= 1 then
							exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES, (charges_n-1))

							local required = 0
							local currently = 0
							local voc = player:getVocation()

							if skills[itemid].id == SKILL_MAGLEVEL then
								required = voc:getRequiredManaSpent(player:getBaseMagicLevel() + 1)/skill_gain
								currently = player:getManaSpent()
								player:addManaSpent(required - currently)
							else
								required = voc:getRequiredSkillTries(skills[itemid].id, player:getSkillLevel(skills[itemid].id)+1)/skill_gain
								currently = player:getSkillTries(skills[itemid].id)

								player:addSkillTries(skills[itemid].id, (required - currently))
							end

							fpos:sendMagicEffect(CONST_ME_HITAREA)
							if skills[itemid].range then
								pos_n:sendDistanceEffect(fpos, skills[itemid].range)
							end
						    player:setStamina(player:getStamina() + 60)

						    if charges_n == 1 then 
								exercise:remove(1)
								return true
						    end
							local training = addEvent(start_train, voc:getAttackSpeed(), pid,start_pos,itemid,fpos)
						else
							exercise:remove(1)
							stopEvent(training)
						end
					end
				end
			end
		else
			stopEvent(training)
		end
	else
		stopEvent(training)
	end
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local start_pos = player:getPosition()

	if target:isItem() then
		if isInArray(dummies,target:getId()) then
			if not skills[item.itemid].range and (start_pos:getDistance(target:getPosition()) > 1) then
				stopEvent(training)
				return false
			end
			if not player:getVocation():getId() == skills[item.itemid].voc or not player:getVocation():getId() == (skills[item.itemid].voc+4) then
				stopEvent(training)
				return false
			end
		    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You started training.")
			start_train(player:getId(),start_pos,item.itemid,target:getPosition())
		end
	end

	return true
end