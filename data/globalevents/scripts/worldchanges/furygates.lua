function onStartup(interval)

    math.randomseed(os.time())

	local chance = math.random(1, 10)

	--exit
	exit = Game.createItem(6116, 1, {x = 33290, y = 31785, z = 13})
	exit:setActionId(9720) 

	if (chance == 1) then -- ab'dendriel
		setGlobalStorageValue(9710, 1)
		Game.createItem(7853, 1, {x = 32679, y = 31719, z = 7})
		Game.createItem(7851, 1, {x = 32680, y = 31719, z = 7})
		Game.createItem(5066, 1, {x = 32680, y = 31719, z = 7})
		Game.createItem(5066, 1, {x = 32679, y = 31719, z = 7})
		
		gate1 = Game.createItem(6116, 1, {x = 32680, y = 31719, z = 7})
		gate1:setActionId(9710)
		print('>> Fury Gate will be active in ab\'dendriel today.')
	elseif (chance == 2) then -- ankrahmun
		setGlobalStorageValue(9711, 2)
		Game.createItem(5064, 1, {x = 32268, y = 32840, z = 7})
		Game.createItem(5064, 1, {x = 32268, y = 32841, z = 7})
		Game.createItem(5064, 1, {x = 32269, y = 32840, z = 7})
		Game.createItem(5064, 1, {x = 32269, y = 32841, z = 7})
		Game.createItem(7852, 1, {x = 32268, y = 32841, z = 7})
		Game.createItem(7853, 1, {x = 32268, y = 32840, z = 7})

		gate2 = Game.createItem(6116, 1, {x = 32268, y = 32841, z = 7})
		gate2:setActionId(9711)
		print('>> Fury Gate will be active in ankrahmun today.')
	elseif (chance == 3) then -- carlin
		setGlobalStorageValue(9712, 3)
		Game.createItem(5066, 1, {x = 32262, y = 31848, z = 7})
		Game.createItem(5066, 1, {x = 32263, y = 31848, z = 7})
		Game.createItem(7853, 1, {x = 32262, y = 31848, z = 7})
		Game.createItem(7851, 1, {x = 32263, y = 31848, z = 7})

		gate3 = Game.createItem(6116, 1, {x = 32263, y = 31848, z = 7})
		gate3:setActionId(9712)
		print('>> Fury Gate will be active in carlin today.')
	elseif (chance == 4) then -- darashia
		setGlobalStorageValue(9713, 4)
		Game.createItem(5064, 1, {x = 33303, y = 32370, z = 7})
		Game.createItem(5064, 1, {x = 33303, y = 32371, z = 7})
		Game.createItem(5064, 1, {x = 33303, y = 32370, z = 7})
		Game.createItem(5064, 1, {x = 33303, y = 32371, z = 7})
		Game.createItem(7852, 1, {x = 33303, y = 32370, z = 7})
		Game.createItem(7853, 1, {x = 33303, y = 32371, z = 7})

		gate4 = Game.createItem(6116, 1, {x = 33303, y = 32371, z = 7})
		gate4:setActionId(9713)
		print('>> Fury Gate will be active in darashia today.')
	elseif (chance == 5) then -- edron
		setGlobalStorageValue(9714, 5)
		Game.createItem(5066, 1, {x = 33220, y = 31922, z = 7})
		Game.createItem(5066, 1, {x = 33221, y = 31922, z = 7})
		Game.createItem(7853, 1, {x = 33220, y = 31922, z = 7})
		Game.createItem(7851, 1, {x = 33221, y = 31922, z = 7})
		Game.createItem(5066, 1, {x = 33220, y = 31923, z = 7})
		Game.createItem(5066, 1, {x = 33221, y = 31923, z = 7})

		gate5 = Game.createItem(6116, 1, {x = 33221, y = 31922, z = 7})
		gate5:setActionId(9714)
		print('>> Fury Gate will be active in edron today.')
	elseif (chance == 6) then -- kazordoon
		setGlobalStorageValue(9715, 6)
		Game.createItem(5066, 1, {x = 32573, y = 31982, z = 7})
		Game.createItem(5066, 1, {x = 32574, y = 31982, z = 7})
		Game.createItem(7853, 1, {x = 32573, y = 31982, z = 7})
		Game.createItem(7851, 1, {x = 32574, y = 31982, z = 7})

		gate6 = Game.createItem(6116, 1, {x = 32574, y = 31982, z = 7})
		gate6:setActionId(9715)
		print('>> Fury Gate will be active in kazordoon today.')
	elseif (chance == 7) then -- liberty bay
		setGlobalStorageValue(9716, 7)
		Game.createItem(5066, 1, {x = 32347, y = 32692, z = 7})
		Game.createItem(5066, 1, {x = 32348, y = 32692, z = 7})
		Game.createItem(5066, 1, {x = 32347, y = 32693, z = 7})
		Game.createItem(5066, 1, {x = 32348, y = 32693, z = 7})
		Game.createItem(7853, 1, {x = 32347, y = 32692, z = 7})
		Game.createItem(7851, 1, {x = 32348, y = 32692, z = 7})

		gate7 = Game.createItem(6116, 1, {x = 32348, y = 32692, z = 7})
		gate7:setActionId(9716)
		print('>> Fury Gate will be active in liberty bay today.')
	elseif (chance == 8) then -- port hope
		setGlobalStorageValue(9717, 8)
		Game.createItem(5066, 1, {x = 32529, y = 32712, z = 7})
		Game.createItem(5066, 1, {x = 32530, y = 32712, z = 7})
		Game.createItem(5066, 1, {x = 32529, y = 32713, z = 7})
		Game.createItem(5066, 1, {x = 32530, y = 32713, z = 7})
		Game.createItem(7853, 1, {x = 32529, y = 32712, z = 7})
		Game.createItem(7851, 1, {x = 32529, y = 32712, z = 7})

		gate8 = Game.createItem(6116, 1, {x = 32529, y = 32712, z = 7})
		gate8:setActionId(9717)
		print('>> Fury Gate will be active in kazordoon today.')
	elseif (chance == 9) then -- thais
		setGlobalStorageValue(9718, 9)
		Game.createItem(5064, 1, {x = 32264, y = 32163, z = 7})
		Game.createItem(5064, 1, {x = 32264, y = 32164, z = 7})
		Game.createItem(7852, 1, {x = 32264, y = 32164, z = 7})
		Game.createItem(7853, 1, {x = 32264, y = 32163, z = 7})
		Game.createItem(5064, 1, {x = 32265, y = 32163, z = 7})
		Game.createItem(5064, 1, {x = 32265, y = 32164, z = 7})

		gate9 = Game.createItem(6117, 1, {x = 32264, y = 32164, z = 7})
		gate9:setActionId(9718)
		print('>> Fury Gate will be active in  thais today.')
	elseif (chance == 10) then -- venore
		setGlobalStorageValue(9719, 10)
		Game.createItem(7853, 1, {x = 32833, y = 32081, z = 7})
		Game.createItem(7851, 1, {x = 32834, y = 32081, z = 7})
		Game.createItem(5066, 1, {x = 32834, y = 32081, z = 7})
		Game.createItem(5066, 1, {x = 32833, y = 32081, z = 7})

		gate10 = Game.createItem(6116, 1, {x = 32834, y = 32081, z = 7})
		gate10:setActionId(9719)
		print('>> Fury Gate will be active in venore today.')
	end
	return true
end
