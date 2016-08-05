--************
--Simple program that creates Fluix Crystals
--Assumes that required items are in a chest front of the robot and water pool is 1 block behind them
--Returns finished product back to the orignal chest that the robot took the items from
--Created by tybo96789
--Version: 1.01
--************

--Required Dependences
local component = require("component")
local sides = require("sides")
local os = require("os")
local robot = require("robot")

--Component Proxies
local inv = component.proxy(component.inventory_controller.address)

--Code
print("Use \"CONTROL + ALT + C\" to terminate program")

while true do

if (inv.getSlotStackSize(sides.front,1) == 1 and (inv.getSlotStackSize(sides.front,2) == 1 and inv.getSlotStackSize(sides.front,3) == 1) then

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