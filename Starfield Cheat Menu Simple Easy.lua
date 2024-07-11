-- Starfield Cheat Menu Lua Script

-- Define the cheat menu
local cheatMenu = {
  { name = "God Mode", address = "starfield.exe+12345678", value = 1, type = "byte" },
  { name = "Infinite Health", address = "starfield.exe+90123456", value = 100, type = "float" },
  { name = "Infinite Ammo", address = "starfield.exe+34567890", value = 999, type = "int" },
  { name = "No Clip", address = "starfield.exe+56789012", value = 1, type = "byte" },
  { name = "Fly Mode", address = "starfield.exe+78901234", value = 1, type = "byte" },
  { name = "Super Speed", address = "starfield.exe+23456789", value = 10, type = "float" }
}

-- Function to create the cheat menu
local function createCheatMenu()
  local menu = CE.createMenu("Starfield Cheats")
  for i, cheat in ipairs(cheatMenu) do
    local item = menu.addItem(cheat.name)
    item.setHotkey(i)
    item.setValue(cheat.value)
    item.setType(cheat.type)
    item.setAddress(cheat.address)
  end
end

-- Function to update the cheat values
local function updateCheats()
  for i, cheat in ipairs(cheatMenu) do
    local value = CE.read(cheat.address, cheat.type)
    if value ~= cheat.value then
      CE.write(cheat.address, cheat.value, cheat.type)
    end
  end
end

-- Create the cheat menu
createCheatMenu()

-- Update the cheat values every 100ms
CE.timer(100, updateCheats)