-- Starfield Cheat Menu Lua Script

-- Toggle God Mode
godmode = false
function toggleGodMode()
    if godmode then
        godmode = false
        game.player.godmode = false
    else
        godmode = true
        game.player.godmode = true
    end
end

-- Toggle Immortal Mode
immortal = false
function toggleImmortal()
    if immortal then
        immortal = false
        game.player.immortal = false
    else
        immortal = true
        game.player.immortal = true
    end
end

-- Unlock All Powers
function unlockAllPowers()
    for i, power in ipairs(game.player.powers) do
        power.unlocked = true
    end
end

-- Toggle No Clip
noclip = false
function toggleNoClip()
    if noclip then
        noclip = false
        game.player.noclip = false
    else
        noclip = true
        game.player.noclip = true
    end
end

-- Add Items to Inventory
function addItem(itemId, value)
    game.player.inventory:addItem(itemId, value)
end

-- Kill All NPCs
function killAllNpcs()
    for i, npc in ipairs(game.npcs) do
        npc:kill()
    end
end

-- Create a menu with the above functions
menu = {
    { "Toggle God Mode", toggleGodMode },
    { "Toggle Immortal Mode", toggleImmortal },
    { "Unlock All Powers", unlockAllPowers },
    { "Toggle No Clip", toggleNoClip },
    { "Add Item to Inventory", addItem },
    { "Kill All NPCs", killAllNpcs }
}

-- Display the menu
function displayMenu()
    for i, item in ipairs(menu) do
        print(i .. ". " .. item[1])
    end
    print("Enter the number of the cheat you want to activate:")
    local input = io.read()
    local func = menu[tonumber(input)][2]
    if func then
        func()
    end
end

-- Run the menu
displayMenu()