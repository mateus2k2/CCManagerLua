-- Imports das APIs individuais

local serverURL = "http://localhost:5000"

local function handleRequest(request)
    responseObj = { resorces = { "iron", 123 } }
    responseStr = textutils.serialiseJSON(responseObj)

    request = http.post({url = serverURL .. "/makeResponse/" .. request.id, body = responseStr})   

end

-- Function to print a table
function printTable(tbl, indent)
    indent = indent or 0
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(string.rep("  ", indent) .. key .. " : ")
            printTable(value, indent + 1)
        else
            print(string.rep("  ", indent) .. key .. " : " .. tostring(value))
        end
    end
end

local function startAPI()
    
    print("Starting" .. serverURL)

    while true do
        print("Buscando Request")
        request = http.get(serverURL .. "/getOldestRequest")   
        if request then obj = textutils.unserialiseJSON(request.readAll()) end
        if obj then 
            handleRequest(obj)
            printTable(obj)
        else
            print("Sem requests")
        end
        
        os.sleep(1)
    end
    
end 

startAPI()
