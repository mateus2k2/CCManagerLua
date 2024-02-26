----------------------------------------
--MODULES
----------------------------------------

local basalt = require("/CC/Modules/basaltMaster") -- we need basalt here
local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(basalt)

local generatorGUIModule = require("/CC/src/GeneratorManager/GUI")
local resorcesManagerGUIModule = require("/CC/src/ResorcesManager/GUI")

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

main, frameGenerator = generatorGUIModule.createGeneratorFrame(main)
main, frameResorces = resorcesManagerGUIModule.createResorcesManagerFrame(main)

local sub = {
    {frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"),         title = "Main"},      -- MAIN
    {frame = frameGenerator,                                                                title = "Generator"}, -- GENERATOR MENAGER
    {frame = frameResorces,                                                                 title = "Resorses"},  -- RESORCE MENAGER
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
--MAIN FRAME
----------------------------------------

basalt.autoUpdate()

----------------------------------------
--TESTES
----------------------------------------

-- shell.run("/CC/src/GeneratorManager/GUI.lua")
-- local generatorModuleObject = require("/CC/src/GeneratorManager/Generator")
-- print(generatorModuleObject.getBatteryFillLevel())
