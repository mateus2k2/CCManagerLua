-- local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(basalt)
-- local debugFrame = debugMenu:createDebugMenu(main, {'debugMenuFrame', 'debugMenuTextbox', 'debugMenuCheckbox'})
-- debugFrame.debug("TESTE")

local debugModule = {}

local debugFrame = nil

function debugModule.debugFunc(obj)
    if obj.first then
        local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(obj.basalt)
        debugFrame = debugMenu:createDebugMenu(obj.main, {'debugMenuFrame', 'debugMenuTextbox', 'debugMenuCheckbox'})
    else    
        return debugFrame
end

return debugModule


