-- Imports das APIs individuais

local serverURL = "http://localhost:5000"

local function handleRequest(request)

end

local function startAPI()
    
    print("Starting" .. serverURL)

    while true do
        print("Buscando Request")
        requests = http.get(serverURL .. "/getOldestRequest")
        print(requests)
        os.sleep(1)
    end
    
end 

startAPI()
