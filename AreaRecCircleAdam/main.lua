--------------------------------------------------------------------------------------
-- Title: Local Variables
-- Name: Adam Winogron
-- Course: ICS2O/3C
-- This program displays a rectangle and sows its area
--------------------------------------------------------------------------------------

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myCircle
local radiusOfCircle = 100
local PI = 3.14
local areaOfCircle
local areaText2
local textSize2 = 50

-- set the background clour of my screen. Remember that colours are between 0 and 1.
display.setDefault("background", 22/255, 199/255, 243/255)

-- to remove staus bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the colour of the recangle
myRectangle:setFillColor(241/255, 24/255, 249/255)

-- set the colour of the border
myRectangle:setStrokeColor( 0/255, 0/255, 0/255)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on screen. 
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels.", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/3

-- set the colour of the newText
areaText:setTextColor( 1, 0, 1)

--draw the circle
myCircle = display.newCircle(0, 0, radiusOfCircle )

-- anchor the circle underneath the rectangle's text and set it's (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 20
myCircle.y = 400

-- set the width of the circle's border
myCircle.strokeWidth = 20

-- change the colour of the circle's border
myCircle:setStrokeColor(0,0,0)

-- change the colour of the circle
myCircle:setFillColor( 0/255, 255/255, 171/255 )

-- calculate the area of the circle
areaOfCircle = radiusOfCircle * radiusOfCircle * PI

-- write the area on the screen.
areaText2 = display.newText("The area of this circle with a radius of \n" .. 
	radiusOfCircle .. " is " .. areaOfCircle .. " pixels. ", 0, 0, Arial, textSize2)

-- anchor the text and set it's (x,y) poition
areaText2.anchorX = 0
areaText2.anchorY = 0
areaText2.x = 20
areaText2.y = display.contentHeight/1.2

-- change the colour of the text
areaText2:setTextColor(0/255, 255/255, 171/255)