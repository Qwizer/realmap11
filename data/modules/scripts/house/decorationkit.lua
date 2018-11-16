local function getDistanceBetween(pos1, pos2)
	return math.abs(pos1 - pos2)
end

local wrapItems = {
	"Magnificent Cabinet",
	"Magnificent Chair",
	"Magnificent Trunk",
	"Magnificent Table",
	"Ferocious Cabinet",
	"Ferocious Chair",
	"Ferocious Trunk",
	"Ferocious Table",
	"Rustic Cabinet",
	"Rustic Chair",
	"Rustic Trunk",
	"Rustic Table",
	"Yalaharian Carpet",
	"White Fur Carpet",
	"Bamboo Mat",
	"Crimson Carpet",
	"Azure Carpet",
	"Emerald Carpet",
	"Light Parquet",
	"Dark Parquet",
	"Marble Parquet",
	"Fish Tank",
	[26364] = "Dog House",
	[26098] = "Baby Dragon",
	[26107] = "Cat in a Basket",
	[26100] = "Hamster in a Wheel",
	"Protectress Lamp",
	"Predator Lamp",
	"Ornate Mailbox",
	"Royal Mailbox",
	"Lordly Tapestry",
	"Menacing Tapestry",
	"AllSeeing Tapestry",
	"Golden Dragon Tapestry",
	"Sword Tapestry",
	"Brocade Tapestry"
}

local function getItemId(name)
	for i, v in pairs(wrapItems) do
		if (i > 20000) then
			if (v == name) then
				return i
			end
		end

		if (v == name) then
			return ItemType(v):getId()
		end
	end
end

function onRecvbyte(player, msg, byte)
	if (Player.getExhaustion(player, 4820392) > 0) then
		return false
	end

	local positionItem = msg:getPosition()
	if (positionItem) then
		if (Tile(positionItem)) then
			local item = Tile(positionItem):getTopDownItem() or Tile(positionItem):getTopTopItem()
			if (item) then
				local itemId = item:getId()
				if (itemId == 26054) then
					onUnWrap(player, positionItem)
					Player.setExhaustion(player, 4820392, 0.2)
				elseif (table.contains(ItemType(itemId):getName(), wrapItems)) then
					onWrap(player, positionItem, itemId)
					Player.setExhaustion(player, 4820392, 0.2)
				else
					player:sendCancelMessage("This item can't be wrap/unwrap.")
					return false
				end
			end
		end
	end
end

function onWrap(player, positionItem, itemId)
	local playerPos = player:getPosition()
	if (getDistanceBetween(positionItem.x, playerPos.x) > 1 or
		getDistanceBetween(positionItem.y, playerPos.y) > 1) then
		player:sendCancelMessage("You need to reach decoration to wrap.")
		return false
	end

	local decoTile = Tile(positionItem)
	if (not decoTile) then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return false
	end

	local decoItem = Tile(positionItem):getItemById(itemId)
	if (not decoItem) then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return false
	end

	if (decoItem:isContainer() and
		Container(decoItem:getUniqueId()):getItemHoldingCount() > 0) then
		player:sendCancelMessage("You can't wrap with items inside of this container.")
		return false
	end

	if (decoTile:getHouse() == nil) then
		player:sendCancelMessage("You can't wrap this decoration out of a house.")
		return false
	end

	if (decoTile:getHouse():getOwnerGuid() ~= player:getGuid()) then
		player:sendCancelMessage("You can't wrap this decoration in a house of other player.")
		return false
	end

	decoItem:remove()
	positionItem:sendMagicEffect(CONST_ME_POFF)
	local kitDeco = Game.createItem(26054, 1, positionItem)
	kitDeco:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "You bought this item in the Store.\nUnwrap it in your own house to create a <" ..decoItem:getName()..">.")
end

function onUnWrap(player, positionItem)
	local playerPos = player:getPosition()
	if (positionItem.x == 65535) then
		player:sendCancelMessage("You can't unwrap this kit in a container.")
		return false
	end

	if (getDistanceBetween(positionItem.x, playerPos.x) > 1 or
		getDistanceBetween(positionItem.y, playerPos.y) > 1) then
		player:sendCancelMessage("You need to reach kit to unwrap.")
		return false
	end

	local kitTile = Tile(positionItem)
	if (not kitTile) then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return false
	end

	if (kitTile:hasFlag(TILESTATE_BLOCKSOLID)) then
		player:sendCancelMessage("You can't unwrap item here, please put in ground and try again.")
		return false
	end

	for i, v in pairs(kitTile:getItems()) do
		if (v:getName() == "table") then
			player:sendCancelMessage("You can't unwrap item in table, please put in ground and try again.")
			return false
		end
	end

	local kitItem = Tile(positionItem):getItemById(26054)

	if (not kitItem) then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return false
	end

	if (kitTile:getHouse() == nil) then
		player:sendCancelMessage("You can't use this kit out of a house.")
		return false
	end

	if (kitTile:getHouse():getOwnerGuid() ~= player:getGuid()) then
		player:sendCancelMessage("You can't use this kit in a house of other player.")
		return false
	end

	local decorationName = kitItem:getDescription():match("Unwrap it in your own house to create a <(.+)>.")
	if (not decorationName) then
		player:sendCancelMessage("Invalid item, please contact Administrator.")
		return false
	end

	kitItem:remove()
	positionItem:sendMagicEffect(CONST_ME_BLOCKHIT)
	Game.createItem(getItemId(decorationName), 1, positionItem)
end