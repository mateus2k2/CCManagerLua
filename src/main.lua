--------------------------------------------------------------------------------
-- GERADOR MAIN 
--------------------------------------------------------------------------------

-- shell.run("/CC/src/GeneratorManager/Generator.lua")

--------------------------------------------------------------------------------
-- GERADOR GUI 
--------------------------------------------------------------------------------

-- shell.run("/CC/src/GeneratorManager/GUI.lua")

--------------------------------------------------------------------------------
-- GUI TESTE
--------------------------------------------------------------------------------

-- shell.run("/CC/src/tests/guiTest/menager.lua")

--------------------------------------------------------------------------------
-- MAIN GUI
--------------------------------------------------------------------------------

-- local basalt = require("/CC/Modules/basalt") -- we need basalt here

-- local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})

-- local sidebar = main:addScrollableFrame():setBackground(colors.gray):setPosition("{parent.w}", 1):setSize(15, "{parent.h}")
-- :onGetFocus(function(self)
--     self:setPosition("{parent.w - (self.w-1)}")
-- end)
-- :onLoseFocus(function(self)
--     self:setPosition("{parent.w}")
-- end)

-- -- Once again we add 3 frames, the first one should be immediatly visible
-- local sub = {
--     main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"),
--     main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide(),
--     main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide(),
-- }

-- --This part of the code adds buttons based on the sub table.
-- local y = 2
-- for k,v in pairs(sub)do
--     sidebar:addButton():setText("Example "..k) -- creating the button and adding a name k is just the index
--     :setBackground(colors.black)
--     :setForeground(colors.lightGray)
--     :setSize("{parent.w - 2}", 3)
--     :setPosition(2, y)
--     :onClick(function() -- here we create a on click event which hides ALL sub frames and then shows the one which is linked to the button
--         for a, b in pairs(sub)do
--             b:hide()
--             v:show()
--         end
--     end)
--     y = y + 4
-- end

-- sub[1]:addButton():setPosition(2, 2)

-- sub[2]:addLabel():setText("Hello World!"):setPosition(2, 2)

-- sub[3]:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)
-- sub[3]:addButton():setText("No functionality"):setPosition(2, 4):setSize(18, 3)

-- basalt.autoUpdate()

--------------------------------------------------------------------------------
-- MAIN GUI
--------------------------------------------------------------------------------

local basalt = require("basalt")

local mainFrame = basalt.createFrame()
local aButton = mainFrame:addButton():setZIndex(1):setPosition(2,2)
local aLabel = mainFrame:addLabel():setZIndex(2):setPosition(2,2):setText("I am a label!")
