-----------------------------------------------------------------------------------------
---- Title: TouchAndDrag
-- Name: Adam Winogron
-- Course: ICS2O/3C
-- This program displays miages that ract to a person's finger.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local YellowGirl = display.newImageRect("Images/YellowGirl.png", 150, 150)
local YellowGirlWidth = YellowGirl.width
local YellowGirlHeight = YellowGirl.height

local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150) 
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local star = display.newImageRect("Images/star.png", 150, 105)
local starWidth = star.width
local starHeight = star.height

-- my boolean variables to keep track of which objects I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false
local alreadyTouchedstar = false

-- set the initial x and y position of myImage
YellowGirl.x = 400
YellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

star.x = 100
star.y = 100

-- function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) and (alreadyTouchedstar == false) then
			alreadyTouchedBlueGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedYellowGirl = false
		alreadyTouchedstar = false
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

-- function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when Yellow girl is touched, move her
local function YellowGirlListener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedYellowGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		YellowGirl.x = touch.x
		YellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedBlueGirl = false
		alreadyTouchedstar = false
	end
end

-- add the respective listeners to each object
YellowGirl:addEventListener("touch", YellowGirlListener)

-- function: starListener
-- Input: touch listener
-- Output: none
-- Description: when star is touched, move her
local function starListener(touch)
	
	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedYellowGirl == false) then
			alreadyTouchedstar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedstar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedBlueGirl = false
		alreadyTouchedstar = false
	end
end

-- add the respective listeners to each object
star:addEventListener("touch", starListener)