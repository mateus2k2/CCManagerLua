-- shell.run("/CC/src/GeneratorManager/GUI.lua")

----------------------------------------
--MODULES
----------------------------------------

local basalt = require("/CC/Modules/basaltMaster") -- we need basalt here
local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(basalt)

----------------------------------------
--MAIN FRAME
----------------------------------------

local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})
local w, h = main:getSize()

----------------------------------------
--DEBUG FRAME
----------------------------------------

local debugFrame = debugMenu:createDebugMenu(main, {'debugMenuFrame', 'debugMenuTextbox', 'debugMenuCheckbox'})

----------------------------------------
--SIDE BAR
----------------------------------------

local sidebar = main:addScrollableFrame():setBackground(colors.gray):setPosition(w, 1):setSize(15, "{parent.h}"):setZ(25):setDirection("vertical")
:onGetFocus(function(self)
    self:setPosition("{parent.w - (self.w-1) - 1}", 1)
end)
:onLoseFocus(function(self)
    self:setPosition(w, 1)
end)


local sub = {
    {frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")       , title = "Main"},      -- MAIN
    {frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide(), title = "Generator"}, -- GENRATOR MENAGER
    {frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide(), title = "Resorses"},  -- RESORCE MENAGER
}

local y = 2
for k,v in pairs(sub)do
    sidebar:addButton():setText(v.title)
    :setBackground(colors.black)
    :setForeground(colors.lightGray)
    :setSize("{parent.w - 3}", 3)
    :setPosition(2, y)
    :onClick(function()
        for a, b in pairs(sub)do
            b.frame:hide()
            v.frame:show()
        end
    end)
    y = y + 4
end

----------------------------------------
--SIDE BAR
----------------------------------------

sub[1].frame:addButton():setPosition(2, 2)

sub[2].frame:addLabel():setText("Hello World!"):setPosition(2, 2)

sub[3].frame:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)
sub[3].frame:addButton():setText("No functionality"):setPosition(2, 4):setSize(18, 3)

basalt.autoUpdate()
