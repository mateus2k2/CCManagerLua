local resorcesManagerGUIModule = {}
local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorcesManagerGUIModule.createResorcesManagerFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Resorces Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    return main, frame
end

return resorcesManagerGUIModule
