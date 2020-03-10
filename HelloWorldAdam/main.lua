-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local textObjectSignature

-- print a greeting to the console
print ("**** Hello Adam!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 221/255, 26/255, 235/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 375 with 
-- a default font style and font size of 50
textObject = display.newText( "Hello, Adam!", 500, 375, nil, 100 )

-- set the color of the text
textObject:setTextColor(22/255, 243/255, 73/255)

-- displays text on your screen at position x = 500 and y = 500 with
-- a defaul font style and font size of 50
textObjectSignature = display.newText( "By: Adam Winogron", 500, 500, nil, 50)

-- set the color of the text
textObjectSignature:setTextColor(22/255, 199/255, 243/255)