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

local basalt = require("/CC/Modules/basalt") -- we need basalt here

local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})

--[[ 
Here we create the sidebar, on focus it should change the position to parent.w - (self.w-1) which "opens the frame"
when the focus gets lost we simply change the position to "{parent.w}"
As you can see we add :setZIndex(25) - this makes sure the sidebar frame is always more important than our normal sub frames.
:setScrollable just makes the sidebar frame scrollable (in case you're adding more frames)
]]
local sidebar = main:addScrollableFrame():setBackground(colors.gray):setPosition("{parent.w}", 1):setSize(15, "{parent.h}"):updateZIndex(25)
-- :onGetFocus(function(self)
--     self:setPosition("{parent.w - (self.w-1)}")
-- end)
-- :onLoseFocus(function(self)
--     self:setPosition("{parent.w}")
-- end)

print(sidebar)

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

