--**********
--Simple program to send a redstone signal when power is below and above a certain percentage
--Created by tybo96789
--**********


--Required Dependences
local component = require("component")
local sides = require("sides")
local os = require("os")

--Component proxies
local cell = component.proxy("")
local rs = component.proxy("")

--Vars
local status = false
local offVal = 25
local onVal = 50
--Must use sides enum
local rsSide
local updateInterval = 30

--Code
while true do
local pwrlvl = cell.getEnergyStored()/cell.getMaxEnergyStored()*100
print(pwrlvl)

if (pwrlvl < offVal and status == false) then
rs.setOutput(rsSide,15)
print("Power Levels Critical! Pasuing Automation!")
status = true
end

if(pwrlvl > onVal and status == true) then
rs.setOutput(rsSide,0)
print("Power Levels Normal! Resuming Automation!")
status = false
end
os.sleep(updateInterval)
end
