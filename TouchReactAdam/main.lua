-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program does something when I click on the button
-----------------------------------------------------------------------------------------

-- add the sound file
local TouchedSound = audio.loadSound( "Sounds/TouchedButtonSound.mp3" )
local soundChannel

-- set the background coluor
display.setDefault ( "background", 12/255, 253/255, 206/255 )

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create the blue button, set it's position and make it visible
local blueButton =  display.newImageRect( "Images/Fast Button Inactive@2x.png",198, 96 )
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set it's position and make it invisible
local redButton = display.newImageRect( "Images/Fast button Active@2x.png",198, 96 ) 
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create the image that appears when you click the button
local yayPicture = display.newImageRect( "Images/yay.jpg", 312.5, 312.5 )
yayPicture.x = display.contentWidth/2
yayPicture.y = display.contentHeight/1.28
yayPicture.isVisible = false

-- create text object, set it's potition and make it insible
local textObject = display.newText ( "Clicked!", 0, 0, nil, 50 )
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1,0,0)
textObject.isVisible = false

-- function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button, 
-- and make the blue button dissapear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		soundChannel = audio.play(TouchedSound)
		yayPicture.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		yayPicture.isVisible = false
	end
end

-- function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is released, turn the button blue and remove the text. 
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end
end
-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)