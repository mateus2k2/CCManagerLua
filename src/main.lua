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

-- local basalt = require("/CC/Modules/basaltMaster")

-- local mainFrame = basalt.createFrame()
-- local aButton = mainFrame:addButton():setSize(10, 3)
-- local w, h = aButton:getSize()
-- -- basalt.debug("Button position: w=" .. w .. ", h=" .. h) -- prints "Button position: w=10, h=3"
-- print(w)
-- print(h)

--------------------------------------------------------------------------------
-- MAIN GUI
--------------------------------------------------------------------------------

local basalt = require("/CC/Modules/basaltMaster") -- we need basalt here
local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(basalt)

local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})
local debugFrame = debugMenu:createDebugMenu(main, {'debugMenuFrame', 'debugMenuTextbox', 'debugMenuCheckbox'})

local sidebar = main:addScrollableFrame():setBackground(colors.gray):setPosition(20, 1):setSize(15, "{parent.h}"):setZ(25):setDirection("vertical")
:onGetFocus(function(self)
    self:setPosition("{parent.w - (self.w-1)}", 1)
end)
:onLoseFocus(function(self)
    self:setPosition("{parent.w}", 1)
end)

local w, h = sidebar:getSize()
print(w)
print(h)

-- Once again we add 3 frames, the first one should be immediatly visible
local sub = {
    main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"),
    main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide(),
    main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide(),
}

--This part of the code adds buttons based on the sub table.
local y = 2
for k,v in pairs(sub)do
    sidebar:addButton():setText("Example "..k) -- creating the button and adding a name k is just the index
    :setBackground(colors.black)
    :setForeground(colors.lightGray)
    :setSize("{parent.w - 2}", 3)
    :setPosition(2, y)
    :onClick(function() -- here we create a on click event which hides ALL sub frames and then shows the one which is linked to the button
        for a, b in pairs(sub)do
            b:hide()
            v:show()
        end
    end)
    y = y + 4
end

sub[1]:addButton():setPosition(2, 2)

sub[2]:addLabel():setText("Hello World!"):setPosition(2, 2)

sub[3]:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)
sub[3]:addButton():setText("No functionality"):setPosition(2, 4):setSize(18, 3)

basalt.autoUpdate()

--------------------------------------------------------------------------------
-- SCROLL LIST 
--------------------------------------------------------------------------------

-- local basalt = require("/CC/Modules/basaltMaster") -- we need basalt here
-- local mainFrame = basalt.createFrame()
-- local scrollableFrame = mainFrame:addScrollableFrame():setBackground(colors.blue)

-- local aList = scrollableFrame:addList()
-- aList:addItem("Item 1")
-- aList:addItem("Item 2", colors.yellow)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)
-- aList:addItem("Item 3", colors.yellow, colors.green)

-- scrollableFrame:setDirection("vertical")
-- basalt.autoUpdate()

--------------------------------------------------------------------------------
-- MAIN GUI
--------------------------------------------------------------------------------

-- local basalt = require("/CC/Modules/basaltMaster") -- we need basalt here

-- local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black}) -- we change the default bg and fg color for frames

-- local sub = { -- here we create a table where we gonna add some frames
--     main:addFrame():setPosition(1, 2):setSize("{parent.w}", "{parent.h - 1}"), -- obviously the first one should be shown on program start
--     main:addFrame():setPosition(1, 2):setSize("{parent.w}", "{parent.h - 1}"):hide(),
--     main:addFrame():setPosition(1, 2):setSize("{parent.w}", "{parent.h - 1}"):hide(),
-- }

-- local function openSubFrame(id) -- we create a function which switches the frame for us
--     if(sub[id]~=nil)then
--         for k,v in pairs(sub)do
--             v:hide()
--         end
--         sub[id]:show()
--     end
-- end

-- local menubar = main:addMenubar():setScrollable() -- we create a menubar in our main frame.
--     :setSize("{parent.w}", 1)
--     :onChange(function(self, val)
--         openSubFrame(self:getItemIndex()) -- here we open the sub frame based on the table index
--     end)
--     :addItem("Example 1")
--     :addItem("Example 2")
--     :addItem("Example 3")

-- -- Now we can change our sub frames, if you want to access a sub frame just use sub[subid], some examples:
-- sub[1]:addButton():setPosition(2, 2)

-- sub[2]:addLabel():setText("Hello World!"):setPosition(2, 2)

-- sub[3]:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)
-- sub[3]:addButton():setText("No functionality"):setPosition(2, 4):setSize(18, 3)

-- basalt.autoUpdate()