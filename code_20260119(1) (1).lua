local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "zh",
    Translations = {
        ["zh"] = {
            ["WINDUI_AIMBOT"] = "WQ 自瞄系统",
            ["AIMBOT_DESC"] = "高级自动瞄准系统，精准射击",
            ["AIMBOT_FEATURES"] = "自瞄功能",
            ["AIMBOT_SETTINGS"] = "自瞄设置",
            ["ENABLE_AIMBOT"] = "启用自瞄",
            ["AIMBOT_ENABLED"] = "自瞄已启用",
            ["AIMBOT_DISABLED"] = "自瞄已禁用",
            ["PREDICTION"] = "移动预判",
            ["TEAM_CHECK"] = "团队检查",
            ["ALIVE_CHECK"] = "活体检测",
            ["AIM_STYLE"] = "瞄准风格",
            ["AIM_PRIORITY"] = "瞄准优先级",
            ["TARGET_PART"] = "瞄准部位",
            ["FOV_CIRCLE"] = "FOV圆圈",
            ["SMOOTHNESS"] = "平滑度",
            ["AIM_STYLES"] = "瞄准风格选项",
            ["PRIORITIES"] = "优先级选项",
            ["BODY_PARTS"] = "身体部位",
            ["BONE_SELECTION"] = "骨骼选择",
            ["VISUAL_SETTINGS"] = "视觉设置",
            ["CONFIGURATION"] = "配置管理",
            ["MAIN_AIMBOT"] = "主自瞄",
            ["VISUALS"] = "视觉效果",
            ["SAVE_CONFIG"] = "保存配置",
            ["LOAD_CONFIG"] = "加载配置",
            ["EXPORT_SETTINGS"] = "导出设置",
            ["RESET_TO_DEFAULT"] = "重置为默认",
            ["CONFIG_NAME"] = "配置名称",
            ["ADVANCED_AIMBOT"] = "高级自瞄系统",
            ["TOGGLE_AIMBOT"] = "开关自瞄系统",
            ["PREDICT_MOVEMENT"] = "预判目标移动",
            ["IGNORE_TEAMMATES"] = "忽略队友",
            ["TARGET_ALIVE_ONLY"] = "仅瞄准存活玩家",
            ["SELECT_AIM_BEHAVIOR"] = "选择瞄准行为",
            ["TARGET_SELECTION_PRIORITY"] = "目标选择优先级",
            ["SELECT_BODY_PART"] = "选择身体部位",
            ["SHOW_FOV_CIRCLE"] = "显示FOV圆圈",
            ["CHANGE_FOV_COLOR"] = "更改FOV颜色",
            ["ADJUST_DETECTION_RANGE"] = "调整检测范围",
            ["ADJUST_AIM_SMOOTHNESS"] = "调整瞄准平滑度",
            ["SAVE_LOAD_SETTINGS"] = "保存和加载设置",
            ["COPY_TO_CLIPBOARD"] = "复制到剪贴板",
            ["RESET_ALL_SETTINGS"] = "重置所有设置",
            ["CUSTOMIZE_APPEARANCE"] = "自定义外观",
            ["CUSTOMIZE_VISUAL"] = "自定义视觉外观",
            ["MANAGE_CONFIGURATIONS"] = "管理配置",
            ["ADVANCED_AIMING"] = "高级瞄准",
            ["THEME_CHANGED"] = "主题已更改",
            ["CURRENT_THEME"] = "当前主题",
            ["COLOR_CHANGED"] = "颜色已更改",
            ["NEW_ACCENT"] = "新主题色",
            ["FOV_RADIUS"] = "FOV半径",
            ["SET_TO"] = "设置为",
            ["CONFIG_SAVED"] = "配置已保存",
            ["CONFIG_LOADED"] = "配置已加载",
            ["SETTINGS_EXPORTED"] = "设置已导出",
            ["RESET_COMPLETE"] = "重置完成",
            ["WINDUI_AIMBOT_LOADED"] = "WindUI自瞄已加载",
            ["AIMING_SYSTEM_READY"] = "瞄准系统就绪",
            ["FAILED_TO_SAVE"] = "保存失败",
            ["FAILED_TO_LOAD"] = "加载失败",
            ["USER_PROFILE"] = "用户资料",
            ["AIMBOT_SYSTEM_V1"] = "自瞄系统 v1.0",
            ["WINDUI_VERSION"] = "WindUI版本",
            ["ADVANCED_AIMING_PRECISION"] = "高级瞄准与精确控制",
            ["COPY_VERSION"] = "复制版本",
            ["VERSION_INFO_COPIED"] = "版本信息已复制"
        }
    }
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

local function gradient(text, startColor, endColor)
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

WindUI:Popup({
    Title = gradient("WQ 自瞄", Color3.fromHex("#FF416C"), Color3.fromHex("#FF4B2B")),
    Icon = "target",
    Content = "loc:AIMBOT_DESC",
    Buttons = {
        {
            Title = "开始使用",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() end
        }
    }
})

local Window = WindUI:CreateWindow({
    Title = "loc:WINDUI_AIMBOT",
    Icon = "target",
    Author = "loc:AIMBOT_DESC",
    Folder = "WQ Aimbot",
    Size = UDim2.fromOffset(750, 550),
    Theme = "Dark",
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            WindUI:Notify({
                Title = "loc:USER_PROFILE",
                Content = "loc:AIMBOT_SYSTEM_V1",
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
    ScrollBarEnabled = true
})

Window:Tag({
    Title = "v1.0",
    Color = Color3.fromHex("#30ff6a")
})
Window:Tag({
    Title = "自瞄",
    Color = Color3.fromHex("#ff6b6b")
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "loc:THEME_CHANGED",
        Content = "loc:CURRENT_THEME: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

local Tabs = {
    Main = Window:Section({ Title = "loc:AIMBOT_FEATURES", Opened = true }),
    Settings = Window:Section({ Title = "loc:AIMBOT_SETTINGS", Opened = true }),
    Visuals = Window:Section({ Title = "loc:VISUAL_SETTINGS", Opened = true })
}

local TabHandles = {
    Aimbot = Tabs.Main:Tab({ Title = "loc:MAIN_AIMBOT", Icon = "crosshair" }),
    Config = Tabs.Settings:Tab({ Title = "loc:CONFIGURATION", Icon = "settings" }),
    Visual = Tabs.Visuals:Tab({ Title = "loc:VISUALS", Icon = "eye" })
}

-- 自瞄核心变量
local isAiming = false
local isPredicting = false
local fov = 50
local plr = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Cam = workspace.CurrentCamera
local targetPart = "Head"
local teamCheck = false
local aliveCheck = false
local smoothness = 0.5
local aimStyle = "平滑"
local aimbotPriority = "距离"
local showFOV = true
local fovColor = Color3.fromHex("#FF0000")

-- 安全的FOV圆圈初始化
local FOVring = nil
local function initFOV()
    if Cam and Cam.ViewportSize then
        FOVring = Drawing.new("Circle")
        FOVring.Visible = false
        FOVring.Thickness = 2
        FOVring.Color = fovColor
        FOVring.Filled = false
        FOVring.Radius = fov
        FOVring.Position = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
        return true
    end
    return false
end

local aimConnection = nil

-- 自瞄核心函数
local function updateDrawings()
    if FOVring and Cam and Cam.ViewportSize then
        FOVring.Position = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
        FOVring.Color = fovColor
    end
end

local function getClosestPlayerInFOV()
    local nearest = nil
    local lastDistance = math.huge
    local lowestHealthPlayer = nil
    local lowestHealth = math.huge
    local nearestDistance = math.huge
    local playerMousePos = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
    local fovToUse = fov

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= plr then
            if teamCheck and player.Team == plr.Team then 
                goto continue 
            end
            
            local character = player.Character
            if character and character:FindFirstChild(targetPart) then
                if aliveCheck and (not character:FindFirstChildOfClass("Humanoid") or character:FindFirstChildOfClass("Humanoid").Health <= 0) then 
                    goto continue 
                end
                
                local part = character[targetPart]
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local screenDistance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
                
                if screenDistance < fovToUse and isVisible then
                    local distance = (plr.Character and plr.Character.PrimaryPart and (part.Position - plr.Character.PrimaryPart.Position).Magnitude) or math.huge
                    
                    if aimbotPriority == "距离" and distance < nearestDistance then
                        nearestDistance = distance
                        nearest = player
                    elseif aimbotPriority == "屏幕距离" and screenDistance < lastDistance then
                        lastDistance = screenDistance
                        nearest = player
                    elseif aimbotPriority == "生命值" then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid and humanoid.Health < lowestHealth then
                            lowestHealth = humanoid.Health
                            lowestHealthPlayer = player
                        end
                    end
                end
            end
        end
        ::continue::
    end

    if aimbotPriority == "生命值" and lowestHealthPlayer then
        return lowestHealthPlayer
    end

    return nearest
end

local function smartAimAt(targetPosition)
    if not targetPosition or not Cam then return end
    local currentCFrame = Cam.CFrame
    local targetDirection = (targetPosition - currentCFrame.Position).Unit
    
    if aimStyle == "平滑" then
        local smoothFactor = smoothness
        local lookVector = currentCFrame.LookVector:Lerp(targetDirection, smoothFactor)
        Cam.CFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + lookVector)
        
    elseif aimStyle == "直接" then
        Cam.CFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + targetDirection)
        
    elseif aimStyle == "震动" then
        local lookVector = currentCFrame.LookVector:Lerp(targetDirection, smoothness)
        local shake = Vector3.new(
            (math.random() - 0.5) * 0.1,
            (math.random() - 0.5) * 0.1,
            0
        )
        Cam.CFrame = CFrame.new(currentCFrame.Position, currentCFrame.Position + lookVector + shake)
    end
end

-- 瞄准主循环
local function aimLoop()
    if not isAiming or not Cam then return end
    
    updateDrawings()
    
    local target = getClosestPlayerInFOV()
    if target and target.Character and target.Character:FindFirstChild(targetPart) then
        local targetPos = target.Character[targetPart].Position
        if isPredicting and target.Character[targetPart].Velocity then
            targetPos = targetPos + target.Character[targetPart].Velocity * 0.016 * 1.5
        end
        smartAimAt(targetPos)
    end
end

TabHandles.Aimbot:Paragraph({
    Title = "loc:ADVANCED_AIMBOT",
    Desc = "loc:AIMBOT_DESC",
    Image = "target",
    ImageSize = 20,
    Color = "White",
})

TabHandles.Aimbot:Divider()

local mainToggle = TabHandles.Aimbot:Toggle({
    Title = "loc:ENABLE_AIMBOT",
    Desc = "loc:TOGGLE_AIMBOT",
    Value = false,
    Callback = function(state)
        isAiming = state
        
        if state then
            -- 确保FOV已初始化
            if not FOVring then
                initFOV()
            end
            FOVring.Visible = state and showFOV
            
            if aimConnection then 
                aimConnection:Disconnect() 
            end
            aimConnection = RunService.RenderStepped:Connect(aimLoop)
            WindUI:Notify({
                Title = "自瞄系统",
                Content = "loc:AIMBOT_ENABLED",
                Icon = "check",
                Duration = 2
            })
        elseif aimConnection then
            aimConnection:Disconnect()
            aimConnection = nil
            WindUI:Notify({
                Title = "自瞄系统",
                Content = "loc:AIMBOT_DISABLED",
                Icon = "x",
                Duration = 2
            })
        end
    end
})

TabHandles.Aimbot:Divider()

local predictionToggle = TabHandles.Aimbot:Toggle({
    Title = "loc:PREDICTION",
    Desc = "loc:PREDICT_MOVEMENT",
    Value = false,
    Callback = function(state)
        isPredicting = state
        WindUI:Notify({
            Title = "移动预判",
            Content = state and "已启用" or "已禁用",
            Icon = state and "zap" or "x",
            Duration = 2
        })
    end
})

local teamCheckToggle = TabHandles.Aimbot:Toggle({
    Title = "loc:TEAM_CHECK",
    Desc = "loc:IGNORE_TEAMMATES",
    Value = false,
    Callback = function(state)
        teamCheck = state
        WindUI:Notify({
            Title = "团队检查",
            Content = state and "已启用" or "已禁用",
            Icon = state and "users" or "user",
            Duration = 2
        })
    end
})

local aliveCheckToggle = TabHandles.Aimbot:Toggle({
    Title = "loc:ALIVE_CHECK",
    Desc = "loc:TARGET_ALIVE_ONLY",
    Value = false,
    Callback = function(state)
        aliveCheck = state
        WindUI:Notify({
            Title = "活体检测",
            Content = state and "已启用" or "已禁用",
            Icon = state and "heart" or "heart-off",
            Duration = 2
        })
    end
})

TabHandles.Aimbot:Divider()

local styleDropdown = TabHandles.Aimbot:Dropdown({
    Title = "loc:AIM_STYLE",
    Desc = "loc:SELECT_AIM_BEHAVIOR",
    Values = {"平滑", "直接", "震动"},
    Value = "平滑",
    Callback = function(option)
        aimStyle = option
        WindUI:Notify({
            Title = "瞄准风格",
            Content = "已选择: "..option,
            Duration = 2,
            Icon = "target"
        })
    end
})

local priorityDropdown = TabHandles.Aimbot:Dropdown({
    Title = "loc:AIM_PRIORITY",
    Desc = "loc:TARGET_SELECTION_PRIORITY",
    Values = {"距离", "屏幕距离", "生命值"},
    Value = "距离",
    Callback = function(option)
        aimbotPriority = option
        WindUI:Notify({
            Title = "瞄准优先级",
            Content = "优先级: "..option,
            Duration = 2,
            Icon = "star"
        })
    end
})

local partDropdown = TabHandles.Aimbot:Dropdown({
    Title = "loc:TARGET_PART",
    Desc = "loc:SELECT_BODY_PART",
    Values = {"头", "胸", "腰部", "左手", "右手"},
    Value = "头",
    Callback = function(option)
        local partMap = {
            ["头"] = "Head",
            ["胸"] = "UpperTorso",
            ["腰部"] = "HumanoidRootPart",
            ["左手"] = "LeftHand",
            ["右手"] = "RightHand"
        }
        targetPart = partMap[option]
        WindUI:Notify({
            Title = "瞄准部位",
            Content = "瞄准: "..option,
            Duration = 2,
            Icon = "target"
        })
    end
})

TabHandles.Visual:Paragraph({
    Title = "loc:VISUAL_SETTINGS",
    Desc = "loc:CUSTOMIZE_APPEARANCE",
    Image = "eye",
    ImageSize = 20,
    Color = "White"
})

local showFOVToggle = TabHandles.Visual:Toggle({
    Title = "loc:FOV_CIRCLE",
    Desc = "loc:SHOW_FOV_CIRCLE",
    Value = true,
    Callback = function(state)
        showFOV = state
        if FOVring then
            FOVring.Visible = state and isAiming
        end
        WindUI:Notify({
            Title = "FOV圆圈",
            Content = state and "可见" or "隐藏",
            Icon = state and "circle" or "circle-off",
            Duration = 2
        })
    end
})

TabHandles.Visual:Colorpicker({
    Title = "FOV圆圈颜色",
    Desc = "loc:CHANGE_FOV_COLOR",
    Default = fovColor,
    Callback = function(color)
        fovColor = color
        if FOVring then
            FOVring.Color = color
        end
        WindUI:Notify({
            Title = "loc:COLOR_CHANGED",
            Content = "新FOV颜色已应用",
            Duration = 2
        })
    end
})

local fovSlider = TabHandles.Visual:Slider({
    Title = "loc:FOV_RADIUS",
    Desc = "loc:ADJUST_DETECTION_RANGE",
    Value = { Min = 10, Max = 500, Default = 50 },
    Callback = function(value)
        fov = value
        if FOVring then
            FOVring.Radius = value
        end
        WindUI:Notify({
            Title = "FOV半径",
            Content = "loc:SET_TO: " .. value,
            Duration = 1,
            Icon = "circle"
        })
    end
})

local smoothSlider = TabHandles.Visual:Slider({
    Title = "loc:SMOOTHNESS",
    Desc = "loc:ADJUST_AIM_SMOOTHNESS",
    Value = { Min = 0.01, Max = 1, Default = 0.5 },
    Step = 0.01,
    Callback = function(value)
        smoothness = value
        WindUI:Notify({
            Title = "平滑度",
            Content = "loc:SET_TO: " .. string.format("%.2f", value),
            Duration = 1,
            Icon = "wind"
        })
    end
})

TabHandles.Config:Paragraph({
    Title = "loc:CONFIGURATION",
    Desc = "loc:SAVE_LOAD_SETTINGS",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "自瞄配置"
local ConfigManager = Window.ConfigManager
local AimbotConfig = {
    enabled = false,
    prediction = false,
    teamCheck = false,
    aliveCheck = false,
    aimStyle = "平滑",
    priority = "距离",
    targetPart = "头",
    fov = 50,
    smoothness = 0.5,
    showFOV = true,
    fovColor = "#FF0000"
}

TabHandles.Config:Input({
    Title = "loc:CONFIG_NAME",
    Value = configName,
    Callback = function(value)
        configName = value
    end
})

-- 简单配置管理（替代WindUI配置管理器）
local function saveConfig()
    AimbotConfig = {
        enabled = isAiming,
        prediction = isPredicting,
        teamCheck = teamCheck,
        aliveCheck = aliveCheck,
        aimStyle = aimStyle,
        priority = aimbotPriority,
        targetPart = partDropdown.Value,
        fov = fov,
        smoothness = smoothness,
        showFOV = showFOV,
        fovColor = fovColor:ToHex()
    }
    
    -- 保存到玩家数据
    local playerData = game:GetService("Players").LocalPlayer:FindFirstChild("AimbotConfig") or Instance.new("Folder")
    playerData.Name = "AimbotConfig"
    playerData.Parent = game:GetService("Players").LocalPlayer
    
    -- 清除旧数据
    for _, child in ipairs(playerData:GetChildren()) do
        child:Destroy()
    end
    
    local configValue = Instance.new("StringValue")
    configValue.Name = "Config"
    configValue.Value = game:GetService("HttpService"):JSONEncode(AimbotConfig)
    configValue.Parent = playerData
    
    WindUI:Notify({ 
        Title = "loc:CONFIG_SAVED", 
        Content = "保存为: "..configName,
        Icon = "check",
        Duration = 3
    })
    return true
end

local function loadConfig()
    local playerData = game:GetService("Players").LocalPlayer:FindFirstChild("AimbotConfig")
    if not playerData then
        WindUI:Notify({ 
            Title = "错误", 
            Content = "没有找到保存的配置",
            Icon = "x",
            Duration = 3
        })
        return false
    end
    
    local configValue = playerData:FindFirstChild("Config")
    if not configValue then
        WindUI:Notify({ 
            Title = "错误", 
            Content = "配置数据损坏",
            Icon = "x",
            Duration = 3
        })
        return false
    end
    
    local success, cfg = pcall(function()
        return game:GetService("HttpService"):JSONDecode(configValue.Value)
    end)
    
    if not success then
        WindUI:Notify({ 
            Title = "错误", 
            Content = "配置解析失败",
            Icon = "x",
            Duration = 3
        })
        return false
    end
    
    -- 应用配置
    mainToggle:Set(cfg.enabled or false)
    predictionToggle:Set(cfg.prediction or false)
    teamCheckToggle:Set(cfg.teamCheck or false)
    aliveCheckToggle:Set(cfg.aliveCheck or false)
    
    -- 处理中文选项
    if cfg.aimStyle then
        styleDropdown:Select(cfg.aimStyle)
        aimStyle = cfg.aimStyle
    end
    if cfg.priority then
        priorityDropdown:Select(cfg.priority)
        aimbotPriority = cfg.priority
    end
    if cfg.targetPart then
        partDropdown:Select(cfg.targetPart)
        targetPart = cfg.targetPart == "头" and "Head" or
                    cfg.targetPart == "胸" and "UpperTorso" or
                    cfg.targetPart == "腰部" and "HumanoidRootPart" or
                    cfg.targetPart == "左手" and "LeftHand" or
                    cfg.targetPart == "右手" and "RightHand" or "Head"
    end
    
    showFOVToggle:Set(cfg.showFOV or true)
    fovSlider:Set(cfg.fov or 50)
    smoothSlider:Set(cfg.smoothness or 0.5)
    
    -- 更新变量
    isAiming = cfg.enabled or false
    isPredicting = cfg.prediction or false
    teamCheck = cfg.teamCheck or false
    aliveCheck = cfg.aliveCheck or false
    fov = cfg.fov or 50
    smoothness = cfg.smoothness or 0.5
    showFOV = cfg.showFOV or true
    
    if cfg.fovColor then
        fovColor = Color3.fromHex(cfg.fovColor)
    end
    
    -- 更新FOV显示
    if FOVring then
        FOVring.Color = fovColor
        FOVring.Radius = fov
        FOVring.Visible = showFOV and isAiming
    end
    
    -- 重新连接瞄准循环
    if isAiming and not aimConnection then
        aimConnection = RunService.RenderStepped:Connect(aimLoop)
    elseif not isAiming and aimConnection then
        aimConnection:Disconnect()
        aimConnection = nil
    end
    
    WindUI:Notify({ 
        Title = "loc:CONFIG_LOADED", 
        Content = "已加载: "..configName,
        Icon = "refresh-cw",
        Duration = 5
    })
    return true
end

TabHandles.Config:Button({
    Title = "loc:SAVE_CONFIG",
    Icon = "save",
    Variant = "Primary",
    Callback = function()
        saveConfig()
    end
})

TabHandles.Config:Button({
    Title = "loc:LOAD_CONFIG",
    Icon = "folder",
    Callback = function()
        loadConfig()
    end
})

TabHandles.Config:Divider()

TabHandles.Config:Button({
    Title = "loc:EXPORT_SETTINGS",
    Icon = "download",
    Callback = function()
        local exportData = {
            AimbotSettings = {
                启用自瞄 = isAiming,
                移动预判 = isPredicting,
                团队检查 = teamCheck,
                活体检测 = aliveCheck,
                瞄准风格 = aimStyle,
                瞄准优先级 = aimbotPriority,
                瞄准部位 = partDropdown.Value,
                FOV半径 = fov,
                平滑度 = smoothness,
                显示FOV = showFOV,
                FOV颜色 = fovColor:ToHex()
            },
            导出时间 = os.date("%Y年%m月%d日 %H:%M:%S")
        }
        
        local json = game:GetService("HttpService"):JSONEncode(exportData)
        if setclipboard then
            setclipboard(json)
            WindUI:Notify({
                Title = "loc:SETTINGS_EXPORTED",
                Content = "loc:COPY_TO_CLIPBOARD",
                Duration = 3,
                Icon = "clipboard"
            })
        else
            WindUI:Notify({
                Title = "导出失败",
                Content = "剪贴板功能不可用",
                Duration = 3,
                Icon = "x"
            })
        end
    end
})

TabHandles.Config:Button({
    Title = "loc:RESET_TO_DEFAULT",
    Icon = "refresh-cw",
    Variant = "Destructive",
    Callback = function()
        Window:Dialog({
            Title = "重置设置",
            Content = "确定要重置所有设置为默认值吗？",
            Buttons = {
                {
                    Title = "取消",
                    Variant = "Secondary"
                },
                {
                    Title = "重置",
                    Variant = "Destructive",
                    Callback = function()
                        -- 重置所有设置
                        mainToggle:Set(false)
                        predictionToggle:Set(false)
                        teamCheckToggle:Set(false)
                        aliveCheckToggle:Set(false)
                        styleDropdown:Select("平滑")
                        priorityDropdown:Select("距离")
                        partDropdown:Select("头")
                        showFOVToggle:Set(true)
                        fovSlider:Set(50)
                        smoothSlider:Set(0.5)
                        
                        -- 重置变量
                        isAiming = false
                        isPredicting = false
                        teamCheck = false
                        aliveCheck = false
                        aimStyle = "平滑"
                        aimbotPriority = "距离"
                        targetPart = "Head"
                        fov = 50
                        smoothness = 0.5
                        showFOV = true
                        fovColor = Color3.fromHex("#FF0000")
                        
                        if FOVring then
                            FOVring.Color = fovColor
                            FOVring.Radius = fov
                            FOVring.Visible = false
                        end
                        
                        if aimConnection then
                            aimConnection:Disconnect()
                            aimConnection = nil
                        end
                        
                        WindUI:Notify({
                            Title = "loc:RESET_COMPLETE",
                            Content = "所有设置已重置为默认值",
                            Duration = 3,
                            Icon = "check"
                        })
                    end
                }
            }
        })
    end
})

local footerSection = Window:Section({ Title = "WQ 自瞄系统" })
TabHandles.Config:Paragraph({
    Title = "WQ 自瞄系统",
    Desc = "loc:ADVANCED_AIMING_PRECISION",
    Image = "target",
    ImageSize = 20,
    Color = "Grey",
    Buttons = {
        {
            Title = "loc:COPY_VERSION",
            Icon = "copy",
            Variant = "Tertiary",
            Callback = function()
                if setclipboard then
                    setclipboard("WQ自瞄系统 v1.0")
                    WindUI:Notify({
                        Title = "已复制",
                        Content = "loc:VERSION_INFO_COPIED",
                        Duration = 2
                    })
                end
            end
        }
    }
})

-- 初始化FOV圆圈（延迟以确保相机已加载）
spawn(function()
    wait(1) -- 等待1秒确保游戏加载完成
    if not initFOV() then
        warn("FOV圆圈初始化失败：相机未加载")
    end
end)

Window:OnClose(function()
    print("自瞄窗口已关闭")
    
    -- 保存配置
    saveConfig()
    print("自瞄配置已自动保存")
    
    -- 清理资源
    if aimConnection then
        aimConnection:Disconnect()
        aimConnection = nil
    end
    
    if FOVring then
        FOVring:Remove()
    end
end)

Window:OnDestroy(function()
    print("自瞄窗口已销毁")
    
    -- 确保清理所有资源
    if aimConnection then
        aimConnection:Disconnect()
        aimConnection = nil
    end
    
    if FOVring then
        FOVring:Remove()
    end
end)

-- 游戏退出时清理
game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic

WindUI:Notify({
    Title = "loc:WINDUI_AIMBOT_LOADED",
    Content = "loc:AIMING_SYSTEM_READY",
    Duration = 3,
    Icon = "target"
})