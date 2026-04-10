local PLACE_PARKOUR = 75034791252172
local PLACE_BITE_BY_NIGHT = 70845479499574

local ScriptUrls = {
    [PLACE_PARKOUR] = "https://raw.githubusercontent.com/W1kcsed/W1kcsed-Hub/refs/heads/main/PFB.lua",
    [PLACE_BITE_BY_NIGHT] = "https://raw.githubusercontent.com/W1kcsed/W1kcsed-Hub/refs/heads/main/BBN.lua",
    Default = "https://raw.githubusercontent.com/W1kcsed/W1kcsed-Hub/refs/heads/main/univ.lua",
}

local function resolveUrl(placeId)
    local u = ScriptUrls[placeId]
    if u ~= nil and u ~= "" then
        return u
    end
    u = ScriptUrls.Default
    if u ~= nil and u ~= "" then
        return u
    end
    return nil
end

local placeId = game.PlaceId
local url = resolveUrl(placeId)

if url == nil then
    warn("[W1kcsed Hub] No url for:", placeId, " and Default.")
    return
end

local ok, err = pcall(function()
    local src = game:HttpGet(url, true)
    loadstring(src)()
end)

if not ok then
    warn("[W1kcsed Hub] Failed to load: ", err)
end
