-- ffs-loader.lua
-- Proxy loader for FFS Public

local FFS_RAW = "https://raw.githubusercontent.com/regata69f/ffs-public/main/loader.lua"

local ok, err = pcall(function()
    loadstring(game:HttpGet(FFS_RAW, true))()
end)

if not ok then
    warn("[FFS Loader] Gagal load FFS")
    warn(err)
else
    print("[FFS Loader] FFS berhasil dimuat")
end
