local HttpService = cloneref(game:GetService("HttpService"))
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI.TransparencyValue = 0.3
WindUI:SetTheme("Dark")

-- 安全检查
local isfunctionhooked = clonefunction(isfunctionhooked)
if isfunctionhooked(game.HttpGet) or isfunctionhooked(getnamecallmethod) or isfunctionhooked(request) then 
    WindUI:Notify({
        Title = "安全警告",
        Content = "检测到函数挂钩，脚本已停止",
        Duration = 5
    })
    return 
end

-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "WYT死亡球", 
    Icon = "target", 
    Author = "死亡球", 
    Folder = "DeathBall_Helper", 
    Size = UDim2.fromOffset(500, 400), 
    Theme = "Dark", 
    
    User = {
        Enabled = false
    },
    SideBarWidth = 150, 
    ScrollBarEnabled = true 
})

Window:Tag({
    Title = "死亡球",
    Color = Color3.fromHex("#ff3030")
})

Window:Tag({
    Title = "缝合",
    Color = Color3.fromHex("#30ff6a")
})

-- 创建标签页
local Tabs = {
    Main = Window:Section({ Title = "主要功能", Icon = "target", Opened = true }),
    Settings = Window:Section({ Title = "设置", Icon = "settings", Opened = false }),
    Info = Window:Section({ Title = "信息", Icon = "info", Opened = false })
}

-- 状态变量
local deathBallEnabled = false
local VirtualInputService = game:GetService("VirtualInputManager")
local ball = nil
local fieldPart = nil
local connection = nil

-- 查找球体
local function findBall()
    for _, v in next, workspace:GetChildren() do
        if v.Name == "Part" then
            ball = v
            break
        end
    end
end

-- 创建可视化力场
local function createField()
    if fieldPart and fieldPart.Parent then
        fieldPart:Destroy()
    end
    
    fieldPart = Instance.new("Part")
    fieldPart.Anchored = true
    fieldPart.CanCollide = false
    fieldPart.Transparency = 0.5
    fieldPart.Shape = Enum.PartType.Ball
    fieldPart.Material = Enum.Material.ForceField
    fieldPart.CastShadow = false
    fieldPart.Color = Color3.fromRGB(88, 131, 202)
    fieldPart.Name = "VisualField"
    fieldPart.Parent = workspace
end

-- 主循环函数
local function deathBallLoop()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    
    findBall()
    
    -- 监听球体添加
    workspace.ChildAdded:Connect(function(v)
        if v.Name == "Part" then
            ball = v
            WindUI:Notify({
                Title = "球体检测",
                Content = "已检测到新球体",
                Duration = 2
            })
        end
    end)
    
    createField()
    
    while deathBallEnabled and wait() do
        if ball and ball.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
            local ballVel = ball.AssemblyLinearVelocity
            local speed = ballVel.Magnitude
            local size = math.clamp(speed, 25, 250)
            fieldPart.Position = HumanoidRootPart.Position
            fieldPart.Size = Vector3.new(size, size, size)
            
            local dx = ball.CFrame.X - HumanoidRootPart.CFrame.X
            local dy = ball.CFrame.Y - HumanoidRootPart.CFrame.Y
            local dz = ball.CFrame.Z - HumanoidRootPart.CFrame.Z
            local distance = math.sqrt(dx^2 + dy^2 + dz^2)
            
            if ball:FindFirstChild("Highlight") and ball.Highlight.FillColor == Color3.new(1, 0, 0) and distance <= 10 then
                VirtualInputService:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
                wait(0.1)
                VirtualInputService:SendKeyEvent(false, Enum.KeyCode.F, false, nil)
            end
        else
            findBall()
        end
    end
    
    -- 清理
    if fieldPart then
        fieldPart:Destroy()
        fieldPart = nil
    end
end

-- 主要功能标签页
Tabs.Main:Toggle({
    Title = "启用死亡球辅助",
    Description = "开启自动防御功能",
    Default = false,
    Callback = function(state)
        deathBallEnabled = state
        if state then
            WindUI:Notify({
                Title = "死亡球辅助",
                Content = "功能已启用",
                Duration = 3
            })
            spawn(deathBallLoop)
        else
            WindUI:Notify({
                Title = "死亡球辅助",
                Content = "功能已禁用",
                Duration = 3
            })
            if fieldPart then
                fieldPart:Destroy()
                fieldPart = nil
            end
        end
    end
})

Tabs.Main:Toggle({
    Title = "显示力场",
    Description = "显示防护力场可视化",
    Default = true,
    Callback = function(state)
        if fieldPart then
            fieldPart.Transparency = state and 0.5 or 1
        end
    end
})

Tabs.Main:Slider({
    Title = "力场透明度",
    Description = "调整力场可见度",
    Default = 50,
    Minimum = 10,
    Maximum = 90,
    Callback = function(value)
        if fieldPart then
            fieldPart.Transparency = value / 100
        end
    end
})

Tabs.Main:ColorPicker({
    Title = "力场颜色",
    Description = "选择力场显示颜色",
    Default = Color3.fromRGB(88, 131, 202),
    Callback = function(color)
        if fieldPart then
            fieldPart.Color = color
        end
    end
})

Tabs.Main:Slider({
    Title = "检测距离",
    Description = "设置自动防御的触发距离",
    Default = 10,
    Minimum = 5,
    Maximum = 20,
    Callback = function(value)
        WindUI:Notify({
            Title = "设置已更新",
            Content = "检测距离: " .. value,
            Duration = 2
        })
    end
})

-- 设置标签页
Tabs.Settings:Dropdown({
    Title = "防御按键",
    Description = "选择防御使用的按键",
    Default = "F",
    Items = {"F", "E", "Q", "R", "T", "G", "V"},
    Callback = function(selected)
        WindUI:Notify({
            Title = "按键设置",
            Content = "防御按键: " .. selected,
            Duration = 3
        })
    end
})

Tabs.Settings:Button({
    Title = "重新查找球体",
    Description = "手动重新扫描游戏中的球体",
    Callback = function()
        findBall()
        if ball then
            WindUI:Notify({
                Title = "球体查找",
                Content = "已找到球体",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "球体查找",
                Content = "未找到球体",
                Duration = 3
            })
        end
    end
})

Tabs.Settings:Toggle({
    Title = "显示球体信息",
    Description = "显示检测到的球体信息",
    Default = false,
    Callback = function(state)
        WindUI:Notify({
            Title = "球体信息",
            Content = state and "已启用球体信息显示" or "已禁用球体信息显示",
            Duration = 2
        })
    end
})

-- 信息标签页
Tabs.Info:Label({
    Title = "死亡球辅助 v1.0",
    Description = "专为死亡球游戏设计的辅助工具"
})

Tabs.Info:Label({
    Title = "功能说明",
    Description = "自动检测红色球体并在近距离时自动防御"
})

Tabs.Info:Label({
    Title = "使用说明",
    Description = "1. 开启主要功能开关\n2. 调整力场设置\n3. 游戏会自动防御靠近的红色球体"
})

Tabs.Info:Label({
    Title = "注意事项",
    Description = "确保游戏中有名为'Part'的球体对象\n红色高亮表示危险球体"
})

-- 创建水印
local function createWatermark()
    if game.CoreGui:FindFirstChild("DeathBall_Watermark") then
        game.CoreGui.DeathBall_Watermark:Destroy()
    end

    local watermarkGui = Instance.new("ScreenGui")
    watermarkGui.Name = "DeathBall_Watermark"
    watermarkGui.Parent = game.CoreGui
    watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    watermarkGui.ResetOnSpawn = false

    local watermarkText = Instance.new("TextLabel")
    watermarkText.Name = "WatermarkText"
    watermarkText.Parent = watermarkGui
    watermarkText.Text = "WYT死亡球 v1.0" 
    watermarkText.TextColor3 = Color3.fromRGB(255, 100, 100)
    watermarkText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    watermarkText.TextStrokeTransparency = 0.3 
    watermarkText.Font = Enum.Font.GothamBold 
    watermarkText.TextSize = 18
    watermarkText.BackgroundTransparency = 1 
    watermarkText.AnchorPoint = Vector2.new(1, 0) 
    watermarkText.Position = UDim2.new(1, -10, 0, 10) 
    watermarkText.TextXAlignment = Enum.TextXAlignment.Right 
    watermarkText.Size = UDim2.new(0, watermarkText.TextBounds.X + 20, 0, watermarkText.TextBounds.Y + 10)
end

createWatermark()

-- 初始化提示
WindUI:Popup({
    Title = "WYT死亡球",
    Icon = "target",
    Content = "死亡球已加载\n无需密钥，直接使用",
    Buttons = {
        {
            Title = "开始使用",
            Icon = "play",
            Variant = "Primary",
            Callback = function() 
                WindUI:Notify({
                    Title = "欢迎使用",
                    Content = "死亡球辅助已启动，请开启主功能开关",
                    Duration = 5
                })
            end
        }
    }
})

-- 自动查找初始球体
findBall()
if ball then
    print("初始球体已找到")
else
    WindUI:Notify({
        Title = "球体检测",
        Content = "未找到初始球体，等待游戏生成",
        Duration = 5
    })
end