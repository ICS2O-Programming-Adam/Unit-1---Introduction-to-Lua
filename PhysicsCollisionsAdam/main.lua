-----------------------------------------------------------------------------------------
-- Title: Interacting Objects 2
-- Name: Adam Winogron
-- ICS20
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-----------------------------------------------------------------------------------------
-- Objects
-----------------------------------------------------------------------------------------

--Ground
local ground = display.newImage("Physics/ground.png", 0, 0)

	-- change the width to be the same as the screen
	ground.width = display.contentWidth

	-- set the x and y pos
	ground.x = display.contentWidth/2
	ground.y = display.contnetHeight/10

	-- add to physics
	physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

local beam = display.newImage("Physics/ground.png", 0, 0)

	-- set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	beam.width = display.contentWidth/2
	beam.height = display.contnetHeight* 1/10

	-- rotate the beam -60 degrees so it's on an angle
	beam:rotate(45)

	--send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction = 0.5, bounce = 0.3})

-- create bgk
local bkg = display.newImage("Physics/bkg.png", 0, 0)
	
	--set the x and y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	bkg.width = display.contentWidth
	bkg.height = display.contnetHeight

	-- send to back
	bkg:toBack()

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- create the firat ball
local function FirstBall()
	-- creating first ball
	local ball1 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end

local function SecondBall()
	--create the second ball
	local ball2 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density = 1.0, density = 1.0, friction = 0.5, bounce = 0.3, radius = 12.5})
end

-----------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
-----------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall )
timer.performWithDelay( 500, SecondBall)