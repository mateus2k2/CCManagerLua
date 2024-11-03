local debugModule = {}

local debugFrame = nil

function debugModule.debugFunc(obj)
    if obj.first then
        local debugMenu = require('/Modules/basaltDebug'):setBasalt(obj.basalt)
        debugFrame = debugMenu:createDebugMenu(obj.main, {'debugMenuFrame', 'debugMenuTextbox', 'debugMenuCheckbox'})
    end
    return debugFrame
end

return debugModule


