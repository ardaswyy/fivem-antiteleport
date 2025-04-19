local lastPositions = {}
local teleportDistanceThreshold = 200.0 -- teleport olarak sayılacak minimum mesafe

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000) -- her 3 saniyede bir kontrol
        for _, playerId in ipairs(GetPlayers()) do
            local ped = GetPlayerPed(playerId)
            if DoesEntityExist(ped) then
                local currentPos = GetEntityCoords(ped)

                if lastPositions[playerId] then
                    local lastPos = lastPositions[playerId]
                    local distance = #(currentPos - lastPos)

                    if distance > teleportDistanceThreshold then
                        print("Teleport tespit edildi: " .. GetPlayerName(playerId))
                        TriggerEvent(BanEvent, playerId, "Teleport tespit edildi.")
                    end
                end

                lastPositions[playerId] = currentPos
            end
        end
    end
end)


// hüküm allahın hakkıdır discord ardaswyy.js