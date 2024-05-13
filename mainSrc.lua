local APIModule = require("/CC/API")
local mainGUIModule = require("/CC/GUI")

-- ----------------------------------------
-- --API
-- ----------------------------------------

local resorsesModuleAPI  = require("/CC/Pages/ResorcesManager/API")
local generatorModuleAPI = require("/CC/Pages/GeneratorManager/API")

APIModules = {
    resource = resorsesModuleAPI,
    generator = generatorModuleAPI
}

-- ----------------------------------------
-- --GUI
-- ----------------------------------------

local generatorGUIModule = require("/CC/Pages/GeneratorManager/GUI")
local resorcesManagerGUIModule = require("/CC/Pages/ResorcesManager/GUI")
local APIGUIModule = require("/CC/Pages/API/GUI")
local mainPageModule = require("/CC/Pages/mainPage/GUI")

GUIModules = {
    generatorGUIModule = generatorGUIModule,
    resorcesManagerGUIModule = resorcesManagerGUIModule, 
    APIGUIModule = APIGUIModule,
    mainPageModule = mainPageModule    
}

-- ----------------------------------------
-- --ENTRRYPOINT
-- ----------------------------------------

parallel.waitForAny(
    function() mainGUIModule.startGUI(GUIModules) end,
    function() APIModule.startAPI(APIModules) end,
    function() mainGUIModule.basalt.autoUpdate() end
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