--************
--Simple program that creates Fluix Crystals
--Created by tybo96789
--************

--Required Dependences
local component = require("component")
local sides = require("sides")
local os = require("os")
local robot = require("robot")

--Component Proxies
local inv = component.proxy(component.inventory_controller.address)

--Code
while true do

if (inv.getSlotStackSize(sides.front,1) == 1 and inv.getSlotStackSize(sides.front,2) == 1, and inv.getSlotStackSize(sides.front,3) == 1) then

inv.suckFromSlot(sides.front,1,1)
inv.suckFromSlot(sides.front,2,1)
inv.suckFromSlot(sides.front,3,1)

robot.turnLeft()
robot.turnLeft()

robot.forward()

robot.select(3)
robot.dropDown()

robot.select(2)
robot.dropDown()

robot.select(1)
robot.dropDown()

os.sleep(10)

robot.suckDown()

robot.back()

robot.turnRight()
robot.turnRight()

inv.dropIntoSlot(sides.front,1)

os.sleep(1)
end


end