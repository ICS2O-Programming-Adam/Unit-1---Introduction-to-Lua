-----------------------------------------------------------------------------------------
-- Title: MathFun
-- Name: Adam Winogron
-- Course: ICS2O/3C
-- This program is a math game that gives you a random math question
-----------------------------------------------------------------------------------------

-- hide the ststus bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 155/255, 2/255, 2/255)

-----------------------------------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create the local variables 
local randomOperator 
local randomNumber1
local randomNumber2
local correctAnswer 
local questionObject
local numericField
local userAnswer
local incorrectObject
local correctObject

----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate a random number between 1 and 2
	randomOperator = math.random(1, 4)

	-- generate 2 random numbers
	randomNumber1 = math.random(1, 10)
	randomNumber2 = math.random(1, 10)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in tex object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then

		if (randomNumber1 >= randomNumber2) then
			correctAnswer = randomNumber1 - randomNumber2
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = " 

		else correctAnswer = randomNumber2 - randomNumber1
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		end	

	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = math.round(randomNumber1 * randomNumber2)

		-- create the question in text object
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "

	elseif (randomOperator == 4) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2
		correctAnswer = correctAnswer * 10
		correctAnswer = math.round(correctAnswer)
  		correctAnswer = correctAnswer / 10  

		-- create the question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
	end
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
		userAnswer = tonumber(event.target.text)

		-- clear the text field
		event.target.text = ""

		-- if the users answer and the correct answer are the same
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(1900, HideCorrect)

		else
			-- if the users answer and the correct answer are different
			incorrectObject.isVisible = true
			timer.performWithDelay(1900, HideIncorrect)
		end
	end
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- create the question object text
questionObject = display.newText("", display.contentWidth/4, display.contentHeight/3, nil, 60 )

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/3, 200, 80 )
numericField.inputType = "decimal"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*1.5/3, nil, 50 )
correctObject:setTextColor( 10/255, 195/255, 28/255 )
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*1.5/3, nil, 50 )
incorrectObject:setTextColor( 50/255, 0/255, 255/255 )
incorrectObject.isVisible = false
-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()