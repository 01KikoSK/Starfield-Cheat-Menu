-- Starfield Cheat Menu Lua using Cheat Engine

-- Compact mode
local compactMode = true

-- Get skill points
local getSkillPoints = true

-- Get credits (Usage: Open stats)
local getCredit = true

-- Infinite medic kit (recovery pack) from quick menu when used (min = 12)
local infiniteMedicKit = true

-- Set min ammo/recovery item/material when "trade from" robot/cargo
local setMinAmmo = true

-- Personal ammo: No reload (# of ammo still decreases)
local noReload = true

-- Enable O2/HP/EN/Pickpocket scripts
local enableScripts = true

-- Infinite Boostpack/Star Power/ship booster
local infiniteBoostpack = true

-- Lock O2
local lockO2 = true

-- Lock HP
local lockHP = true

-- EN/ship weapon/Shield
local enShield = true

-- Get shield data
local getShieldData = true

-- Engine/Shield bonus
local engineShieldBonus = true

-- Infinite personal/ship EN weapon energy
local infiniteENEnergy = true

-- Easy Pickpocket (90%)
local easyPickpocket = true

-- Enable stealth helper - step 1
local enableStealthHelper1 = true

-- Enable stealth helper - step 2
local enableStealthHelper2 = true

-- Carry item weight multiplier
local carryItemWeightMultiplier = true

-- Manufacturing/Research Lab: submit one item to fill stock# to 10
local manufacturingResearchLab = true

-- Zero material during crafting
local zeroMaterialCrafting = true

-- XP Multiplier
local xpMultiplier = true

-- Get game statistics
local getGameStatistics = true

-- Starfield Cheat Menu Lua using Cheat Engine
-- https://opencheattables.com / CE 7.5+

-- Credit script
[ENABLE]
aobscanmodule(credotss,Starfield.exe,03 48 08 48 83 C0 10 EB F2 49 8B 04) // should be unique
alloc(newmem,$1000,credotss)

label(code)
label(return)
label(creditptr)
registersymbol(creditptr)

newmem:
push rbx
mov rbx, [creditptr]
mov [rax+08], rbx
pop rbx

code:
add ecx,[rax+08]
add rax,10
jmp return

creditptr:
dd 0

credotss:
jmp newmem
nop 2

return:
registersymbol(credotss)

[DISABLE]
credotss:
db 03 48 08 48 83 C0 10
unregistersymbol(credotss)
dealloc(newmem)