local uteis = require("/CC/src/Uteis/Uteis")

local resorcesManagerGUIModule = {}
local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

local debugTestInMain = require("/CC/src/Uteis/Debug")
debugFrame = debugTestInMain.debugFunc({first = false})

function resorcesManagerGUIModule.createResorcesManagerFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Resorces Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    local searchField = frame:addInput():setPosition(2, 6):setSize(20, 2)
    local searchButton = frame:addButton():setText("Search"):setPosition(2, 9):setBackground(colors.red):setSize(10, 1)

    itemLabel = frame:addLabel():setText(""):setPosition(2, 14)
    

    searchButton:onClick(function(text)
        retorno = resorsesModuleMine.getItemAmount(text)
        itemLabel:setText(retorno)

        for key, value in pairs(text) do
            debugFrame.debug(tostring(key) .. " = " .. tostring(value))

            if tostring(key) == "__index":
                for key1, value2 in pairs(value) do
                    debugFrame.debug(tostring(key1) .. " = " .. tostring(value2))
                end
            end
        end
    end)

    local objects = {
        title = titleLabel,
    }

    return main, frame, objects
end

function resorcesManagerGUIModule.updateFrame(objects)
end

return resorcesManagerGUIModule

-- minecraft:iron_ingot