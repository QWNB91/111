-- WQ Hub
-- 作者：五月 & 秋晚
-- 基于 WindUI 功能整合
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local mt = getrawmetatable(game)
local old_namecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" and not checkcaller() then
        local eventName = args[1]
        if eventName == "LogKick" or eventName == "LogACTrigger" then
            warn("[Bypass] Blocked AC Network Request:", eventName)
            return nil
        end
    end

    return old_namecall(self, ...)
end)

setreadonly(mt, true)

local ac_table_found = false

for _, v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "punish") and rawget(v, "getAcNameAndAbbr") then
        
        warn("[Bypass] Found AntiCheatHandler Table.")
        
        local original_punish = v.punish
        
        hookfunction(original_punish, function(...)
            local args = {...}
            local punishInfo = args[2]
            
            if punishInfo then
                warn("[Bypass] Local Punish Prevented. Reason:", punishInfo.reason, "| Type:", punishInfo.punishType)
            else
                warn("[Bypass] Local Punish Prevented (Unknown Args)")
            end
            return
        end)
        
        ac_table_found = true
    end
end

if not ac_table_found then
    warn("[Warning] Could not find AntiCheatHandler via GC. The script might not be loaded yet.")
else
    print("[Success] Anti-Cheat Neutralized.")
end
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "zh",
    Translations = {
        ["zh"] = {
            ["WQ_HUB_TITLE"] = "WQ Hub",
            ["WELCOME"] = "欢迎使用 WQ Hub",
            ["LIB_DESC"] = "战斗勇士",
            ["MAIN_FEATURES"] = "主要功能",
            ["OTHER_FEATURES"] = "其他功能",
            ["SCRIPTS"] = "脚本功能",
            ["SETTINGS"] = "设置",
            ["CONFIGURATION"] = "配置",
            ["PLAYER_VISION"] = "玩家视觉",
            ["AUTOMATION"] = "自动化",
            ["COMBAT"] = "战斗功能",
            ["MISC"] = "其他功能",
            ["SAVE_CONFIG"] = "保存配置",
            ["LOAD_CONFIG"] = "加载配置",
            ["THEME_SELECT"] = "选择主题",
            ["TRANSPARENCY"] = "窗口透明度"
        }
    }
})

-- 全局设置
_G.Settings = {
    enabled = false,
    antistuck = true,
    esp = false,
    autoequip = false,
    autospawn = false,
    antiparry = false,
    followclosest = false,
    autohit = false,
    antiradgoll = false,
    usehitbox = 1,
    loopspeed = 5,
    range = 50,
    stompaura = false,
    usemethod2 = false,
    autojump = false
}

-- 初始化 WindUI
WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")

-- 渐变标题函数
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

-- 显示欢迎弹窗
WindUI:Popup({
    Title = gradient("WQ Hub ", Color3.fromHex("#FF6B6B"), Color3.fromHex("#4ECDC4")),
    Icon = "sparkles",
    Content = "战斗勇士",
    Buttons = {
        {
            Title = "开始使用",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() end
        }
    }
})

-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "WQ Hub",
    Icon = "swords",
    Author = "欢迎使用 WQ Hub",
    Folder = "WQ_Hub",
    Size = UDim2.fromOffset(750, 550),
    Theme = "Dark",
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            WindUI:Notify({
                Title = "用户信息",
                Content = "作者：五月 & 秋晚",
                Duration = 3
            })
        end
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true
})

-- 添加标签
Window:Tag({
    Title = "v6",
    Color = Color3.fromHex("#4ECDC4")
})

Window:Tag({
    Title = "战斗勇士",
    Color = Color3.fromHex("#FF6B6B")
})

-- 主题切换按钮
Window:CreateTopbarButton("主题切换器", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "主题已切换",
        Content = "当前主题: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

-- 创建标签页
local Tabs = {
    Main = Window:Section({ Title = "主要功能", Opened = true }),
    Other = Window:Section({ Title = "其他功能", Opened = true }),
    Scripts = Window:Section({ Title = "脚本功能", Opened = true }),
    Settings = Window:Section({ Title = "设置", Opened = true })
}

local TabHandles = {
    Main = Tabs.Main:Tab({ Title = "自动化", Icon = "zap" }),
    Vision = Tabs.Other:Tab({ Title = "玩家视觉", Icon = "eye" }),
    Combat = Tabs.Other:Tab({ Title = "战斗功能", Icon = "sword" }),
    Script = Tabs.Scripts:Tab({ Title = "脚本功能", Icon = "code" }),
    Config = Tabs.Settings:Tab({ Title = "配置", Icon = "settings" })
}

-- 保存设置函数
local function saveSettings()
    if Window.ConfigManager then
        local config = Window.ConfigManager:CreateConfig("wq_hub_settings")
        config:Set("settings", _G.Settings)
        config:Save()
    end
end

-- 加载设置函数
local function loadSettings()
    if Window.ConfigManager then
        local config = Window.ConfigManager:CreateConfig("wq_hub_settings")
        local data = config:Load()
        if data and data.settings then
            _G.Settings = data.settings
            return true
        end
    end
    return false
end

-- ESP 功能函数
local function addEsp()
    for _, playerChar in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if playerChar.Name ~= game.Players.LocalPlayer.Name and not playerChar.HumanoidRootPart:FindFirstChild("eyeesspee") then
            -- 头部 Billboard
            local headBillboard = Instance.new("BillboardGui", playerChar:WaitForChild("Head"))
            headBillboard.LightInfluence = 0
            headBillboard.Size = UDim2.new(40, 40, 1, 1)
            headBillboard.StudsOffset = Vector3.new(0, 3, 0)
            headBillboard.ZIndexBehavior = "Global"
            headBillboard.ClipsDescendants = false
            headBillboard.AlwaysOnTop = true
            headBillboard.Name = "Head"
            
            local nameText = Instance.new("TextBox", headBillboard)
            nameText.BackgroundTransparency = 1
            nameText.Size = UDim2.new(1, 1, 1, 1)
            nameText.Font = "GothamBold"
            nameText.Text = playerChar.Name
            nameText.TextScaled = true
            nameText.TextYAlignment = "Top"
            nameText.TextColor3 = Color3.fromRGB(255, 55, 55)
            
            -- 身体 Billboard
            local bodyBillboard = Instance.new("BillboardGui", playerChar:WaitForChild("HumanoidRootPart"))
            bodyBillboard.LightInfluence = 0
            bodyBillboard.Size = UDim2.new(3, 3, 5, 5)
            bodyBillboard.StudsOffset = Vector3.new(0, 0, 0)
            bodyBillboard.ZIndexBehavior = "Global"
            bodyBillboard.ClipsDescendants = false
            bodyBillboard.AlwaysOnTop = true
            bodyBillboard.Name = "eyeesspee"
            
            local bodyText = Instance.new("TextBox", bodyBillboard)
            bodyText.BackgroundTransparency = 0.85
            bodyText.Size = UDim2.new(1, 1, 1, 1)
            bodyText.Font = "GothamBold"
            bodyText.Text = " "
            bodyText.TextScaled = true
            bodyText.TextYAlignment = "Top"
            bodyText.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
        end
    end
end

local function removeEsp()
    for _, playerChar in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if playerChar.Name ~= game.Players.LocalPlayer.Name then
            if playerChar.HumanoidRootPart:FindFirstChild("eyeesspee") then
                playerChar.HumanoidRootPart.eyeesspee:Destroy()
            end
            if playerChar.Head:FindFirstChild("Head") then
                playerChar.Head.Head:Destroy()
            end
        end
    end
end

-- 自动行走函数
local function walkToClosest()
    local localPlayer = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]
    local localHRP = localPlayer:FindFirstChild("HumanoidRootPart")
    
    if not localHRP then return end
    
    local closestDistance = 999999
    local closestHRP = nil
    
    for _, playerChar in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if playerChar.Name ~= game.Players.LocalPlayer.Name and playerChar.Humanoid.Health > 0 then
            local targetHRP = playerChar:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                local distance = (localHRP.Position - targetHRP.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestHRP = targetHRP
                end
            end
        end
    end
    
    if closestHRP then
        localPlayer.Humanoid:MoveTo(closestHRP.Position)
    end
end

-- 主功能标签页
TabHandles.Main:Paragraph({
    Title = "自动化功能",
    Desc = "自动执行常用操作",
    Image = "zap",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Main:Divider()

local autoWalkToggle = TabHandles.Main:Toggle({
    Title = "自动行走",
    Desc = "自动走向最近的玩家",
    Value = _G.Settings.followclosest,
    Callback = function(state)
        _G.Settings.followclosest = state
        saveSettings()
        WindUI:Notify({
            Title = "自动行走",
            Content = state and "已启用" or "已禁用",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local autoSpawnToggle = TabHandles.Main:Toggle({
    Title = "自动重生",
    Desc = "死亡后自动重生",
    Value = _G.Settings.autospawn,
    Callback = function(state)
        _G.Settings.autospawn = state
        saveSettings()
    end
})

local autoEquipToggle = TabHandles.Main:Toggle({
    Title = "自动装备",
    Desc = "自动装备武器",
    Value = _G.Settings.autoequip,
    Callback = function(state)
        _G.Settings.autoequip = state
        saveSettings()
    end
})

local autoHitToggle = TabHandles.Main:Toggle({
    Title = "自动攻击",
    Desc = "自动进行攻击",
    Value = _G.Settings.autohit,
    Callback = function(state)
        _G.Settings.autohit = state
        saveSettings()
        if state then
            task.spawn(function()
                while task.wait(0.1) and _G.Settings.autohit do
                    mouse1click()
                end
            end)
        end
    end
})

-- 视觉标签页
TabHandles.Vision:Paragraph({
    Title = "玩家视觉功能",
    Desc = "增强玩家视觉效果",
    Image = "eye",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Vision:Divider()

local espToggle = TabHandles.Vision:Toggle({
    Title = "玩家透视",
    Desc = "显示其他玩家的位置和名称",
    Value = _G.Settings.esp,
    Callback = function(state)
        _G.Settings.esp = state
        saveSettings()
        if state then
            addEsp()
        else
            removeEsp()
        end
    end
})

TabHandles.Vision:Colorpicker({
    Title = "ESP颜色",
    Desc = "设置玩家透视的颜色",
    Default = Color3.fromRGB(255, 55, 55),
    Callback = function(color)
        -- 这里可以添加颜色更新逻辑
        WindUI:Notify({
            Title = "颜色已更新",
            Content = "ESP颜色已更改",
            Duration = 2
        })
    end
})

-- 战斗标签页
TabHandles.Combat:Paragraph({
    Title = "战斗功能",
    Desc = "增强战斗能力",
    Image = "sword",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Combat:Divider()

local antiParryToggle = TabHandles.Combat:Toggle({
    Title = "反格挡",
    Desc = "防止攻击被格挡",
    Value = _G.Settings.antiparry,
    Callback = function(state)
        _G.Settings.antiparry = state
        saveSettings()
    end
})

local antiRagdollToggle = TabHandles.Combat:Toggle({
    Title = "反辍尸",
    Desc = "防止被击倒",
    Value = _G.Settings.antiradgoll,
    Callback = function(state)
        _G.Settings.antiradgoll = state
        saveSettings()
        if state then
            task.spawn(function()
                while task.wait(0.5) and _G.Settings.antiradgoll do
                    pcall(function()
                        game:GetService("Players").LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
                    end)
                end
            end)
        end
    end
})

local stompAuraToggle = TabHandles.Combat:Toggle({
    Title = "踩踏光环",
    Desc = "启用踩踏攻击范围",
    Value = _G.Settings.stompaura,
    Callback = function(state)
        _G.Settings.stompaura = state
        saveSettings()
    end
})

TabHandles.Combat:Slider({
    Title = "攻击范围",
    Desc = "设置自动攻击的范围",
    Value = { Min = 10, Max = 100, Default = _G.Settings.range },
    Callback = function(value)
        _G.Settings.range = value
        saveSettings()
    end
})

-- 脚本标签页
TabHandles.Script:Paragraph({
    Title = "脚本功能",
    Desc = "执行外部脚本功能",
    Image = "code",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Script:Divider()

TabHandles.Script:Button({
    Title = "无障体势",
    Icon = "shield",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wtYHDGXe/raw"))()
        WindUI:Notify({
            Title = "脚本已执行",
            Content = "无障体势脚本已加载",
            Duration = 3
        })
    end
})

TabHandles.Script:Button({
    Title = "反盾脚本",
    Icon = "shield-off",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/9jhuTwes/raw"))()
        WindUI:Notify({
            Title = "脚本已执行",
            Content = "反盾脚本已加载",
            Duration = 3
        })
    end
})

TabHandles.Script:Button({
    Title = "自动格挡",
    Icon = "shield-check",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/p80SKVYg"))()
        WindUI:Notify({
            Title = "脚本已执行",
            Content = "自动格挡脚本已加载",
            Duration = 3
        })
    end
})

TabHandles.Script:Button({
    Title = "敌人打不死",
    Icon = "skull",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpawnBox.SpawnPart.CFrame
        end)
        WindUI:Notify({
            Title = "功能已执行",
            Content = "已传送到安全位置",
            Duration = 3
        })
    end
})

-- 配置标签页
TabHandles.Config:Paragraph({
    Title = "配置管理",
    Desc = "保存和加载您的设置",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

TabHandles.Config:Divider()

local configName = "wq_hub"

TabHandles.Config:Input({
    Title = "配置名称",
    Value = configName,
    Callback = function(value)
        configName = value
    end
})

TabHandles.Config:Button({
    Title = "保存配置",
    Icon = "save",
    Variant = "Primary",
    Callback = function()
        if Window.ConfigManager then
            local config = Window.ConfigManager:CreateConfig(configName)
            config:Set("settings", _G.Settings)
            config:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            
            if config:Save() then
                WindUI:Notify({
                    Title = "配置已保存",
                    Content = "保存为: "..configName,
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "保存失败",
                    Content = "无法保存配置",
                    Icon = "x",
                    Duration = 3
                })
            end
        else
            WindUI:Notify({
                Title = "配置管理器不可用",
                Content = "请确保配置管理器已启用",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
    end
})

TabHandles.Config:Button({
    Title = "加载配置",
    Icon = "folder",
    Callback = function()
        if Window.ConfigManager then
            local config = Window.ConfigManager:CreateConfig(configName)
            local data = config:Load()
            
            if data and data.settings then
                _G.Settings = data.settings
                
                -- 更新UI状态
                autoWalkToggle:Set(_G.Settings.followclosest)
                autoSpawnToggle:Set(_G.Settings.autospawn)
                autoEquipToggle:Set(_G.Settings.autoequip)
                autoHitToggle:Set(_G.Settings.autohit)
                espToggle:Set(_G.Settings.esp)
                antiParryToggle:Set(_G.Settings.antiparry)
                antiRagdollToggle:Set(_G.Settings.antiradgoll)
                stompAuraToggle:Set(_G.Settings.stompaura)
                
                local lastSave = data.lastSave or "未知时间"
                WindUI:Notify({
                    Title = "配置已加载",
                    Content = "加载: "..configName.."\n最后保存: "..lastSave,
                    Icon = "refresh-cw",
                    Duration = 5
                })
            else
                WindUI:Notify({
                    Title = "加载失败",
                    Content = "无法加载配置",
                    Icon = "x",
                    Duration = 3
                })
            end
        else
            WindUI:Notify({
                Title = "配置管理器不可用",
                Content = "请确保配置管理器已启用",
                Icon = "alert-triangle",
                Duration = 3
            })
        end
    end
})

-- 设置标签页中的外观设置
local appearanceTab = Tabs.Settings:Tab({ Title = "外观设置", Icon = "palette" })

appearanceTab:Paragraph({
    Title = "界面外观",
    Desc = "自定义界面外观",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

appearanceTab:Dropdown({
    Title = "选择主题",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "主题已应用",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
    end
})

appearanceTab:Slider({
    Title = "窗口透明度",
    Value = { Min = 0, Max = 1, Default = 0.2 },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
    end
})

-- 页脚
local footerSection = Window:Section({ Title = "WQ Hub | 作者：五月 & 秋晚" })

TabHandles.Config:Paragraph({
    Title = "感谢使用 WQ Hub",
    Desc = "战斗勇士",
    Image = "heart",
    ImageSize = 20,
    Color = "Grey",
    Buttons = {
        {
            Title = "复制qq群",
            Icon = "copy",
            Variant = "Tertiary",
            Callback = function()
                setclipboard("1079143405")
                WindUI:Notify({
                    Title = "已复制",
                    Content = "群号已复制到剪贴板",
                    Duration = 2
                })
            end
        }
    }
})

-- 主循环
local FollowClosestCounter = 0
local EspUpdateCounter = 0

game:GetService("RunService").RenderStepped:Connect(function()
    -- 自动重生
    if game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") and _G.Settings.autospawn then
        keypress(32) -- 空格键
        keyrelease(32)
    end
    
    -- 自动装备
    if _G.Settings.autoequip and not (game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool") or 
       game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")) then
        keypress(49) -- 数字1
        keyrelease(49)
    end
    
    -- ESP 更新
    EspUpdateCounter = EspUpdateCounter + 1
    if EspUpdateCounter >= 60 then
        if _G.Settings.esp then
            addEsp()
        else
            removeEsp()
        end
        EspUpdateCounter = 0
    end
    
    -- 自动行走
    FollowClosestCounter = FollowClosestCounter + 1
    if FollowClosestCounter >= 10 then
        if _G.Settings.followclosest then
            walkToClosest()
        end
        FollowClosestCounter = 0
    end
end)

-- 防挂机
local VirtualUserService = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUserService:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUserService:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- 窗口关闭事件
Window:OnClose(function()
    print("WQ Hub 窗口已关闭")
    
    -- 保存配置
    if Window.ConfigManager then
        local config = Window.ConfigManager:CreateConfig("wq_hub_autosave")
        config:Set("settings", _G.Settings)
        config:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
        config:Save()
        print("配置已自动保存")
    end
end)

Window:OnDestroy(function()
    print("WQ Hub 窗口已销毁")
    removeEsp() -- 清理ESP
end)

-- 显示加载完成通知
task.wait(1)
WindUI:Notify({
    Title = "WQ Hub 加载完成",
    Content = "欢迎使用 WQ Hub \n作者：五月 & 秋晚",
    Icon = "check",
    Duration = 5
})

print("WQ Hub 已成功加载！")