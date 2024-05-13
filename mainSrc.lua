local APIModule = require("/CC/API")
local GUIModule = require("/CC/GUI")

-- ----------------------------------------
-- --API
-- ----------------------------------------

APIModules = {
    resource    = require("/CC/Pages/ResorcesPage/API"),
    generator   = require("/CC/Pages/GeneratorPage/API")
}

-- ----------------------------------------
-- --GUI
-- ----------------------------------------

GUIModules = {
    mainPageModule              = require("/CC/Pages/mainPage/GUI"),    
    APIGUIModule                = require("/CC/Pages/APIPage/GUI"),
    generatorGUIModule          = require("/CC/Pages/GeneratorPage/GUI"),
    resorcesManagerGUIModule    = require("/CC/Pages/ResorcesPage/GUI")
}

-- ----------------------------------------
-- --ENTRRYPOINT
-- ----------------------------------------

parallel.waitForAny(
    function() APIModule.startAPI(APIModules) end
    -- function() GUIModule.startGUI(GUIModules) end,
    -- function() GUIModule.basalt.autoUpdate() end
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