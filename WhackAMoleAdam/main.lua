-----------------------------------------------------------------------------------------
-- Title: Whack a Mole 
-- Created by: Adam Winogron
-- Course: ICS2O
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 147/255, 114/255, 9/255)

local soundChannel = audio.loadStream("Sounds/bkMusic.mp3")
audio.play(soundChannel, {loops = -1})

local score = 0

local scoreText = display.newText( "Score: 0", 200, 100, nil, 50 )
	scoreText:setTextColor(0,1,1)

local whacked = audio.loadSound( "Sounds/whacked.mp3" )

-- create mole
local mole = display.newImage( "Images/mole.png", 0, 0 )

	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	mole.width = 271.5
	mole.height = 177.5

	mole.isVisible = false

local function Hide()
	mole.isVisible = false
end

local function PopUp()

	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	mole.isVisible = true

	timer.performWithDelay(750, Hide)

	timer.performWithDelay(1500, PopUp)
end

local function PopUpDelay()
	timer.performWithDelay( 2000, PopUp )
end


local function GameStart()
	PopUpDelay()
end

local function Whacked(event)
	if (event.phase == "began") then
		audio.play(whacked)
		score = score + 1
		scoreText.text = "Score: " .. score
	end
end

mole:addEventListener( "touch", Whacked)

GameStart()