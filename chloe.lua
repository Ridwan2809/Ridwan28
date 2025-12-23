-- chloe.lua
-- Proxy loader for Chloe-X

local CHLOE_RAW = "https://raw.githubusercontent.com/MajestySkie/Chloe-X/main/Main/ChloeX"

local ok, err = pcall(function()
    loadstring(game:HttpGet(CHLOE_RAW, true))()
end)

if not ok then
    warn("[Chloe Loader] Gagal load Chloe-X")
    warn(err)
else
    print("[Chloe Loader] Chloe-X berhasil dimuat")
end
