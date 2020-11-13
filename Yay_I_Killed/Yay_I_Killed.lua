local addonName = "Yay_I_Killed"
local testing = false

if testing then
    print(string.format("%s Loaded", addonName))
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

frame:SetScript("OnEvent", function(self, event, ...)
    local numberOfArguments = select("#", ...)
    local argumentTable = {...}

    local playerGUID = UnitGUID("player")
    local eventType = argumentTable[2]

    if eventType == "PARTY_KILL" then
        local sourceGUID = argumentTable[4]

        if (sourceGUID == playerGUID) then
            local nameOfWhatWasKilled = argumentTable[9]

            local msgFormat = "Yay! I Killed %s!"
            local msg = string.format(msgFormat, nameOfWhatWasKilled)

            if testing then
                SendChatMessage(msg, "WHISPER", nil, UnitName("player"))
            else
                SendChatMessage(msg, "SAY")
            end
        end
    end
end)
