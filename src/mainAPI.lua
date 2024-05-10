-- Imports das APIs individuais

local serverURL = "http://localhost:5000"

local function handleRequest(request)

end

function printTable(tbl)
    for key, value in pairs(tbl) do
        print(value)
    end
end

local function startAPI()
    
    print("Starting" .. serverURL)

    while true do
        print("Buscando Request")
        request = http.get(serverURL .. "/getOldestRequest")   
        obj = textutils.unserialiseJSON(request.readAll())
        
        -- print(request.readAll())
        printTable(obj)
        
        os.sleep(1)
    end
    
end 

startAPI()
