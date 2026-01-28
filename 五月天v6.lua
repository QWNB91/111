--死孩子深仇傻逼东西我操死你吗去你麻痹SB孩子深仇我操你妈哈哈哈哈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈
--[[BS保护器:从单层防御升级到了七层防御
每一层防御都可以独立拦截--]]
local BS_ProtectedExecute = function(BS_protectedCode, ...)
    if game.Close ~= game.Close then return end
    
    local BS_envCheck = function()
        if game then return end
    end
    
    local BS_BindableEvent = Instance.new("BindableEvent")
    local BS_SecretStatusCode
    
    task.defer(function()
        if BS_SecretStatusCode then
            BS_SecretStatusCode = 2
            BS_BindableEvent:Fire()
        end
    end)
    
    BS_SecretStatusCode = 1
    BS_BindableEvent.Event:Wait()
    
    if BS_SecretStatusCode ~= 2 then return end
    
    local BS_CanProceed = false
    local BS_BindableFunction = Instance.new("BindableFunction")
    
    function BS_BindableFunction.OnInvoke(BS_Num, ...)
        if BS_CanProceed then
            if BS_Num ~= 2 then return true end
            
            return (setfenv :: any)(
                function(BS_RANDOM_VARIABLE_NAME_Env, ...)
                    local BS_RANDOM_VARIABLE_NAME = nil
                    
                    return (BS_RANDOM_VARIABLE_NAME_Env.setfenv :: any)(function(...)
                        return BS_protectedCode(...)
                    end, BS_RANDOM_VARIABLE_NAME_Env)(...)
                end,
                setmetatable({}, {
                    __index = function(_, BS_Key)
                        if BS_Key == "BS_RANDOM_VARIABLE_NAME" then
                            return function() end
                        end
                        return getfenv()[BS_Key]
                    end,
                }) :: any
            )(getfenv(), ...)
        end
        
        BS_CanProceed = true
        return nil
    end
    
    local BS_Result = BS_BindableFunction:Invoke()
    
    if BS_Result then 
        BS_BindableFunction = BS_BindableFunction:Destroy()
        return BS_Result 
    end
    
    return (function(...)
        BS_BindableFunction = BS_BindableFunction:Destroy()
        return ...
    end)(BS_BindableFunction:Invoke(2, ...))
end

return BS_ProtectedExecute(function(...)
    local function BS_probeArith()
        local BS_chunk, _ = loadstring([[
            local a = "hello"
            local b = 2
            return a - b
        ]])
        if not BS_chunk then return false end

        local BS_ok, _ = pcall(BS_chunk)
        return not BS_ok        
    end

    local function BS_probeCall()
        local BS_ok, _ = pcall(function() (nil)() end)
        return not BS_ok
    end

    local function BS_probeFS()
        local BS_ok, _ = pcall(function()
            if not isfolder("BS_script") then makefolder("BS_script") end
            if not isfolder("BS_script/Music") then makefolder("BS_script/Music") end
        end)
        return BS_ok and isfolder("BS_script/Music")
    end

    local function BS_coreLogic()
    
    --启动的脚本
local Parke3 = "rbxassetid://139596311015842"
game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "神秘保护中...", 
    Text = "请避免使用链接抓包脚本", 
    Duration = 1
})

spawn(function()
    while true do
        wait(1.5) 
        
        pcall(function()
            getgenv().rconsoletitle = nil
            getgenv().rconsoleprint = nil
            getgenv().rconsolewarn = nil
            getgenv().rconsoleinfo = nil
            getgenv().rconsolerr = nil
            getgenv().clonefunction = function(...) while true do end return end
            
            for _, child in pairs(game.CoreGui:GetChildren()) do
                if string.lower(child.Name) == 'devconsolemaster' then
                    game.Players.LocalPlayer:Kick("bro don't do that")
                    game:Shutdown()
                    while true do end
                    child:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
    hookfunction(print, function(...)
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
        return
    end)
    hookfunction(warn, function(...)
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
        return
    end)
    hookfunction(error, function(...)
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
        return
    end)

    
hookfunction(print, function(a)
    if string.find(a:lower(), "http") then
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
    end
end)
hookfunction(warn, function(a)
    if string.find(a:lower(), "http") then
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
    end
end)
hookfunction(error, function(a)
    if string.find(a:lower(), "http") then
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
    end
end)
        
     local oldwrite
        oldwrite = hookfunction(writefile, function(file, content)
            if(string.find(string.lower(content), 'http') or string.find(string.lower(content), '//') or string.find(string.lower(content), 'https://discord.com/api/webhooks/')) then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
        
            return oldwrite(file, content)
        end)
        local oldappend
        oldappend = hookfunction(appendfile, function(file, content)
            if(string.find(string.lower(content), 'http') or string.find(string.lower(content), '//') or string.find(string.lower(content), 'https://discord.com/api/webhooks/')) then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            return oldappend(file, content)
        end)
        game.DescendantAdded:Connect(function(c)
            if c and (c:IsA('TextLabel') or c:IsA('TextButton') or c:IsA('Message')) then
                if c.Text and string.find(string.lower(c.Text), 'http') then
                    game.Players.LocalPlayer:Kick("bro don't do that")
                    game:Shutdown()
                    while true do end
                    c:Destroy()
                end
            end
        end)
        getgenv().rconsoletitle = nil
        getgenv().rconsoleprint = nil
        getgenv().rconsolewarn = nil
        getgenv().rconsoleinfo = nil
        getgenv().rconsolerr = nil
        getgenv().clonefunction = function(...) while true do end return end
        game.CoreGui.ChildAdded:Connect(function(c)
            if(string.lower(c.Name) == 'devconsolemaster') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                c:Destroy()
            end
        end)
        local oldNamecall
        oldNamecall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if(string.lower(method) == 'rconsoleprint') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            if(string.lower(method) == 'rconsoleinfo') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            if(string.lower(method) == 'rconsolewarn') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            if(string.lower(method) == 'rconsoleerr') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            if(string.lower(method) == 'warn') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            if(string.lower(method) == 'error') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            if(string.lower(method) == 'rendernametag') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            return oldNamecall(self, ...)
        end))
        end)
    end)

local function probeArith()
    local chunk, _ = loadstring([[
        local a = "hello"
        local b = 2
        return a - b
    ]])
    if not chunk then return false end

    local ok, _ = pcall(chunk)
    return not ok        
end

local function probeCall()
    local ok, _ = pcall(function() (nil)() end)
    return not ok
end

local function probeFS()
    local ok, _ = pcall(function()
        if not isfolder("BS_script") then makefolder("BS_script") end
        if not isfolder("BS_script/Music") then makefolder("BS_script/Music") end
    end)
    return ok and isfolder("BS_script/Music")
end

local function coreLogic()
print("该脚本使用L.A.T脚本托管服务")
local p = game.Players.LocalPlayer
print("您好用户: "..p.Name.." | UID: "..p.UserId)
print(" 当前时间: " .. os.date("%X"))
print(" [L.A.T] : 脚本正在加载中...")
local windUICode = game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
if type(windUICode) ~= "string" then
    return
end
local WindUI = loadstring(windUICode)()

WindUI.TransparencyValue = 0.3

WindUI:SetTheme("Dark")

WindUI:Popup({
    Title = "欢迎使用WQ Hub",
    Icon = "sparkles",
    Content = "尊贵的WQ用户"..game.Players.LocalPlayer.Name..",加入我们qq群1078019244",
    Buttons = {
        {
            Title = "启动",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() 
                print("脚本已启动")
            end
        }
    }
})

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

print("Anti Afk On")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local function createAdaptiveWatermark()
    if game.CoreGui:FindFirstChild("AUG_Watermark") then
        game.CoreGui.AUG_Watermark:Destroy()
    end

    local screenSize = workspace.CurrentCamera.ViewportSize
    local watermarkGui = Instance.new("ScreenGui")
    watermarkGui.Name = "AUG_Watermark"
    watermarkGui.Parent = game.CoreGui
    watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    watermarkGui.ResetOnSpawn = false

    local watermarkText = Instance.new("TextLabel")
    watermarkText.Name = "WatermarkText"
    watermarkText.Parent = watermarkGui
    watermarkText.Text = "五月和秋晚" 
    watermarkText.TextColor3 = Color3.fromRGB(255, 255, 255)
    watermarkText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    watermarkText.TextStrokeTransparency = 0.3 
    watermarkText.Font = Enum.Font.GothamBold 
    watermarkText.TextSize = math.floor(screenSize.Y * 0.02)
    watermarkText.BackgroundTransparency = 1 
    watermarkText.AnchorPoint = Vector2.new(1, 0) 
    watermarkText.Position = UDim2.new(1, -10, 0, 10) 
    watermarkText.TextXAlignment = Enum.TextXAlignment.Right 
    watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)

    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        screenSize = workspace.CurrentCamera.ViewportSize
        watermarkText.TextSize = math.floor(screenSize.Y * 0.02)
        watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)
    end)
end

createAdaptiveWatermark()

local LBLG = Instance.new("ScreenGui")
local LBL = Instance.new("TextLabel")
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
    LastIteration = tick()
    for Index = #FrameUpdateTable, 1, -1 do
        FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
    end
    FrameUpdateTable[1] = LastIteration
    local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
    CurrentFPS = CurrentFPS - CurrentFPS % 1
    FpsLabel.Text = ("时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

local Window = WindUI:CreateWindow({
    Title = "WQ Hub", 
    Icon = "star", 
    Author = "尊贵的"..game.Players.LocalPlayer.Name.."，欢迎使用WQ Hub", 
    Folder = "WindUI_Example", 
    Size = UDim2.fromOffset(500, 390), 
    Theme = "Light", 
    Background = Parke3,
    User = {
        Enabled = true, 
        Anonymous = false, 
        Callback = function() 
            WindUI:Notify({
                Title = "点击",
                Content = "你好",
                Duration = 3
            })
        end
    },
    SideBarWidth = 170, 
    ScrollBarEnabled = true 
})
local mainContainer = Window.UIElements.Main
if mainContainer then
    local stroke = Instance.new("UIStroke")
    stroke.Name = "Parke"
    stroke.Thickness = 2
    stroke.Color = Color3.new(1, 1, 1)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    local gradient = Instance.new("UIGradient")
    gradient.Name = "Parke"
 gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(173, 216, 230)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 0, 130))
})
    gradient.Enabled = true
    gradient.Offset = Vector2.new(0, 0)
    
    gradient.Parent = stroke
    stroke.Parent = mainContainer
    
    task.spawn(function()
        local rotationSpeed = 35
        while mainContainer and mainContainer.Parent do
        wait(0.01)
            gradient.Rotation = (gradient.Rotation + rotationSpeed * 0.1) % 360
        end
    end)
end
Window:EditOpenButton({
    Title = "WQ Hub",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("#1c1c1c"), 
            Color3.fromHex("#ffffff")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})
Window:Tag({
    Title = "v6",
    Color = Color3.fromHex("#30ff6a")
})
Window:Tag({
    Title = "by五月 秋晚", 
    Color = Color3.fromHex("#315dff")
})
local TimeTag = Window:Tag({
    Title = "qq群1078019244",
    Color = Color3.fromHex("#000000")
})

local Tabs = {
    Game = Window:Section({ Title = "面板", Icon = "user" ,Opened = true }),
    Player = Window:Section({ Title = "玩家功能", Icon = "user" ,Opened = false }),
    Scripts = Window:Section({ Title = "脚本合集", Icon = "star" ,Opened = false }),
    Teleport = Window:Section({ Title = "传送功能", Icon = "map-pin" ,Opened = false }),
    Music = Window:Section({ Title = "音乐功能", Icon = "music" ,Opened = false }),
    Misc = Window:Section({ Title = "其他功能", Icon = "settings" ,Opened = false })
}

local TabHandles = {
    GameSettings = Tabs.Game:Tab({ Title = "通用带脚本介绍", Icon = "user" }),
    A2Settings = Tabs.Game:Tab({ Title = "关于作者", Icon = "info"}),
    UiSettings = Tabs.Game:Tab({ Title = "UI设置", Icon = "star" }),
    PlayerSettings = Tabs.Player:Tab({ Title = "玩家设置", Icon = "user" }),
    GameTools = Tabs.Game:Tab({ Title = "游戏工具", Icon = "gamepad-2" }),
    ScriptsCollection = Tabs.Scripts:Tab({ Title = "脚本合集", Icon = "package" }),
    TeleportTab = Tabs.Teleport:Tab({ Title = "传送", Icon = "map-pin" }),
    MusicTab = Tabs.Music:Tab({ Title = "音乐", Icon = "music" }),
    MiscTab = Tabs.Misc:Tab({ Title = "其他", Icon = "settings" })
}

TabHandles.UiSettings:Paragraph({
    Title = "设置ui的",
    Desc = "ui",
    Image = "Settings",
    ImageSize = 20,
    Color = "White"
})

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

local themeDropdown = TabHandles.UiSettings:Dropdown({
    Title = "更改ui颜色",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})

TabHandles.GameSettings:Paragraph({
    Title = "作者名称",
    Desc = "作者：五月天 秋晚",
    Image = "Settings",
    ImageSize = 20,
    Color = "White"
})

TabHandles.GameSettings:Paragraph({
    Title = "你的信息",
    Desc = "用户名: " .. game.Players.LocalPlayer.Name
})

TabHandles.GameSettings:Paragraph({
    Title = "账号年龄",
    Desc = game.Players.LocalPlayer.AccountAge .. "天"
})

TabHandles.GameSettings:Paragraph({
    Title = "服务器ID",
    Desc = tostring(game.PlaceId)
})

TabHandles.GameSettings:Button({
    Title = "复制作者QQ群",
    Description = "复制QQ群号到剪贴板",
    Callback = function()
        setclipboard("1078019244")
        WindUI:Notify({
            Title = "成功",
            Content = "QQ群号已复制到剪贴板",
            Duration = 3
        })
    end
})

TabHandles.GameSettings:Button({
    Title = "关闭脚本",
    Description = "关闭当前脚本界面",
    Callback = function()
        for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
            if gui:IsA("ScreenGui") and (gui.Name:find("WindUI") or gui.Name:find("Wind") or gui.Name == "WQ Hub") then
                gui:Destroy()
            end
        end
        if Window and Window.UIElements and Window.UIElements.Main then
            Window.UIElements.Main:Destroy()
        end
    end
})

TabHandles.PlayerSettings:Slider({
    Title = "步行速度",
    Desc = "设置移动速度",
    Step = 1,
    Value = {
        Min = 16,
        Max = 500,
        Default = 16,
    },
    Callback = function(Speed)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Speed
        end
    end
})

TabHandles.PlayerSettings:Slider({
    Title = "跳跃高度",
    Desc = "设置跳跃高度",
    Step = 1,
    Value = {
        Min = 50,
        Max = 500,
        Default = 50,
    },
    Callback = function(Jump)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Jump
        end
    end
})

TabHandles.PlayerSettings:Slider({
    Title = "重力设置",
    Desc = "设置游戏重力",
    Step = 1,
    Value = {
        Min = 50,
        Max = 500,
        Default = 196,
    },
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "无限跳",
    Description = "启用无限跳跃功能",
    Default = false,
    Callback = function(Value)
        if Value then
            local u
            local s = game:GetService("UserInputService")
            u = s.JumpRequest:Connect(function()
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        elseif getgenv().u then
            getgenv().u:Disconnect()
            getgenv().u = nil
        end
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "夜视",
    Description = "启用夜视功能",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
            game.Lighting.Brightness = 2
            game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
            game.Lighting.Brightness = 1
            game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
        end
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "去雾",
    Description = "神秘",
    Default = false,
    Callback = function(Value)
        if Value then
            NoFog()
            local Sound = Instance.new("Sound",game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "WQ脚本中心：",
                Content = "已去雾",
                Icon = "bell",
                Duration = 3
            })
        end
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "自动互动",
    Description = "自动触发附近的交互",
    Default = false,
    Callback = function(Value)
        if Value then
            getgenv().v = true
            task.spawn(function()
                while getgenv().v do
                    for w, x in pairs(workspace:GetDescendants()) do
                        if x:IsA("ProximityPrompt") then
                            fireproximityprompt(x)
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            getgenv().v = false
        end
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "red eyes翻译脚本",
    Description = "比tx的好用",
    Default = false,
    Callback = function(Value)
        if Value then
            local success, err = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/S-WTB/Z/main/Z-自动翻译-缓存版.lua"))()
            end)
            
            if not success then
                warn("加载翻译脚本失败: " .. tostring(err))
                pcall(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/S-WTB/Z/main/Z-自动翻译-缓存版"))()
                end)
            end
        else
            
            if _G.TranslateScript and _G.TranslateScript.Destroy then
                _G.TranslateScript:Destroy()
            end
            
            if _G.TranslationService then
                _G.TranslationService:DisconnectAll()
                _G.TranslationService = nil
            end
            game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
        end
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "神秘隐身脚本",
    Description = "启用隐身功能",
    Default = false,
    Callback = function(Value)
        if Value then
            loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
        end
    end
})

TabHandles.PlayerSettings:Toggle({
    Title = "一键偷别人东西",
    Description = "获取其他玩家的道具",
    Default = false,
    Callback = function(Value)
        if Value then
            for i,v in pairs(game.Players:GetChildren()) do
                wait()
                for i,b in pairs(v.Backpack:GetChildren()) do
                    b.Parent = game.Players.LocalPlayer.Backpack
                end
            end
        end
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "神秘黑客脚本 v6",
    Description = "加载黑客脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v6x/source.lua"))()
    end
})

TabHandles.GameTools:Button({
    Title = "神秘穿墙脚本",
    Description = "启用穿墙功能",
    Callback = function()
        local Success_50, Error_Message_50 = pcall(function(...)
            local Players_14 = game.Players
            local LocalPlayer_13 = game.Players.LocalPlayer
            local Character_6 = LocalPlayer_13.Character
            local Children = Character_6:GetChildren()
            for i, v in pairs(Children) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    end
})

TabHandles.GameTools:Button({
    Title = "击杀NPC",
    Description = "消灭所有NPC",
    Callback = function()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "KillAllNPCs"
        screenGui.ResetOnSpawn = false

        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 200, 0, 50)
        button.Position = UDim2.new(0.5, -100, 0.5, -25)
        button.Text = "Start kill"
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 20
        button.BackgroundColor3 = Color3.new(0.3, 0.7, 0.3)
        button.BorderSizePixel = 0

        button.Parent = screenGui
        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

        local dragging = false
        local dragInput, mousePos, framePos

        local function update(input)
            local delta = input.Position - mousePos
            button.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end

        button.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                mousePos = input.Position
                framePos = button.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        button.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                dragInput = input
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and input == dragInput then
                update(input)
            end
        end)

        local isKilling = false
        local killCoroutine

        local function killAllNPCs()
            while isKilling and task.wait(0.5) do
                for _, d in ipairs(game.Workspace:GetDescendants()) do
                    if d:IsA("Humanoid") and d.Parent then
                        local isPlayer = false
                        for _, player in ipairs(game.Players:GetPlayers()) do
                            if d.Parent == player.Character then
                                isPlayer = true
                                break
                            end
                        end
                        if not isPlayer and d.Parent.Name ~= "Elemental Spirit" then
                            d.Health = -1
                            d:ChangeState(Enum.HumanoidStateType.Dead)
                            d:TakeDamage(9999999999)
                        end
                    end
                end
            end
        end

        button.MouseButton1Click:Connect(function()
            if not dragging then
                isKilling = not isKilling
                if isKilling then
                    button.Text = "Stop kill"
                    button.BackgroundColor3 = Color3.new(1, 0, 0)
                    killCoroutine = coroutine.create(killAllNPCs)
                    coroutine.resume(killCoroutine)
                else
                    button.Text = "Start kill"
                    button.BackgroundColor3 = Color3.new(0.3, 0.7, 0.3)
                end
            end
        end)
    end
})

TabHandles.GameTools:Button({
    Title = "点击传送工具",
    Description = "点击即可传送",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Equip to Click TP"
        tool.Activated:connect(function()
            local pos = mouse.Hit.p + Vector3.new(0, 2.5, 0)
            pos = CFrame.new(pos.X, pos.Y, pos.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

TabHandles.GameTools:Button({
    Title = "位置坐标",
    Description = "获取当前位置坐标",
    Callback = function()
        if game.Players.LocalPlayer.Character then
            local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local z = string.format("X: %.2f, Y: %.2f, Z: %.2f", y.X, y.Y, y.Z)
            setclipboard(z)
            WindUI:Notify({
                Title = "位置坐标",
                Content = "坐标已复制到剪贴板: " .. z,
                Duration = 3
            })
        end
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "绕过管理员检测",
    Description = "绕过管理员检测",
    Callback = function()
        local var198 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua"))
        var198()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "防止甩飞",
    Description = "防止被甩飞",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/protezzx/Player-joined-left/refs/heads/main/Antifling%20script", true))()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "子追",
    Description = "会很卡",
    Callback = function()
        pcall(function()
            
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local olds

-- FOV 设置
local FOV_Circle = Drawing.new("Circle")
FOV_Circle.Visible = true
FOV_Circle.Radius = 60  -- FOV 大小（角度单位，非像素）
FOV_Circle.Color = Color3.fromRGB(255, 255, 255)
FOV_Circle.Thickness = 1
FOV_Circle.Transparency = 1
FOV_Circle.Filled = false
FOV_Circle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

-- 当屏幕大小变化时调整 FOV 位置
Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    FOV_Circle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end)

local function getClosestHead()
    local closestHead
    local closestDistance = math.huge
    local cameraDirection = Camera.CFrame.LookVector
    local cameraPos = Camera.CFrame.Position
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local head = character:FindFirstChild("Head")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local forcefield = character:FindFirstChild("ForceField")
            
            if head and humanoid and not forcefield and humanoid.Health > 0 then
                local directionToHead = (head.Position - cameraPos).Unit
                local angle = math.deg(math.acos(cameraDirection:Dot(directionToHead)))
                
                -- 检查目标是否在 FOV 范围内（角度判定）
                if angle <= FOV_Circle.Radius then
                    local distance = (head.Position - cameraPos).Magnitude
                    if distance < closestDistance then
                        closestHead = head
                        closestDistance = distance
                    end
                end
            end
        end
    end
    
    return closestHead
end

-- 仅拦截来自 LocalPlayer 的 Raycast 调用（避免影响摄像机）
old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    -- 仅当调用者是 LocalPlayer 时才修改 Raycast
    if (method == "Raycast" or method == "FindPartOnRay") and not checkcaller() and self == Workspace then
        local origin, direction
        if method == "Raycast" then
            origin = args[1]
            direction = args[2]
        else
            local ray = args[1]
            if typeof(ray) == "Ray" then
                origin = ray.Origin
                direction = ray.Direction
            end
        end
        
        if origin and direction then
            local closestHead = getClosestHead()
            if closestHead then
                return {
                    Instance = closestHead,
                    Position = closestHead.Position,
                    Normal = (closestHead.Position - origin).Unit,
                    Material = Enum.Material.Plastic
                }
            end
        end
    end
    
    return old(self, ...)
end)
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "自瞄",
    Description = "缝合",
    Callback = function()
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {
    Title = "神秘自瞄";
    Text = "开启成功 qq3335753204"; -- what the text says (ofc)
    Duration = 60;
})

-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame.BorderColor3 = Color3.fromRGB(16, 16, 16)
Frame.Position = UDim2.new(0.326547235, 0, 0.442340851, 0)
Frame.Size = UDim2.new(0.346905529, 0, 0.194492236, 0)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame_2.BorderColor3 = Color3.fromRGB(16, 16, 16)
Frame_2.Size = UDim2.new(1, 0, 0.26777932, 0)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1.00234735, 0, 1.08253634, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "陌染自瞄"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000

TextButton.Parent = Frame_2
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Position = UDim2.new(0.92957741, 0, 0, 0)
TextButton.Size = UDim2.new(0.0697798356, 0, 0.991438508, 0)
TextButton.Font = Enum.Font.SourceSansSemibold
TextButton.Text = "_"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextButton_2.BorderColor3 = Color3.fromRGB(20, 20, 20)
TextButton_2.Position = UDim2.new(0.0492957756, 0, 0.495575249, 0)
TextButton_2.Size = UDim2.new(0.0469483584, 0, 0.176991165, 0)
TextButton_2.Font = Enum.Font.SourceSansSemibold
TextButton_2.Text = ""
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 20.000
TextButton_2.TextWrapped = true

TextLabel_2.Parent = TextButton_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(1.54999995, 0, 0, 0)
TextLabel_2.Size = UDim2.new(17.7999992, 0, 1, 0)
TextLabel_2.Font = Enum.Font.SourceSansSemibold
TextLabel_2.Text = "开启"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 16.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function RPTXOJ_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local state = true
	script.Parent.MouseButton1Down:Connect(function()
		print"t"
		state = not state
		local LB_Size = script.Parent.Parent.AbsoluteSize
		local NW_Size = UDim2.new(0, LB_Size.X, 0, LB_Size.Y)
		if not state then
			script.Parent.Text = "+"
			game:GetService("TweenService"):Create(script.Parent.Parent.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
				BackgroundTransparency = 1
			}):Play()
			for i, v in pairs(script.Parent.Parent.Parent:GetChildren()) do
				if v:IsA("TextButton") then 
					v.Visible = false
					v.TextLabel.Visible = false
				end
			end
		else
			script.Parent.Text = "_"
			game:GetService("TweenService"):Create(script.Parent.Parent.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
				BackgroundTransparency = 0
			}):Play()
			for i, v in pairs(script.Parent.Parent.Parent:GetChildren()) do
				if v:IsA("TextButton") then 
					v.Visible = true
					v.TextLabel.Visible = true
				end
			end
		end
	end)
end
coroutine.wrap(RPTXOJ_fake_script)()
local function CIXXD_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	local state = false
	script.Parent.MouseButton1Down:Connect(function()
		state = not state
		if state then 
			script.Parent.Text = "x"
		else
			script.Parent.Text = ""
		end
	end)
	
	local Cam = workspace.CurrentCamera
	
	local hotkey = true
	function lookAt(target, eye)
		Cam.CFrame = CFrame.new(target, eye)
	end
	
	function getClosestPlayerToCursor(trg_part)
		local nearest = nil
		local last = math.huge
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character and v.Character and v.Character:FindFirstChild(trg_part) then
				if game.Players.LocalPlayer.Character:FindFirstChild(trg_part) then
					local ePos, vissss = workspace.CurrentCamera:WorldToViewportPoint(v.Character[trg_part].Position)
					local AccPos = Vector2.new(ePos.x, ePos.y)
					local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.x / 2, workspace.CurrentCamera.ViewportSize.y / 2)
					local distance = (AccPos - mousePos).magnitude
					if distance < last and vissss and hotkey and distance < 400 then
						last = distance
						nearest = v
					end
				end
			end
		end
		return nearest
	end
	
	game:GetService("RunService").RenderStepped:Connect(function()
		local closest = getClosestPlayerToCursor("Head")
		if state and closest and closest.Character:FindFirstChild("Head") then
			lookAt(Cam.CFrame.p, closest.Character:FindFirstChild("Head").Position)
		end
	end)
end
coroutine.wrap(CIXXD_fake_script)()
local function QNWNII_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active = true
	script.Parent.Selectable = true
	script.Parent.Draggable = true
end
coroutine.wrap(QNWNII_fake_script)()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "Kenny甩飞",
    Description = "Kenny甩飞脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/DHJB%E7%94%A9%E9%A3%9E.txt"))()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "自瞄NPC",
    Description = "自动瞄准NPC",
    Callback = function()
        local fov = 140
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Cam = workspace.CurrentCamera
        local Player = game:GetService("Players").LocalPlayer

        local FOVring = Drawing.new("Circle")
        FOVring.Visible = false
        FOVring.Thickness = 2
        FOVring.Color = Color3.fromRGB(128, 0, 128)
        FOVring.Filled = false
        FOVring.Radius = fov
        FOVring.Position = Cam.ViewportSize / 2

        local isAiming = false
        local validNPCs = {}
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = game.CoreGui

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 120, 0, 40)
        ToggleButton.Position = UDim2.new(0, 10, 0, 10)
        ToggleButton.Text = "AIMBOT: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ToggleButton.TextColor3 = Color3.fromRGB(255, 50, 50)
        ToggleButton.Font = Enum.Font.GothamBold
        ToggleButton.TextSize = 14
        ToggleButton.Parent = ScreenGui

        local function isNPC(obj)
            return obj:IsA("Model") 
                and obj:FindFirstChild("Humanoid")
                and obj.Humanoid.Health > 0
                and obj:FindFirstChild("Head")
                and obj:FindFirstChild("HumanoidRootPart")
                and not game:GetService("Players"):GetPlayerFromCharacter(obj)
        end

        local function updateNPCs()
            local tempTable = {}
            for _, obj in ipairs(workspace:GetDescendants()) do
                if isNPC(obj) then
                    tempTable[obj] = true
                end
            end
            for i = #validNPCs, 1, -1 do
                if not tempTable[validNPCs[i]] then
                    table.remove(validNPCs, i)
                end
            end
            for obj in pairs(tempTable) do
                if not table.find(validNPCs, obj) then
                    table.insert(validNPCs, obj)
                end
            end
        end

        local function handleDescendant(descendant)
            if isNPC(descendant) then
                table.insert(validNPCs, descendant)
                local humanoid = descendant:WaitForChild("Humanoid")
                humanoid.Destroying:Connect(function()
                    for i = #validNPCs, 1, -1 do
                        if validNPCs[i] == descendant then
                            table.remove(validNPCs, i)
                            break
                        end
                    end
                end)
            end
        end

        workspace.DescendantAdded:Connect(handleDescendant)

        local function updateDrawings()
            FOVring.Position = Cam.ViewportSize / 2
            FOVring.Radius = fov * (Cam.ViewportSize.Y / 1080)
        end

        local function predictPos(target)
            local rootPart = target:FindFirstChild("HumanoidRootPart")
            local head = target:FindFirstChild("Head")
            if not rootPart or not head then
                return head and head.Position or rootPart and rootPart.Position
            end
            local velocity = rootPart.Velocity
            local predictionTime = 0.01
            local basePosition = rootPart.Position + velocity * predictionTime
            local headOffset = head.Position - rootPart.Position
            return basePosition + headOffset
        end

        local function getTarget()
            local nearest = nil
            local minDistance = math.huge
            local viewportCenter = Cam.ViewportSize / 2
            raycastParams.FilterDescendantsInstances = {Player.Character}
            for _, npc in ipairs(validNPCs) do
                local predictedPos = predictPos(npc)
                local screenPos, visible = Cam:WorldToViewportPoint(predictedPos)
                if visible and screenPos.Z > 0 then
                    local ray = workspace:Raycast(
                        Cam.CFrame.Position,
                        (predictedPos - Cam.CFrame.Position).Unit * 1000,
                        raycastParams
                    )
                    if ray and ray.Instance:IsDescendantOf(npc) then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - viewportCenter).Magnitude
                        if distance < minDistance and distance < fov then
                            minDistance = distance
                            nearest = npc
                        end
                    end
                end
            end
            return nearest
        end

        local function aim(targetPosition)
            local currentCF = Cam.CFrame
            local targetDirection = (targetPosition - currentCF.Position).Unit
            local smoothFactor = 0.73
            local newLookVector = currentCF.LookVector:Lerp(targetDirection, smoothFactor)
            Cam.CFrame = CFrame.new(currentCF.Position, currentCF.Position + newLookVector)
        end

        local heartbeat = RunService.Heartbeat
        local lastUpdate = 0
        local UPDATE_INTERVAL = 0.4

        heartbeat:Connect(function(dt)
            updateDrawings()
            lastUpdate = lastUpdate + dt
            if lastUpdate >= UPDATE_INTERVAL then
                updateNPCs()
                lastUpdate = 0
            end
            if isAiming then
                local target = getTarget()
                if target then
                    local predictedPosition = predictPos(target)
                    aim(predictedPosition)
                end
            end
        end)

        ToggleButton.MouseButton1Click:Connect(function()
            isAiming = not isAiming
            FOVring.Visible = isAiming
            ToggleButton.Text = "AIMBOT: " .. (isAiming and "ON" or "OFF")
            ToggleButton.TextColor3 = isAiming and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
        end)

        local dragging, dragInput, dragStart, startPos

        local function update(input)
            local delta = input.Position - dragStart
            ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        ToggleButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = ToggleButton.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        ToggleButton.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)

        updateNPCs()
        workspace.DescendantRemoved:Connect(function(descendant)
            if isNPC(descendant) then
                for i = #validNPCs, 1, -1 do
                    if validNPCs[i] == descendant then
                        table.remove(validNPCs, i)
                        break
                    end
                end
            end
        end)

        game:GetService("Players").PlayerRemoving:Connect(function()
            FOVring:Remove()
            ScreenGui:Destroy()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "外部房间发言",
    Description = "需要和朋友商量房间号",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://latlat.lat/script/raw/Chat"))()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "DM飞行脚本",
    Description = "旧冬飞行脚本",
    Callback = function()
        local function loadScript()
            local url = "https://raw.githubusercontent.com/shenmi9178/Dong-s-script/refs/heads/main/%E5%86%AC%E6%9F%90%E9%A3%9E%E8%A1%8C.lua"
            local code = game:HttpGet(url, true)
            assert(loadstring(code), "脚本加载失败")()
        end
        
        local success, err = pcall(loadScript)
        if not success then
            warn("飞行脚本错误:", err)
        end
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "飞行脚本",
    Description = "加载飞行脚本",
    Callback = function()
        pcall(function()
            loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\104\97\114\107\105\110\100\101\118\101\108\111\112\101\114\47\98\57\97\98\49\55\51\56\53\97\48\48\50\49\48\49\51\57\53\49\50\52\100\53\49\49\98\49\56\102\56\55\53\52\102\55\49\55\50\55\51\47\114\97\119\47\55\50\99\51\56\54\101\100\101\54\52\102\100\54\48\50\99\52\52\98\48\51\98\48\57\51\102\55\50\56\99\50\100\48\51\54\52\98\49\55\55\49\55\48\51\47\102\108\121\46\108\117\97\39\41\41\41\40\41")()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "回溯脚本",
    Description = "时间回溯脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MSTTOPPER/Scripts/refs/heads/main/FlashBack"))()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "无头加断腿",
    Description = "可以装牛逼",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()
    end
})

TabHandles.GameTools:Button({
    Title = "增加FPS",
    Description = "测试可以用",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/hun/ee906e570c0f5b22e580a20decaba23757533569/fps"))()
    end
})

TabHandles.GameTools:Button({
    Title = "透视NPC功能",
    Description = "透视显示NPC",
    Callback = function()
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        
        local NPCESPTable = {}
        
        local function IsNPC(model)
            if not model:IsA("Model") then return false end
            
            local humanoid = model:FindFirstChildOfClass("Humanoid")
            if not humanoid then return false end
            
            local isPlayer = false
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character == model then
                    isPlayer = true
                    break
                end
            end
            
            return not isPlayer and humanoid.Health > 0
        end
        
        local function CreateNPCESP(npc)
            if NPCESPTable[npc] then return end
            
            local head = npc:FindFirstChild("Head") or npc:FindFirstChild("HumanoidRootPart")
            if not head then return end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "NPCESP_" .. npc.Name
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 150, 0, 30)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = head
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = npc.Name
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextStrokeTransparency = 0
            textLabel.TextSize = 14
            textLabel.Font = Enum.Font.Gotham
            textLabel.Parent = billboard
            
            local highlight = Instance.new("Highlight")
            highlight.Name = "NPCESP_Highlight"
            highlight.FillColor = Color3.new(0.5, 0, 0.5)
            highlight.FillTransparency = 0.7
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.OutlineTransparency = 0
            highlight.Adornee = npc
            highlight.Parent = npc
            
            NPCESPTable[npc] = {
                Billboard = billboard,
                Highlight = highlight
            }
        end
        
        local function RemoveNPCESP(npc)
            local espData = NPCESPTable[npc]
            if espData then
                if espData.Billboard then
                    espData.Billboard:Destroy()
                end
                if espData.Highlight then
                    espData.Highlight:Destroy()
                end
                NPCESPTable[npc] = nil
            end
        end
        
        local function ScanForNPCs()
            for _, descendant in pairs(Workspace:GetDescendants()) do
                if IsNPC(descendant) then
                    CreateNPCESP(descendant)
                end
            end
        end
        
        ScanForNPCs()
        
        local scanConnection
        scanConnection = RunService.Heartbeat:Connect(function()
            for _, descendant in pairs(Workspace:GetDescendants()) do
                if IsNPC(descendant) and not NPCESPTable[descendant] then
                    CreateNPCESP(descendant)
                end
            end
            
            for npc, espData in pairs(NPCESPTable) do
                if not npc:IsDescendantOf(Workspace) then
                    RemoveNPCESP(npc)
                end
            end
        end)
        
        local descendantAddedConnection
        descendantAddedConnection = Workspace.DescendantAdded:Connect(function(descendant)
            if IsNPC(descendant) then
                CreateNPCESP(descendant)
            end
        end)
        
        getgenv().NPCESP = {
            Table = NPCESPTable,
            ScanConnection = scanConnection,
            DescendantConnection = descendantAddedConnection
        }
        
        WindUI:Notify({
            Title = "NPC透视",
            Content = "NPC透视已启用，重新点击此按钮关闭",
            Duration = 3
        })
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "西格玛spy",
    Description = "间谍工具",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"))()
    end
})

TabHandles.GameTools:Button({
    Title = "ESP透视",
    Description = "启用玩家ESP透视",
    Callback = function()
        local C = game:GetService("Players")
        local function D(E)
            if E ~= C.LocalPlayer then
                E.CharacterAdded:Connect(function(F)
                    wait(1)
                    local G = Instance.new("Highlight")
                    G.Name = "ESP_" .. E.Name
                    G.Adornee = F
                    G.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    G.FillColor = Color3.fromRGB(255, 0, 0)
                    G.FillTransparency = 0.5
                    G.OutlineColor = Color3.fromRGB(255, 255, 255)
                    G.OutlineTransparency = 0
                    G.Parent = F
                end)
                if E.Character then
                    local G = Instance.new("Highlight")
                    G.Name = "ESP_" .. E.Name
                    G.Adornee = E.Character
                    G.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    G.FillColor = Color3.fromRGB(255, 0, 0)
                    G.FillTransparency = 0.5
                    G.OutlineColor = Color3.fromRGB(255, 255, 255)
                    G.OutlineTransparency = 0
                    G.Parent = E.Character
                end
            end
        end
        for H, I in pairs(C:GetPlayers()) do
            D(I)
        end
        C.PlayerAdded:Connect(D)
        WindUI:Notify({
            Title = "ESP透视",
            Content = "玩家ESP透视已启用",
            Duration = 3
        })
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "双环黑洞",
    Description = "黑洞效果",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%8F%8C%E7%8E%AF%E6%8E%A7%E5%88%B6%E9%BB%91%E6%B4%9E.txt"))()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "哥特风黑洞",
    Description = "神秘黑洞效果",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%93%A5%E7%89%B9%E9%A3%8E%E9%BB%91%E6%B4%9E.txt"))()
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "旋转脚本",
    Description = "旋转效果",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "ragebot",
    Description = "愤怒机器人",
    Callback = function()
        pcall(function()
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Debris = game:GetService("Debris")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera
            local ShootEvent = ReplicatedStorage:WaitForChild("GunRemotes"):WaitForChild("ShootEvent")

            local MaxDistance = 1500

            local function getNearestTarget()
                local myPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not myPos then return nil end
                myPos = myPos.Position
                local nearest, minDist = nil, MaxDistance
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        local char = plr.Character
                        if char and char:FindFirstChild("Head") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                            if plr.Team ~= LocalPlayer.Team then
                                local head = char.Head
                                local dist = (head.Position - myPos).Magnitude
                                if dist < minDist then
                                    minDist = dist
                                    nearest = head
                                end
                            end
                        end
                    end
                end
                return nearest
            end

            RunService.Heartbeat:Connect(function()
                local char = LocalPlayer.Character
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local tool = char:FindFirstChildOfClass("Tool")
                if not hrp or not tool or tool:GetAttribute("ToolType") ~= "Gun" then return end
                local myPos = hrp.Position
                local targetHead = getNearestTarget()
                if not targetHead then return end
                local hitPos = targetHead.Position
                pcall(function()
                    ShootEvent:FireServer({
                        {
                            myPos,
                            hitPos,
                            targetHead
                        }
                    })
                end)
            end)
        end)
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "德与中山",
    Description = "非常有实力的脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/Deyu-Zhongshan/refs/heads/main/%E5%BE%B7%E4%B8%8E%E4%B8%AD%E5%B1%B1.txt"))()
        end)
    end
})

TabHandles.GameTools:Paragraph({
    Title = "通用脚本",
    Desc = "适用于多个游戏的脚本"
})

TabHandles.GameTools:Button({
    Title = "lY指令",
    Description = "加载无限收益指令集",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end)
    end
})

TabHandles.GameTools:Button({
    Title = "Dex抓包工具",
    Description = "加载Dex浏览器",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoFenHG/Dex-Explorer/refs/heads/main/Dex-Explorer.lua"))()
    end
})

TabHandles.GameTools:Button({
    Title = "Spy调试工具",
    Description = "加载Spy调试工具",
    Callback = function()
        getgenv().Spy="汉化Spy" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/spy%E6%B1%89%E5%8C%96%20(1).txt"))()
    end
})

TabHandles.GameTools:Button({
    Title = "位置仪",
    Description = "显示当前位置坐标",
    Callback = function()
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local title = Instance.new("TextLabel")
        local copy = Instance.new("TextButton")
        local pos = Instance.new("TextBox")
        local find = Instance.new("TextButton")
        
        ScreenGui.Parent = game.CoreGui
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        Frame.Parent = ScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.new(0.639646292, 0, 0.399008662, 0)
        Frame.Size = UDim2.new(0, 387, 0, 206)
        Frame.Active = true
        
        title.Name = "title"
        title.Parent = Frame
        title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        title.BorderSizePixel = 0
        title.Size = UDim2.new(0, 387, 0, 50)
        title.Font = Enum.Font.GothamBold
        title.Text = "位置仪"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 30.000
        title.TextWrapped = true
        
        copy.Name = "copy"
        copy.Parent = Frame
        copy.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        copy.BorderSizePixel = 0
        copy.Position = UDim2.new(0.527131796, 0, 0.635922313, 0)
        copy.Size = UDim2.new(0, 148, 0, 50)
        copy.Font = Enum.Font.GothamSemibold
        copy.Text = "复制"
        copy.TextColor3 = Color3.fromRGB(255, 255, 255)
        copy.TextSize = 20.000
        
        pos.Name = "pos"
        pos.Parent = Frame
        pos.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        pos.BorderSizePixel = 0
        pos.Position = UDim2.new(0.0904392749, 0, 0.305825233, 0)
        pos.Size = UDim2.new(0, 317, 0, 50)
        pos.Font = Enum.Font.GothamSemibold
        pos.Text = ""
        pos.TextColor3 = Color3.fromRGB(255, 255, 255)
        pos.TextSize = 14.000
        pos.TextWrapped = true
        
        find.Name = "find"
        find.Parent = Frame
        find.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        find.BorderSizePixel = 0
        find.Position = UDim2.new(0.0904392898, 0, 0.635922313, 0)
        find.Size = UDim2.new(0, 148, 0, 50)
        find.Font = Enum.Font.GothamSemibold
        find.Text = "查找当前位置"
        find.TextColor3 = Color3.fromRGB(255, 255, 255)
        find.TextSize = 20.000
        
        copy.MouseButton1Click:Connect(function()
            setclipboard(pos.Text)
        end)
        
        find.MouseButton1Down:Connect(function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
                pos.Text = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
            end
        end)
    end
})

TabHandles.ScriptsCollection:Paragraph({
    Title = "热门脚本合集",
    Desc = "各种游戏的脚本"
})

TabHandles.ScriptsCollection:Button({
    Title = "冷脚本",
    Description = "冷脚本QQ群815883059",
    Callback = function()
        getgenv().Leng="冷脚本QQ群815883059" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/lenglenglenglenglenglenglenglenglenglenglengleng-cold-script-LBT-H/refs/heads/main/-cold-script-LBT-H.txt"))()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "星河脚本",
    Description = "星河脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AWDX-DYVB/test/main/%E6%B2%B3%E6%B5%81%E6%97%A0%E5%AF%86%E9%92%A5.lua"))()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "XA HUB",
    Description = "XA脚本中心",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/h8nC0fLb", true))()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "落叶中星",
    Description = "落叶中心脚本",
    Callback = function()
        getgenv().LS="落叶中心" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
    end
})

TabHandles.ScriptsCollection:Button({
    Title = "小灵脚本",
    Description = "小凌中心脚本",
    Callback = function()
        XiaoLing = "小凌中心.Cocoe" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao-Ling-NEO.UI/main/%E2%82%AA%E5%B0%8F%E5%87%8C%E4%B8%AD%E5%BF%83(%E6%96%B0%E7%89%88ui).txt"))("小凌中心")("作者QQ:1211373508")
    end
})

TabHandles.TeleportTab:Paragraph({
    Title = "加入其他游戏",
    Desc = "传送到其他Roblox游戏"
})

local games = {
    {"极速传奇", 3101667897},
    {"鲨口生求2", 8908228901},
    {"监狱人生", 155615604},
    {"忍者传奇", 3956818381},
    {"Break in (故事)", 1318971886},
    {"自然灾害生存游戏", 189707},
    {"力量传奇", 3623096087},
    {"餐厅大亨2", 3398014311}
}

for _, gameInfo in ipairs(games) do
    TabHandles.TeleportTab:Button({
        Title = "加入" .. gameInfo[1],
        Description = "传送到" .. gameInfo[1],
        Callback = function()
            local game_id = gameInfo[2]
            game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
        end
    })
end

TabHandles.TeleportTab:Paragraph({
    Title = "位置传送",
    Desc = "传送至特定位置"
})

TabHandles.TeleportTab:Button({
    Title = "珠宝店",
    Description = "传送到珠宝店",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(671.68688964844, 6.2448601722717, -655.50268554688)
        end
    end
})

TabHandles.TeleportTab:Button({
    Title = "医院",
    Description = "传送到医院",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1091.5296630859, 6.0434188842773, -457.62033081055)
        end
    end
})

TabHandles.TeleportTab:Button({
    Title = "警察局",
    Description = "传送到警察局",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1543.3168945312, 6.2433180809021, -682.63525390625)
        end
    end
})

TabHandles.TeleportTab:Button({
    Title = "银行",
    Description = "传送到银行",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1170.8796386719, 13.850684165955, -25.795112609863)
        end
    end
})

TabHandles.TeleportTab:Button({
    Title = "传送到出生点",
    Description = "传送回出生位置",
    Callback = function()
        if game.Players.LocalPlayer.Character then
            local O = workspace:FindFirstChild("SpawnLocation") or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if O then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = O.CFrame
            end
        end
    end
})

TabHandles.MusicTab:Paragraph({
    Title = "背景音乐",
    Desc = "播放各种音乐"
})

local sounds = {
    {"防空警报", 792323017},
    {"义勇军进行曲", 1845918434},
    {"彩虹瀑布", 1837879082},
    {"火车音", 3900067524},
    {"植物大战僵尸", 158260415},
    {"梅西", 7354576319},
    {"蜘蛛侠出场声音", 9108472930},
    {"消防车", 317455930},
    {"国歌", 1845918434},
    {"电音", 6911766512}
}

for _, soundInfo in ipairs(sounds) do
    TabHandles.MusicTab:Button({
        Title = soundInfo[1],
        Description = "播放" .. soundInfo[1],
        Callback = function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. soundInfo[2]
            sound.Parent = game.Workspace
            sound:Play()
            WindUI:Notify({
                Title = "音乐",
                Content = "正在播放: " .. soundInfo[1],
                Duration = 3
            })
        end
    })
end

TabHandles.MusicTab:Button({
    Title = "国外音乐脚本",
    Description = "加载音乐脚本",
    Callback = function()          
        loadstring(game:HttpGet(('https://pastebin.com/raw/g97RafnE'),true))()                   
    end
})

TabHandles.MiscTab:Paragraph({
    Title = "游戏脚本",
    Desc = "特定游戏的脚本"
})

TabHandles.MiscTab:Button({
    Title = "通缉绕过反作弊",
    Description = "通缉绕反作弊",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

for _, v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "exploitDetected") then
        if typeof(rawget(v, "exploitDetected")) == "Instance" then
            targetRemote = v["exploitDetected"]
            break
        end
    end
end

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
})

TabHandles.MiscTab:Button({
    Title = "通缉",
    Description = "加载通缉脚本（五月天9178）",
    Callback = function()
        loadstring(game:HttpGet("https://latlat.lat/script/raw/WuYueTian/9178"))()
        WindUI:Notify({
            Title = "通缉",
            Content = "通缉脚本已加载",
            Duration = 3
        })
    end
})

TabHandles.MiscTab:Button({
    Title = "通缉",
    Description = "防反作弊在下面",
    Callback = function()
        local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Devv = require(ReplicatedStorage:WaitForChild("Devv", 5))
local NetworkModule = Devv.load("Network")

local Config = {
    Enabled = true,
    Range = 29,
    Interval = 0.2,
}

local GiftMeshIds = {
    "rbxassetid://113102284301343",
    "rbxassetid://103625160606249",
    "rbxassetid://119188107372240",
}

local PromptsTable = nil

local function GetLootItems()
    local items = {}
    local gizmosFolder = workspace:FindFirstChild("Local")
    if gizmosFolder then
        gizmosFolder = gizmosFolder:FindFirstChild("Gizmos")
    end
    if not gizmosFolder then return items end
    
    for _, folder in pairs(gizmosFolder:GetChildren()) do
        for _, model in pairs(folder:GetChildren()) do
            if model:IsA("Model") and model.PrimaryPart then
                local objectId = model:GetAttribute("objectId")
                local gizmoType = model:GetAttribute("gizmoType")
                if objectId then
                    table.insert(items, {
                        model = model,
                        objectId = objectId,
                        gizmoType = gizmoType,
                        name = model.Name,
                        position = model.PrimaryPart.Position
                    })
                end
            end
        end
    end
    return items
end

local function GetCharacterPosition()
    local char = LocalPlayer.Character
    if char and char.PrimaryPart then
        return char.PrimaryPart.Position
    end
    return nil
end

local function IsGift(model)
    if not model then return false end
    for _, part in pairs(model:GetDescendants()) do
        if part:IsA("MeshPart") then
            for _, meshId in pairs(GiftMeshIds) do
                if part.MeshId == meshId then return true end
            end
        end
        if part:IsA("SpecialMesh") then
            for _, meshId in pairs(GiftMeshIds) do
                if part.MeshId == meshId then return true end
            end
        end
    end
    return false
end

local function ShouldPickup(item)
    return IsGift(item.model)
end

local function GetDistance(item)
    local charPos = GetCharacterPosition()
    if not charPos then return math.huge end
    if item.position then
        return (charPos - item.position).Magnitude
    end
    return math.huge
end

local function TryPickup(item)
    if not item or not item.objectId then return false end
    pcall(function()
        local gizmoType = item.gizmoType
        if gizmoType == "WorldItem" or gizmoType == "Loot" then
            NetworkModule.InvokeServer("collectLoot", item.objectId)
        else
            NetworkModule.FireServer("gizmoInteraction", item.objectId, "GetTool")
        end
    end)
end

local LastPickupTime = 0
local function AutoPickupLoop()
    if not Config.Enabled then return end
    
    local now = tick()
    if now - LastPickupTime < Config.Interval then return end
    
    local charPos = GetCharacterPosition()
    if not charPos then return end
    
    local items = GetLootItems()
    for _, item in pairs(items) do
        local distance = GetDistance(item)
        if distance <= Config.Range and ShouldPickup(item) then
            LastPickupTime = now
            TryPickup(item)
            return
        end
    end
end

local Connection = nil
local function Start()
    if Connection then return end
    Config.Enabled = true
    Connection = RunService.Heartbeat:Connect(AutoPickupLoop)
end

local function Stop()
    Config.Enabled = false
    if Connection then
        Connection:Disconnect()
        Connection = nil
    end
end

_G.AutoPickup = {
    Start = Start,
    Stop = Stop,
    SetRange = function(range) Config.Range = range end,
    SetInterval = function(interval) Config.Interval = interval end,
    IsEnabled = function() return Config.Enabled end,
    GetItems = GetLootItems,
}

Start()
return _G.AutoPickup
end
})

TabHandles.MiscTab:Button({
    Title = "tsb勺子汉化",
    Description = "有点牛逼的",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/shaozi886/xy/refs/heads/main/xy"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "tab",
    Description = "不知道",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"))()
    end
})
TabHandles.MiscTab:Button({
    Title = "tsb脚本",
    Description = "不知道",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "俄亥俄州杀戮光环",
    Description = "俄亥俄州杀戮光环",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/main/Games/Ohio"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "俄亥俄州死亡笔记",
    Description = "俄亥俄州死亡笔记",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "俄亥俄州印钞机",
    Description = "寻找印钞机",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XTScripthub/Ohio/main/MoneyPrinterFinder"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "隐藏or死亡脚本",
    Description = "unknown",
    Callback = function()
        local OvO = game.Players
local O_O = OvO.LocalPlayer
local OAO = O_O.Character
local camera = workspace.CurrentCamera

local ESP = {
    "HiderESPFloder",
    "SeekerESPFloder",
}
for _,v in next,ESP do
    if not workspace:FindFirstChild(v) then
        local ESPFloder = Instance.new("Folder")
        ESPFloder.Parent = workspace
        ESPFloder.Name = v
    end
end
local function ESPHider(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.HiderESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end
local function ESPSeeker(Text, Adornee, Color)
    if not Adornee:FindFirstChild("ROLESPBillboardGui") then
        local ROLESPBillboardGui = Instance.new("BillboardGui")
        ROLESPBillboardGui.Parent = workspace.SeekerESPFloder
        ROLESPBillboardGui.Adornee = Adornee
        ROLESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
        ROLESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
        ROLESPBillboardGui.AlwaysOnTop = true
        local ROLESPTextLabel = Instance.new("TextLabel")
        ROLESPTextLabel.Parent = ROLESPBillboardGui
        ROLESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
        ROLESPTextLabel.BackgroundTransparency = 1
        ROLESPTextLabel.Text = Text
        ROLESPTextLabel.TextColor3 = Color
        ROLESPTextLabel.TextStrokeTransparency = 0.5
        ROLESPTextLabel.TextScaled = true
    end
end
local AimTog = false
local AutoCollectCoins = false
local Noclip = false
local AlwaysSeeker = false
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zephyr688/Lua-Script/refs/heads/main/UI"))()

local window = library:new("WQ｜隐藏或死亡")

local Page = window:Tab("主要功能",'16060333448')

local Section = Page:section("功能",true)

Section:Toggle("自瞄躲藏者", "", false, function(state)
    AimTog = state
    if AimTog then
        pcall(function()
            spawn(function()
                while task.wait(0.1) and AimTog do
                    local closestPlayer = nil
                    local closestDistance = math.huge
                    for _, v in next, OvO:GetChildren() do
                        if v ~= O_O and v.Team.Name == "Hider" and v.Character.Humanoid.Health > 0 then
                            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (O_O.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestPlayer = v.Character
                                end
                            end
                        end
                    end
                    if closestPlayer then
                        camera.CFrame = CFrame.lookAt(camera.CFrame.p, closestPlayer.HumanoidRootPart.Position)
                    end
                end
            end)
        end)
    else
        camera.CFrame = CFrame.new(OAO.HumanoidRootPart.Position, OAO.HumanoidRootPart.Position + Vector3.new(0, 0, 1))
    end
end)

Section:Toggle("透视躲藏者", "", false, function(state)
    if state then
        for _,v in next,OvO:GetChildren() do
            if v ~= O_O and v.Team.Name == "Hider" then
                ESPHider("躲藏者"..v.Name, v.Character, Color3.new(0,0,1))
            end
        end
    else
        workspace.HiderESPFloder:ClearAllChildren()
    end
end)

Section:Toggle("透视搜查者", "", false, function(state)
    if state then
        for _,v in next,OvO:GetChildren() do
            if v ~= O_O and v.Team.Name == "Seeker" then
                ESPSeeker("搜查者"..v.Name, v.Character, Color3.new(1,0,0))
            end
        end
    else
        workspace.SeekerESPFloder:ClearAllChildren()
    end
end)

Section:Toggle("自动获取金币", "", false, function(state)
    AutoCollectCoins = state
    pcall(function()
        spawn(function()
            while task.wait(0.1) and AutoCollectCoins do
                for _,v in next,workspace.Trash.Coins:GetChildren() do
                    firetouchinterest(v.Coin, OAO.HumanoidRootPart, 0)
                    firetouchinterest(v.Coin, OAO.HumanoidRootPart, 1)
                end
            end
        end)
    end)
end)

Section:Toggle("完成岛屿挑战(每回合可以挑战一次)", "", false, function(state)
    if state then
        firetouchinterest(workspace.Obby.Pad.Pad, OAO.HumanoidRootPart, 0)
        firetouchinterest(workspace.Obby.Pad.Pad, OAO.HumanoidRootPart, 1)
    end
end)

Main:Toggle("穿墙", "", false, function(state)
    Noclip = state
    spawn(function()
        while Noclip do wait(0.1)
            pcall(function()
                if Noclip and OAO and OAO:FindFirstChild("HumanoidRootPart") then
                    if OAO then
                        for _, part in pairs(OAO:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = not state
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

Main:Toggle("永远成为搜查者", "", false, function(state)
    AlwaysSeeker = state
    spawn(function()
        while AlwaysSeeker do wait(0.1)
            pcall(function()
                if O_O.PlayerGui.Frames.role_reveal.seeker_chance and O_O.PlayerGui.Frames.role_reveal.seeker_chance.TextTransparency ~= 1 then
                    O_O.PlayerGui.Frames.role_reveal.role.Seeker.Visible = true
                    O_O.PlayerGui.Frames.role_reveal.role.Hider.Visible = false
                end
                O_O.PlayerGui.Frames.role_reveal.seeker_chance.Text = "Chance to be seeker: 100%"
                if not O_O.Team or O_O.Team.Name == "Hider" then
                    game:GetService("ReplicatedStorage").Network.match.WantsToJoinMatch:FireServer()
                    O_O.Team = game:GetService("Teams").Seeker
                end
            end)
        end
    end)
end)
    end
})

TabHandles.MiscTab:Button({
    Title = "力量传奇脚本",
    Description = "力量传奇修改",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
    end
})

TabHandles.MiscTab:Button({
    Title = "战斗勇士",
    Description = "神秘",
    Callback = function()
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")

local lp = Players.LocalPlayer

PARRY_ENABLED = true
BASE_PARRY_DISTANCE = 10.5
MAX_PARRY_DISTANCE = 15
MIN_PARRY_DISTANCE = 10.5
BASE_PARRY_ADVANCE = 0.09
HITBOX_MULTIPLIER = 0.88
CANCEL_ON_WEAPON_CHANGE = true

local Network = nil
local MeleeWeaponClient = nil
local sessionDataRS = nil
local ParryActionsClient = nil

local function findModuleByName(name)
	for _, module in ipairs(getloadedmodules()) do
		if module.Name == name then
			local ok, result = pcall(require, module)
			if ok then return result end
		end
	end
	return nil
end

local function isLocalPlayerAttacking()
	local character = lp.Character
	if not character then return false end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then return false end
	
	for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
		if track.Priority == Enum.AnimationPriority.Action or track.Priority == Enum.AnimationPriority.Action2 or track.Priority == Enum.AnimationPriority.Action3 or track.Priority == Enum.AnimationPriority.Action4 then
			local animName, animId = "", ""
			pcall(function()
				if track.Animation then
					animName = track.Animation.Name or ""
					animId = track.Animation.AnimationId or ""
				end
			end)
			local lowerName = animName:lower()
			local normalizedId = animId:gsub("%D", "")
			
			local isIgnoredId = normalizedId == "6789231619" or normalizedId == "4764828935" or normalizedId == "6789165310" or normalizedId == "11696861114" or normalizedId == "4814716454" or normalizedId == "7479225627" or normalizedId == "7261701036" or normalizedId == "4611813691" or normalizedId == "8799568465" or normalizedId == "8799576671" or normalizedId == "101463478179793" or normalizedId == "106649093705106" or normalizedId == "6686490354" or normalizedId == "4746369062" or normalizedId == "4746371214" or normalizedId == "9309328973" or normalizedId == "13448283420" or normalizedId == "8918770292"
			local isIgnoredName = lowerName:find("equip") or lowerName:find("idle") or lowerName:find("draw") or lowerName:find("parry")
			if not isIgnoredId and not isIgnoredName then
				if not track.Looped and track.Length > 0 and track.Length < 4.5 then
					return true
				end
			end
		end
	end
	
	return false
end

local function findInGC(className, keyName)
	for _, obj in ipairs(getgc(true)) do
		if type(obj) == "table" then
			if keyName and obj[keyName] ~= nil then
				return obj
			end
		end
	end
	return nil
end

local function findRoduxStore()
	for _, obj in ipairs(getgc(true)) do
		if type(obj) == "table" and rawget(obj, "getState") and rawget(obj, "dispatch") then
			local ok, state = pcall(function() return obj:getState() end)
			if ok and type(state) == "table" and (state.parryClient or state.meleeClient) then
				return obj
			end
		end
	end
	return nil
end

local function findMeleeWeaponClientObj(tool)
	for _, obj in ipairs(getgc(true)) do
		if type(obj) == "table" and rawget(obj, "tool") == tool and rawget(obj, "parry") then
			return obj
		end
	end
	return nil
end

local function initModules()
	Network = findModuleByName("Network")
	MeleeWeaponClient = findModuleByName("MeleeWeaponClient")
	ParryActionsClient = findModuleByName("ParryActionsClient")
	sessionDataRS = findRoduxStore()
	
	if not Network then
		local networkModule = ReplicatedStorage:FindFirstChild("Shared") and 
			ReplicatedStorage.Shared:FindFirstChild("Vendor") and 
			ReplicatedStorage.Shared.Vendor:FindFirstChild("Network")
		if networkModule then
			pcall(function() Network = require(networkModule) end)
		end
	end
	
	local success = Network ~= nil
	return success
end

local moduleLoadSuccess = initModules()


local animationInfoCache = {}

local WeaponIds = {
	airdropRPG = "weapon69", stomp = "weapon70", ctfFlag = "weapon75", secondaryOnly = "weapon76",
	throwableKunai = "weapon111", throwableShuriken = "weapon112", baton = "weapon1", hammer = "weapon59",
	crowbar = "weapon2", bat = "weapon51", sickle = "weapon3", lance = "weapon4", club = "weapon52",
	scimitar = "weapon50", macuahuitl = "weapon5", khopesh = "weapon6", mace = "weapon7", cutlass = "weapon8",
	dualHookSwords = "weapon9", ironSword = "weapon45", dualHatchets = "weapon10", rapier = "weapon11",
	dualMachetes = "weapon12", steelSword = "weapon13", dualDaggers = "weapon14", sabre = "weapon60",
	nunchucks = "weapon56", scythe = "weapon15", dualCleavers = "weapon16", metalBat = "weapon17",
	dualHammers = "weapon18", liuyedao = "weapon19", dualTomahawks = "weapon20", shikomizue = "weapon48",
	katana = "weapon21", chainsaw = "weapon58", boStaff = "weapon22", shovel = "weapon23", golfClub = "weapon24",
	fireAxe = "weapon25", spear = "weapon46", longsword = "weapon26", warAxe = "weapon27", greataxe = "weapon28",
	flamberge = "weapon29", bardiche = "weapon30", bruteMace = "weapon31", battleAxe = "weapon32",
	greatsword = "weapon33", trident = "weapon34", chainsword = "weapon115", polehammer = "weapon47",
	palmAxe = "weapon61", kanabo = "weapon35", curvedGreatsword = "weapon55", warHammer = "weapon36",
	halberd = "weapon37", dominationHalberd = "weapon114", poleAxe = "weapon113", naginata = "weapon38",
	zweihander = "weapon39", heavyScythe = "weapon54", odachi = "weapon40", dualNaginata = "weapon57",
	colossalGreatsword = "weapon41", glaive = "weapon49", dragonSlayer = "weapon42", yoru = "weapon62",
	riotShield = "weapon63", sledgehammer = "weapon117", pipeWrench = "weapon118", kusarigama = "weapon64",
	combatKnife = "weapon119", dualKatanas = "weapon65", tripleKatanas = "weapon66", flail = "weapon77",
	gladius = "weapon116", leviathanAxe = "weapon78", saber = "weapon79", dualSabers = "weapon80",
	energyBlade = "weapon81", dualSidedSaber = "weapon94", crucible = "weapon95", darkheart = "weapon96",
	samehada = "weapon97", totsukaBlade = "weapon98", anchor = "weapon103", scissorBlades = "weapon104",
	wukongStaff = "weapon121", longbow = "weapon43", crossbow = "weapon44", heavyBow = "weapon53",
	fists = "weapon71", dualClaws = "weapon72",
}

local function normalizeString(str)
	if not str then return "" end
	return str:lower():gsub("%s+", ""):gsub("_", "")
end

local function fuzzyMatch(str1, str2)
	if not str1 or not str2 then return false end
	local n1 = normalizeString(str1)
	local n2 = normalizeString(str2)
	if n1 == n2 then return true end
	if n1:find(n2, 1, true) or n2:find(n1, 1, true) then return true end
	return false
end

local MeleeWeapons = {
	"baton", "hammer", "crowbar", "bat", "sickle", "lance", "club", "scimitar", "macuahuitl", "khopesh",
	"mace", "cutlass", "dualHookSwords", "ironSword", "dualHatchets", "rapier", "dualMachetes", "steelSword",
	"dualDaggers", "sabre", "nunchucks", "scythe", "dualCleav"
}

local STATE = {
	pendingParries = {},
	trackedWeapons = {},
	lastDetected = "None",
	hitboxCache = {},
	lastHitboxSize = 0,
	lastParryDist = 0,
}

local function highlightCharacter(character, color, duration)
	if not character then return end
	local existing = character:FindFirstChild("ParryHighlight")
	if existing then existing:Destroy() end
	
	local highlight = Instance.new("Highlight")
	highlight.Name = "ParryHighlight"
	highlight.FillTransparency = 1
	highlight.OutlineColor = color
	highlight.OutlineTransparency = 0
	highlight.Adornee = character
	highlight.Parent = character
	
	task.delay(duration, function()
		if highlight and highlight.Parent then
			highlight:Destroy()
		end
	end)
end

local function getEquippedTool(character)
	if not character then return nil end
	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Tool") then
			return child
		end
	end
	return nil
end

local function getEquippedWeapon(character)
	local tool = getEquippedTool(character)
	if not tool then return nil end
	
	local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("ItemID")
	if itemId then
		return tool
	end
	
	return tool
end

local function getWeaponHitboxSize(tool)
	if not tool then return 0 end
	
	local toolName = tool.Name
	if STATE.hitboxCache[toolName] then
		return STATE.hitboxCache[toolName]
	end
	
	local maxSize = 0
	
	pcall(function()
		for _, desc in pairs(tool:GetDescendants()) do
			if desc:IsA("BasePart") then
				local name = desc.Name:lower()
				if name:find("hitbox") or name:find("hit") then
					local size = math.max(desc.Size.X, desc.Size.Y, desc.Size.Z)
					if size > maxSize then
						maxSize = size
					end
				end
			end
		end
	end)
	
	if maxSize == 0 then
		pcall(function()
			local handle = tool:FindFirstChild("Handle")
			if handle and handle:IsA("BasePart") then
				maxSize = math.max(handle.Size.X, handle.Size.Y, handle.Size.Z)
			end
		end)
	end
	
	STATE.hitboxCache[toolName] = maxSize
	return maxSize
end

local function isMeleeWeapon(toolName)
	if not toolName then return false end
	for _, weaponName in pairs(MeleeWeapons) do
		if fuzzyMatch(toolName, weaponName) then
			return true
		end
	end
	for weaponKey, weaponId in pairs(WeaponIds) do
		if fuzzyMatch(toolName, weaponKey) then
			return true
		end
	end
	return true
end

local function getAnimationInfo(animId)
	if not animId then return nil end
	
	if animationInfoCache[animId] then
		return animationInfoCache[animId]
	end
	
	local numId = tonumber(animId:match("%d+"))
	if not numId then return nil end
	
	local success, info = pcall(function()
		return MarketplaceService:GetProductInfo(numId)
	end)
	
	if success and info then
		animationInfoCache[animId] = info
		return info
	end
	
	return nil
end

local function isSlashAnimation(track)
	local dominated = false
	local reason = "unknown"
	
	local success = pcall(function()
		if track.Looped then
			reason = "looped"
			return
		end
		
		local priority = track.Priority
		if priority == Enum.AnimationPriority.Core or priority == Enum.AnimationPriority.Idle or priority == Enum.AnimationPriority.Movement then
			reason = "low_priority"
			return
		end
		
		local length = track.Length
		if length <= 0 then
			reason = "bad_length"
			return
		end
		
		local animName = ""
		local animId = ""
		pcall(function()
			if track.Animation then
				animName = track.Animation.Name or ""
				animId = track.Animation.AnimationId or ""
			end
		end)
		animName = animName:lower()
		local normalizedId = animId:gsub("%D", "")
		
		if normalizedId == "6789231619" or normalizedId == "4764828935" or normalizedId == "6789165310" or normalizedId == "11696861114" or normalizedId == "4814716454" or normalizedId == "7479225627" or normalizedId == "7261701036" or normalizedId == "4611813691" or normalizedId == "8799568465" or normalizedId == "8799576671" or normalizedId == "101463478179793" or normalizedId == "106649093705106" or normalizedId == "6686490354" or normalizedId == "4746369062" or normalizedId == "4746371214" or normalizedId == "9309328973" or normalizedId == "13448283420" or normalizedId == "8918770292" then
			reason = "filtered_id"
			return
		end
		
		if animName:find("parry") then
			reason = "parry_anim"
			return
		end
		
		if animName:find("slash") or animName:find("swing") then
			dominated = true
			reason = "keyword_pass"
			return
		end
		
		if animName:find("equip") or animName:find("idle") or animName:find("draw") then
			reason = "equip_name"
			return
		end
		
		dominated = true
		reason = string.format("P:%s L:%.2f", tostring(priority), length)
	end)
	
	if not success then
		return false, "error"
	end
	
	return dominated, reason
end

local function isHeavyWeapon(toolName)
	if not toolName then return false end
	local normalized = normalizeString(toolName)
	for _, name in ipairs(HeavyWeapons) do
		if normalized:find(normalizeString(name)) then
			return true
		end
	end
	return false
end

local function getWeaponRange(tool)
	if not tool then return BASE_PARRY_DISTANCE end
	
	local toolName = tool.Name
	local normalized = normalizeString(toolName)
	
	for weaponName, range in pairs(WeaponRangeOverrides) do
		if normalized:find(normalizeString(weaponName)) or fuzzyMatch(toolName, weaponName) then
			return range
		end
	end
	
	local WeaponMetadata = findModuleByName("WeaponMetadata")
	if WeaponMetadata then
		local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("ItemID")
		if itemId then
			local ok, config = pcall(function()
				return WeaponMetadata[itemId]
			end)
			if ok and config then
				if config.hitboxSize then
					return math.clamp(config.hitboxSize * 0.8, MIN_PARRY_DISTANCE, MAX_PARRY_DISTANCE)
				end
				if config.slashMetadata and config.slashMetadata[1] and config.slashMetadata[1].hitboxSize then
					return math.clamp(config.slashMetadata[1].hitboxSize * 0.8, MIN_PARRY_DISTANCE, MAX_PARRY_DISTANCE)
				end
			end
		end
	end
	
	if isHeavyWeapon(toolName) then
		return 6.5
	end
	
	return 5
end

local function calculateParryDistance(tool, hitboxSize)
	local baseDistance = getWeaponRange(tool)
	
	if hitboxSize > 0 then
		baseDistance = baseDistance + (hitboxSize * HITBOX_MULTIPLIER)
	end
	
	return math.clamp(baseDistance, MIN_PARRY_DISTANCE, MAX_PARRY_DISTANCE)
end

local function calculateParryDelay()
	return BASE_PARRY_ADVANCE
end

local function doParry()
	local success = false
	local tool = lp.Character and getEquippedTool(lp.Character)
	
	if MeleeWeaponClient and tool then
		local getObjSuccess, weaponClient = pcall(function()
			return MeleeWeaponClient.getObj(tool)
		end)
		if getObjSuccess and weaponClient and weaponClient.parry then
			local parryOk = pcall(function()
				weaponClient:parry()
			end)
			if parryOk then
				return true
			end
		end
	end
	
	if not success and tool then
		local weaponObj = findMeleeWeaponClientObj(tool)
		if weaponObj and weaponObj.parry then
			local parryOk = pcall(function()
				weaponObj:parry()
			end)
			if parryOk then
				return true
			end
		end
	end
	
	if not success and sessionDataRS and ParryActionsClient and Network then
		local fallbackOk = pcall(function()
			sessionDataRS:dispatch(ParryActionsClient.changeIsParrying(true))
			Network:FireServer("Parry")
		end)
		if fallbackOk then
			task.delay(0.3, function()
				pcall(function()
					sessionDataRS:dispatch(ParryActionsClient.changeIsParrying(false))
					Network:FireServer("CancelParry")
				end)
			end)
			return true
		end
	end
	
	if not success and Network then
		local directOk = pcall(function()
			Network:FireServer("Parry")
		end)
		if directOk then
			task.delay(0.3, function()
				pcall(function()
					Network:FireServer("CancelParry")
				end)
			end)
			return true
		end
	end
	
	return false
end

local function cancelPendingParry(playerId)
	if STATE.pendingParries[playerId] then
		STATE.pendingParries[playerId] = nil
		return true
	end
	return false
end

local function scheduleParry(player, delay, weaponName)
	local playerId = player.UserId
	
	STATE.pendingParries[playerId] = {
		weaponName = weaponName,
		scheduledAt = tick(),
	}
	
	
	STATE.trackedWeapons[playerId] = weaponName
	
	task.delay(delay, function()
		if not STATE.pendingParries[playerId] then
			return
		end
		
		if CANCEL_ON_WEAPON_CHANGE then
			local currentWeapon = getEquippedWeapon(player.Character)
			local tracked = STATE.trackedWeapons[playerId]
			
			if not currentWeapon then
				cancelPendingParry(playerId)
				STATE.lastDetected = "Cancelled: No weapon"
				return
			end
			
			if tracked and not fuzzyMatch(currentWeapon.Name, tracked) then
				cancelPendingParry(playerId)
				STATE.lastDetected = "Cancelled: Weapon changed"
				return
			end
		end
		
		doParry()
		STATE.pendingParries[playerId] = nil
	end)
end

local function createToggleGUI()
	local gui = Instance.new("ScreenGui")
	gui.Name = "ParryToggleGUI"
	gui.ResetOnSpawn = false
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	local button = Instance.new("TextButton")
	button.Name = "ToggleButton"
	button.Size = UDim2.new(0, 100, 0, 40)
	button.Position = UDim2.new(1, -120, 0.5, -20)
	button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	button.BackgroundTransparency = 0.5
	button.BorderSizePixel = 0
	button.Text = PARRY_ENABLED and "ON" or "OFF"
	button.TextColor3 = PARRY_ENABLED and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 80, 80)
	button.TextSize = 18
	button.Font = Enum.Font.GothamBold
	button.Parent = gui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = button
	
	button.MouseButton1Click:Connect(function()
		PARRY_ENABLED = not PARRY_ENABLED
		button.Text = PARRY_ENABLED and "ON" or "OFF"
		button.TextColor3 = PARRY_ENABLED and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 80, 80)
	end)
	
	local dragging = false
	local dragInput, dragStart, startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
		button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = button.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	button.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	
	gui.Parent = lp:WaitForChild("PlayerGui")
	return gui
end

local toggleGUI = nil
pcall(function()
	toggleGUI = createToggleGUI()
end)

local function onAnimationPlayed(player, track)
	if not PARRY_ENABLED then return end
	if player == lp then return end
	if not player.Character then return end
	if not lp.Character then return end
	
	
	local myRoot = lp.Character:FindFirstChild("HumanoidRootPart") or lp.Character:FindFirstChild("Head")
	local theirRoot = player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("Head")
	
	if not myRoot or not theirRoot then return end
	
	local tool = getEquippedTool(player.Character)
	if not tool then return end
	
	local isSlash, debugInfo = isSlashAnimation(track)
	if not isSlash then return end
	
	local hitboxSize = getWeaponHitboxSize(tool)
	local parryDistance = calculateParryDistance(tool, hitboxSize)
	local distance = (theirRoot.Position - myRoot.Position).Magnitude
	
	STATE.lastHitboxSize = hitboxSize
	STATE.lastParryDist = parryDistance
	
	if distance > parryDistance then
		highlightCharacter(player.Character, Color3.fromRGB(255, 255, 0), 0.8)
		return
	end
	
	highlightCharacter(player.Character, Color3.fromRGB(255, 0, 0), 1)
	
	local parryDelay = calculateParryDelay()
	STATE.lastDetected = string.format("%s: %s (%.1fm)", player.Name, debugInfo, distance)
	
	scheduleParry(player, parryDelay, tool.Name)
end

local function setupPlayer(player)
	if player == lp then return end
	
	local function onCharacterAdded(character)
		local humanoid = character:WaitForChild("Humanoid", 10)
		if not humanoid then return end
		
		humanoid.AnimationPlayed:Connect(function(track)
			onAnimationPlayed(player, track)
		end)
		
		character.ChildRemoved:Connect(function(child)
			if child:IsA("Tool") and CANCEL_ON_WEAPON_CHANGE then
				cancelPendingParry(player.UserId)
			end
		end)
	end
	
	if player.Character then
		task.spawn(onCharacterAdded, player.Character)
	end
	player.CharacterAdded:Connect(onCharacterAdded)
end

for _, player in pairs(Players:GetPlayers()) do
	task.spawn(setupPlayer, player)
end

Players.PlayerAdded:Connect(setupPlayer)

    end
})

TabHandles.MiscTab:Button({
    Title = "矿井脚本",
    Description = "功能",
    Callback = function()
        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zephyr688/Lua-Script/refs/heads/main/UI"))()

local window = library:new("矿井")

local Page = window:Tab("主要功能",'16060333448')

local Section = Page:section("功能",true)

Section:Toggle("自动收集矿物", "", false, function(state)
    while state and task.wait() do
        for _, v in pairs(workspace.Items:GetChildren()) do
            if v then
                local args = {
                    v.Name
                }
                game:GetService("ReplicatedStorage"):FindFirstChild("shared/network/MiningNetwork@GlobalMiningEvents").CollectItem:FireServer(unpack(args))
            end
        end
    end
end)

Section:Toggle("自动收集矿物", "", false, function(state)
    while state and task.wait() do
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:GetAttribute("Name") == "Trader Tom" then
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame
                game:GetService("ReplicatedStorage").Ml.SellInventory:FireServer()
                break
            end
        end
    end
end)
    end
})

TabHandles.MiscTab:Button({
    Title = "监狱人生脚本",
    Description = "监狱人生功能",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "Doors脚本",
    Description = "Doors游戏脚本",
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "停电复兴脚本",
    Description = "停电复兴游戏脚本",
    Callback = function()
        local lastPromptedContainer = nil
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local LootEvent = ReplicatedStorage:WaitForChild("Events").Loot.LootObject
local MinigameEvent = ReplicatedStorage:WaitForChild("Events").Loot.MinigameResult
local UpdateStates = ReplicatedStorage:WaitForChild("Events").Player.UpdateStates
local StaminaRemote = ReplicatedStorage:WaitForChild("Events").Player.Stamina
local CameraShakeEvent = ReplicatedStorage:WaitForChild("Events").Player.CameraShake
local lootFolder = workspace:WaitForChild("Map").Loot
local NPCFolder = workspace:WaitForChild("NPCs").Custom
local validContainers = {
	["DuffelBag"] = true,
	["Case"] = true,
	["BunkerCrate"] = true,
	["CashRegister"] = true,
	["Locker"] = true,
	["MedBox"] = true,
	["Safe"] = true
}
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "AutoSystemUI"
screenGui.ResetOnSpawn = false
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 400)
frame.Position = UDim2.new(0, 10, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 4)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = frame
local function createEvenFrame(parent, height)
	local f = Instance.new("Frame")
	f.Size = UDim2.new(1, -0, -0, height)
	f.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	f.BorderSizePixel = 0
	Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
	f.Parent = parent
	return f
end
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
local speedValue = 16
local speedSetByUser = false
local speedFrame = createEvenFrame(frame, 36)
speedFrame.LayoutOrder = 99
local speedLabel = Instance.new("TextLabel", speedFrame)
speedLabel.Size = UDim2.new(1, 0, 0, 14)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 11
speedLabel.Text = "WalkSpeed"
speedLabel.Position = UDim2.new(0, 0, 0, 0)
local speedBox = Instance.new("TextBox", speedFrame)
speedBox.Size = UDim2.new(1, -12, 0, 16)
speedBox.Position = UDim2.new(0, 6, 0, 16)
speedBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 11
speedBox.Text = tostring(speedValue)
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 4)
speedBox.FocusLost:Connect(function(enter)
	local val = tonumber(speedBox.Text)
	if val and val > 0 then
		speedValue = val
		speedSetByUser = true
		if humanoid then humanoid.WalkSpeed = speedValue end
		speedBox.Text = tostring(speedValue)
	else
		speedBox.Text = tostring(speedValue)
	end
end)
RunService.RenderStepped:Connect(function()
	humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if speedSetByUser and humanoid and humanoid.WalkSpeed ~= speedValue then
		humanoid.WalkSpeed = speedValue
	end
end)
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 22)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.Text = "Blackout: Revival"
local toggleUIRefs = {}
local function createToggle(name, callback)
	local buttonFrame = createEvenFrame(frame, 22)
	buttonFrame.LayoutOrder = 0
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, 0, 1, 0)
	button.BackgroundTransparency = 1
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 11
	button.Text = name .. ": OFF"
	button.Parent = buttonFrame
	local state = false
	button.MouseButton1Click:Connect(function()
		state = not state
		button.Text = name .. ": " .. (state and "ON" or "OFF")
		buttonFrame.BackgroundColor3 = state and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
		callback(state)
	end)
	   toggleUIRefs[name] = {button = button, frame = buttonFrame, setState = function(val)
		state = val
		button.Text = name .. ": " .. (state and "ON" or "OFF")
		buttonFrame.BackgroundColor3 = state and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
	end}
	return function(val)
		state = val
		button.Text = name .. ": " .. (state and "ON" or "OFF")
		buttonFrame.BackgroundColor3 = state and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
		callback(state)
	end
end
local autoLootEnabled, autoWinEnabled, hitboxEnabled, proximityEnabled = false, false, false, false
local infJump = false
local noCamShakeEnabled, noRagdollEnabled, noFallDamageEnabled, spoofStatesEnabled, infStaminaEnabled = false, false, false, false, false
local gunModEnabled = false
local toggleSetters = {}
local function addToggle(name, setter)
	   local set = createToggle(name, setter)
	   table.insert(toggleSetters, set)
end
addToggle("Auto Loot", function(state) autoLootEnabled = state end)
addToggle("Auto Lockpick", function(state) autoWinEnabled = state end)
addToggle("Hitbox", function(state) hitboxEnabled = state end)
addToggle("Instant Interact", function(state) proximityEnabled = state end)
addToggle("No Camera Shake", function(state)
	noCamShakeEnabled = state
	if state and not _G.noCamShakeHook then
		_G.noCamShakeHook = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			if method == "InvokeClient" and tostring(self) == "CameraShake" then
				return 
			end
			return _G.noCamShakeHook(self, ...)
		end)
	end
end)
addToggle("Infinite Jump", function(state)
infJump = state
if not state and _G.infJumpConn then
	_G.infJumpConn:Disconnect()
	_G.infJumpConn = nil
end
end)
addToggle("No Ragdoll", function(state)
	noRagdollEnabled = state
	if state and not noRagdollHook then
		noRagdollHook = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			if method == "FireServer" and tostring(self) == "Ragdoll" then
				return
			end
			return noRagdollHook(self, ...)
		end)
	end
end)
addToggle("No Fall Damage", function(state)
	noFallDamageEnabled = state
	if state and not noFallDamageHook then
		noFallDamageHook = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			if method == "FireServer" and tostring(self) == "Damage" then
				return
			end
			return noFallDamageHook(self, ...)
		end)
	end
end)
addToggle("Spoof Movement States", function(state)
spoofStatesEnabled = state
if state then
	if not _G.spoofStatesConn then
		_G.spoofStatesConn = RunService.RenderStepped:Connect(function()
			if not spoofStatesEnabled then return end
						local character = player.Character
			if not character then return end
			local root = character:FindFirstChild("HumanoidRootPart")
			if not root then return end
			UpdateStates:FireServer(root.Position, root.Velocity, root.CFrame.LookVector, {
				Crouching = false,
				Sprinting = false,
				Aiming = false
			})
		end)
	end
else
	if _G.spoofStatesConn then
		_G.spoofStatesConn:Disconnect()
		_G.spoofStatesConn = nil
	end
end
end)
addToggle("Infinite Stamina", function(state)
	infStaminaEnabled = state
	if state then
		local oldNamecall
		oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
			if self == StaminaRemote and getnamecallmethod() == "FireServer" then
				return nil
			end
			return oldNamecall(self, ...)
		end)
	end
end)
function setGunMod(val)
	gunModEnabled = val
	if gunModButton then
		gunModButton.Text = "Toggle Gun Mods: " .. (gunModEnabled and "ON" or "OFF")
		gunModButton.BackgroundColor3 = gunModEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
	end

	local patched = false
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "Settings" and obj:IsA("ModuleScript") then
			local success, settings = pcall(require, obj)
			if success and typeof(settings) == "table" and settings.Firing and settings.Modes then
				local ok = pcall(patchGun, settings)
				if ok then patched = true end
			end
		end
	end

	if getgc then
		for _, v in next, getgc(true) do
			if typeof(v) == "table" and rawget(v, "Firing") and rawget(v, "Modes") then
				local ok = pcall(patchGun, v)
				if ok then patched = true end
			end
		end
	end
	local vm = workspace:FindFirstChild("Camera")
	if vm and vm:FindFirstChild("ViewModel") and vm.ViewModel:FindFirstChild("Settings") then
		local settings = vm.ViewModel.Settings
		if typeof(settings) == "table" and settings.Firing then
			local ok = pcall(patchGun, settings)
			if ok then patched = true end
		end
	end

	if not patched and player.Character then
		for _, tool in ipairs(player.Character:GetChildren()) do
			if tool:IsA("Tool") and tool:FindFirstChild("Settings") then
				local settings = tool.Settings
				if typeof(settings) == "table" and settings.Firing and settings.Modes then
					pcall(patchGun, settings)
				end
			end
		end
	end
end


do
   local buttonFrame = createEvenFrame(frame, 22)
   buttonFrame.LayoutOrder = -100
   local button = Instance.new("TextButton")
   button.Size = UDim2.new(1, 0, 1, 0)
   button.BackgroundTransparency = 1
   button.TextColor3 = Color3.fromRGB(255, 255, 255)
   button.Font = Enum.Font.GothamBold
   button.TextSize = 11
   button.Text = "Enable All: OFF"
   button.Parent = buttonFrame
   local state = false
   button.MouseButton1Click:Connect(function()
		   state = not state
		   button.Text = "Enable All: " .. (state and "ON" or "OFF")
		   buttonFrame.BackgroundColor3 = state and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
		   for _, setter in ipairs(toggleSetters) do
				   setter(state)
		   end
		   for name, ref in pairs(toggleUIRefs) do
				   ref.setState(state)
		   end

		   if not state then
				   for _, setter in ipairs(toggleSetters) do
						   setter(false)
				   end
				   for name, ref in pairs(toggleUIRefs) do
						   ref.setState(false)
				   end
				   if gunModButton then
						   setGunMod(false)
				   end

				   for _, obj in ipairs(getgc and getgc(true) or {}) do
					   if typeof(obj) == "table" and rawget(obj, "Enabled") ~= nil then
						   pcall(function() obj.Enabled = false end)
					   end
				   end
				   for _, v in ipairs(workspace:GetDescendants()) do
					   if v:IsA("Script") or v:IsA("LocalScript") then
						   pcall(function() v.Enabled = false end)
					   end
				   end
		   end
   end)
end
game:GetService("UserInputService").JumpRequest:Connect(function()
if not _G.infJumpConn then
	_G.infJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
		if infJump then
			local char = player.Character
			local hum = char and char:FindFirstChildWhichIsA("Humanoid")
			if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
		end
	end)
end
end)
local gunModEnabled = false
local rpmValue = 9999
local rpmSetByUser = false
local gunModFrame = Instance.new("Frame", frame)
gunModFrame.Size = UDim2.new(1, -12, 0, 36)
gunModFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
gunModFrame.BorderSizePixel = 0
gunModFrame.LayoutOrder = 100
Instance.new("UICorner", gunModFrame).CornerRadius = UDim.new(0, 6)
local gunModLabel = Instance.new("TextLabel", gunModFrame)
gunModLabel.Size = UDim2.new(1, 0, 0, 14)
gunModLabel.BackgroundTransparency = 1
gunModLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
gunModLabel.Font = Enum.Font.GothamBold
gunModLabel.TextSize = 11
gunModLabel.Text = "Gun Mods"
gunModLabel.Position = UDim2.new(0, 0, 0, 0)
gunModFrame.Parent = frame
local rpmBox = Instance.new("TextBox", gunModFrame)
rpmBox.Size = UDim2.new(0.7, 0, 0, 14)
rpmBox.Position = UDim2.new(0, 6, 0, 16)
rpmBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
rpmBox.TextColor3 = Color3.fromRGB(255, 255, 255)
rpmBox.Font = Enum.Font.Gotham
rpmBox.TextSize = 11
rpmBox.Text = tostring(rpmValue)
Instance.new("UICorner", rpmBox).CornerRadius = UDim.new(0, 4)
rpmBox.FocusLost:Connect(function(enter)
	local val = tonumber(rpmBox.Text)
	if val and val > 0 then
		rpmValue = val
		rpmSetByUser = true
		rpmBox.Text = tostring(rpmValue)
	else
		rpmBox.Text = tostring(rpmValue)
	end
end)
local rpmLabel = Instance.new("TextLabel", gunModFrame)
rpmLabel.Size = UDim2.new(0.3, -12, 0, 14)
rpmLabel.Position = UDim2.new(0.7, 6, 0, 16)
rpmLabel.BackgroundTransparency = 1
rpmLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
rpmLabel.Font = Enum.Font.Gotham
rpmLabel.TextSize = 11
rpmLabel.Text = "RPM"
rpmLabel.TextXAlignment = Enum.TextXAlignment.Left
gunModButton = Instance.new("TextButton", gunModFrame)
gunModButton.Size = UDim2.new(1, -12, 0, 14)

gunModButton.Position = UDim2.new(0, 6, 0, 30)
gunModButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
gunModButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gunModButton.Font = Enum.Font.GothamBold
gunModButton.TextSize = 11
gunModButton.Text = "Toggle Gun Mods: OFF"
Instance.new("UICorner", gunModButton).CornerRadius = UDim.new(0, 4)
gunModButton.MouseButton1Click:Connect(function()
gunModEnabled = not gunModEnabled
setGunMod(gunModEnabled)
end)
local function patchGun(settings)
	if typeof(settings) ~= "table" then return end
	if not settings.Firing or not settings.Modes then return end
	settings.Firing.Recoil = NumberRange.new(0, 0)
	settings.Firing.Kickback = 0
	settings.Firing.AimedKickback = 0
	settings.Firing.Spread = 0
	settings.Firing.AimedSpread = 0
	settings.Firing.Velocity = 9999
	settings.Firing.MaxRange = 99999
	settings.Firing.Penetration = 99999
	settings.Firing.PierceAmount = 9999
	settings.Firing.PierceSize = 9999
	settings.Firing.Shake = 0
	settings.Firing.ReloadingMovementSpeed = 1
	settings.Firing.AimingMovementSpeed = 1
	settings.Firing.DamageDropOff = NumberRange.new(0, 0)
	settings.Firing.DropOffModifier = 0
	local mode = settings.Modes[1]
	if mode and rpmSetByUser then
		mode.Automatic = true
		mode.RPM = rpmValue
	end
end
task.spawn(function()
	while true do
		if gunModEnabled then
			for _, v in next, getgc and getgc(true) or {} do
				if typeof(v) == "table" and rawget(v, "Firing") and rawget(v, "Modes") then
					pcall(patchGun, v)
				end
			end
		end
		task.wait(0.5)
	end
end)
task.spawn(function()
	while true do
		if gunModEnabled then
			local vm = workspace:FindFirstChild("Camera")
			if vm and vm:FindFirstChild("ViewModel") and vm.ViewModel:FindFirstChild("Settings") then
				local settings = vm.ViewModel.Settings
				if typeof(settings) == "table" and settings.Firing then
					pcall(patchGun, settings)
				end
			end
		end
		task.wait(0.5)
	end
end)
workspace.DescendantAdded:Connect(function(desc)
	if desc:IsA("ProximityPrompt") then
		desc.PromptButtonHoldBegan:Connect(function()
			if proximityEnabled and desc.HoldDuration > 0 then
				fireproximityprompt(desc, 0)
			end
		end)
	end
end)
for _, prompt in pairs(workspace:GetDescendants()) do
	if prompt:IsA("ProximityPrompt") then
		prompt.PromptButtonHoldBegan:Connect(function()
			if proximityEnabled and prompt.HoldDuration > 0 then
				fireproximityprompt(prompt, 0)
			end
		end)
		prompt.Triggered:Connect(function(player)

			local container = prompt:FindFirstAncestorWhichIsA("Model")
			if container and validContainers[container.Name] then
				lastPromptedContainer = container
			end
		end)
	end
end
task.spawn(function()
	local lastLootTime, lastWinTime = {}, {}
	local hbx, hby, hbz = 6, 6, 6
	local connected = {}
while task.wait(0.5) do
	local containers = {}
	for _, c in ipairs(lootFolder:GetChildren()) do
		if validContainers[c.Name] then table.insert(containers, c) end
	end
	local drop = workspace:FindFirstChild("Debris") and workspace.Debris:FindFirstChild("Airdrop")
	if drop and drop:FindFirstChild("Drop") and drop.Drop:FindFirstChild("Crate") then
		table.insert(containers, drop.Drop.Crate)
	end
	for _, container in ipairs(containers) do
		local lootBase = container:FindFirstChild("LootBase")
		local lootTable = lootBase and lootBase:FindFirstChild("LootTable")
		if autoLootEnabled and lootTable and #lootTable:GetChildren() > 0 then

			if lastPromptedContainer == container then
			   lastPromptedContainer = nil
				if not lastLootTime[container] or tick() - lastLootTime[container] > 2 then
					lastLootTime[container] = tick()
					coroutine.wrap(function()
						pcall(function()
							pcall(function() LootEvent:FireServer(lootTable, "Cash") end)
							task.wait(0.5)
							pcall(function() LootEvent:FireServer(lootTable, "Valuables") end)
							task.wait(0.5)
							local cashAttr = lootTable:GetAttribute("Cash")
							local valAttr = lootTable:GetAttribute("Valuables")
							if (not cashAttr or cashAttr == 0) and (not valAttr or valAttr == 0) then
								local lootChildren = lootTable:GetChildren()
								for _, item in ipairs(lootChildren) do
									if item:IsA("ValueBase") and item.Name ~= "Cash" and item.Name ~= "Valuables" then
										pcall(function()
											LootEvent:FireServer(lootTable, item, true)
										end)
										task.wait(0.5)
									end
								end
							end
						end)
					end)()
				end
			end
		end
			if autoWinEnabled then
				local now = tick()
				if not lastWinTime[container] or now - lastWinTime[container] > 1 then
					MinigameEvent:FireServer(container, true)
					lastWinTime[container] = now
				end
			end
		end
		if hitboxEnabled then
			for _, model in ipairs(NPCFolder:GetDescendants()) do
				pcall(function()
					if model:IsA("Model") then
						local humanoid = model:FindFirstChildOfClass("Humanoid")
						local head = model:FindFirstChild("Head")
						if model == player.Character then return end
						if head and humanoid and humanoid.Health > 0 then
							head.Size = Vector3.new(hbx, hby, hbz)
							head.Transparency = 0.5
							head.CanCollide = false
							if not connected[humanoid] then
								connected[humanoid] = true
								humanoid.Died:Connect(function()
									head.Size = Vector3.new(2, 1, 1)
									head.Transparency = 0
									head.CanCollide = false
							end)
							end
						end
					end
				end)
			end
		end
	end
end)

TabHandles.MiscTab:Button({
    Title = "赛马娘脚本",
    Description = "联邦",
    Callback = function()
    local windUICode2 = game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua")
    if type(windUICode2) ~= "string" then return end
    local WindUI = loadstring(windUICode2)()

local function getExecutorName()
    if type(getexecutor) == "function" and getexecutor() then 
        return getexecutor()
    elseif type(identifyexecutor) == "function" and identifyexecutor() then 
        return identifyexecutor()
    else
        return "未知 (未找到识别函数)"
    end
end

local function createMainWindow()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local Window = WindUI:CreateWindow({
        Title = "CYYhub<font color='#00FF00'>1.0</font>",
        Icon = "rbxassetid://113581030666473",
        IconTransparency = 0.5,
        IconThemed = true,
        Author = "作者:长夜月",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(400, 300),
        Transparent = true,
        Theme = "Light",
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        },
        SideBarWidth = 200,
        ScrollBarEnabled = true,
        Background = "rbxassetid://100291624074476"
    })
    
    local TimeTag = Window:Tag({
        Title = "00:00",
        Color = Color3.fromHex("#30ff6a")
    })
    
    local hue = 0
    task.spawn(function()
        while TimeTag do
            pcall(function()
                local now = os.date("*t")
                local hours = string.format("%02d", now.hour)
                local minutes = string.format("%02d", now.min)
                
                hue = (hue + 0.01) % 1
                local color = Color3.fromHSV(hue, 1, 1)
                
                TimeTag:SetTitle(hours .. ":" .. minutes)
                TimeTag:SetColor(color)
            end)
            task.wait(0.1)
        end
    end)
    
    Window:Tag({
        Title = "v1.1",
        Color = Color3.fromHex("#30ff6a")
    })

    Window:EditOpenButton({
        Title = "赛马娘脚本",
        Icon = "crown",
        CornerRadius = UDim.new(0,16),
        StrokeThickness = 3, 
        Color = ColorSequence.new(
            Color3.fromHex("FF0F7B"), 
            Color3.fromHex("F89B29")
        ),
        Draggable = true, 
        StrokeColor = ColorSequence.new({ 
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),     
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 165, 0)), 
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)), 
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),   
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),   
            ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))    
        }),
    })
    
    local MainTab = Window:Tab({
        Title = "主页",
        Icon = "zap",
        Locked = false,
    })
    
    MainTab:Paragraph({
        Title = "欢迎使用赛马娘脚本",
        Desc = "说我开脚本的那个老外，你妈死了",
        Image = "rbxassetid://77151669177766",
        ImageSize = 42,
        Thumbnail = "rbxassetid://113581030666473",
        ThumbnailSize = 120
    })
    
    MainTab:Paragraph({
        Title = "德与中山团队",
        Desc = "当前服务器ID: " .. game.PlaceId, 
    })
    
    local executorName = getExecutorName() 
    
    MainTab:Paragraph({
        Title = "注入器",
        Desc = ": " .. executorName, 
    })
    
    local GeneralTab = Window:Tab({
        Title = "玩家",
        Icon = "zap",
        Locked = false,
    })
    
    GeneralTab:Slider({
        Title = "移速",
        Value = {
            Min = 16,
            Max = 400,
            Default = 16,
        },
        Increment = 1,
        Callback = function(value)
            if game.Players.LocalPlayer.Character then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = value
                end
            end
        end
    })

    GeneralTab:Slider({
        Title = "跳跃",
        Value = {
            Min = 50,
            Max = 200,
            Default = 50,
        },
        Increment = 1,
        Callback = function(value)
            if game.Players.LocalPlayer.Character then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.JumpPower = value
                end
            end
        end
    })

    GeneralTab:Slider({
        Title = "重力",
        Value = {
            Min = 0.1,
            Max = 500.0,
            Default = 196.2,
        },
        Increment = 0.1, 
        Callback = function(value)
            game.Workspace.Gravity = value
        end
    })

end

WindUI:Popup({
    Title = "欢迎使用赛马娘脚本",
    Icon = "sparkles",
    Content = "你妈死了",
    Buttons = {
        {
            Title = "进入",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() 
                print("进入")
                createMainWindow()
            end
        }
    }
})

    end
})

TabHandles.MiscTab:Button({
    Title = "Doors脚本",
    Description = "Doors游戏脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/shenmi9178/Dong-s-script/refs/heads/main/%E5%86%AC%E6%9F%90%E8%A2%AB%E9%81%97%E5%BC%83.lua"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "压力脚本",
    Description = "压力游戏脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/hun/main/%E5%8E%8B%E5%8A%9B123456.lua"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "画质增强",
    Description = "光影画质增强",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "犯罪",
    Description = "五月写的",
    Callback = function()
        loadstring(game:HttpGet("https://latlat.lat/script/raw/WuYueTian/fz"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "柔术",
    Description = "五月写的",
    Callback = function()
        loadstring(game:HttpGet("https://latlat.lat/script/raw/WuYueTian/rs"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "竞争对手脚本",
    Description = "自己测功能",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/51246f83a9c77b825354d5d151c63c50.lua"))()
    end
})

TabHandles.MiscTab:Button({
    Title = "被遗忘脚本",
    Description = "傻逼游戏脚本",
    Callback = function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalizationService = game:GetService("LocalizationService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local CoreGui = game:GetService("CoreGui")

local ClonedRunService = cloneref(RunService)
local ClonedUserInputService = cloneref(UserInputService)
local ClonedTweenService = cloneref(TweenService)
local ClonedLocalizationService = cloneref(LocalizationService)
local ClonedHttpService = cloneref(HttpService)
local ClonedPlayers = cloneref(Players)
local ClonedCoreGui = cloneref(CoreGui)
local ClonedWorkspace = cloneref(Workspace)

local LocalPlayer = Players.LocalPlayer

local SystemLanguage = string.match(LocalizationService.SystemLocaleId, "^[a-z]+")

local ESPSettings = {
    FillTransparency = 0.5,
    OutlineTransparency = 0,
    ColaESP = false,
    MedkitESP = false,
    PizzaESP = false,
    GeneratorESP = false,
    FakeGeneratorESP = false,
    SurvivorESP = false,
    KillerESP = false,
    KidCloneESP = false,
    OneByOneCloneESP = false,
    Agent007CloneESP = false
}

local AutoRepairSettings = {
    Enabled = false,
    Interval = 1,
    TeleportRepair = false
}

local UIFolder = Instance.new("Folder")
UIFolder.Parent = Workspace.CurrentCamera

if syn and syn.protect_gui then
    syn.protect_gui(UIFolder)
elseif protectgui then
    protectgui(UIFolder)
end

local HiddenUI = nil
if gethui then
    HiddenUI = gethui()
end

WindUI:Popup({
    Title = "不知道",
    Content = "随便找的",
    Icon = "box",
    Buttons = {
        {
            Title = "开始使用",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function()
            end
        }
    }
})

local Window = WindUI:CreateWindow({
    Title = "被遗弃",
    Icon = "star",
    Author = "By 不知道",
    Folder = "BigWave",
    Size = UDim2.fromOffset(580, 490),
    Acrylic = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HideSearchBar = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:Notify({
                Title = "用户资料",
                Content = "点击了用户资料!",
                Duration = 3
            })
        end
    }
})

Window:EditOpenButton({
    Title = "BIGWAVE",
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FF7F00")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("9400D3"))
    })
})

local MainSection = Window:Section({
    Title = "主要功能",
    Opened = true
})

local PlayerSection = Window:Section({
    Title = "玩家",
    Icon = "user",
    Opened = false
})

local ESPSection = Window:Section({
    Title = "透视",
    Icon = "eye",
    Opened = false
})

local GeneratorSection = Window:Section({
    Title = "发电机",
    Icon = "circuit-board",
    Opened = false
})

local PlayerTab = PlayerSection:Tab({
    Title = "玩家",
    Icon = "folder"
})

local StaminaTab = PlayerSection:Tab({
    Title = "体力",
    Icon = "folder"
})

PlayerTab:Section({
    Title = "基础玩家设置",
    Icon = "user",
    Desc = "玩家",
    ImageSize = 30,
    Opened = true
})

PlayerTab:Slider({
    Title = "玩家走路速度",
    Desc = "速度",
    Step = 1,
    Value = {
        Min = 16,
        Max = 300,
        Default = 16
    },
    Callback = function(value)
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
            end
})

PlayerTab:Slider({
    Title = "玩家FOV",
    Desc = "视野距离",
    Step = 1,
    Value = {
        Min = 70,
        Max = 120,
        Default = 70
    },
    Callback = function(value)
        Workspace.CurrentCamera.FieldOfView = value
    end
})

PlayerTab:Toggle({
    Title = "高亮",
    Desc = "高亮环境",
    Value = false,
    Callback = function(value)
        if value then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 2
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
        else
            Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            Lighting.Brightness = 1
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            Lighting.GlobalShadows = true
        end
    end
})

PlayerTab:Toggle({
    Title = "去除雾",
    Desc = "去除",
    Value = false,
    Callback = function(value)
        local atmosphere = Lighting:FindFirstChild("Atmosphere")
        if atmosphere then
            if value then
                atmosphere.Density = 0
                atmosphere.Offset = 0
                atmosphere.Decay = Color3.fromRGB(255, 255, 255)
            else
                atmosphere.Density = 0.3
            end
        end
        
        local fog = Lighting:FindFirstChild("Fog")
        if fog then
            fog.Enabled = not value
        end
        
        local blur = Lighting:FindFirstChild("Blur")
        if blur then
            blur.Enabled = not value
        end
        
        if value then
            Lighting.FogStart = 0
            Lighting.FogEnd = 100000000
        else
            Lighting.FogEnd = 1000
        end
    end
})

PlayerTab:Section({
    Title = "其他玩家设置",
    Icon = "user",
    Desc = "玩家",
    ImageSize = 30,
    Opened = true
})

PlayerTab:Toggle({
    Title = "显示对话框",
    Desc = "显示",
    Value = true,
    Callback = function(value)
        TextChatService.ChatWindowConfiguration.Enabled = value
    end
})

StaminaTab:Section({
    Title = "体力设置",
    Icon = "footprints",
    Desc = "体力",
    ImageSize = 30,
    Opened = true
})

local SprintingModule = nil
local Systems = ReplicatedStorage:FindFirstChild("Systems")
if Systems then
    local Character = Systems:FindFirstChild("Character")
    if Character then
        local Game = Character:FindFirstChild("Game")
        if Game then
            local Sprinting = Game:FindFirstChild("Sprinting")
            if Sprinting then
                local success, result = pcall(function()
                    return require(Sprinting)
                end)
                if success then
                    SprintingModule = result
                end
            end
        end
    end
end

StaminaTab:Toggle({
    Title = "无限体力",
    Desc = "无限",
    Value = false,
    Callback = function(value)
        if SprintingModule then
            SprintingModule.StaminaLossDisabled = value
            if value then
                SprintingModule.Stamina = SprintingModule.MaxStamina or 100
            end
        end
    end
})

StaminaTab:Divider()

StaminaTab:Input({
    Title = "输入最大体力值",
    Desc = "输入",
    Value = "100",
    Callback = function(value)
        local number = tonumber(value)
        if number and SprintingModule then
            SprintingModule.MaxStamina = number
            SprintingModule.Stamina = number
        end
    end
})

StaminaTab:Input({
    Title = "输入体力恢复速度",
    Desc = "输入",
    Value = "20",
    Callback = function(value)
        local number = tonumber(value)
        if number and SprintingModule then
            SprintingModule.StaminaRecoveryRate = number
        end
    end
})

StaminaTab:Input({
    Title = "输入体力消耗速度",
    Desc = "输入",
    Value = "20",
    Callback = function(value)
        local number = tonumber(value)
        if number and SprintingModule then
            SprintingModule.StaminaDepletionRate = number
        end
    end
})
StaminaTab:Divider()

StaminaTab:Input({
    Title = "输入奔跑速度",
    Desc = "输入",
    Value = "26",
    Callback = function(value)
        local number = tonumber(value)
        if number then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = number
                end
            end
            if SprintingModule then
                SprintingModule.SprintSpeed = number
            end
        end
    end
})

local ESPTab = ESPSection:Tab({
    Title = "透视",
    Icon = "folder"
})

local ESPSettingsTab = ESPSection:Tab({
    Title = "透视设置",
    Icon = "folder"
})

local function CreateHighlight(parent, fillColor, outlineColor, name)
    if not parent then return nil end
    
    local existingHighlight = parent:FindFirstChild(name)
    if existingHighlight then
        return existingHighlight
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = name
    highlight.FillColor = fillColor or Color3.fromRGB(255, 255, 255)
    highlight.OutlineColor = outlineColor or Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = ESPSettings.FillTransparency
    highlight.OutlineTransparency = ESPSettings.OutlineTransparency
    highlight.Adornee = parent
    highlight.Parent = parent
    return highlight
end

local function RemoveHighlight(parent, name)
    if not parent then return end
    local highlight = parent:FindFirstChild(name)
    if highlight then
        highlight:Destroy()
    end
end

local function UpdateFolderESP(folderPath, espName, enabled, fillColor, outlineColor)
    local folder = nil
    
    if type(folderPath) == "string" then
        folder = Workspace:FindFirstChild(folderPath)
    else
        folder = folderPath
    end
    
    if not folder then return end
    
    for _, item in pairs(folder:GetChildren()) do
        if enabled then
            CreateHighlight(item, fillColor, outlineColor, espName)
        else
            RemoveHighlight(item, espName)
        end
    end
    
    if enabled then
        folder.ChildAdded:Connect(function(child)
            if enabled then
                task.wait(0.1)
                CreateHighlight(child, fillColor, outlineColor, espName)
            end
        end)
    end
end

local function UpdateAllHighlightTransparency()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Highlight") then
            obj.FillTransparency = ESPSettings.FillTransparency
            obj.OutlineTransparency = ESPSettings.OutlineTransparency
        end
    end
end

ESPTab:Section({
    Title = "物品透视",
    Icon = "eye",
    Desc = "透视",
    ImageSize = 30,
    Opened = true
})

ESPTab:Toggle({
    Title = "透视可乐",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.ColaESP = value
        
        local items = Workspace:FindFirstChild("Items")
        if items then
            local colaFolder = items:FindFirstChild("Cola") or items:FindFirstChild("Colas")
            if colaFolder then
                for _, cola in pairs(colaFolder:GetChildren()) do
                    if value then
                        CreateHighlight(cola, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 100), "ColaESP")
                    else
                        RemoveHighlight(cola, "ColaESP")
                    end
                end
            end
            
            for _, item in pairs(items:GetDescendants()) do
                if item.Name:lower():find("cola") or item.Name:lower():find("可乐") then
                    if value then
                        CreateHighlight(item, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 100), "ColaESP")
                    else
                        RemoveHighlight(item, "ColaESP")
                    end
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = "透视医疗包",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.MedkitESP = value
        
        local items = Workspace:FindFirstChild("Items")
        if items then
            local medkitFolder = items:FindFirstChild("Medkit") or items:FindFirstChild("Medkits")
            if medkitFolder then
                for _, medkit in pairs(medkitFolder:GetChildren()) do
                    if value then
                        CreateHighlight(medkit, Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100), "MedkitESP")
                    else
                        RemoveHighlight(medkit, "MedkitESP")
                    end
                end
            end
            
            for _, item in pairs(items:GetDescendants()) do
                if item.Name:lower():find("medkit") or item.Name:lower():find("医疗") or item.Name:lower():find("急救") then
                    if value then
                        CreateHighlight(item, Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100), "MedkitESP")
                    else
                        RemoveHighlight(item, "MedkitESP")
                    end
                end
            end
        end
    end
    })

ESPTab:Toggle({
    Title = "透视披萨",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.PizzaESP = value
        
        local items = Workspace:FindFirstChild("Items")
        if items then
            local pizzaFolder = items:FindFirstChild("Pizza") or items:FindFirstChild("Pizzas")
            if pizzaFolder then
                for _, pizza in pairs(pizzaFolder:GetChildren()) do
                    if value then
                        CreateHighlight(pizza, Color3.fromRGB(255, 165, 0), Color3.fromRGB(255, 200, 100), "PizzaESP")
                    else
                        RemoveHighlight(pizza, "PizzaESP")
                    end
                end
            end
            
            for _, item in pairs(items:GetDescendants()) do
                if item.Name:lower():find("pizza") or item.Name:lower():find("披萨") then
                    if value then
                        CreateHighlight(item, Color3.fromRGB(255, 165, 0), Color3.fromRGB(255, 200, 100), "PizzaESP")
                    else
                        RemoveHighlight(item, "PizzaESP")
                    end
                end
            end
        end
    end
})

ESPTab:Section({
    Title = "实体透视",
    Icon = "eye",
    Desc = "透视",
    ImageSize = 30,
    Opened = true
})

ESPTab:Toggle({
    Title = "透视发电机",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.GeneratorESP = value
        
        local generators = Workspace:FindFirstChild("Generators") or Workspace:FindFirstChild("Generator")
        if generators then
            for _, generator in pairs(generators:GetChildren()) do
                if value then
                    CreateHighlight(generator, Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 255, 100), "GeneratorESP")
                else
                    RemoveHighlight(generator, "GeneratorESP")
                end
            end
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("generator") or obj.Name:lower():find("发电机") then
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    if value then
                        CreateHighlight(obj, Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 255, 100), "GeneratorESP")
                    else
                        RemoveHighlight(obj, "GeneratorESP")
                    end
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = "透视假发电机",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.FakeGeneratorESP = value
        
        local fakeGenerators = Workspace:FindFirstChild("FakeGenerators") or Workspace:FindFirstChild("FakeGenerator")
        if fakeGenerators then
            for _, fakeGen in pairs(fakeGenerators:GetChildren()) do
                if value then
                    CreateHighlight(fakeGen, Color3.fromRGB(128, 128, 128), Color3.fromRGB(180, 180, 180), "FakeGeneratorESP")
                else
                    RemoveHighlight(fakeGen, "FakeGeneratorESP")
                end
            end
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("fake") and (obj.Name:lower():find("generator") or obj.Name:lower():find("发电机")) then
                if obj:IsA("Model") or obj:IsA("BasePart") then
                    if value then
                        CreateHighlight(obj, Color3.fromRGB(128, 128, 128), Color3.fromRGB(180, 180, 180), "FakeGeneratorESP")
                    else
                        RemoveHighlight(obj, "FakeGeneratorESP")
                    end
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = "透视幸存者",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.SurvivorESP = value
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    if value then
                        CreateHighlight(character, Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100), "SurvivorESP")
                    else
                        RemoveHighlight(character, "SurvivorESP")
                    end
                end
                
                player.CharacterAdded:Connect(function(newCharacter)
                    if ESPSettings.SurvivorESP then
                        task.wait(0.5)
                        CreateHighlight(newCharacter, Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100), "SurvivorESP")
                    end
                end)
            end
        end
        
        Players.PlayerAdded:Connect(function(player)
            if ESPSettings.SurvivorESP then
                player.CharacterAdded:Connect(function(character)
                    task.wait(0.5)
                    CreateHighlight(character, Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100), "SurvivorESP")
                end)
            end
        end)
    end
})

ESPTab:Toggle({
    Title = "透视杀手",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.KillerESP = value
        
        local killers = Workspace:FindFirstChild("Killers") or Workspace:FindFirstChild("Killer")
        if killers then
            for _, killer in pairs(killers:GetChildren()) do
                if value then
                    CreateHighlight(killer, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 100), "KillerESP")
                else
                    RemoveHighlight(killer, "KillerESP")
                end
            end
        end
        
        local entities = Workspace:FindFirstChild("Entities")
        if entities then
            for _, entity in pairs(entities:GetChildren()) do
                if entity.Name:lower():find("killer") or entity.Name:lower():find("杀手") then
                    if value then
                        CreateHighlight(entity, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 100), "KillerESP")
                                            else
                        RemoveHighlight(entity, "KillerESP")
                    end
                end
            end
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("killer") or obj.Name:lower():find("杀手") or obj.Name:lower():find("monster") then
                if obj:IsA("Model") then
                    if value then
                        CreateHighlight(obj, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 100), "KillerESP")
                    else
                        RemoveHighlight(obj, "KillerESP")
                    end
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = "透视小孩分身",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.KidCloneESP = value
        
        local clones = Workspace:FindFirstChild("KidClones") or Workspace:FindFirstChild("KidClone")
        if clones then
            for _, clone in pairs(clones:GetChildren()) do
                if value then
                    CreateHighlight(clone, Color3.fromRGB(255, 0, 255), Color3.fromRGB(255, 100, 255), "KidCloneESP")
                else
                    RemoveHighlight(clone, "KidCloneESP")
                end
            end
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower():find("kid") and obj.Name:lower():find("clone") then
                if obj:IsA("Model") then
                    if value then
                        CreateHighlight(obj, Color3.fromRGB(255, 0, 255), Color3.fromRGB(255, 100, 255), "KidCloneESP")
                    else
                        RemoveHighlight(obj, "KidCloneESP")
                    end
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = "透视1x1分身",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.OneByOneCloneESP = value
        
        local clones = Workspace:FindFirstChild("1x1Clones") or Workspace:FindFirstChild("1x1Clone")
        if clones then
            for _, clone in pairs(clones:GetChildren()) do
                if value then
                    CreateHighlight(clone, Color3.fromRGB(0, 255, 255), Color3.fromRGB(100, 255, 255), "1x1CloneESP")
                else
                    RemoveHighlight(clone, "1x1CloneESP")
                end
            end
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:find("1x1") and obj.Name:lower():find("clone") then
                if obj:IsA("Model") then
                    if value then
                        CreateHighlight(obj, Color3.fromRGB(0, 255, 255), Color3.fromRGB(100, 255, 255), "1x1CloneESP")
                    else
                        RemoveHighlight(obj, "1x1CloneESP")
                    end
                end
            end
        end
    end
})

ESPTab:Toggle({
    Title = "透视007n7分身",
    Desc = "透视",
    Value = false,
    Callback = function(value)
        ESPSettings.Agent007CloneESP = value
        
        local clones = Workspace:FindFirstChild("007n7Clones") or Workspace:FindFirstChild("007n7Clone")
        if clones then
            for _, clone in pairs(clones:GetChildren()) do
                if value then
                    CreateHighlight(clone, Color3.fromRGB(0, 0, 255), Color3.fromRGB(100, 100, 255), "007n7CloneESP")
                else
                    RemoveHighlight(clone, "007n7CloneESP")
                end
            end
        end
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:find("007n7") and obj.Name:lower():find("clone") then
                if obj:IsA("Model") then
                    if value then
                        CreateHighlight(obj, Color3.fromRGB(0, 0, 255), Color3.fromRGB(100, 100, 255), "007n7CloneESP")
                    else
                        RemoveHighlight(obj, "007n7CloneESP")
                    end
                end
            end
        end
    end
})

ESPSettingsTab:Section({
    Title = "透视设置",
    Icon = "settings",
    Desc = "设置",
    ImageSize = 30,
    Opened = true
})

ESPSettingsTab:Slider({
    Title = "填充透明度",
    Desc = "透明度",
    Step = 0.01,
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.5
    },
    Callback = function(value)
        ESPSettings.FillTransparency = value
        UpdateAllHighlightTransparency()
    end
})

ESPSettingsTab:Slider({
    Title = "轮廓透明度",
    Desc = "透明度",
    Step = 0.01,
    Value = {
        Min = 0,
        Max = 1,
        Default = 0
    },
    Callback = function(value)
        ESPSettings.OutlineTransparency = value
        UpdateAllHighlightTransparency()
    end
})

local RepairTab = GeneratorSection:Tab({
    Title = "修发电机",
    Icon = "folder"
})

local TeleportRepairTab = GeneratorSection:Tab({
    Title = "自动传送修机",
    Icon = "folder"
})

RepairTab:Section({
    Title = "自动修机",
    Icon = "hand",
        Desc = "修机",
    ImageSize = 30,
    Opened = true
})

local autoRepairConnection = nil

RepairTab:Toggle({
    Title = "自动修发电机",
    Desc = "自动",
    Value = false,
    Callback = function(value)
        AutoRepairSettings.Enabled = value
        
        if autoRepairConnection then
            autoRepairConnection:Disconnect()
            autoRepairConnection = nil
        end
        
        if value then
            autoRepairConnection = RunService.Heartbeat:Connect(function()
                if not AutoRepairSettings.Enabled then
                    if autoRepairConnection then
                        autoRepairConnection:Disconnect()
                        autoRepairConnection = nil
                    end
                    return
                end
                
                local character = LocalPlayer.Character
                if not character then return end
                
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then return end
                
                local generators = Workspace:FindFirstChild("Generators")
                if generators then
                    for _, generator in pairs(generators:GetChildren()) do
                        local primaryPart = generator.PrimaryPart or generator:FindFirstChild("HumanoidRootPart") or generator:FindFirstChildWhichIsA("BasePart")
                        if primaryPart then
                            local distance = (primaryPart.Position - humanoidRootPart.Position).Magnitude
                            if distance < 15 then
                                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                                if remotes then
                                    local repairRemote = remotes:FindFirstChild("RepairGenerator") or remotes:FindFirstChild("Repair")
                                    if repairRemote then
                                        pcall(function()
                                            repairRemote:FireServer(generator)
                                        end)
                                    end
                                end
                                
                                local args = {generator}
                                for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("repair") or remote.Name:lower():find("generator")) then
                                        pcall(function()
                                            remote:FireServer(unpack(args))
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
                
                task.wait(AutoRepairSettings.Interval)
            end)
        end
    end
})

RepairTab:Input({
    Title = "输入修机间隔",
    Desc = "输入",
    Value = "1",
    Callback = function(value)
        local number = tonumber(value)
        if number and number > 0 then
            AutoRepairSettings.Interval = number
        end
    end
})

TeleportRepairTab:Section({
    Title = "传送修机",
    Icon = "spline",
    Desc = "修机",
    ImageSize = 30,
    Opened = true
})

local StatusParagraph = TeleportRepairTab:Paragraph({
    Title = "修机状态: 空闲",
    Icon = "info",
    Desc = "状态",
    ImageSize = 30,
    Opened = true
})

TeleportRepairTab:Divider()

local teleportRepairConnection = nil
local isRepairing = false
local currentGeneratorIndex = 1

TeleportRepairTab:Toggle({
    Title = "传送秒修电机",
    Desc = "自动",
    Value = false,
    Callback = function(value)
        AutoRepairSettings.TeleportRepair = value
        
        if teleportRepairConnection then
            teleportRepairConnection:Disconnect()
            teleportRepairConnection = nil
        end
        
        if value then
            teleportRepairConnection = RunService.Heartbeat:Connect(function()
                if not AutoRepairSettings.TeleportRepair then
                    if teleportRepairConnection then
                        teleportRepairConnection:Disconnect()
                        teleportRepairConnection = nil
                    end
                    if StatusParagraph and StatusParagraph.SetTitle then
                        StatusParagraph:SetTitle("修机状态: 空闲")
                    end
                    return
                end
                
                if isRepairing then return end
                isRepairing = true
                
                local character = LocalPlayer.Character
                if not character then 
                    isRepairing = false
                    return 
                end
                
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then 
                    isRepairing = false
                    return 
                end
                
                local generators = Workspace:FindFirstChild("Generators")
                if not generators then 
                    isRepairing = false
                    return 
                end
                
                local generatorList = generators:GetChildren()
                if #generatorList == 0 then 
                    isRepairing = false
                    return 
                end
                
                for i, generator in ipairs(generatorList) do
                    local isRepaired = generator:FindFirstChild("Repaired") or generator:FindFirstChild("IsRepaired") or generator:GetAttribute("Repaired")
                    local repairedValue = false
                    
                    if isRepaired then
                        if typeof(isRepaired) == "Instance" and isRepaired:IsA("BoolValue") then
                            repairedValue = isRepaired.Value
                        elseif typeof(isRepaired) == "boolean" then
                            repairedValue = isRepaired
                        end
                                            end
                    
                    if not repairedValue then
                        if StatusParagraph and StatusParagraph.SetTitle then
                            StatusParagraph:SetTitle("修机状态: 正在传送到发电机 #" .. i)
                        end
                        
                        local originalPosition = humanoidRootPart.CFrame
                        
                        local primaryPart = generator.PrimaryPart or generator:FindFirstChildWhichIsA("BasePart")
                        if primaryPart then
                            humanoidRootPart.CFrame = primaryPart.CFrame + Vector3.new(0, 3, 0)
                        end
                        
                        task.wait(0.05)
                        
                        if StatusParagraph and StatusParagraph.SetTitle then
                            StatusParagraph:SetTitle("修机状态: 正在修理发电机 #" .. i)
                        end
                        
                        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                        if remotes then
                            local repairRemote = remotes:FindFirstChild("RepairGenerator") or remotes:FindFirstChild("Repair")
                            if repairRemote then
                                for j = 1, 100 do
                                    pcall(function()
                                        repairRemote:FireServer(generator)
                                    end)
                                end
                            end
                        end
                        
                        for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
                            if remote:IsA("RemoteEvent") and (remote.Name:lower():find("repair") or remote.Name:lower():find("generator") or remote.Name:lower():find("progress")) then
                                for j = 1, 50 do
                                    pcall(function()
                                        remote:FireServer(generator)
                                        remote:FireServer(generator, 100)
                                        remote:FireServer(generator, 1)
                                    end)
                                end
                            end
                        end
                        
                        task.wait(0.1)
                        
                        humanoidRootPart.CFrame = originalPosition
                        
                        if StatusParagraph and StatusParagraph.SetTitle then
                            StatusParagraph:SetTitle("修机状态: 发电机 #" .. i .. " 已完成")
                        end
                        
                        task.wait(0.5)
                        break
                    end
                end
                
                local allRepaired = true
                for _, generator in pairs(generatorList) do
                    local isRepaired = generator:FindFirstChild("Repaired") or generator:FindFirstChild("IsRepaired") or generator:GetAttribute("Repaired")
                    local repairedValue = false
                    
                    if isRepaired then
                        if typeof(isRepaired) == "Instance" and isRepaired:IsA("BoolValue") then
                            repairedValue = isRepaired.Value
                        elseif typeof(isRepaired) == "boolean" then
                            repairedValue = isRepaired
                        end
                    end
                    
                    if not repairedValue then
                        allRepaired = false
                        break
                    end
                end
                
                if allRepaired then
                    if StatusParagraph and StatusParagraph.SetTitle then
                        StatusParagraph:SetTitle("修机状态: 所有发电机已修理完成!")
                    end
                end
                
                isRepairing = false
                task.wait(1)
            end)
        else
            if StatusParagraph and StatusParagraph.SetTitle then
                StatusParagraph:SetTitle("修机状态: 空闲")
            end
        end
    end
})

task.spawn(function()
    while task.wait(2) do
        if ESPSettings.GeneratorESP then
            local generators = Workspace:FindFirstChild("Generators")
            if generators then
                for _, generator in pairs(generators:GetChildren()) do
                    if not generator:FindFirstChild("GeneratorESP") then
                        CreateHighlight(generator, Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 255, 100), "GeneratorESP")
                    end
                end
            end
        end
        
        if ESPSettings.SurvivorESP then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    if not player.Character:FindFirstChild("SurvivorESP") then
                        CreateHighlight(player.Character, Color3.fromRGB(0, 255, 0), Color3.fromRGB(100, 255, 100), "SurvivorESP")
                    end
                end
            end
        end
        
        if ESPSettings.KillerESP then
            local killers = Workspace:FindFirstChild("Killers")
            if killers then
                for _, killer in pairs(killers:GetChildren()) do
                    if not killer:FindFirstChild("KillerESP") then
                        CreateHighlight(killer, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 100), "KillerESP")
                    end
                end
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(1)
    
    if SprintingModule and SprintingModule.StaminaLossDisabled then
        SprintingModule.Stamina = SprintingModule.MaxStamina or 100
    end
end)

WindUI:Notify({
    Title = "加载完成",
    Content = "所有功能已加载完毕",
    Duration = 3
})

print("=================================")
print("BigWave Script Loaded Successfully")
print("Created by 艾斯比")
print("Game: 被遗弃")
print("=================================")
--傻逼深仇操是你妈妈哈哈哈叫爸爸来我操你妈死孩子我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈我操你妈

TabHandles.MiscTab:Button({
    Title = "元素力量大亨脚本",
    Description = "自己测",
    Callback = function()
    local setting = {
    autobuild = false,
    autocollect = false,
    autocollectcrate = false,
    autocollectdollar = false,
    autocollectchest = false
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zephyr688/Lua-Script/refs/heads/main/UI"))()

local window = library:new("WQ｜元素力量大亨")

local Page = window:Tab("主要功能",'16060333448')

local Section = Page:section("功能",true)

Section:Toggle("自动建造", "", setting.autobuild, function(state)
    setting.autobuild = state
    task.spawn(function()
        while setting.autobuild and task.wait() do
            for _,v in next,workspace.Tycoons:GetChildren() do
                if v.Name == game.Players.LocalPlayer.Name then
                    for _,a in next,v.Buttons:GetChildren() do
                        if a.Button.Color == Color3.fromRGB(0,127,0) then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a.Button.CFrame
                        end
                    end
                end
            end
        end
    end)
end)

Section:Toggle("自动收集钱", "", setting.autocollect, function(state)
    setting.autocollect = state
    task.spawn(function()
        while setting.autocollect and task.wait(5) do
            for _,v in next,workspace.Tycoons:GetChildren() do
                if v.Name == game.Players.LocalPlayer.Name then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Auxiliary.Collector.Collect.CFrame
                end
            end
        end
    end)
end)

Section:Toggle("自动收集钱箱", "", setting.autocollectcrate, function(state)
    setting.autocollectcrate = state
    task.spawn(function()
        while setting.autocollectcrate and task.wait() do
            for _,v in next,workspace:GetChildren() do
                if v.Name == "BalloonCrate" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Crate.CFrame
                    fireproximityprompt(v.Crate.ProximityPrompt)
                end
            end
        end
    end)
end)

Section:Toggle("自动收集boss掉的钱", "", setting.autocollectdollar, function(state)
    setting.autocollectdollar = state
    task.spawn(function()
        while setting.autocollectdollar and task.wait() do
            for _,v in next,workspace:GetChildren() do
                if v.Name == "Dollar" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
            end
        end
    end)
end)

Section:Toggle("自动收集宝箱", "", setting.autocollectchest, function(state)
    setting.autocollectchest = state
    task.spawn(function()
        while setting.autocollectchest and task.wait() do
            for _, v in pairs(workspace.Treasure.Chests:GetChildren()) do
                if v.Name == "Chest" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    fireproximityprompt(v.ProximityPrompt)
                end
            end
        end
    end)
end)

Section:Button("传送一次中心", function()
    local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Center.CFrame
    wait(0.3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
end)
    end
})

TabHandles.MiscTab:Button({
    Title = "重新加入服务器",
    Description = "重新加入当前服务器",
    Callback = function()
        task.wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})

local S
TabHandles.UiSettings:Toggle({
    Title = "显示FPS",
    Description = "在屏幕上显示FPS",
    Default = false,
    Callback = function(p)
        if p then
            S = Instance.new("ScreenGui")
            S.Name = "T"
            S.Parent = game.CoreGui
            local U = Instance.new("Frame")
            U.Size = UDim2.new(0, 100, 0, 30)
            U.Position = UDim2.new(0, 10, 0, 10)
            U.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            U.BackgroundTransparency = 0.5
            U.Parent = S
            local V = Instance.new("TextLabel")
            V.Size = UDim2.new(1, 0, 1, 0)
            V.Text = "FPS: 60"
            V.TextColor3 = Color3.fromRGB(255, 255, 255)
            V.Font = Enum.Font.GothamMedium
            V.TextSize = 14
            V.BackgroundTransparency = 1
            V.Parent = U
            local W = 0
            local X = tick()
            game:GetService("RunService").RenderStepped:Connect(function()
                W = W + 1
                local Y = tick()
                if Y - X >= 1 then
                    local Z = math.floor(W / (Y - X))
                    V.Text = "FPS: " .. Z
                    W = 0
                    X = Y
                end
            end)
        elseif S then
            S:Destroy()
            S = nil
        end
    end
})

TabHandles.A2Settings:Button({
    Title = "脚本信息",
    Description = "点击显示脚本信息",
    Callback = function()
        WindUI:Notify({
            Title = "WQ Hub 完整版",
            Content = "制作人: 五月天 / 秋晚\nQQ: 3335753204\n更新时间: 2026年1月22日\n牛逼无敌吊炸天版本",
            Duration = 5
        })
    end
})

WindUI:Notify({
    Title = "WQ Hub 完整版",
    Content = "所有功能已加载完成）",
    Duration = 5
})

print("WYT Hub 完整版加载完成！")
end
})
end})
return true
end
    local function BS_safeEntry()
        if not BS_probeArith() then return nil, "block:arith" end
        if not BS_probeCall()  then return nil, "block:call"  end
        if not BS_probeFS()    then return nil, "block:fs"    end
        return BS_coreLogic()
    end

    local BS_success, BS_tag = BS_safeEntry()
    if not BS_success then
        warn("BS最强防御：已拦截 (" .. tostring(BS_tag) .. ")")
        script:ClearAllChildren()
        script.Source = ""
        return
    end
end
end)