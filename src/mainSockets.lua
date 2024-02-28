local serverURL = "http://localhost:5000"

local function handleRequest(request)

end

local function openWebSocket()
    
    print("Starting")
    print(serverURL)

    while true do
        requests = http.get(serverURL .. "/getRequests")
        print(requests)


        os.sleep(1)
        
    end

end

openWebSocket()
