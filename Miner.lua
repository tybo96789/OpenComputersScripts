--*********
--Program that mines using a TiC Hammer as the tool
--Assumes that front of drone is center block
--Created by: tybo96789
--Version: 1.1
--*********

--Required Dependences
local robot = require("robot")
local sides = require("sides")
local keyboard = require("keyboard")
local os = require("os")
local shell = require("shell")

--Vars
local args, options = shell.prase(...)
local iterations = tonumber(args[1])

--Code

if not component.isAvailable("robot") then
print("This is not the component that you are looking for...")
print("JK But this program works on robots m8")
os.exit()
end

if iterations < 0 then
print("u wat m8")
os.exit()
end

for i = iterations,1,-1 do
if robot.detect() == true then 
robot.forward()
elseif robot.swing(sides.front) == true then
os.sleep(1)
print(i)
end
if keyboard.isControlDown() then
print("Ending Program")
break end
end
