-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Adam Winogron
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield terminal
-----------------------------------------------------------------------------------------

-- hide the ststus bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 155/255, 2/255, 2/255)

-----------------------------------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create the local variables 
local questionObject
local correctObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0,8)
	randomNumber2 = math.random(0,8)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text objects
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end


local function NumericFieldListener( event )
	-- user begins editing numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the awnser is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.exit)

		-- if the users answer and the correct answer are the same
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)

		elseif 

			-- if the users answer and the correct answer are different
			incorrectObject.isVisible = true
		end
	end
end
	

	
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor( 10/255, 195/255, 164/255 )

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor( 10/255, 195/255, 28/255 )
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor( 10/255, 195/255, 28/255 )
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask then question
AskQuestion()