--========================================
-- Unified Lightweight Loader
-- FPS Stable • No Memory Leak
--========================================

--========== ANTI DOUBLE EXECUTE ==========
getgenv().__UNIFIED_APP__ = getgenv().__UNIFIED_APP__ or {}
local APP = getgenv().__UNIFIED_APP__

if APP.LOADED then
    return
end
APP.LOADED = true
APP.VERSION = "1.0.0"

--========== CONFIG (GANTI RAW KAMU) ==========
local CONFIG = {
    FFS = "https://raw.githubusercontent.com/regata69f/ffs-public/main/loader.lua",
    CHLOE = "https://raw.githubusercontent.com/MajestySkie/Chloe-X/main/Main/ChloeX"
}

--========== SAFE HTTP LOAD ==========
local function SafeLoad(url, name)
    if not url or url == "" then
        warn("[Loader] URL kosong:", name)
        return false
    end

    local ok, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)

    if not ok then
        warn("[Loader] Gagal load:", name)
        warn(err)
        return false
    end

    print("[Loader] Loaded:", name)
    return true
end

--========== STATE & CACHE ==========
APP.State = {
    Running = true
}

APP.Cache = {
    LastTick = 0
}

--========== SINGLE SCHEDULER ==========
local RunService = game:GetService("RunService")
local INTERVAL = 0.25 -- aman, ringan

APP.Connection = RunService.Heartbeat:Connect(function(dt)
    if not APP.State.Running then return end

    APP.Cache.LastTick += dt
    if APP.Cache.LastTick >= INTERVAL then
        APP.Cache.LastTick = 0

        -- tempat logic ringan (kosong = aman)
        -- jangan taruh loop berat di sini
    end
end)

--========== LOAD ORDER ==========
local ffsOK = SafeLoad(CONFIG.FFS, "FFS Public")
local chloeOK = SafeLoad(CONFIG.CHLOE, "Chloe-X")

--========== FINAL STATUS ==========
if ffsOK and chloeOK then
    print("[Unified Loader] Semua script berhasil dimuat ✔")
else
    warn("[Unified Loader] Ada script yang gagal dimuat ⚠")
end

--========== CLEANUP (OPTIONAL) ==========
function APP:Shutdown()
    self.State.Running = false
    if self.Connection then
        self.Connection:Disconnect()
        self.Connection = nil
    end
    self.LOADED = false
end
