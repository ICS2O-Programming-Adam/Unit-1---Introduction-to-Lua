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
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local correctObject
local points = 0
local winText
local wrongAnswers = 0
local answerText

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
		userAnswer = tonumber(event.target.text)

		-- clear the text field
		event.target.text = ""

		-- if the users answer and the correct answer are the same
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(1900, HideCorrect)
			-- give a point if the user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "Points = " .. points 

		else
			-- if the users answer and the correct answer are different
			incorrectObject.isVisible = true
			timer.performWithDelay(1900, HideIncorrect)
			-- add to the incorrect answers variable
			wrongAnswers = wrongAnswers + 1
			answerText.alpha = 1
		end
	end
end

local function YouWin( event )
	if (points == 5) then
		questionObject.alpha = 0
		winText.alpha = 1
	end
end

local function YouLose( event )
	if (wrongAnswers == 3) then
		questionObject.alpha = 0
		loseText.alpha = 1
	end
end
	
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/4, display.contentHeight/3, nil, 60 )
questionObject:setTextColor( 10/255, 195/255, 164/255 )
questionObject.alpha = 1

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*1.5/3, nil, 50 )
correctObject:setTextColor( 10/255, 195/255, 28/255 )
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*1.5/3, nil, 50 )
incorrectObject:setTextColor( 50/255, 0/255, 255/255 )
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/3, 200, 80 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/1.3, display.contentHeight/10, nil, 50)

-- display the winText
winText = display.newText( "YOU WIN!", display.contentWidth/2, display.contentHeight/1.6, nil, 100)
winText:setTextColor( 12/255, 253/255, 206/255 )
winText.alpha = 0

-- display the loseText
loseText = display.newText( "GAME OVER!", display.contentWidth/2, display.contentHeight/1.6, nil, 100)
loseText.alpha = 0

-- display the correct answer text
answerText = display.newText( "The correct answer is " .. correctAnswer, display.contentWidth/2, display.contentHeight/1.5, nil, 30)
answerText.alpha = 0
answerText:setTextColor()

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask then question
AskQuestion()

-- call the function over and over again
Runtime:addEventListener("enterFrame", YouWin)

-- call the function over and over again
Runtime:addEventListener("enterFrame", YouLose)

Runtime:addEventListener("enterframe", DisplayAnswer)