local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- ==================== 防检测系统（从闪光脚本移植） ====================
local getInfo = getinfo or debug.getinfo
local debugMode = false
local hookedFunctions = {}
local detectedFunc, killFunc

setthreadidentity(2)

for _, value in ipairs(getgc(true)) do
    if typeof(value) == "table" then
        local detected = rawget(value, "Detected")
        local kill = rawget(value, "Kill")

        if typeof(detected) == "function" and not detectedFunc then
            detectedFunc = detected
            local originalHook
            originalHook = hookfunction(detectedFunc, function(method, info, ...)
                if method ~= "_" then
                    if debugMode then
                        warn(string.format(
                            "Adonis AntiCheat flagged\nMethod: %s\nInfo: %s",
                            tostring(method),
                            tostring(info)
                        ))
                    end
                end
                return true
            end)
            table.insert(hookedFunctions, detectedFunc)
        end

        if rawget(value, "Variables") and rawget(value, "Process") and typeof(kill) == "function" and not killFunc then
            killFunc = kill
            local originalHook
            originalHook = hookfunction(killFunc, function(info)
                if debugMode then
                    warn(string.format("Adonis AntiCheat tried to kill (fallback): %s", tostring(info)))
                end
            end)
            table.insert(hookedFunctions, killFunc)
        end
    end
end

local originalDebugInfo
originalDebugInfo = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local firstArg, _ = ...
    if detectedFunc and firstArg == detectedFunc then
        if debugMode then
            warn("Adonis bypassed")
        end
        return coroutine.yield(coroutine.running())
    end
    return originalDebugInfo(...)
end))

setthreadidentity(7)

-- ==================== 远程事件hook（从闪光脚本移植） ====================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local targetRemote

for _, v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "exploitDetected") then
        if typeof(rawget(v, "exploitDetected")) == "Instance" then
            targetRemote = v["exploitDetected"]
            break
        end
    end
end

if targetRemote then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if self == targetRemote and method == "FireServer" then
            return nil
        end
        return oldNamecall(self, ...)
    end)

    local oldFireServer
    oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
        if self == targetRemote then
            return nil
        end
        return oldFireServer(self, ...)
    end)
end

-- ==================== 本地化配置 ====================
WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "zh",
    Translations = {
        ["zh"] = {
            ["WINDUI_EXAMPLE"] = "WQ Hub",
            ["WELCOME"] = "欢迎使用此脚本",
            ["LIB_DESC"] = "美观的 Roblox UI 库",
            ["SETTINGS"] = "设置",
            ["APPEARANCE"] = "外观",
            ["FEATURES"] = "功能",
            ["UTILITIES"] = "实用工具",
            ["UI_ELEMENTS"] = "UI 元素",
            ["CONFIGURATION"] = "配置",
            ["SAVE_CONFIG"] = "保存配置",
            ["LOAD_CONFIG"] = "加载配置",
            ["THEME_SELECT"] = "选择主题",
            ["TRANSPARENCY"] = "窗口透明度",
            
            -- 闪光功能翻译
            ["MAIN_TAB"] = "主要",
            ["VISUALS_TAB"] = "视觉",
            ["FEATURES_TAB"] = "功能",
            ["RAGEBOT_TAB"] = "RageBot",
            ["SETTINGS_TAB"] = "设置",
            ["STATUS_INFO"] = "状态信息",
            ["CHAR_SETTINGS"] = "角色设置",
            ["ESP_SETTINGS"] = "ESP 设置",
            ["VISUAL_CONFIG"] = "视觉配置",
            ["AIM_SETTINGS"] = "自瞄设置",
            ["OTHER_FEATURES"] = "其他功能",
            ["RAGEBOT_CONTROL"] = "RageBot 控制",
            ["RAGEBOT_CONFIG"] = "RageBot 配置",
            ["UI_SETTINGS"] = "UI 设置",
            ["SCRIPT_CONTROL"] = "脚本控制"
        },
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Example",
            ["WELCOME"] = "欢迎使用此脚本",
            ["LIB_DESC"] = "Beautiful UI library for Roblox",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency"
        }
    }
})

-- ==================== 服务初始化 ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local HapticService = game:GetService("HapticService")

-- ==================== 从闪光脚本移植的变量 ====================
-- RageBot设置
local ragebotEnabled = false
local attackIntervalA = 1.2
local attackIntervalB = 1
local meleeRange = 22
local rangedRange = 2000
local attackingA = false
local attackingB = true
local rotating = false
local wallbangEnabled = true

local wallbangThickness = 1
local wallbangShootRadius = 14
local wallbangTargetRadius = 8.9
local enableScan = true
local fireScanOffset = 7.3
local hitScanOffset = 6.4

local lastShootPos = nil
local lastShootHitPos = nil
local lastShootPosUpdate = 0

local ScanPositionsVectors = {
    Vector3.new(1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 1, 0), -Vector3.new(1, 0, 0), -Vector3.new(0, 0, 1), -Vector3.new(0, 1, 0),
    Vector3.new(1, 1, 0)/math.sqrt(2), Vector3.new(1, 0, 1)/math.sqrt(2), Vector3.new(0, 1, 1)/math.sqrt(2),
    Vector3.new(-1, 1, 0)/math.sqrt(2), Vector3.new(-1, 0, 1)/math.sqrt(2),
    -Vector3.new(1, 0, 1)/math.sqrt(2), -Vector3.new(-1, 0, 1)/math.sqrt(2), -Vector3.new(0, -1, 1)/math.sqrt(2),
    Vector3.new(1, 1, 1)/math.sqrt(3), Vector3.new(-1, 1, 1)/math.sqrt(3), Vector3.new(1, 1, -1)/math.sqrt(3),
    -Vector3.new(1, 1, 1)/math.sqrt(3), -Vector3.new(1, -1, 1)/math.sqrt(3),
    Vector3.new(1,2,0)/math.sqrt(5), Vector3.new(-1,2,0)/math.sqrt(5), Vector3.new(1,0,2)/math.sqrt(5), Vector3.new(-1,0,2)/math.sqrt(5),
    -Vector3.new(-1,0,2)/math.sqrt(5), -Vector3.new(1,0,2)/math.sqrt(5)
}

-- 自瞄设置（从闪光脚本移植）
local aimlockenabled = false
local smoothaimlock = false
local aimlocktype = "最近玩家"
local aimpart = "头部"
local fovenabled = false
local showfov = false
local fovsize = 100
local fovcolor = Color3.fromRGB(255, 255, 255)
local fovgui = nil
local fovframe = nil
local fovstroke = nil
local fovstrokethickness = 2
local nearestplayerdistance = 1000
local nearestmousedistance = 500
local fovlockdistance = 1000
local rainbowfov = false
local aimlockcertainplayer = false
local selectedplayer = nil
local ignoredplayers = {}
local prioritizedplayers = {}
local wallcheckenabled = true
local lerpalpha = 0.4
local aimlockOffsetX = 0
local aimlockOffsetY = 0
local ignoreShielded = true
local ignoreLobby = true
local isAimingLocked = false 
local autoFireEnabled = false
local autoFireDelay = 1.5
local autoFireShootDelay = 0.1
local currentTarget = nil
local isFiring = false
local autoFireConnection = nil
local aimlockConnection = nil

local instantHitEnabled = false
local instantHitConnection = nil

-- 视觉设置
local espenabled = false
local outlineenabled = false
local tracersenabled = false
local radarEnabled = false
local radarConnections = {}
local radarArrows = {}
local radarRadius = 200
local radarUpdateConnection = nil
local aimWarningEnabled = false
local aimWarningTexts = {}
local aimWarningRange = 50
local aimWarningCheckConnection = nil

-- ESP配置（从闪光脚本移植）
local espconfig = {
    espcolor = Color3.fromRGB(255, 255, 255),
    outlinecolor = Color3.fromRGB(255, 255, 255),
    outlinefillcolor = Color3.fromRGB(255, 255, 255),
    tracercolor = Color3.fromRGB(255, 255, 255),
    espsize = 16,
    tracersize = 2,
    outlinetransparency = 0,
    outlinefilltransparency = 1,
    rainbowesp = false,
    rainbowoutline = false,
    rainbowtracers = false,
    rainbowspeed = 5,
    tracerposition = "底部"
}

local originallighting = {
    Brightness = game.Lighting.Brightness,
    Ambient = game.Lighting.Ambient,
    OutdoorAmbient = game.Lighting.OutdoorAmbient,
    FogEnd = game.Lighting.FogEnd,
    FogStart = game.Lighting.FogStart
}

-- 其他设置
local currentwalkspeed = 16
local xrayenabled = false
local xraytransparency = 0.6
local bunnyHopEnabled = false
local autoRespawnEnabled = false
local knifeCloseEnabled = false
local knifeRange = 10
local bulletTrailsEnabled = false
local rgbGunKnifeEnabled = false

-- RGB设置
local rgbAsyncEnabled = false
local rgbAsyncSpeed = 10
local rgbAsyncMode = "Backwards"
local rgbSyncHue = 0
local rgbSyncLastUpdate = 0

-- 武器音效系统（从闪光脚本移植）
local hitSfxId = ""
local critSfxId = ""
local autoApplySfx = false
local autoApplyDelay = 1
local autoApplyConnection = nil

-- 开箱系统（从闪光脚本移植）
local knifeCrateCount = 0
local gunCrateCount = 0
local isOpeningCrates = false
local RollCrate = nil
local SwapWeapon = nil

-- 状态变量
local shieldedPlayers = {}
local activehighlights = {}
local inLobby = false
local lastFireTime = 0
local rotateConnection = nil
local espobjects = {}
local tracerlines = {}
local radarBeacons = {}
local espConnections = {}
local bhopConnection = nil
local autoRespawnConnection = nil
local knifeCheckConnection = nil
local rgbConnection = nil

-- 击杀音效系统（从闪光脚本移植）
local lastKillCount = 0

-- 远程事件
local ClientRemotes = LocalPlayer:WaitForChild("ClientRemotes", 10)
local CheckShotEvent = ClientRemotes and ClientRemotes:WaitForChild("CheckShot", 5)
local CheckFireEvent = ClientRemotes and ClientRemotes:WaitForChild("CheckFire", 5)
local ReloadEvent = ClientRemotes and ClientRemotes:WaitForChild("Reload", 5)

local GunModulesRemote = ReplicatedStorage:WaitForChild("ModuleScripts", 5)
GunModulesRemote = GunModulesRemote and GunModulesRemote:WaitForChild("GunModules", 5)
GunModulesRemote = GunModulesRemote and GunModulesRemote:WaitForChild("Remote", 5)

local ProjectileFinishedEvent = GunModulesRemote and GunModulesRemote:FindFirstChild("ProjectileFinished")
local ProjectileRenderEvent = GunModulesRemote and GunModulesRemote:FindFirstChild("ProjectileRender")

-- 信号事件（从闪光脚本移植）
local AimWeapon, AimStateChanged, FireWeaponMobile, Sound_Request

-- ==================== 核心功能函数 ====================
-- 获取本地玩家 HRP
local function GetLocalHRP()
    if not LocalPlayer.Character then return nil end
    return LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

-- 从闪光脚本移植：获取同步彩虹颜色
local function getSyncRainbowColor()
    local currenttime = tick()
    local speedmultiplier = 11 - rgbAsyncSpeed
    local increment = 0.001 * speedmultiplier
    if rgbAsyncMode == "Backwards" then 
        increment = -increment 
    end
    if currenttime - rgbSyncLastUpdate >= 0.01 then 
        rgbSyncHue = (rgbSyncHue + increment) % 1
        rgbSyncLastUpdate = currenttime
    end
    return Color3.fromHSV(rgbSyncHue, 1, 1)
end

-- 从闪光脚本移植：检查是否在大厅
local function checkLobbyStatus()
    local team = LocalPlayer.Team
    if team then
        inLobby = (team.Name == "Lobby")
    else
        inLobby = false
    end
end

-- 从闪光脚本移植：检查玩家是否有护盾
local function isShielded(player)
    return shieldedPlayers[player] == true
end

-- 从闪光脚本移植：获取最近玩家的头部
local function getClosestHead()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local closestHead = nil
    local closestDistance = math.huge
    local myPos = hrp.Position
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local head = character:FindFirstChild("Head")
                local root = character:FindFirstChild("HumanoidRootPart")
                
                if head and root then
                    local distance = (root.Position - myPos).Magnitude
                    if distance < closestDistance and distance <= rangedRange then
                        closestHead = head
                        closestDistance = distance
                    end
                end
            end
        end
    end
    
    return closestHead
end

-- 从闪光脚本移植：获取装备的武器
local function getEquippedWeapon()
    local char = LocalPlayer.Character
    if not char then return nil end
    for _, child in pairs(char:GetChildren()) do
        if child:IsA("Tool") and child:FindFirstChild("Configuration") then
            return child
        end
    end
    return nil
end

-- 从闪光脚本移植：获取武器配置
local function getWeaponConfig(weapon)
    if not weapon then return nil end
    local config = weapon:FindFirstChild("Configuration")
    if not config then return nil end
    
    local function getValue(name, default)
        local val = config:FindFirstChild(name)
        return val and val.Value or default
    end
    
    return {
        Ammo = getValue("Ammo", 30),
        spread = getValue("spread", 1),
        reloadTime = getValue("reloadTime", 1),
        BulletForce = getValue("BulletForce", 110),
        Damage = getValue("Damage", 10),
        DamageDropoff = getValue("DamageDropoff", 300),
        FireRate = getValue("FireRate", 0.1),
        PelletAmount = getValue("PelletAmount", 1),
        isAuto = getValue("isAuto", false),
        Gravity = getValue("Gravity", 0),
        HitEffect = getValue("HitEffect", "Gib_T"),
        Bullet = getValue("Bullet", "Bullet"),
        isExplosive = getValue("isExplosive", false),
        ExplosionRadius = getValue("ExplosionRadius", 15),
        ExplosionSoundId = getValue("ExplosionSoundId", "rbxassetid://2814354338")
    }
end

-- 从闪光脚本移植：获取武器种子
local function getWeaponSeed(weapon)
    if not weapon then return math.random(1, 1000) end
    local seedVal = weapon:FindFirstChild("Seed")
    return seedVal and seedVal.Value or math.random(1, 1000)
end

-- 从闪光脚本移植：创建轨迹
local function createTrail(origin, targetPos)
    local part = Instance.new("Part")
    part.Size = Vector3.new(0.2, 0.2, 0.2)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.CFrame = CFrame.new(origin)
    part.Parent = Workspace

    local att0 = Instance.new("Attachment", part)
    local att1 = Instance.new("Attachment", Workspace.Terrain)
    att1.WorldPosition = targetPos

    local beam = Instance.new("Beam", part)
    beam.Attachment0 = att0
    beam.Attachment1 = att1
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0))
    beam.Width0 = 0.3
    beam.Width1 = 0.3
    beam.FaceCamera = true
    beam.LightEmission = 1.5

    local billboard = Instance.new("BillboardGui", part)
    billboard.Size = UDim2.new(4, 0, 4, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 200
    
    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "江江江砚辰"
    textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeTransparency = 0.5
    textLabel.TextStrokeColor3 = Color3.fromRGB(255, 150, 0)

    Debris:AddItem(part, 0.3)
end

-- 从闪光脚本移植：播放射击音效
local function playShotSound()
    local snd = Instance.new("Sound", Workspace)
    snd.SoundId = "rbxassetid://9116483270"
    snd.Volume = 0.3
    snd.PlayOnRemove = true
    snd:Destroy()
end

local currentAmmo = nil
local currentSeed = nil
local isReloading = false

-- 从闪光脚本移植：重新装弹
local function doReload(weapon, config)
    if isReloading then return end
    isReloading = true
    
    local reloadTime = config and config.reloadTime or 0.8
    task.wait(reloadTime)
    
    if ReloadEvent then
        ReloadEvent:FireServer()
    end
    
    currentAmmo = config and config.Ammo or 1
    isReloading = false
end

-- 从闪光脚本移植：获取扩散向量
local function getSpreadVector(direction, spreadAmount, weaponSeedValue)
    if currentSeed == nil then currentSeed = 0 end
    if currentSeed == 0 and weaponSeedValue then
        currentSeed = weaponSeedValue
    end
    currentSeed = currentSeed + 11
    local newSeed = currentSeed
    math.randomseed(newSeed)
    local spreadX = math.random(-spreadAmount, spreadAmount) / 100
    local spreadY = math.random(-spreadAmount, spreadAmount) / 100
    local spreadZ = math.random(-spreadAmount, spreadAmount) / 100
    return (direction + Vector3.new(spreadX, spreadY, spreadZ)).Unit, newSeed
end

-- 从闪光脚本移植：执行射线检测
local function performRaycast(origin, direction, maxDistance)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {LocalPlayer.Character, Workspace:FindFirstChild("bulletStorage")}
    
    local result = Workspace:Raycast(origin, direction * maxDistance, params)
    return result
end

-- 从闪光脚本移植：检查目标是否可见
local function isTargetVisible(targetPlayer)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Head") then return false end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then return false end
    local origin = LocalPlayer.Character.Head.Position
    local dest = targetPlayer.Character.Head.Position
    local dir = dest - origin
    local rp = RaycastParams.new()
    rp.FilterType = Enum.RaycastFilterType.Exclude
    rp.FilterDescendantsInstances = {LocalPlayer.Character, targetPlayer.Character}
    local res = Workspace:Raycast(origin, dir, rp)
    return not res
end

-- 从闪光脚本移植：获取偏移
local function GetOffsets(FirePosition, TargetPosition, Offset)
    if not Offset or Offset == 0 then return {FirePosition} end
    local Offsets = {FirePosition}
    local CFrameOffset = CFrame.new(FirePosition, TargetPosition) * CFrame.Angles(0, 0, math.rad(math.random(1, 90)))
    for _,_position in next, ScanPositionsVectors do
        Offsets[#Offsets+1] = CFrameOffset:PointToWorldSpace(_position * Offset)
    end
    return Offsets
end

-- 从闪光脚本移植：直接视线检测
local function IsDirectLineOfSight(shootPos, targetPart)
    local targetPos = targetPart.Position
    local direction = (targetPos - shootPos).Unit
    local distance = (targetPos - shootPos).Magnitude
    if distance < 0.1 then return false end

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, targetPart.Parent}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.IgnoreWater = true

    local result = Workspace:Raycast(shootPos, direction * distance, raycastParams)
    return not result
end

-- 从闪光脚本移植：检查是否可以射击
local function CanShootFromPosition(shootPos, targetPart, allowWallbang)
    local targetPos = targetPart.Position
    local direction = (targetPos - shootPos).Unit
    local distance = (targetPos - shootPos).Magnitude
    if distance < 0.1 then return false, false end

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, targetPart.Parent}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.IgnoreWater = true

    local firstRaycast = Workspace:Raycast(shootPos, direction * distance, raycastParams)

    if not firstRaycast then
        return true, false
    end

    if not allowWallbang then
        return false, false
    end

    local entryPoint = firstRaycast.Position
    
    local exitRayDirection = (shootPos - targetPos).Unit
    local exitRaycast = Workspace:Raycast(targetPos, exitRayDirection * distance, raycastParams)

    if not exitRaycast then
        return false, false
    end
    
    local exitPoint = exitRaycast.Position
    
    local wallThickness = (entryPoint - exitPoint).Magnitude
    
    if wallThickness <= wallbangThickness then
        local finalDirection = (targetPos - exitPoint).Unit
        local finalDistance = (targetPos - exitPoint).Magnitude
        
        if finalDistance < 0.1 then return true, true end

        local finalRaycast = Workspace:Raycast(exitPoint, finalDirection * finalDistance, raycastParams)
        
        if not finalRaycast then
            return true, true
        end
    end
    
    return false, false
end

-- 从闪光脚本移植：查找扫描解决方案
local function FindScanSolution(origin, targetPart)
    local _fireScanOffset = enableScan and fireScanOffset or 0
    local _hitScanOffset = enableScan and hitScanOffset or 0

    local newOrigin = GetOffsets(origin, targetPart.Position, _fireScanOffset)
    local newTarget = GetOffsets(targetPart.Position, origin, _hitScanOffset)

    local directSolutions = {}
    local wallbangSolutions = {}

    for _, _origin in next, newOrigin do
        for _, _target in next, newTarget do
            local mockTargetPart = { Position = _target, Parent = targetPart.Parent }
            local canShoot, isWallbang = CanShootFromPosition(_origin, mockTargetPart, wallbangEnabled)
            if canShoot then
                if not isWallbang then
                    table.insert(directSolutions, {origin = _origin, target = _target})
                else
                    table.insert(wallbangSolutions, {origin = _origin, target = _target})
                end
            end
        end
    end

    if #directSolutions > 0 then
        local best = directSolutions[1]
        return best.origin, best.target, false
    end

    if #wallbangSolutions > 0 then
        local best = wallbangSolutions[1]
        return best.origin, best.target, true
    end

    return nil, nil, false
end

-- 从闪光脚本移植：查找最佳射击位置
local function FindOptimalShootPosition(targetPart)
    if not targetPart or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Head") then return nil, nil end

    local basePos = LocalPlayer.Character.Head.Position
    local targetPos = targetPart.Position
    local shootRadius = wallbangShootRadius
    local targetRadius = wallbangTargetRadius
    
    local bestPos = nil
    local bestHitPos = nil
    local bestScore = -math.huge
    local bestIsDirect = false
    local shootPrecision = 28
    local targetPrecision = 28

    local currentTime = tick()
    if lastShootPos and lastShootHitPos and (currentTime - lastShootPosUpdate) < (1/10) then
        local canShoot, isWallbang = CanShootFromPosition(lastShootPos, {Position = lastShootHitPos, Parent = targetPart.Parent}, wallbangEnabled)
        if canShoot then
            return lastShootPos, lastShootHitPos
        end
    end

    local directCanShoot, _ = CanShootFromPosition(basePos, targetPart, false)
    if directCanShoot then
        return basePos, targetPos
    end

    local directOffsets = {
        Vector3.new(0, 0, 0),
        Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0),
        Vector3.new(0, 1, 0), Vector3.new(0, -1, 0),
        Vector3.new(0, 0, 1), Vector3.new(0, 0, -1),
        Vector3.new(1, 1, 0).Unit, Vector3.new(-1, 1, 0).Unit,
        Vector3.new(1, -1, 0).Unit, Vector3.new(-1, -1, 0).Unit,
    }

    for _, offset in ipairs(directOffsets) do
        local testShootPos = basePos + offset * (shootRadius * 0.5)
        for _, tOffset in ipairs(directOffsets) do
            local testTargetPos = targetPos + tOffset * (targetRadius * 0.3)
            local canShoot, isWallbang = CanShootFromPosition(testShootPos, {Position = testTargetPos, Parent = targetPart.Parent}, wallbangEnabled)
            if canShoot and not isWallbang then
                return testShootPos, testTargetPos
            end
        end
    end

    local directSolutions = {}
    local wallbangSolutions = {}

    for i = 1, shootPrecision do
        local shootAngle = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).Unit
        local shootPos = basePos + shootAngle * math.random() * shootRadius

        for j = 1, targetPrecision do
            local targetAngle = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).Unit
            local testTargetPos = targetPos + targetAngle * math.random() * targetRadius
            
            local canShoot, isWallbang = CanShootFromPosition(shootPos, {Position = testTargetPos, Parent = targetPart.Parent}, wallbangEnabled)
            if canShoot then
                local score = 100 - (shootPos - basePos).Magnitude - (testTargetPos - targetPos).Magnitude
                local solution = {pos = shootPos, hitPos = testTargetPos, score = score}
                
                if not isWallbang then
                    table.insert(directSolutions, solution)
                else
                    table.insert(wallbangSolutions, solution)
                end
            end
        end
    end

    if #directSolutions > 0 then
        table.sort(directSolutions, function(a, b) return a.score > b.score end)
        bestPos = directSolutions[1].pos
        bestHitPos = directSolutions[1].hitPos
    elseif #wallbangSolutions > 0 then
        table.sort(wallbangSolutions, function(a, b) return a.score > b.score end)
        bestPos = wallbangSolutions[1].pos
        bestHitPos = wallbangSolutions[1].hitPos
    end

    if bestPos and bestHitPos then
        lastShootPos = bestPos
        lastShootHitPos = bestHitPos
        lastShootPosUpdate = currentTime
    end

    return bestPos, bestHitPos
end

-- 从闪光脚本移植：墙射功能
local function wallbang(target, shootOriginOverride, firePositionOverride)
    if not target or not ragebotEnabled then return end
    if isReloading then return end
    
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local weapon = getEquippedWeapon()
    if not weapon then return end
    
    local config = getWeaponConfig(weapon)
    if not config then
        config = {
            Ammo = 1, spread = 0, reloadTime = 0.8, BulletForce = 130,
            Gravity = 0, HitEffect = "Gib_T", Bullet = "Bullet",
            isExplosive = false, ExplosionRadius = 15,
            ExplosionSoundId = "rbxassetid://2814354338"
        }
    end
    
    if currentAmmo == nil then
        currentAmmo = config.Ammo
    end
    
    if currentAmmo <= 0 then
        task.spawn(function()
            doReload(weapon, config)
        end)
        return
    end
    
    local weaponSeedValue = 0
    local seedVal = weapon:FindFirstChild("Seed")
    if seedVal then
        weaponSeedValue = seedVal.Value
    end
    
    currentAmmo = currentAmmo - 1
    
    local shootOrigin = shootOriginOverride or Camera.CFrame.Position
    local targetPos = firePositionOverride or target.Position
    
    local fakeCamCFrame = CFrame.new(shootOrigin, targetPos)
    
    local spreadDir, newSeed = getSpreadVector((targetPos - shootOrigin).Unit, config.spread, weaponSeedValue)
    local bulletId = tick()
    
    local hitCFrame = CFrame.new(targetPos, targetPos + Vector3.new(0, 1, 0))
    
    pcall(function()
        if CheckFireEvent then
            CheckFireEvent:FireServer(bulletId, shootOrigin)
        end
        
        if CheckShotEvent then
            CheckShotEvent:FireServer(
                currentAmmo,
                config.spread,
                config.Ammo,
                config.reloadTime,
                fakeCamCFrame,
                Vector3.new(targetPos.X, targetPos.Y, targetPos.Z),
                target,
                newSeed,
                bulletId
            )
        end
        
        if ProjectileFinishedEvent then
            ProjectileFinishedEvent:FireServer(
                bulletId,
                hitCFrame,
                config.HitEffect or "Gib_T",
                config.isExplosive or false,
                config.ExplosionRadius or 15,
                config.ExplosionSoundId or "rbxassetid://2814354338"
            )
        end
    end)
    
    createTrail(shootOrigin, targetPos)
    playShotSound()
    
    if currentAmmo <= 0 then
        task.spawn(function()
            doReload(weapon, config)
        end)
    end
end

-- ==================== RageBot 功能 ====================
local meleeAttackTask = nil
local randomShotTask = nil

local function startMeleeAttack()
    if meleeAttackTask then return end
    
    meleeAttackTask = task.spawn(function()
        while true do
            if attackingA and ragebotEnabled then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local myPos = hrp.Position
                    local target = getClosestHead()
                    
                    if target then
                        local dist = (target.Position - myPos).Magnitude
                        if dist <= meleeRange then
                            task.wait(math.random(200, 500) / 1000)
                        end
                    end
                end
                task.wait(attackIntervalA)
            else
                task.wait(0.3)
            end
        end
    end)
end

local function stopMeleeAttack()
    if meleeAttackTask then
        task.cancel(meleeAttackTask)
        meleeAttackTask = nil
    end
end

local function startRandomShots()
    if randomShotTask then return end
    
    randomShotTask = task.spawn(function()
        while true do
            if ragebotEnabled and attackingB then
                local randomDelay = math.random(5, 15)
                task.wait(randomDelay)
                
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local target = getClosestHead()
                        if target then
                            task.wait(0.5)
                            
                            local targetPlayer = nil
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") == target then
                                    targetPlayer = p
                                    break
                                end
                            end
                            
                            local canFire = false
                            local shootOrigin = Camera.CFrame.Position
                            local firePos = target.Position
                            
                            if enableScan then
                                local scanOrigin, scanTarget, isWallbang = FindScanSolution(shootOrigin, target)
                                if scanOrigin and scanTarget then
                                    shootOrigin = scanOrigin
                                    firePos = scanTarget
                                    canFire = true
                                end
                            else
                                local isVisible = targetPlayer and isTargetVisible(targetPlayer) or false
                                if isVisible then
                                    canFire = true
                                elseif wallbangEnabled then
                                    local optimalShootPos, optimalHitPos = FindOptimalShootPosition(target)
                                    if optimalShootPos and optimalHitPos then
                                        shootOrigin = optimalShootPos
                                        firePos = optimalHitPos
                                        canFire = true
                                    end
                                end
                            end
                            
                            if canFire then
                                wallbang(target, shootOrigin, firePos)
                            end
                        end
                    end
                end
            else
                task.wait(1)
            end
        end
    end)
end

local function stopRandomShots()
    if randomShotTask then
        task.cancel(randomShotTask)
        randomShotTask = nil
    end
end

local function startRotate()
    if rotating or not ragebotEnabled then return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    rotating = true
    rotateConnection = RunService.RenderStepped:Connect(function(dt)
        if not rotating or not ragebotEnabled then return end
        local slowRotation = math.rad(180) * dt
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, slowRotation, 0)
    end)
end

local function stopRotate()
    rotating = false
    if rotateConnection then
        rotateConnection:Disconnect()
        rotateConnection = nil
    end
end

local function setupLegitAim()
    task.spawn(function()
        while true do
            if attackingB and ragebotEnabled then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local target = getClosestHead()
                    
                    if target then
                        local humanoid = char:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.AutoRotate = false
                            
                            local currentCFrame = hrp.CFrame
                            local targetPosition = target.Position
                            local direction = (targetPosition - currentCFrame.Position).Unit
                            
                            local lookCFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + direction)
                            local smoothFactor = 0.3
                            
                            hrp.CFrame = currentCFrame:Lerp(lookCFrame, smoothFactor)
                            
                            local now = tick()
                            if now - lastFireTime >= attackIntervalB then
                                lastFireTime = now
                                
                                local targetPlayer = nil
                                for _, p in ipairs(Players:GetPlayers()) do
                                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") == target then
                                        targetPlayer = p
                                        break
                                    end
                                end
                                
                                local canFire = false
                                local shootOrigin = Camera.CFrame.Position
                                local firePos = target.Position
                                
                                if enableScan then
                                    local scanOrigin, scanTarget, isWallbang = FindScanSolution(shootOrigin, target)
                                    if scanOrigin and scanTarget then
                                        shootOrigin = scanOrigin
                                        firePos = scanTarget
                                        canFire = true
                                    end
                                else
                                    local isVisible = targetPlayer and isTargetVisible(targetPlayer) or false
                                    if isVisible then
                                        canFire = true
                                    elseif wallbangEnabled then
                                        local optimalShootPos, optimalHitPos = FindOptimalShootPosition(target)
                                        if optimalShootPos and optimalHitPos then
                                            shootOrigin = optimalShootPos
                                            firePos = optimalHitPos
                                            canFire = true
                                        end
                                    end
                                end
                                
                                if canFire then
                                    wallbang(target, shootOrigin, firePos)
                                end
                            end
                        end
                    end
                end
            end
            task.wait(attackIntervalB)
        end
    end)
end

-- 切换 RageBot
local function toggleRageBot(enabled)
    ragebotEnabled = enabled
    
    if enabled then
        WindUI:Notify({Title = "RageBot 已启用", Duration = 3})
        setupLegitAim()
        startMeleeAttack()
        startRandomShots()
        
        if rotating then
            startRotate()
        end
    else
        WindUI:Notify({Title = "RageBot 已禁用", Duration = 3})
        stopMeleeAttack()
        stopRandomShots()
        stopRotate()
    end
end

local function toggleAttackingA(enabled)
    attackingA = enabled
    if ragebotEnabled then
        if enabled then
            startMeleeAttack()
        else
            stopMeleeAttack()
        end
    end
end

local function toggleAttackingB(enabled)
    attackingB = enabled
end

local function toggleRotating(enabled)
    rotating = enabled
    if ragebotEnabled then
        if enabled then
            startRotate()
        else
            stopRotate()
        end
    end
end

local function toggleWallbang(enabled)
    wallbangEnabled = enabled
end

-- ==================== 自瞄功能（从闪光脚本移植） ====================
local rainbowhue = 0
local lastupdate = 0

local function getrainbowcolor()
    local currenttime = tick()
    if currenttime - lastupdate >= 0.1 then
        rainbowhue = (rainbowhue + 0.005) % 1
        lastupdate = currenttime
    end
    return Color3.fromHSV(rainbowhue, 1, 1)
end

-- 从闪光脚本移植：获取最近玩家
local function getclosestplayer()
    local localHRP = GetLocalHRP()
    if not localHRP then return nil end
    local mousePos = UserInputService:GetMouseLocation()

    local function getPriorityScore(player)
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return math.huge end
        if player == LocalPlayer or ignoredplayers[player.Name] or (ignoreShielded and isShielded(player)) or (ignoreLobby and player.Team and player.Team.Name == "Lobby") then return math.huge end

        local hrp = player.Character.HumanoidRootPart
        local screen, onscreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onscreen then return math.huge end

        if fovenabled then
            local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
            local distFromCenter = (Vector2.new(screen.X, screen.Y) - center).Magnitude
            if distFromCenter > fovsize/2 then return math.huge end
            if (localHRP.Position - hrp.Position).Magnitude > fovlockdistance then return math.huge end
        end

        if wallcheckenabled then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local origin = localHRP.Parent:FindFirstChild("Head") and localHRP.Parent.Head.Position or localHRP.Position
                local direction = head.Position - origin
                local rayParams = RaycastParams.new()
                rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                rayParams.FilterType = Enum.RaycastFilterType.Exclude
                local result = workspace:Raycast(origin, direction, rayParams)
                if result then
                    if not result.Instance:IsDescendantOf(player.Character) then
                        return math.huge
                    end
                end
            end
        end

        if aimlocktype == "最近玩家" then
            return (localHRP.Position - hrp.Position).Magnitude
        else
            return (Vector2.new(screen.X, screen.Y) - mousePos).Magnitude
        end
    end

    local bestPlayer, bestScore = nil, math.huge
    for _, player in ipairs(prioritizedplayers) do
        local score = getPriorityScore(player)
        if score and score < bestScore then
            bestScore = score
            bestPlayer = player
        end
    end

    if bestPlayer then return bestPlayer end

    for _, player in ipairs(Players:GetPlayers()) do
        if table.find(prioritizedplayers, player) then continue end
        local score = getPriorityScore(player)
        if score and score < bestScore then
            bestScore = score
            bestPlayer = player
        end
    end
    return bestPlayer
end

-- 从闪光脚本移植：获取瞄准部位位置
local function getaimpartposition(targetplayer)
    if not targetplayer or not targetplayer.Character then return nil end
    if aimpart == "头部" and targetplayer.Character:FindFirstChild("Head") then
        return targetplayer.Character.Head.Position
    elseif aimpart == "躯干" then
        local torso = targetplayer.Character:FindFirstChild("UpperTorso") or targetplayer.Character:FindFirstChild("Torso")
        if torso then return torso.Position end
    elseif aimpart == "脚部" and targetplayer.Character:FindFirstChild("HumanoidRootPart") then
        return targetplayer.Character.HumanoidRootPart.Position + Vector3.new(0, -3, 0)
    end
    return nil
end

-- 从闪光脚本移植：更新自瞄
local function updateaimlock()
    local localHRP = GetLocalHRP()
    if not localHRP then 
        isAimingLocked = false
        return 
    end
    
    if inLobby then 
        isAimingLocked = false
        return 
    end

    local targetplayer = aimlockcertainplayer and selectedplayer or getclosestplayer()
    if targetplayer then
        isAimingLocked = true
        local targetposition = getaimpartposition(targetplayer)
        if targetposition then
            targetposition = targetposition + Vector3.new(aimlockOffsetX, aimlockOffsetY, 0)
            local lookdirection = (targetposition - Camera.CFrame.Position).Unit
            if smoothaimlock then
                local targetcframe = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + lookdirection)
                Camera.CFrame = Camera.CFrame:Lerp(targetcframe, lerpalpha)
            else
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + lookdirection)
            end
        end
    else
        isAimingLocked = false
    end
end

-- 从闪光脚本移植：更新FOV圆圈
local function updatefovcircle()
    if fovframe and fovstroke then
        if showfov then
            local color = fovcolor
            if isAimingLocked then
                color = Color3.fromRGB(0, 255, 0)
            elseif rainbowfov then
                color = (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor())
            end
            fovstroke.Color = color
            fovframe.Visible = true
        else
            fovframe.Visible = false
        end
    end
end

-- 从闪光脚本移植：切换自瞄
local function toggleAimlock()
    if aimlockenabled then
         if not aimlockConnection then aimlockConnection = RunService.RenderStepped:Connect(updateaimlock) end
    else
         if aimlockConnection then aimlockConnection:Disconnect() aimlockConnection = nil end
         isAimingLocked = false
    end
end

-- ==================== ESP系统（从闪光脚本移植） ====================
local rainbowhue_esp = 0
local lastupdate_esp = 0
local playerconnections = {}
local tracerlines_drawing = {}

local function getrainbowcolor_esp()
    local currenttime = tick()
    local speedmultiplier = 11 - espconfig.rainbowspeed
    local increment = 0.001 * speedmultiplier
    if currenttime - lastupdate_esp >= 0.1 then
        rainbowhue_esp = (rainbowhue_esp + increment) % 1
        lastupdate_esp = currenttime
    end
    return Color3.fromHSV(rainbowhue_esp, 1, 1)
end

local function getPlayerWeapon(player)
    if not player.Character then return "无" end
    local tool = player.Character:FindFirstChildWhichIsA("Tool")
    if tool then return tool.Name end
    return "无"
end

local function createesp(player)
    if player == LocalPlayer or espobjects[player] then return end
    local nametext = Drawing.new("Text")
    nametext.Size = espconfig.espsize
    nametext.Center = true
    nametext.Outline = true
    nametext.Color = espconfig.espcolor
    nametext.Font = 2
    nametext.Visible = false
    espobjects[player] = { Name = nametext }
end

local function removeesp(player)
    if espobjects[player] then
        espobjects[player].Name:Remove()
        espobjects[player] = nil
    end
end

local function applyhighlighttocharacter(player, character)
    if not character then return end
    local userid = player.UserId
    if activehighlights[userid] then activehighlights[userid]:Destroy() end
    local highlighter = Instance.new("Highlight")
    highlighter.FillTransparency = espconfig.outlinefilltransparency
    highlighter.OutlineTransparency = espconfig.outlinetransparency
    highlighter.OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.outlinecolor
    highlighter.FillColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.outlinefillcolor
    highlighter.Adornee = character
    highlighter.Parent = character
    activehighlights[userid] = highlighter
end

local function removehighlight(player)
    local userid = player.UserId
    if activehighlights[userid] then activehighlights[userid]:Destroy() activehighlights[userid] = nil end
    if playerconnections[userid] then
        for _, conn in pairs(playerconnections[userid]) do if conn then conn:Disconnect() end end
        playerconnections[userid] = nil
    end
end

local function setupplayerhighlight(player)
    local userid = player.UserId
    playerconnections[userid] = playerconnections[userid] or {}
    local function oncharacteradded(character)
        if not character then return end
        task.spawn(function()
            local humanoid = character:WaitForChild("Humanoid", 5)
            if not humanoid then return end
            if outlineenabled then applyhighlighttocharacter(player, character) end
            table.insert(playerconnections[userid], player:GetPropertyChangedSignal("TeamColor"):Connect(function()
                local highlight = activehighlights[userid]
                if highlight then
                    highlight.OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or (player.TeamColor and player.TeamColor.Color) or espconfig.outlinecolor
                end
            end))
            table.insert(playerconnections[userid], humanoid.Died:Connect(function() removehighlight(player) end))
        end)
    end
    local charaddedconn = player.CharacterAdded:Connect(oncharacteradded)
    table.insert(playerconnections[userid], charaddedconn)
    if player.Character then oncharacteradded(player.Character) end
end

local function applyShieldEffect(player)
    if player == LocalPlayer then return end
    shieldedPlayers[player] = true
    if activehighlights[player.UserId] then
        activehighlights[player.UserId].OutlineColor = Color3.fromRGB(255, 0, 0)
        activehighlights[player.UserId].FillColor = Color3.fromRGB(255, 0, 0)
    end
    task.delay(1.5, function()
        if shieldedPlayers[player] then
            shieldedPlayers[player] = nil
            if activehighlights[player.UserId] then
                activehighlights[player.UserId].OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.outlinecolor
                activehighlights[player.UserId].FillColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.outlinefillcolor
            end
        end
    end
    )
end

local function updateesp()
    for player, esp in pairs(espobjects) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local pos, onscreen = Camera:WorldToViewportPoint(hrp.Position)
            local isShielded = shieldedPlayers[player] == true
            local color = isShielded and Color3.fromRGB(255, 0, 0) or (espconfig.rainbowesp and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.espcolor)
            esp.Name.Color = color
            esp.Name.Size = espconfig.espsize
            if onscreen then
                local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
                local weapon = getPlayerWeapon(player)
                local prefix = isShielded and "[护盾] " or ""
                esp.Name.Position = Vector2.new(pos.X, pos.Y - 20)
                esp.Name.Text = prefix .. player.Name .. " | " .. math.floor(distance) .. " 单位 | " .. weapon
                esp.Name.Visible = true
            else
                esp.Name.Visible = false
            end
        else
            esp.Name.Visible = false
        end
    end
    if outlineenabled then
        for _, h in pairs(activehighlights) do
            if h then
                h.OutlineColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.outlinecolor
                h.FillColor = espconfig.rainbowoutline and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.outlinefillcolor
            end
        end
    end
end

do -- Scope wrapper to fix PARSER_LOCAL_LIMIT
function createtracers_drawing()
    tracerlines_drawing = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local line = Drawing.new("Line")
            line.Thickness = espconfig.tracersize
            line.Transparency = 1
            line.Visible = false
            tracerlines_drawing[player] = line
        end
    end
end

function updatetracers_drawing()
    local screenHeight = Camera.ViewportSize.Y
    local fromY
    if espconfig.tracerposition == "底部" then fromY = screenHeight
    elseif espconfig.tracerposition == "中间" then fromY = screenHeight / 2
    elseif espconfig.tracerposition == "顶部" then fromY = 0 end
    for player, line in pairs(tracerlines_drawing) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local root = player.Character.HumanoidRootPart
            local screenpos, onscreen = Camera:WorldToViewportPoint(root.Position)
            local isShielded = shieldedPlayers[player] == true
            local color = isShielded and Color3.fromRGB(255, 0, 0) or (espconfig.rainbowtracers and (rgbAsyncEnabled and getSyncRainbowColor() or getrainbowcolor_esp()) or espconfig.tracercolor)
            if onscreen then
                line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
                line.To = Vector2.new(screenpos.X, screenpos.Y)
                line.Color = color
                line.Visible = true
            else
                line.Visible = false
            end
        else
            line.Visible = false
        end
    end
end

function createRadarArrow(player)
    if radarArrows[player] then return end
    local arrow = Drawing.new("Triangle")
    arrow.Filled = true
    arrow.Thickness = 1
    arrow.Visible = false
    arrow.ZIndex = 1
    radarArrows[player] = arrow
end

function removeRadarArrow(player)
    if radarArrows[player] then
        radarArrows[player]:Remove()
        radarArrows[player] = nil
    end
end

function updateRadar()
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local localHRP = GetLocalHRP()
    if not localHRP then return end

    for player, arrow in pairs(radarArrows) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local distance = (localHRP.Position - hrp.Position).Magnitude
            if distance <= radarRadius then
                local direction = (hrp.Position - localHRP.Position).Unit
                local angle = math.atan2(direction.Z, direction.X)
                local offset = Vector2.new(math.cos(angle), math.sin(angle)) * (radarRadius / 2)
                local arrowPos = screenCenter + offset
                local size = math.clamp(200 / distance, 5, 15)
                
                local head = player.Character:FindFirstChild("Head")
                local visible = true
                if head then
                    local origin = localHRP.Parent:FindFirstChild("Head") and localHRP.Parent.Head.Position or localHRP.Position
                    local rayParams = RaycastParams.new()
                    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                    rayParams.FilterType = Enum.RaycastFilterType.Exclude
                    local result = workspace:Raycast(origin, (head.Position - origin).Unit * distance, rayParams)
                    if result and not result.Instance:IsDescendantOf(player.Character) then
                        arrow.Color = Color3.fromRGB(255, 255, 255)
                        visible = false
                    else
                        arrow.Color = Color3.fromRGB(255, 0, 0)
                    end
                end
                
                local a = Vector2.new(arrowPos.X, arrowPos.Y - size)
                local b = Vector2.new(arrowPos.X - size/2, arrowPos.Y + size/2)
                local c = Vector2.new(arrowPos.X + size/2, arrowPos.Y + size/2)
                
                arrow.PointA = a
                arrow.PointB = b
                arrow.PointC = c
                arrow.Visible = visible
            else
                arrow.Visible = false
            end
        else
            arrow.Visible = false
        end
    end
end

function toggleRadar()
    if radarEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                createRadarArrow(player)
            end
        end
        if not radarUpdateConnection then
            radarUpdateConnection = RunService.RenderStepped:Connect(updateRadar)
        end
    else
        if radarUpdateConnection then
            radarUpdateConnection:Disconnect()
            radarUpdateConnection = nil
        end
        for player, arrow in pairs(radarArrows) do
            arrow:Remove()
        end
        radarArrows = {}
    end
end

function createAimWarningText(player)
    if aimWarningTexts[player] then return end
    local text = Drawing.new("Text")
    text.Size = 20
    text.Center = true
    text.Outline = true
    text.Color = Color3.fromRGB(255, 0, 0)
    text.Font = 2
    text.Visible = false
    aimWarningTexts[player] = text
end

function removeAimWarningText(player)
    if aimWarningTexts[player] then
        aimWarningTexts[player]:Remove()
        aimWarningTexts[player] = nil
    end
end

function updateAimWarning()
    if not aimWarningEnabled then return end
    local localHRP = GetLocalHRP()
    if not localHRP then return end
    
    for player, text in pairs(aimWarningTexts) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local head = player.Character:FindFirstChild("Head")
            if head then
                local direction = (localHRP.Position - head.Position).Unit
                local lookDirection = head.CFrame.LookVector
                local dot = direction:Dot(lookDirection)
                local distance = (localHRP.Position - head.Position).Magnitude
                
                if dot > 0.95 and distance <= aimWarningRange then
                    local pos, onscreen = Camera:WorldToViewportPoint(head.Position)
                    if onscreen then
                        text.Position = Vector2.new(pos.X, pos.Y - 90)
                        text.Text = player.Name .. "瞄准您" .. math.floor(distance) .. "米"
                        text.Visible = true
                    else
                        text.Visible = false
                    end
                else
                    text.Visible = false
                end
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end

function toggleAimWarning()
    if aimWarningEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                createAimWarningText(player)
            end
        end
        if not aimWarningCheckConnection then
            aimWarningCheckConnection = RunService.RenderStepped:Connect(updateAimWarning)
        end
    else
        if aimWarningCheckConnection then
            aimWarningCheckConnection:Disconnect()
            aimWarningCheckConnection = nil
        end
        for player, text in pairs(aimWarningTexts) do
            removeAimWarningText(player)
        end
        aimWarningTexts = {}
    end
end
end -- End scope wrapper

-- ==================== 武器音效系统（从闪光脚本移植） ====================
do -- Scope wrapper to fix PARSER_LOCAL_LIMIT
local function applyCustomSFX()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return end
    local effect = playerGui:FindFirstChild("Effect")
    if not effect then return end
    local hitSound = effect:FindFirstChild("Bang")
    local critSound = effect:FindFirstChild("Crit")
    if hitSound and hitSfxId ~= "" then hitSound.SoundId = "rbxassetid://" .. hitSfxId end
    if critSound and critSfxId ~= "" then critSound.SoundId = "rbxassetid://" .. critSfxId end
end

function toggleAutoApplySFX()
    if autoApplySfx then
        autoApplyConnection = RunService.Heartbeat:Connect(function()
            task.wait(autoApplyDelay)
            applyCustomSFX()
        end)
    else
        if autoApplyConnection then autoApplyConnection:Disconnect() autoApplyConnection = nil end
    end
end
end -- End scope wrapper

-- ==================== 瞬间击中功能（从闪光脚本移植） ====================
 -- Scope wrapper to fix PARSER_LOCAL_LIMIT
local function toggleInstantHit()
    if instantHitEnabled then
        local gunModules = ReplicatedStorage:FindFirstChild("ModuleScripts")
        if not gunModules then return end
        gunModules = gunModules:FindFirstChild("GunModules")
        if not gunModules then return end
        local bulletHandler = require(gunModules:WaitForChild("BulletHandler"))
        if not bulletHandler then return end

        local oldFire = bulletHandler.Fire
        bulletHandler.Fire = function(data)
            local localHRP = GetLocalHRP()
            if not localHRP then return oldFire(data) end
            
            local closestTarget = nil
            local closestDistance = math.huge
            
            for _, player in pairs(Players:GetPlayers()) do
                if player == LocalPlayer then continue end
                if ignoredplayers[player.Name] then continue end
                if ignoreShielded and isShielded(player) then continue end
                if ignoreLobby and player.Team and player.Team.Name == "Lobby" then continue end
                
                local character = player.Character
                if not character then continue end
                
                local head = character:FindFirstChild("Head")
                if not head then continue end
                
                local humanoid = character:FindFirstChild("Humanoid")
                if not humanoid or humanoid.Health <= 0 then continue end
                
                local distance = (localHRP.Position - head.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestTarget = head
                end
            end
            
            if closestTarget then
                data.Force = data.Force * 1000
                data.Direction = (closestTarget.Position - data.Origin).Unit
            end
            
            return oldFire(data)
        end
        
        instantHitConnection = bulletHandler.Fire
    else
        if instantHitConnection then
            local gunModules = ReplicatedStorage:FindFirstChild("ModuleScripts")
            if gunModules then
                gunModules = gunModules:FindFirstChild("GunModules")
                if gunModules then
                    local bulletHandler = require(gunModules:WaitForChild("BulletHandler"))
                    if bulletHandler then
                        bulletHandler.Fire = instantHitConnection
                    end
                end
            end
            instantHitConnection = nil
        end
    end
end

-- ==================== 自动开火功能（从闪光脚本移植） ====================
function startAim(head)
    if AimStateChanged then AimStateChanged:Fire(true) end
    if AimWeapon then AimWeapon:Fire(Enum.UserInputState.Begin) end
    Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
end

function stopAim()
    if AimStateChanged then AimStateChanged:Fire(false) end
    if AimWeapon then AimWeapon:Fire(Enum.UserInputState.End) end
end

function fireOnce(head)
    if isFiring then return end
    isFiring = true
    local ts = os.clock()
    local muz = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso") and LocalPlayer.Character.Torso.Position) or Camera.CFrame.Position
    local hit = head.Position
    local dir = (hit - muz).Unit
    local vel = dir * 800

    if Sound_Request then Sound_Request:FireServer(LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso") or Camera, "rbxassetid://3821795742") end
    if CheckFire then CheckFire:FireServer(ts, hit) end
    local cf = CFrame.lookAt(hit, muz)
    if CheckShot then CheckShot:FireServer(0,0,1,0.8, cf, muz, head, 6310, ts) end
    if ProjectileRender then ProjectileRender:FireServer(ts, LocalPlayer.Character, muz, vel, 130, 1, Vector3.zero, 5, "Bullet") end
    if FireWeaponMobile then
        FireWeaponMobile:Fire(Enum.UserInputState.Begin)
        task.wait(autoFireShootDelay)
        FireWeaponMobile:Fire(Enum.UserInputState.End)
    end
    task.delay(0.1, function()
        if ProjectileFinished then ProjectileFinished:FireServer(ts, head.CFrame, "Gib_T", false, 15, "rbxassetid://2814354338") end
    end)
    task.delay(autoFireDelay, function() isFiring = false end)
end

function toggleAutoFire()
    if autoFireEnabled then
        currentTarget = nil
        isFiring = false
        autoFireConnection = RunService.Heartbeat:Connect(function()
            if not autoFireEnabled then return end
            if inLobby then if currentTarget then stopAim() currentTarget = nil end return end
            local localHRP = GetLocalHRP()
            if not localHRP then if currentTarget then stopAim() currentTarget = nil end return end

            local targetplayer = aimlockcertainplayer and selectedplayer or getclosestplayer()
            if not targetplayer or not targetplayer.Character then if currentTarget then stopAim() currentTarget = nil end return end
            local head = targetplayer.Character:FindFirstChild("Head")
            if not head then if currentTarget then stopAim() currentTarget = nil end return end
            local hum = targetplayer.Character:FindFirstChild("Humanoid")
            if not hum or hum.Health <= 0 then if currentTarget then stopAim() currentTarget = nil end return end

            if targetplayer ~= currentTarget then
                currentTarget = targetplayer
                startAim(head)
            end
            if not isFiring then fireOnce(head) end
        end)
    else
        if autoFireConnection then autoFireConnection:Disconnect() autoFireConnection = nil end
        currentTarget = nil
        isFiring = false
        stopAim()
    end
end

-- ==================== 开箱系统（从闪光脚本移植） ====================
function openKnifeCrates()
    if isOpeningCrates then return end
    isOpeningCrates = true
    for i = 1, knifeCrateCount do
        if RollCrate then RollCrate:FireServer("KnifeCrate") end
        task.wait(0.1)
    end
    isOpeningCrates = false
end

function openGunCrates()
    if isOpeningCrates then return end
    isOpeningCrates = true
    for i = 1, gunCrateCount do
        if RollCrate then RollCrate:FireServer("GunCrate") end
        task.wait(0.1)
    end
    isOpeningCrates = false
end

-- ==================== 击杀音效系统（从闪光脚本移植） ====================
function setupKillSound()
    task.spawn(function()
        while true do
            task.wait(0.5)

            local ls = LocalPlayer:FindFirstChild("leaderstats")
            if not ls then continue end
            local kills = ls:FindFirstChild("Kills")
            if not kills then continue end
            local v = kills.Value

            if v > 50 and v <= 53 then
                local s = Instance.new("Sound")
                s.SoundId = "rbxassetid://1555493683"
                s.Parent = LocalPlayer:WaitForChild("PlayerGui")
                s:Play()
                game:GetService("Debris"):AddItem(s, 2)
            end
        end
    end)
end

-- ==================== 连跳实现 ====================
function setupBunnyHop()
    if bunnyHopEnabled and not bhopConnection then
        bhopConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == Enum.KeyCode.Space then
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end)
    elseif not bunnyHopEnabled and bhopConnection then
        bhopConnection:Disconnect()
        bhopConnection = nil
    end
end

-- ==================== 自动复活实现 ====================
function setupAutoRespawn()
    if autoRespawnEnabled and not autoRespawnConnection then
        autoRespawnConnection = LocalPlayer.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.Died:Connect(function()
                task.wait(3) -- 等待3秒后复活
                if autoRespawnEnabled then
                    LocalPlayer:LoadCharacter()
                end
            end)
        end)
        
        -- 为现有角色设置
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Died:Connect(function()
                    task.wait(3)
                    if autoRespawnEnabled then
                        LocalPlayer:LoadCharacter()
                    end
                end)
            end
        end
    elseif not autoRespawnEnabled and autoRespawnConnection then
        autoRespawnConnection:Disconnect()
        autoRespawnConnection = nil
    end
end

-- ==================== 近战切刀实现 ====================
function setupKnifeCheck()
    if knifeCloseEnabled and not knifeCheckConnection then
        knifeCheckConnection = RunService.Heartbeat:Connect(function()
            local character = LocalPlayer.Character
            if not character then return end
            
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            local closestEnemy = nil
            local closestDistance = math.huge
            
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local enemyHrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if enemyHrp then
                        local distance = (enemyHrp.Position - hrp.Position).Magnitude
                        if distance < closestDistance and distance <= knifeRange then
                            closestEnemy = player
                            closestDistance = distance
                        end
                    end
                end
            end
            
            -- 模拟切刀（需要游戏特定API）
            if closestEnemy then
                -- 这里可以添加切换武器的逻辑
                WindUI:Notify({
                    Title = "近战警告",
                    Content = "敌人接近！距离: " .. math.floor(closestDistance),
                    Duration = 1
                })
            end
        end)
    elseif not knifeCloseEnabled and knifeCheckConnection then
        knifeCheckConnection:Disconnect()
        knifeCheckConnection = nil
    end
end

-- ==================== RGB武器效果实现 ====================
function setupRGBEffects()
    if rgbGunKnifeEnabled and not rgbConnection then
        rgbConnection = RunService.RenderStepped:Connect(function(dt)
            local character = LocalPlayer.Character
            if not character then return end
            
            -- 查找所有武器并添加RGB效果
            for _, child in ipairs(character:GetDescendants()) do
                if child:IsA("BasePart") or child:IsA("MeshPart") then
                    -- 判断是否是武器
                    if child.Name:match("Gun") or child.Name:match("Knife") or child.Name:match("Weapon") then
                        local hue = tick() % 5 / 5
                        local color = Color3.fromHSV(hue, 1, 1)
                        child.Color = color
                        
                        -- 添加发光效果
                        local glow = child:FindFirstChild("RGBGlow") or Instance.new("SurfaceLight")
                        glow.Name = "RGBGlow"
                        glow.Color = color
                        glow.Range = 5
                        glow.Brightness = 0.5
                        glow.Parent = child
                    end
                end
            end
        end)
    elseif not rgbGunKnifeEnabled and rgbConnection then
        rgbConnection:Disconnect()
        rgbConnection = nil
        
        -- 清理RGB效果
        local character = LocalPlayer.Character
        if character then
            for _, child in ipairs(character:GetDescendants()) do
                local glow = child:FindFirstChild("RGBGlow")
                if glow then
                    glow:Destroy()
                end
            end
        end
    end
end

-- ==================== Wind UI 设置 ====================
WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

-- ==================== 渐变文本函数 ====================
function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

-- ==================== 欢迎弹窗 ====================
WindUI:Popup({
    Title = gradient("WQ Hub", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
    Icon = "sparkles",
    Content = "所有功能已加载",
    Buttons = {
        {
            Title = "开始使用",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() end
        }
    }
})

-- ==================== 创建主窗口 ====================
Window = WindUI:CreateWindow({
    Title = "WQ Hub",
    Icon = "palette",
    Author = "loc:WELCOME",
    Folder = "WQ hub",
    Size = UDim2.fromOffset(750, 550),
    Theme = "Dark",
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "用户ID: " .. LocalPlayer.UserId,
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
    ScrollBarEnabled = true
})

-- ==================== UI彩虹边框（从闪光脚本移植） ====================
task.spawn(function()
    local mainContainer = Window.UIElements and Window.UIElements.Main or Window:FindFirstChild("Main")
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "RainbowStroke"
        stroke.Thickness = 2
        stroke.Color = Color3.new(1, 1, 1)
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local gradient = Instance.new("UIGradient")
        gradient.Name = "RainbowGradient"
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(100, 0, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
        })
        gradient.Enabled = true
        gradient.Offset = Vector2.new(0, 0)
        gradient.Parent = stroke
        stroke.Parent = mainContainer
        task.spawn(function()
            local rotationSpeed = 40
            while mainContainer and mainContainer.Parent do
                task.wait(0.01)
                gradient.Rotation = (gradient.Rotation + rotationSpeed * 0.1) % 360
            end
        end)
    end
end)

-- 添加标签
Window:Tag({
    Title = "v2.0",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
    Title = "闪光",
    Color = Color3.fromHex("#FF00FF")
})

-- ==================== 主题切换按钮 ====================
Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "主题已更改",
        Content = "当前主题: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

-- ==================== 创建标签页结构 ====================
Tabs = {
    Main = Window:Section({ Title = "🏠主要", Opened = true }),
    Visuals = Window:Section({ Title = "👀视觉", Opened = true }),
    Features = Window:Section({ Title = "⚠️功能", Opened = true }),
    RageBot = Window:Section({ Title = "🤖RageBot", Opened = true }),
    Settings = Window:Section({ Title = "⚙️设置", Opened = true })
}

TabHandles = {
    Main = Tabs.Main:Tab({ Title = "✅状态", Icon = "user" }),
    Visuals = Tabs.Visuals:Tab({ Title = "✅视觉", Icon = "eye" }),
    Features = Tabs.Features:Tab({ Title = "✅功能", Icon = "bug" }),
    RageBot = Tabs.RageBot:Tab({ Title = "✅RageBot", Icon = "zap" }),
    Settings = Tabs.Settings:Tab({ Title = "✅设置", Icon = "settings" })
}

-- ==================== 主要标签页内容 ====================
TabHandles.Main:Paragraph({
    Title = "状态信息",
    Desc = "玩家实时状态信息",
    Image = "activity",
    ImageSize = 20,
    Color = "White"
})

-- 状态显示
healthParagraph = TabHandles.Main:Paragraph({ Title = "生命值", Desc = "当前生命值: 0" })
fpsParagraph = TabHandles.Main:Paragraph({ Title = "帧数", Desc = "当前帧数: 0" })
pingParagraph = TabHandles.Main:Paragraph({ Title = "延迟", Desc = "网络延迟: 0ms" })

TabHandles.Main:Divider()

TabHandles.Main:Paragraph({
    Title = "角色设置",
    Desc = "角色相关配置",
    Image = "user",
    ImageSize = 20,
    Color = "White"
})

-- 移动速度滑块
speedSlider = TabHandles.Main:Slider({
    Title = "移动速度",
    Desc = "调整角色移动速度",
    Value = { Min = 16, Max = 100, Default = 16 },
    Callback = function(value)
        currentwalkspeed = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

-- 透视开关
TabHandles.Main:Toggle({
    Title = "透视",
    Desc = "启用墙壁透视功能",
    Value = xrayenabled,
    Callback = function(state)
        xrayenabled = state
        if state then
            -- 透视效果（简化版）
            for _, part in ipairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Transparency < 1 then
                    part.LocalTransparencyModifier = xraytransparency
                end
            end
        else
            -- 恢复透明度
            for _, part in ipairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.LocalTransparencyModifier = 0
                end
            end
        end
    end
})

-- 透视透明度滑块
TabHandles.Main:Slider({
    Title = "透视透明度",
    Desc = "调整透视效果透明度",
    Value = { Min = 0, Max = 100, Default = 60 },
    Suffix = "%",
    Callback = function(value)
        xraytransparency = value / 100
        if xrayenabled then
            for _, part in ipairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.Transparency < 1 then
                    part.LocalTransparencyModifier = xraytransparency
                end
            end
        end
    end
})

-- ==================== 视觉标签页内容 ====================
TabHandles.Visuals:Paragraph({
    Title = "ESP 设置",
    Desc = "玩家透视显示配置",
    Image = "eye",
    ImageSize = 20,
    Color = "White"
})

-- ESP 开关
TabHandles.Visuals:Toggle({
    Title = "开启 ESP",
    Desc = "显示玩家信息框体",
    Value = espenabled,
    Callback = function(state)
        espenabled = state
        if state then
            -- 为所有玩家创建 ESP
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    createesp(player)
                end
            end
            
            -- 监听新玩家
            Players.PlayerAdded:Connect(function(player)
                task.wait(1)
                createesp(player)
            end)
            
            -- 监听玩家离开
            Players.PlayerRemoving:Connect(function(player)
                removeesp(player)
            end)
            
            -- 更新ESP
            RunService:BindToRenderStep("ESPUpdate", Enum.RenderPriority.Camera.Value + 1, updateesp)
        else
            for p, _ in pairs(espobjects) do removeesp(p) end
            RunService:UnbindFromRenderStep("ESPUpdate")
        end
    end
})

-- 高亮框体开关
TabHandles.Visuals:Toggle({
    Title = "高亮框体",
    Desc = "高亮显示玩家框体",
    Value = outlineenabled,
    Callback = function(state)
        outlineenabled = state
        if state then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    playerconnections[p.UserId] = {}
                    setupplayerhighlight(p)
                end
            end
        else
            for _, p in ipairs(Players:GetPlayers()) do removehighlight(p) end
        end
    end
})

-- 追踪线开关
TabHandles.Visuals:Toggle({
    Title = "追踪线",
    Desc = "显示玩家追踪线",
    Value = tracersenabled,
    Callback = function(state)
        tracersenabled = state
        if state then
            createtracers_drawing()
            RunService:BindToRenderStep("Tracers", Enum.RenderPriority.Camera.Value + 1, updatetracers_drawing)
        else
            RunService:UnbindFromRenderStep("Tracers")
            for _, line in pairs(tracerlines_drawing) do line:Remove() end
            tracerlines_drawing = {}
        end
    end
})

-- 被瞄预警开关
TabHandles.Visuals:Toggle({
    Title = "被瞄预警",
    Desc = "警告被其他玩家瞄准",
    Value = aimWarningEnabled,
    Callback = function(state)
        aimWarningEnabled = state
        toggleAimWarning()
    end
})

TabHandles.Visuals:Slider({
    Title = "预警范围",
    Desc = "设置被瞄预警范围",
    Value = { Min = 10, Max = 200, Default = 50 },
    Suffix = "单位",
    Callback = function(value)
        aimWarningRange = value
    end
})

TabHandles.Visuals:Divider()

TabHandles.Visuals:Paragraph({
    Title = "ESP配置",
    Desc = "调整ESP相关参数",
    Image = "sliders",
    ImageSize = 20,
    Color = "White"
})

-- ESP配置选项
TabHandles.Visuals:Toggle({
    Title = "彩虹名字",
    Desc = "启用名字彩虹效果",
    Value = false,
    Callback = function(state)
        espconfig.rainbowesp = state
    end
})

TabHandles.Visuals:Toggle({
    Title = "彩虹高亮",
    Desc = "启用高亮彩虹效果",
    Value = false,
    Callback = function(state)
        espconfig.rainbowoutline = state
    end
})

TabHandles.Visuals:Toggle({
    Title = "彩虹追踪线",
    Desc = "启用追踪线彩虹效果",
    Value = false,
    Callback = function(state)
        espconfig.rainbowtracers = state
    end
})

TabHandles.Visuals:Slider({
    Title = "名字大小",
    Desc = "调整ESP名字大小",
    Value = { Min = 16, Max = 48, Default = 16 },
    Callback = function(value)
        espconfig.espsize = value
    end
})

TabHandles.Visuals:Dropdown({
    Title = "追踪线位置",
    Desc = "选择追踪线起始位置",
    Values = { "底部", "中间", "顶部" },
    Value = "底部",
    Callback = function(value)
        espconfig.tracerposition = value
    end
})

TabHandles.Visuals:Slider({
    Title = "边框透明度",
    Desc = "调整高亮边框透明度",
    Value = { Min = 0, Max = 100, Default = 0 },
    Suffix = "%",
    Callback = function(value)
        espconfig.outlinetransparency = value / 100
    end
})

TabHandles.Visuals:Slider({
    Title = "填充透明度",
    Desc = "调整高亮填充透明度",
    Value = { Min = 0, Max = 100, Default = 50 },
    Suffix = "%",
    Callback = function(value)
        espconfig.outlinefilltransparency = value / 100
    end
})

TabHandles.Visuals:Slider({
    Title = "彩虹速度",
    Desc = "调整彩虹效果速度",
    Value = { Min = 1, Max = 10, Default = 5 },
    Callback = function(value)
        espconfig.rainbowspeed = value
    end
})

TabHandles.Visuals:Divider()

TabHandles.Visuals:Paragraph({
    Title = "雷达设置",
    Desc = "玩家雷达显示配置",
    Image = "radar",
    ImageSize = 20,
    Color = "White"
})

-- 雷达开关
TabHandles.Visuals:Toggle({
    Title = "360°雷达",
    Desc = "显示360度雷达",
    Value = false,
    Callback = function(state)
        radarEnabled = state
        toggleRadar()
    end
})

TabHandles.Visuals:Slider({
    Title = "雷达范围",
    Desc = "设置雷达显示范围",
    Value = { Min = 50, Max = 500, Default = 200 },
    Suffix = "单位",
    Callback = function(value)
        radarRadius = value
    end
})

TabHandles.Visuals:Divider()

TabHandles.Visuals:Paragraph({
    Title = "视觉配置",
    Desc = "调整视觉相关参数",
    Image = "sliders",
    ImageSize = 20,
    Color = "White"
})

-- 视野范围滑块
TabHandles.Visuals:Slider({
    Title = "视野范围",
    Desc = "调整摄像机视野范围",
    Value = { Min = 60, Max = 120, Default = 70 },
    Callback = function(value)
        Camera.FieldOfView = value
    end
})

-- 子弹轨迹开关
TabHandles.Visuals:Toggle({
    Title = "子弹轨迹",
    Desc = "显示子弹飞行轨迹",
    Value = bulletTrailsEnabled,
    Callback = function(state)
        bulletTrailsEnabled = state
        WindUI:Notify({
            Title = "子弹轨迹",
            Content = state and "子弹轨迹已启用" or "子弹轨迹已禁用",
            Duration = 2
        })
    end
})

-- RGB武器开关
TabHandles.Visuals:Toggle({
    Title = "RGB 武器",
    Desc = "启用武器 RGB 效果",
    Value = rgbGunKnifeEnabled,
    Callback = function(state)
        rgbGunKnifeEnabled = state
        setupRGBEffects()
    end
})

-- ==================== 功能标签页内容 ====================
-- 从闪光脚本移植的自瞄设置
TabHandles.Features:Paragraph({
    Title = "自瞄设置",
    Desc = "自动瞄准功能配置",
    Image = "target",
    ImageSize = 20,
    Color = "White"
})

-- 自瞄开关
TabHandles.Features:Toggle({
    Title = "开启自瞄",
    Desc = "启用自动瞄准功能",
    Value = aimlockenabled,
    Callback = function(state)
        aimlockenabled = state
        toggleAimlock()
    end
})

-- 自瞄类型下拉框
TabHandles.Features:Dropdown({
    Title = "自瞄类型",
    Desc = "选择自瞄的目标类型",
    Values = { "最近玩家", "最近鼠标" },
    Value = "最近玩家",
    Callback = function(value)
        aimlocktype = value
    end
})

-- 自动开火开关
TabHandles.Features:Toggle({
    Title = "自动开火(测试)",
    Desc = "自动瞄准并开火",
    Value = autoFireEnabled,
    Callback = function(state)
        autoFireEnabled = state
        toggleAutoFire()
    end
})

-- 锁定特定玩家开关
TabHandles.Features:Toggle({
    Title = "锁定特定玩家",
    Desc = "锁定特定玩家进行瞄准",
    Value = aimlockcertainplayer,
    Callback = function(state)
        aimlockcertainplayer = state
    end
})

-- 开启范围开关
TabHandles.Features:Toggle({
    Title = "开启范围",
    Desc = "启用自瞄范围限制",
    Value = fovenabled,
    Callback = function(state)
        fovenabled = state
    end
})

-- 显示范围开关
TabHandles.Features:Toggle({
    Title = "显示范围",
    Desc = "显示自瞄范围圆圈",
    Value = showfov,
    Callback = function(state)
        showfov = state
        if state then 
            if not fovgui then 
                fovgui = Instance.new("ScreenGui") 
                fovgui.Name = "FOVCircle" 
                fovgui.IgnoreGuiInset = true 
                fovgui.Parent = game:GetService("CoreGui") 
                fovframe = Instance.new("Frame") 
                fovframe.Name = "Circle" 
                fovframe.AnchorPoint = Vector2.new(0.5, 0.5) 
                fovframe.Position = UDim2.new(0.5, 0, 0.5, 0) 
                fovframe.BackgroundTransparency = 1
                fovframe.BorderSizePixel = 0 
                fovframe.Parent = fovgui 
                local corner = Instance.new("UICorner") 
                corner.CornerRadius = UDim.new(1, 0) 
                corner.Parent = fovframe 
                fovstroke = Instance.new("UIStroke") 
                fovstroke.Color = Color3.fromRGB(255,255,255) 
                fovstroke.Thickness = fovstrokethickness 
                fovstroke.Parent = fovframe 
                fovframe.Size = UDim2.new(0, fovsize, 0, fovsize) 
            end 
            fovframe.Visible = true 
        else 
            if fovframe then fovframe.Visible = false end 
        end 
    end
})

-- 瞬间击中开关
TabHandles.Features:Toggle({
    Title = "瞬间击中",
    Desc = "启用瞬间击中目标",
    Value = instantHitEnabled,
    Callback = function(state)
        instantHitEnabled = state
        toggleInstantHit()
    end
})

-- 平滑自瞄开关
TabHandles.Features:Toggle({
    Title = "平滑自瞄",
    Desc = "启用平滑过渡瞄准",
    Value = smoothaimlock,
    Callback = function(state)
        smoothaimlock = state
    end
})

-- 瞄准部位下拉框
TabHandles.Features:Dropdown({
    Title = "瞄准部位",
    Desc = "选择瞄准的身体部位",
    Values = { "头部", "躯干", "脚部" },
    Value = "头部",
    Callback = function(value)
        aimpart = value
    end
})

TabHandles.Features:Divider()

TabHandles.Features:Paragraph({
    Title = "自瞄配置",
    Desc = "自瞄高级配置选项",
    Image = "settings",
    ImageSize = 20,
    Color = "White"
})

-- 自瞄配置滑块
TabHandles.Features:Slider({
    Title = "最近玩家锁定距离",
    Desc = "设置最近玩家锁定距离",
    Value = { Min = 10, Max = 5000, Default = 1000 },
    Suffix = "单位",
    Callback = function(value)
        nearestplayerdistance = value
    end
})

TabHandles.Features:Slider({
    Title = "最近鼠标锁定距离",
    Desc = "设置最近鼠标锁定距离",
    Value = { Min = 10, Max = 5000, Default = 500 },
    Suffix = "单位",
    Callback = function(value)
        nearestmousedistance = value
    end
})

TabHandles.Features:Slider({
    Title = "范围锁定距离",
    Desc = "设置自瞄范围锁定距离",
    Value = { Min = 50, Max = 5000, Default = 1000 },
    Suffix = "单位",
    Callback = function(value)
        fovlockdistance = value
    end
})

TabHandles.Features:Slider({
    Title = "平滑自瞄速度",
    Desc = "调整平滑自瞄的速度",
    Value = { Min = 100, Max = 1000, Default = 400 },
    Callback = function(value)
        lerpalpha = value / 1000
    end
})

TabHandles.Features:Toggle({
    Title = "忽略护盾",
    Desc = "忽略带有护盾的玩家",
    Value = true,
    Callback = function(state)
        ignoreShielded = state
    end
})

TabHandles.Features:Toggle({
    Title = "忽略大厅",
    Desc = "忽略大厅中的玩家",
    Value = true,
    Callback = function(state)
        ignoreLobby = state
    end
})

TabHandles.Features:Toggle({
    Title = "彩虹范围",
    Desc = "使自瞄范围显示彩虹色",
    Value = false,
    Callback = function(state)
        rainbowfov = state
    end
})

TabHandles.Features:Slider({
    Title = "范围大小",
    Desc = "调整自瞄范围大小",
    Value = { Min = 1, Max = 750, Default = 100 },
    Callback = function(value)
        fovsize = value
        if fovframe then 
            fovframe.Size = UDim2.new(0, value, 0, value) 
        end
    end
})

TabHandles.Features:Slider({
    Title = "范围边框厚度",
    Desc = "调整自瞄范围边框厚度",
    Value = { Min = 1, Max = 10, Default = 2 },
    Callback = function(value)
        fovstrokethickness = value
        if fovstroke then 
            fovstroke.Thickness = value 
        end
    end
})

TabHandles.Features:Slider({
    Title = "自动开火延迟",
    Desc = "设置自动开火的延迟时间",
    Value = { Min = 1.5, Max = 3, Default = 1.5, Step = 0.1 },
    Suffix = "秒",
    Callback = function(value)
        autoFireDelay = value
    end
})

TabHandles.Features:Slider({
    Title = "自动射击延迟",
    Desc = "设置自动射击的延迟时间",
    Value = { Min = 0.1, Max = 1, Default = 0.1, Step = 0.1 },
    Suffix = "秒",
    Callback = function(value)
        autoFireShootDelay = value
    end
})

TabHandles.Features:Divider()

TabHandles.Features:Toggle({
    Title = "墙体检测",
    Desc = "启用墙体检测功能",
    Value = true,
    Callback = function(state)
        wallcheckenabled = state
    end
})

TabHandles.Features:Divider()

TabHandles.Features:Paragraph({
    Title = "高级配置",
    Desc = "自瞄高级偏移配置",
    Image = "sliders",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Features:Slider({
    Title = "垂直偏移",
    Desc = "调整瞄准的垂直偏移",
    Value = { Min = -1, Max = 1, Default = 0, Step = 0.1 },
    Callback = function(value)
        aimlockOffsetY = value
    end
})

TabHandles.Features:Slider({
    Title = "水平偏移",
    Desc = "调整瞄准的水平偏移",
    Value = { Min = -1, Max = 1, Default = 0, Step = 0.1 },
    Callback = function(value)
        aimlockOffsetX = value
    end
})

TabHandles.Features:Divider()

TabHandles.Features:Paragraph({
    Title = "其他功能",
    Desc = "辅助功能配置",
    Image = "tool",
    ImageSize = 20,
    Color = "White"
})

-- 近战切刀开关
TabHandles.Features:Toggle({
    Title = "近战切刀",
    Desc = "近距离自动切换刀具",
    Value = knifeCloseEnabled,
    Callback = function(state)
        knifeCloseEnabled = state
        setupKnifeCheck()
    end
})

-- 切刀范围滑块
TabHandles.Features:Slider({
    Title = "切刀范围",
    Desc = "设置自动切刀的距离范围",
    Value = { Min = 1, Max = 50, Default = 10 },
    Suffix = "单位",
    Callback = function(value)
        knifeRange = value
    end
})

-- 连跳开关
TabHandles.Features:Toggle({
    Title = "连跳",
    Desc = "启用自动连续跳跃",
    Value = bunnyHopEnabled,
    Callback = function(state)
        bunnyHopEnabled = state
        setupBunnyHop()
    end
})

-- 自动复活开关
TabHandles.Features:Toggle({
    Title = "自动复活",
    Desc = "死亡后自动复活",
    Value = autoRespawnEnabled,
    Callback = function(state)
        autoRespawnEnabled = state
        setupAutoRespawn()
    end
})

-- 武器音效系统
TabHandles.Features:Divider()
TabHandles.Features:Paragraph({
    Title = "武器音效",
    Desc = "自定义武器音效设置",
    Image = "volume-2",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Features:Input({ 
    Default = "", 
    Text = "命中音效", 
    Placeholder = "rbxassetid://...", 
    Callback = function(v) 
        hitSfxId = v:gsub("rbxassetid://", "") 
    end 
})

TabHandles.Features:Input({ 
    Default = "", 
    Text = "暴击音效", 
    Placeholder = "rbxassetid://...", 
    Callback = function(v) 
        critSfxId = v:gsub("rbxassetid://", "") 
    end 
})

TabHandles.Features:Button({
    Text = "应用音效", 
    Callback = applyCustomSFX
})

TabHandles.Features:Toggle({ 
    Text = "自动应用音效", 
    Default = false, 
    Callback = function(v) 
        autoApplySfx = v 
        toggleAutoApplySFX() 
    end 
})

TabHandles.Features:Slider({ 
    Text = "自动应用延迟", 
    Default = 1, 
    Min = 0, 
    Max = 5, 
    Rounding = 2, 
    Suffix = "秒", 
    Callback = function(v) 
        autoApplyDelay = v 
    end 
})

-- 开箱系统
TabHandles.Features:Divider()
TabHandles.Features:Paragraph({
    Title = "开箱系统",
    Desc = "批量开启武器箱",
    Image = "package",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Features:Button({
    Text = "批量开刀箱", 
    Callback = openKnifeCrates
})

TabHandles.Features:Slider({ 
    Text = "刀箱数量", 
    Default = 0, 
    Min = 0, 
    Max = 25, 
    Rounding = 1, 
    Callback = function(v) 
        knifeCrateCount = math.floor(v) 
    end 
})

TabHandles.Features:Button({
    Text = "批量开枪箱", 
    Callback = openGunCrates
})

TabHandles.Features:Slider({ 
    Text = "枪箱数量", 
    Default = 0, 
    Min = 0, 
    Max = 15, 
    Rounding = 1, 
    Callback = function(v) 
        gunCrateCount = math.floor(v) 
    end 
})

-- ==================== RageBot 标签页内容 ====================
TabHandles.RageBot:Paragraph({
    Title = "RageBot 控制",
    Desc = "激进射击模式控制",
    Image = "zap",
    ImageSize = 20,
    Color = "White"
})

-- RageBot 开关
TabHandles.RageBot:Toggle({
    Title = "启用 RageBot",
    Desc = "启用激进射击模式",
    Value = ragebotEnabled,
    Callback = function(state)
        toggleRageBot(state)
    end
})

-- 近战攻击开关
TabHandles.RageBot:Toggle({
    Title = "近战攻击",
    Desc = "启用近战攻击",
    Value = attackingA,
    Callback = function(state)
        toggleAttackingA(state)
    end
})

-- 远程攻击开关
TabHandles.RageBot:Toggle({
    Title = "远程攻击",
    Desc = "启用远程攻击",
    Value = attackingB,
    Callback = function(state)
        toggleAttackingB(state)
    end
})

-- 自动旋转开关
TabHandles.RageBot:Toggle({
    Title = "自动旋转",
    Desc = "自动旋转视角朝向敌人",
    Value = rotating,
    Callback = function(state)
        toggleRotating(state)
    end
})

-- 穿墙射击开关
TabHandles.RageBot:Toggle({
    Title = "穿墙射击",
    Desc = "启用穿墙射击功能",
    Value = wallbangEnabled,
    Callback = function(state)
        toggleWallbang(state)
    end
})

TabHandles.RageBot:Divider()

TabHandles.RageBot:Paragraph({
    Title = "RageBot 配置",
    Desc = "调整 RageBot 参数设置",
    Image = "settings",
    ImageSize = 20,
    Color = "White"
})

-- 近战范围滑块
TabHandles.RageBot:Slider({
    Title = "近战范围",
    Desc = "设置近战攻击距离",
    Value = { Min = 5, Max = 50, Default = 22 },
    Suffix = "单位",
    Callback = function(value)
        meleeRange = value
    end
})

-- 远程范围滑块
TabHandles.RageBot:Slider({
    Title = "远程范围",
    Desc = "设置远程攻击距离",
    Value = { Min = 50, Max = 3000, Default = 2000 },
    Suffix = "单位",
    Callback = function(value)
        rangedRange = value
    end
})

-- 近战攻击间隔滑块
TabHandles.RageBot:Slider({
    Title = "近战攻击间隔",
    Desc = "设置近战攻击时间间隔",
    Value = { Min = 0.5, Max = 3, Default = 1.2 },
    Suffix = "秒",
    Callback = function(value)
        attackIntervalA = value
    end
})

-- 远程攻击间隔滑块
TabHandles.RageBot:Slider({
    Title = "远程攻击间隔",
    Desc = "设置远程攻击时间间隔",
    Value = { Min = 0.1, Max = 3, Default = 1 },
    Suffix = "秒",
    Callback = function(value)
        attackIntervalB = value
    end
})

-- 穿墙厚度滑块
TabHandles.RageBot:Slider({
    Title = "穿墙厚度",
    Desc = "设置穿墙射击的墙体厚度",
    Value = { Min = 0.5, Max = 5, Default = 1 },
    Suffix = "单位",
    Callback = function(value)
        wallbangThickness = value
    end
})

-- 启用扫描开关
TabHandles.RageBot:Toggle({
    Title = "启用扫描",
    Desc = "启用射击点扫描功能",
    Value = true,
    Callback = function(state)
        enableScan = state
    end
})

-- 射击点偏移滑块
TabHandles.RageBot:Slider({
    Title = "射击点偏移",
    Desc = "设置射击点的偏移距离",
    Value = { Min = 0, Max = 20, Default = 7.3 },
    Suffix = "单位",
    Callback = function(value)
        fireScanOffset = value
    end
})

-- 命中点偏移滑块
TabHandles.RageBot:Slider({
    Title = "命中点偏移",
    Desc = "设置命中点的偏移距离",
    Value = { Min = 0, Max = 20, Default = 6.4 },
    Suffix = "单位",
    Callback = function(value)
        hitScanOffset = value
    end
})

-- 手动射击按钮
TabHandles.RageBot:Button({
    Title = "手动射击",
    Desc = "手动执行 RageBot 射击",
    Icon = "target",
    Callback = function()
        if ragebotEnabled then
            local target = getClosestHead()
            if target then
                local targetPlayer = nil
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") == target then
                        targetPlayer = p
                        break
                    end
                end
                
                local canFire = false
                local shootOrigin = Camera.CFrame.Position
                local firePos = target.Position
                
                if enableScan then
                    local scanOrigin, scanTarget, isWallbang = FindScanSolution(shootOrigin, target)
                    if scanOrigin and scanTarget then
                        shootOrigin = scanOrigin
                        firePos = scanTarget
                        canFire = true
                    end
                else
                    local isVisible = targetPlayer and isTargetVisible(targetPlayer) or false
                    if isVisible then
                        canFire = true
                    elseif wallbangEnabled then
                        local optimalShootPos, optimalHitPos = FindOptimalShootPosition(target)
                        if optimalShootPos and optimalHitPos then
                            shootOrigin = optimalShootPos
                            firePos = optimalHitPos
                            canFire = true
                        end
                    end
                end
                
                if canFire then
                    wallbang(target, shootOrigin, firePos)
                    WindUI:Notify({
                        Title = "RageBot 攻击",
                        Content = "已攻击目标: " .. target.Parent.Name,
                        Duration = 2
                    })
                else
                    WindUI:Notify({
                        Title = "RageBot",
                        Content = "无法攻击目标",
                        Duration = 2
                    })
                end
            else
                WindUI:Notify({
                    Title = "RageBot",
                    Content = "未找到有效目标",
                    Duration = 2
                })
            end
        else
            WindUI:Notify({
                Title = "RageBot",
                Content = "请先启用 RageBot",
                Duration = 2
            })
        end
    end
})

TabHandles.RageBot:Paragraph({
    Title = "警告",
    Desc = "使用RageBot可能会被检测到！谨慎使用！",
    Image = "alert-circle",
    ImageSize = 20,
    Color = Color3.fromRGB(255, 50, 50)
})

-- ==================== 设置标签页内容 ====================
TabHandles.Settings:Paragraph({
    Title = "UI 设置",
    Desc = "界面外观设置",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

-- 主题选择下拉框
function buildThemes()
    local themesLocal = {}
    for themeName in pairs(WindUI:GetThemes()) do
        table.insert(themesLocal, themeName)
    end
    table.sort(themesLocal)
    return themesLocal
end

themes = buildThemes()

themeDropdown = TabHandles.Settings:Dropdown({
    Title = "主题",
    Desc = "选择界面主题颜色",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "主题已更改",
            Content = "当前主题: " .. theme,
            Duration = 2
        })
    end
})

-- 窗口透明度滑块
TabHandles.Settings:Slider({
    Title = "窗口透明度",
    Desc = "调整窗口透明度",
    Value = { Min = 0, Max = 1, Default = 0.2 },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(value > 0)
        WindUI.TransparencyValue = value
    end
})

TabHandles.Settings:Divider()

TabHandles.Settings:Paragraph({
    Title = "脚本控制",
    Desc = "脚本管理选项",
    Image = "power",
    ImageSize = 20,
    Color = "White"
})

-- 卸载脚本按钮
TabHandles.Settings:Button({
    Title = "卸载脚本",
    Desc = "完全卸载所有功能脚本",
    Icon = "trash-2",
    Callback = function()
        -- 清理所有功能
        for p, _ in pairs(espobjects) do removeesp(p) end
        
        if bhopConnection then
            bhopConnection:Disconnect()
        end
        
        if autoRespawnConnection then
            autoRespawnConnection:Disconnect()
        end
        
        if knifeCheckConnection then
            knifeCheckConnection:Disconnect()
        end
        
        if rgbConnection then
            rgbConnection:Disconnect()
        end
        
        if rotateConnection then
            rotateConnection:Disconnect()
            rotateConnection = nil
        end
        
        if aimlockConnection then
            aimlockConnection:Disconnect()
            aimlockConnection = nil
        end
        
        if autoFireConnection then
            autoFireConnection:Disconnect()
            autoFireConnection = nil
        end
        
        if instantHitConnection then
            toggleInstantHit()
        end
        
        if autoApplyConnection then
            autoApplyConnection:Disconnect()
            autoApplyConnection = nil
        end
        
        -- 清理FOV圆圈
        if fovgui then
            fovgui:Destroy()
            fovgui = nil
        end
        
        -- 停止近战和随机射击任务
        stopMeleeAttack()
        stopRandomShots()
        
        -- 清理雷达
        toggleRadar()
        
        -- 清理被瞄预警
        toggleAimWarning()
        
        -- 清理追踪线
        for _, line in pairs(tracerlines_drawing) do line:Remove() end
        tracerlines_drawing = {}
        
        -- 清理高亮
        for _, p in ipairs(Players:GetPlayers()) do removehighlight(p) end
        
        -- 关闭窗口
        Window:Destroy()
        
        -- 清理自定义按钮
        if customButtonGui then
            customButtonGui:Destroy()
        end
        
        WindUI:Notify({
            Title = "脚本已卸载",
            Content = "所有功能已成功卸载",
            Duration = 3
        })
    end
})

-- 重新加载按钮
TabHandles.Settings:Button({
    Title = "重新加载",
    Desc = "重新加载脚本界面",
    Icon = "refresh-cw",
    Callback = function()
        WindUI:Notify({
            Title = "重新加载",
            Content = "界面功能已刷新",
            Duration = 2
        })
        
        -- 重新初始化功能
        if espenabled then
            for p, _ in pairs(espobjects) do removeesp(p) end
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    createesp(player)
                end
            end
        end
        
        if bunnyHopEnabled then
            setupBunnyHop()
        end
        
        if autoRespawnEnabled then
            setupAutoRespawn()
        end
        
        if knifeCloseEnabled then
            setupKnifeCheck()
        end
        
        if rgbGunKnifeEnabled then
            setupRGBEffects()
        end
        
        if aimlockenabled then
            toggleAimlock()
        end
        
        if autoFireEnabled then
            toggleAutoFire()
        end
        
        if instantHitEnabled then
            toggleInstantHit()
        end
        
        if autoApplySfx then
            toggleAutoApplySFX()
        end
    end
})

-- ==================== 自定义切换按钮（从闪光脚本移植） ====================
showToggle = isfile("showtoggle.unx")
toggleSize = 100
if isfile("togglesize.unx") then
    sizeStr = readfile("togglesize.unx")
    toggleSize = tonumber(sizeStr) or 100
end

customButtonGui = Instance.new("ScreenGui")
customButtonGui.Name = "CustomButtonGui"
customButtonGui.ResetOnSpawn = false
customButtonGui.IgnoreGuiInset = true
customButtonGui.DisplayOrder = 999999999
customButtonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
customButtonGui.Parent = gethui and gethui() or game:GetService("CoreGui")

button = Instance.new("ImageButton")
button.Name = "CustomButton"
button.Image = "rbxassetid://130346803512317"
button.BackgroundTransparency = 1
button.Position = UDim2.new(0.5, 0, 0, 50)
button.AnchorPoint = Vector2.new(0.5, 0)
button.Size = UDim2.new(0, 60, 0, 60)
button.ClipsDescendants = true
button.ZIndex = 999999999
button.Visible = showToggle
button.Parent = customButtonGui

uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = button

uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 2
uiStroke.Parent = button

uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 140, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 90, 65))
}
uiGradient.Rotation = 0
uiGradient.Parent = uiStroke

function triggerSmallHaptic()
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        local success, supported = pcall(function()
            return HapticService:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small)
        end)
        if success and supported then
            HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0.3)
            task.delay(0.06, function()
                HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0)
            end)
        end
    end
end

currentInput = nil
dragStartPos = nil
isDragging = false
dragThreshold = 8
clickStartTime = 0

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if currentInput then return end
        currentInput = input
        dragStartPos = input.Position
        isDragging = false
        clickStartTime = tick()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == currentInput and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStartPos
        if delta.Magnitude > dragThreshold and not isDragging then
            isDragging = true
        end
        if isDragging then
            local newPos = UDim2.new(0, dragStartPos.X + delta.X, 0, dragStartPos.Y + delta.Y)
            TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Position = newPos}):Play()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input == currentInput then
        local clickDuration = tick() - clickStartTime
        if not isDragging and clickDuration < 0.3 then
            Window:Toggle()
            triggerSmallHaptic()
            local pos = input.Position
            local absPos = button.AbsolutePosition
            local absSize = button.AbsoluteSize
            local relX = (pos.X - absPos.X) / absSize.X
            local relY = (pos.Y - absPos.Y) / absSize.Y
            local wave = Instance.new("ImageLabel")
            wave.Size = UDim2.new(0, 0, 0, 0)
            wave.Position = UDim2.new(relX, 0, relY, 0)
            wave.AnchorPoint = Vector2.new(0.5, 0.5)
            wave.BackgroundTransparency = 1
            wave.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            wave.ImageColor3 = Color3.fromRGB(255, 255, 255)
            wave.ImageTransparency = 0.3
            wave.ZIndex = 999999999
            wave.Parent = button
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = wave
            local tween = TweenService:Create(wave, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
                Size = UDim2.new(2.5, 0, 2.5, 0),
                ImageTransparency = 1
            })
            tween:Play()
            task.delay(0.5, function() wave:Destroy() end)
        end
        currentInput = nil
        isDragging = false
    end
end)

button.MouseEnter:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, button.Size.X.Offset * 1.08, 0, button.Size.Y.Offset * 1.08)
    }):Play()
end)

button.MouseLeave:Connect(function()
    local size = math.clamp(math.min(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y) * 0.08, 50, 80)
    local scale = toggleSize / 100
    TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, size * scale, 0, size * scale)
    }):Play()
end)

function updateButtonSize()
    local base = math.clamp(math.min(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y) * 0.08, 50, 80)
    local scale = toggleSize / 100
    button.Size = UDim2.new(0, base * scale, 0, base * scale)
end

updateButtonSize()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateButtonSize)

-- 添加自定义切换按钮设置到设置标签页
TabHandles.Settings:Toggle({ 
    Text = "自定义开关", 
    Default = showToggle, 
    Callback = function(v) 
        if v then
            writefile("showtoggle.unx", "")
        else
            if isfile("showtoggle.unx") then
                delfile("showtoggle.unx")
            end
        end
        if button then button.Visible = v end
    end 
})

TabHandles.Settings:Slider({ 
    Text = "开关大小 (%)", 
    Default = toggleSize, 
    Min = 50, 
    Max = 200, 
    Rounding = 0, 
    Callback = function(v)
        writefile("togglesize.unx", tostring(v))
        local scale = v / 100
        if button then
            local base = math.clamp(math.min(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y) * 0.08, 50, 80)
            button.Size = UDim2.new(0, base * scale, 0, base * scale)
        end
    end 
})

-- ==================== 主要更新循环 ====================
updateLoop = RunService.RenderStepped:Connect(function(dt)
    -- 更新帧数显示
    fpsParagraph:SetDesc("当前帧数: " .. math.floor(1 / dt))
    
    -- 更新生命值显示
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        healthParagraph:SetDesc("当前生命值: " .. math.floor(char.Humanoid.Health))
    else
        healthParagraph:SetDesc("当前生命值: 0")
    end
    
    -- 更新延迟显示
    if Stats and Stats.Network and Stats.Network.ServerStatsItem then
        local pingItem = Stats.Network.ServerStatsItem["Data Ping"]
        if pingItem then
            pingParagraph:SetDesc("网络延迟: " .. math.floor(pingItem:GetValue()) .. "ms")
        end
    end
    
    -- 检查大厅状态
    checkLobbyStatus()
    
    -- 应用移动速度
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = currentwalkspeed
    end
    
    -- 更新FOV圆圈
    if showfov then
        updatefovcircle()
    end
end)

-- 监听团队变化
LocalPlayer:GetPropertyChangedSignal("Team"):Connect(checkLobbyStatus)
LocalPlayer:GetPropertyChangedSignal("TeamColor"):Connect(checkLobbyStatus)
checkLobbyStatus()

-- 初始化信号事件
task.spawn(function()
    local signalEvents = ReplicatedStorage:WaitForChild("SignalManager", 10)
    if not signalEvents then return end
    signalEvents = signalEvents:WaitForChild("SignalEvents", 10)
    AimWeapon = signalEvents:WaitForChild("AimWeapon", 10)
    AimStateChanged = signalEvents:WaitForChild("AimStateChanged", 10)
    FireWeaponMobile = signalEvents:WaitForChild("FireWeaponMoblie", 10)
    local soundModule = ReplicatedStorage:FindFirstChild("SoundModule")
    if soundModule then Sound_Request = soundModule:WaitForChild("Sound_RequestFromServer_C2S", 10) end
end)

-- 初始化开箱系统
task.spawn(function()
    local signalEvents = ReplicatedStorage:WaitForChild("SignalManager", 10)
    if signalEvents then
        signalEvents = signalEvents:WaitForChild("SignalEvents", 10)
        if signalEvents then SwapWeapon = signalEvents:WaitForChild("SwapWeapon", 10) end
    end
    local remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
    if remotes then RollCrate = remotes:WaitForChild("RollCrate", 10) end
end)

function initExistingPlayers()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            p.CharacterAdded:Connect(function(c)
                applyShieldEffect(p)
                if espenabled then task.wait(0.1) if not espobjects[p] then createesp(p) end end
                if outlineenabled then task.wait(0.1) applyhighlighttocharacter(p, c) end
            end)
        end
    end
end

initExistingPlayers()

Players.PlayerAdded:Connect(function(p)
    if p ~= LocalPlayer then
        if espenabled then createesp(p) end
        if outlineenabled then playerconnections[p.UserId] = {} setupplayerhighlight(p) end
        if tracersenabled then
            local line = Drawing.new("Line")
            line.Thickness = espconfig.tracersize
            line.Transparency = 1
            line.Visible = false
            tracerlines_drawing[p] = line
        end
        if radarEnabled then createRadarArrow(p) end
        if aimWarningEnabled then createAimWarningText(p) end
        p.CharacterAdded:Connect(function(c)
            applyShieldEffect(p)
            if espenabled then task.wait(0.1) if not espobjects[p] then createesp(p) end end
            if outlineenabled then task.wait(0.1) applyhighlighttocharacter(p, c) end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(p)
    removeesp(p)
    removehighlight(p)
    shieldedPlayers[p] = nil
    if tracerlines_drawing[p] then tracerlines_drawing[p]:Remove() tracerlines_drawing[p] = nil end
    removeRadarArrow(p)
    removeAimWarningText(p)
end)

-- 启动击杀音效系统
setupKillSound()

-- ==================== 窗口事件处理 ====================
Window:OnClose(function()
    print("WindUI 界面已关闭")
    -- 停止更新循环
    if updateLoop then
        updateLoop:Disconnect()
    end
    
    -- 关闭旋转连接
    if rotateConnection then
        rotateConnection:Disconnect()
        rotateConnection = nil
    end
    
    -- 关闭自瞄连接
    if aimlockConnection then
        aimlockConnection:Disconnect()
        aimlockConnection = nil
    end
    
    -- 关闭自动开火连接
    if autoFireConnection then
        autoFireConnection:Disconnect()
        autoFireConnection = nil
    end
end)

Window:OnDestroy(function()
    print("WQ已卸载")
    -- 清理所有连接和界面
    if updateLoop then
        updateLoop:Disconnect()
    end
    
    if rotateConnection then
        rotateConnection:Disconnect()
        rotateConnection = nil
    end
    
    if aimlockConnection then
        aimlockConnection:Disconnect()
        aimlockConnection = nil
    end
    
    if autoFireConnection then
        autoFireConnection:Disconnect()
        autoFireConnection = nil
    end
    
    if instantHitConnection then
        toggleInstantHit()
    end
    
    if autoApplyConnection then
        autoApplyConnection:Disconnect()
        autoApplyConnection = nil
    end
    
    if bhopConnection then
        bhopConnection:Disconnect()
    end
    
    if autoRespawnConnection then
        autoRespawnConnection:Disconnect()
    end
    
    if knifeCheckConnection then
        knifeCheckConnection:Disconnect()
    end
    
    if rgbConnection then
        rgbConnection:Disconnect()
    end
    
    -- 清理ESP
    for p, _ in pairs(espobjects) do removeesp(p) end
    
    -- 清理追踪线
    for _, line in pairs(tracerlines_drawing) do line:Remove() end
    tracerlines_drawing = {}
    
    -- 清理FOV圆圈
    if fovgui then
        fovgui:Destroy()
        fovgui = nil
    end
    
    -- 停止近战和随机射击任务
    stopMeleeAttack()
    stopRandomShots()
    
    -- 清理雷达
    toggleRadar()
    
    -- 清理被瞄预警
    toggleAimWarning()
    
    -- 清理高亮
    for _, p in ipairs(Players:GetPlayers()) do removehighlight(p) end
    
    if customButtonGui then
        customButtonGui:Destroy()
    end
end)

-- ==================== 显示欢迎消息 ====================
WindUI:Notify({
    Title = "WQ Hub",
    Content = "所有功能加载完毕",
    Duration = 8,
    Icon = "check"
})

-- 窗口销毁时传送
if Window and Window.Destroying then
    Window.Destroying:Connect(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
end

-- ==================== 返回接口 ====================
return {
    Window = Window,
    WindUI = WindUI,
    -- 导出功能函数
    toggleRageBot = toggleRageBot,
    toggleAimlock = toggleAimlock,
    getClosestHead = getClosestHead,
    -- 从闪光脚本导出的函数
    toggleAttackingA = toggleAttackingA,
    toggleAttackingB = toggleAttackingB,
    toggleRotating = toggleRotating,
    toggleWallbang = toggleWallbang,
    toggleAutoFire = toggleAutoFire,
    toggleInstantHit = toggleInstantHit,
    applyCustomSFX = applyCustomSFX,
    openKnifeCrates = openKnifeCrates,
    openGunCrates = openGunCrates
}
