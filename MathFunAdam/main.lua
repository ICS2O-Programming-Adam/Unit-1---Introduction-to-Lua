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
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/incorrectSound.mp3")
local incorrectSoundChannel

local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 5
local heart1
local heart2
local heart3
local heart4
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
			correctSoundChannel = audio.play(correctSound)
			secondsLeft = totalSeconds
		else
			-- if the users answer and the correct answer are different
			incorrectObject.isVisible = true
			timer.performWithDelay(1900, HideIncorrect)
			incorrectSoundChannel = audio.play(incorrectSound)
			lives = lives - 1
			secondsLeft = totalSeconds

		end
	end
end


local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = "Time Left: " .. secondsLeft

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1
	end
end

local function LoseLives()
	if (lives == 4) then
		heart4.isVisible = false
	elseif (lives == 3) then
		heart3.isVisible = false
	elseif (lives == 2) then
		heart2.isVisible = false
	elseif (lives == 1) then
		heart1.isVisible = false
	end
end

local function Lose()
	if (lives == 0) then
		loseText.isVisible = true
		loseImage,isVisible = true
		timer.cancel(countDownTimer)
	end
end


-- function that calls the timer
local function StartTimer()
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0 )
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

heart1 = display.newImageRect("Images/life.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/life.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/life.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/life.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

clockText = display.newText("Time Left: ", 200, 100, nil, 50)
clockText:setTextColor(0,1,1)

loseText = display.newText("Game Over!", display.contentWidth/2, display.contentHeight/1.7, nil, 100)
loseText.isVisible = false

loseImage = display.newImageRect("Images/lose.gif", 458, 238)
loseImage.x = display.contentWidth/2
loseImage.y = display.contentHeight/1.22
loseImage.isVisible = false

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

StartTimer()

LoseLives()

Lose()