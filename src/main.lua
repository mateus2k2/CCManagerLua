indexOnTop = 1

----------------------------------------
--MODULES
----------------------------------------

local basalt = require("/CC/Modules/basalt2")
local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(basalt)

local generatorGUIModule = require("/CC/src/GeneratorManager/GUI")
local resorcesManagerGUIModule = require("/CC/src/ResorcesManager/GUI")
local APIGUIModule = require("/CC/src/API/GUI")
local mainGUIModule = require("/CC/src/mainGUI")

local API = require("/CC/src/API/API")

----------------------------------------
--MAIN FRAME
----------------------------------------

local main = basalt.addFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})
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

main, frameGenerator, generatorObjects = generatorGUIModule.createGeneratorFrame(main)
main, frameResorces = resorcesManagerGUIModule.createResorcesManagerFrame(main)
main, frameAPI, APIObjects = APIGUIModule.createAPIFrame(main)
main, frameMain = mainGUIModule.createMainFrame(main)

local sub = {
    {index = 1, frame = frameMain,             title = "Main",      objects = nil,              updateFunction = nil},                            -- MAIN
    {index = 2, frame = frameAPI:hide(),       title = "API",       objects = APIObjects,       updateFunction = APIGUIModule.updateFrame},       -- RESORCE MENAGER
    {index = 3, frame = frameGenerator:hide(), title = "Generator", objects = generatorObjects, updateFunction = generatorGUIModule.updateFrame}, -- GENERATOR MENAGER
    {index = 4, frame = frameResorces:hide(),  title = "Resorses",  objects = nil,              updateFunction = nil},                            -- RESORCE MENAGER
}

local y = 2
for k,v in pairs(sub) do
    -- debugFrame.debug(k)

    sidebar:addButton():setText(v.title)
    :setBackground(colors.black)
    :setForeground(colors.lightGray)
    :setSize("{parent.w - 3}", 3)
    :setPosition(2, y)
    :onClick(function()
        for a, b in pairs(sub)do
            b.frame:hide()
            v.frame:show()
            indexOnTop = v.index
        end
    end)
    y = y + 4
end

----------------------------------------
--MAIN FRAME
----------------------------------------

function updateFrame()
    while true do
        if sub[indexOnTop].updateFunction then
            sub[indexOnTop].updateFunction(sub[indexOnTop].objects)
        end
        os.sleep(1)
    end
end

parallel.waitForAny(updateFrame, API.startAPI, basalt.autoUpdate)

-- ----------------------------------------
-- --TESTES
-- ----------------------------------------

-- shell.run("/CC/src/API/API.lua")