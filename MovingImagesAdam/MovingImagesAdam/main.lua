-- Title: MovingObjects
-- Name: Adam Winogron
-- Course: ICS2O/3C
-- This program moves a beetleship across 
-- the screen and then makes it fade in.
-- I added a second object that 
-- moves in a different direction, 
-- fades out and grows in size.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/2

-- function: MoveShip
-- Input: this function accepts and event listener
-- output: none
-- description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- second character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

-- flip the image horizontally
rocketship:scale(-1, 1)

-- set the image's transparency
rocketship.alpha = 1

-- set the initial x and y position of rocketship
rocketship.x = 1200
rocketship.y = display.contentHeight/7

-- set scroll speed
NewScrollSpeed = -3

-- function: MoveRocketShi
-- Input: this function accepts and event listener
-- output: none
-- description: This function adds the scroll speed to the x-value of the ship
local function MoveRocketShip(event)
	-- add the scroll speed to the x-value of the ship
	rocketship.x = rocketship.x + NewScrollSpeed
	-- change the transparency of the ship every time it moves so that it fades in
	rocketship.alpha = rocketship.alpha - 0.0000000000000001
end

-- MoveRocketShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveRocketShip)