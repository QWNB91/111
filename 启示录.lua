local Players = cloneref(game:GetService("Players"))
local LocalPlayer = cloneref(Players.LocalPlayer)
local UserInputService = cloneref(game:GetService("UserInputService"))
local RunService = cloneref(game:GetService("RunService"))
local speed = 1
local sd = nil
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local Data = {
    TreeCuttingDistance = 50,
    MiningDistance = 50,
    KillAuraDistance = 50,
    AutoTreeCutting = false,
    AutoMining = false,
    KillAura = false,
    AutoCollectFruits = false,
    InfiniteStamina = false,
    NoHungerThirst = false
}

local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Camera = Workspace.CurrentCamera

local activeHighlights = {}
local heartbeatConnection = nil


local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "WQ脚本",
    Icon = "rbxassetid://70930606389113",
    IconThemed = true,
    Author = "by.SU",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(300, 270),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HideSearchBar = true,
    ScrollBarEnabled = true,
    Background = "rbxassetid://96797361260081"
})

Window:Tag({
    Title = "服务器：启示录",
    Color = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#FF0F7B"),  Transparency = 0.7 },
        ["100"] = { Color = Color3.fromHex("#F89B29"), Transparency = 0.5 },
    }, {
        Rotation = 100,
    }),
    Radius = 10,
})

Window:Tag({
    Title = (identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "未知"),
    Color = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#FF0F7B"),  Transparency = 0.7 },
        ["100"] = { Color = Color3.fromHex("#F89B29"), Transparency = 0.5 },
    }, {
        Rotation = 100,
    }),
    Radius = 10,
})

Window:Tag({
    Title = "Beta",
    Color = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#FF0F7B"),  Transparency = 0.7 },
        ["100"] = { Color = Color3.fromHex("#F89B29"), Transparency = 0.5 },
    }, {
        Rotation = 100,
    }),
    Radius = 10,
})


Window:SetToggleKey(Enum.KeyCode.F)

Window:EditOpenButton({
    Title = "SUscript",
    Icon = "rbxassetid://91866950234209",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    OnlyMobile = false,
    Draggable = true,
})

TabSection = Window:Section({Title = "主页", Opened = true})

local Tab = TabSection:Tab({Title = "透视功能", Icon = "check"})
local main = TabSection:Tab({Title = "主要功能", Icon = "check"})


local Section = Tab:Section({Title = "物品透视"})

Tab:Toggle({
    Title = "透视宝箱",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "CommonLoot"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(255, 255, 0)
                                newHighlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视蓝莓灌木",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "BlueberryBush"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(174, 55, 204)
                                newHighlight.OutlineColor = Color3.fromRGB(174, 55, 204)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视石头",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "Stone"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil
        
        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(12, 98, 209)
                                newHighlight.OutlineColor = Color3.fromRGB(12, 98, 209)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视铜矿石",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "CopperOre"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(224, 24, 24)
                                newHighlight.OutlineColor = Color3.fromRGB(224, 24, 24)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视铁矿石",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "IronOre"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(0, 255, 136)
                                newHighlight.OutlineColor = Color3.fromRGB(0, 255, 136)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视马铃薯植物",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "PotatoPlant"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(98, 0, 255)
                                newHighlight.OutlineColor = Color3.fromRGB(98, 0, 255)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视稀有战利品",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "RareLoot"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(0, 183, 255)
                                newHighlight.OutlineColor = Color3.fromRGB(0, 183, 255)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视砂岩",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "Sandstone"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(38, 0, 255)
                                newHighlight.OutlineColor = Color3.fromRGB(38, 0, 255)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视煤",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "Coal"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(0, 204, 255)
                                newHighlight.OutlineColor = Color3.fromRGB(0, 204, 255)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

Tab:Toggle({
    Title = "透视草莓丛",
    Default = false,
    Image = "check",
    Callback = function(state)
        local TARGET_NAME = "StrawberryBush"
        local activeHighlights_Local = {}
        local heartbeatConnection_Local = nil

        if state then
            local function UpdateHighlights()
                for _, highlight in pairs(activeHighlights) do
                    highlight:Destroy()
                end
                activeHighlights = {}

                local spawnedFolder = Workspace:FindFirstChild("Spawned")
                if spawnedFolder then
                    for _, child in ipairs(spawnedFolder:GetChildren()) do
                        if child.Name == TARGET_NAME then
                            if child:IsA("Model") or child:IsA("BasePart") then
                                local newHighlight = Instance.new("Highlight")
                                newHighlight.FillColor = Color3.fromRGB(0, 205, 255)
                                newHighlight.OutlineColor = Color3.fromRGB(0, 205, 255)
                                newHighlight.Adornee = child
                                newHighlight.Parent = Camera
                                table.insert(activeHighlights, newHighlight)
                            end
                        end
                    end
                end
            end

            heartbeatConnection = RunService.Heartbeat:Connect(UpdateHighlights)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end

            for _, highlight in pairs(activeHighlights) do
                highlight:Destroy()
            end
            activeHighlights = {}
        end
    end
})

local Section = main:Section({Title = "杀戮光环"})

main:Slider({
    Title = "杀戮光环范围调整",
    Value = {Min = 16, Max = 200, Default = 50},
    Callback = function(Value)
        Data.KillAuraDistance = Value
    end
})

main:Toggle({
    Title = "杀戮光环",
    Image = "check",
    Value = false,
    Callback = function(state)
        Data.KillAura = state
        spawn(function()
            while Data.KillAura and wait() do
                pcall(function()
                    local closestEnemy, minDistance = nil, math.huge
                    local currentDistance = Data.KillAuraDistance or 50
                    for _,v in next,workspace.Enemies:GetChildren() do
                        if v then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).Magnitude
                            if distance <= currentDistance and distance < minDistance then
                                closestEnemy = v
                                minDistance = distance
                            end
                        end
                    end
                    
                    if closestEnemy then
                        game:GetService("ReplicatedStorage").Network.Items.ToolAction:FireServer("click", closestEnemy)
                    end
                end)
            end
        end)
    end
})

local Section = main:Section({Title = "速度功能"})

main:Slider({
    Title = "速度调整",
    Value = {Min = 1, Max = 500, Default = 16},
    Callback = function(value)
        speed = value
    end
})

main:Toggle({
    Title = "开启速度",
    Value = false,
    Callback = function(v)
        if v then
            sd = RunService.Heartbeat:Connect(function()
                if Character and Humanoid then
                    if Humanoid.MoveDirection.Magnitude > 0 then
                        Character:TranslateBy(Humanoid.MoveDirection * speed / 20)
                    end
                end
            end)
        elseif sd then
            sd:Disconnect()
            sd = nil
        end
    end
})

local Section = main:Section({Title = "自动砍树"})

main:Slider({
    Title = "砍树范围",
    Value = {Min = 16, Max = 200, Default = 50},
    Callback = function(Value)
        Data.TreeCuttingDistance = Value
    end
})

main:Toggle({
    Title = "自动砍树",
    Image = "check",
    Value = false,
    Callback = function(state)
        Data.AutoTreeCutting = state
        spawn(function()
            while Data.AutoTreeCutting and wait() do
                pcall(function()
                    local closestTree, minDistance = nil, math.huge
                    local currentDistance = Data.TreeCuttingDistance or 50
                    for _,v in next,workspace.Spawned:GetChildren() do
                        if v and v.Name:find("Tree") then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).Magnitude
                            if distance <= currentDistance and distance < minDistance then
                                closestTree = v
                                minDistance = distance
                            end
                        end
                    end
                    
                    if closestTree then
                        game:GetService("ReplicatedStorage").Network.Items.ToolAction:FireServer("click", closestTree, false)
                    end
                end)
            end
        end)
    end
})

local Section = main:Section({Title = "自动挖矿"})

main:Slider({
    Title = "挖矿距离",
    Value = {Min = 16, Max = 200, Default = 50},
    Callback = function(Value)
        Data.MiningDistance = Value
    end
})

main:Toggle({
    Title = "自动挖矿",
    Image = "check",
    Value = false,
    Callback = function(state)
        Data.AutoMining = state
        spawn(function()
            while Data.AutoMining and wait() do
                pcall(function()
                    local closestOre, minDistance = nil, math.huge
                    local currentDistance = Data.MiningDistance or 50
                    for _,v in next,workspace.Spawned:GetChildren() do
                        if v and require(v.Config).handlerModule == "Ore" then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).Magnitude
                            if distance <= currentDistance and distance < minDistance then
                                closestOre = v
                                minDistance = distance
                            end
                        end
                    end
                    
                    if closestOre then
                        game:GetService("ReplicatedStorage").Network.Items.ToolAction:FireServer("click", closestOre, false)
                    end
                end)
            end
        end)
    end
})

local Section = main:Section({Title = "无线体力"})

local sbxp = false
main:Toggle({
    Title = "无限体力",
    Default = false,
    Image = "check",
    Callback = function(state)
        sbxp = state
    while sbxp and wait() do
game:GetService("ReplicatedStorage").Network.Character.TakeStamina:FireServer(-math.huge)
end
    end
})

