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
        requests = http.get(serverURL .. "/getOldestRequest")   
        print(request.readAll())
        os.sleep(1)
    end
    
end 

startAPI()
