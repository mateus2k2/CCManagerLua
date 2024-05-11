local resorcesManagerGUIModule = {}
local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorcesManagerGUIModule.createResorcesManagerFrame(main)
    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    frame:addLabel():setText("Resorce Menager"):setPosition(2, 2)
    -- frame:addLabel():setText("Iron: " .. resorsesModuleMine.getIron()):setPosition(2, 3)
    return main, frame
end

return resorcesManagerGUIModule
