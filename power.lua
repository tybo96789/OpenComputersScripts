--**********
--Simple program to send a redstone signal when power is below and above a certain percentage
--Uses Adapter: Connected to a Thermal Expansion Energy cell
--Uses Redstone I/O block: to send redstone signal
--Created by tybo96789
--Version 1.11
--**********


--Required Dependences
local component = require("component")
local sides = require("sides")
local os = require("os")
local keyboard = require("keyboard")

--Component proxies
local cell = component.proxy("")
local rs = component.proxy("")

--Vars
local status = false
local offVal = 25
local onVal = 50
local overrideTimer = 300
local startTime = os.time

--Must use sides enum
local rsSide
local updateInterval = 30

--Code
while true do
--Print the current percentage of power remaining in the cell
local pwrlvl = cell.getEnergyStored()/cell.getMaxEnergyStored()*100
print("[Uptime: "os.time - startTime .. "] "..pwrlvl .. %%)

--If user is holding down the 'Control' key and it is in lower power mode, restore power and recheck status again for the specified wait period 
if (keyboard.isControlDown() and status == true) then
rs.setOutput(rsSide,0)
print("Override Requested! Resuming Automation")
print("System will recheck status in " .. overrideTimer .. " seconds")
os.sleep(overrideTimer)
pwrlvl = cell.getEnergyStored()/cell.getMaxEnergyStored()*100
print(pwrlvl .. %%)
end

--If power percentage is below the specified off value, send redstone signal
if (pwrlvl < offVal and status == false) then
rs.setOutput(rsSide,15)
print("Power Levels Critical! Pasuing Automation!")
print("Keep Holding \'Control\' Key until Override Message is shown to restore power")
status = true
end

--If power percentages is above the specified on value, do not continue to send redstone signal
if(pwrlvl > onVal and status == true) then
rs.setOutput(rsSide,0)
print("Power Levels Normal! Resuming Automation!")
status = false
end
--Sleep the program for the specified amount of time
os.sleep(updateInterval)
end
