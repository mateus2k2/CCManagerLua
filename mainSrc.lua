local APIModule = require("/CC/API/API")
local mainGUIModule = require("/CC/mainGUI")

-- ----------------------------------------
-- --API
-- ----------------------------------------

local resorsesModuleAPI  = require("/CC/ResorcesManager/API")
local generatorModuleAPI = require("/CC/GeneratorManager/API")

APIModules = {
    resource = resorsesModuleAPI,
    generator = generatorModuleAPI
}

-- ----------------------------------------
-- --GUI
-- ----------------------------------------

local generatorGUIModule = require("/CC/GeneratorManager/GUI")
local resorcesManagerGUIModule = require("/CC/ResorcesManager/GUI")
local APIGUIModule = require("/CC/API/GUI")
local mainPageModule = require("/CC/mainPage/GUI")

GUIModules = {
    generatorGUIModule = generatorGUIModule,
    resorcesManagerGUIModule = resorcesManagerGUIModule, 
    APIGUIModule = APIGUIModule,
    mainPageModule = mainPageModule    
}

mainGUIModule.mainGUI(GUIModules)

-- ----------------------------------------
-- --ENTRRYPOINT
-- ----------------------------------------

parallel.waitForAny(
    function() mainGUIModule.updateFrame() end,
    function() mainGUIModule.basalt.autoUpdate() end,
    function() APIModule.startAPI(APIModules) end
)

-- ----------------------------------------
-- --TESTES
-- ----------------------------------------

-- shell.run("/CC/API/API.lua")

-- ----------------------------------------
-- --BASALT 2.0
-- ----------------------------------------

-- local basalt = require("/Modules/basalt2")
-- local main = basalt.getMainFrame()

-- -- Create a button
-- local button = main:addButton():setText("Click me")

-- -- Attach an onClick event to the button
-- button:onClick(function()
--     basalt.debug("Button clicked!")
-- end)

-- basalt.run()