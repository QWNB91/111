local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/ParKe001/ParKe/refs/heads/main/ui.lua"))()
local b = a:CreateWindow({
    Title = "Q1",
    Icon = "crown",
    IconThemed = false,
    Author = "Q1 / 五月天",
    Folder = "Q1 Script",
    Size = UDim2.fromOffset(500, 390),
    Transparent = false,
    Theme = "Dark",
    User = { Enabled = true },
    SideBarWidth = 240,
    ScrollBarEnabled = true
})

local c = b:Tab({ Title = "主页", })
local d = b:Tab({ Title = "玩家", })
local e = b:Tab({ Title = "脚本", })
local f = b:Tab({ Title = "传送", })
local g = b:Tab({ Title = "设置", })

local h = c:Section({ Title = "公告" })
h:Button({
    Title = "QW脚本中心 v3",
    Desc = "制作人: Q1 / 五月天\nQQ: 3335753204\n更新时间: 2026年",
    Callback = function()
        setclipboard("1078019244")
        a:Notify({
            Title = "成功",
            Content = "QQ群号已复制到剪贴板",
            Icon = "check",
            Duration = 3
        })
    end
})

h:Button({
    Title = "用户信息",
    Desc = "用户: " .. game.Players.LocalPlayer.Name .. "\n账号年龄: " .. game.Players.LocalPlayer.AccountAge .. " 天" .. "\n用户ID: " .. game.Players.LocalPlayer.UserId,
    Callback = function()
        local i = "未知"
        pcall(function()
            i = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        end)
        a:Notify({
            Title = "服务器信息",
            Content = "游戏: " .. i .. "\n游戏ID: " .. game.PlaceId .. "\n服务器ID: " .. game.JobId .. "\n玩家人数: " .. #game.Players:GetPlayers(),
            Duration = 5
        })
    end
})

h:Button({
    Title = "背景音乐",
    Desc = "选择要播放的背景音乐",
    Callback = function()
        local j = b:Dialog({
            Title = "背景音乐播放器",
            Content = "选择要播放的背景音乐",
            Buttons = {
                {
                    Title = "防空警报",
                    Callback = function()
                        local k = Instance.new("Sound")
                        k.SoundId = "rbxassetid://792323017"
                        k.Parent = game.Workspace
                        k:Play()
                        a:Notify({
                            Title = "背景音乐",
                            Content = "正在播放防空警报",
                            Duration = 2
                        })
                    end
                },
                {
                    Title = "义勇军进行曲",
                    Callback = function()
                        local k = Instance.new("Sound")
                        k.SoundId = "rbxassetid://1845918434"
                        k.Parent = game.Workspace
                        k:Play()
                        a:Notify({
                            Title = "背景音乐",
                            Content = "正在播放义勇军进行曲",
                            Duration = 2
                        })
                    end
                },
                {
                    Title = "关闭",
                    Variant = "Secondary",
                    Callback = function() end
                }
            }
        })
    end
})

local l = d:Section({ Title = "移动设置" })
local m = d:Section({ Title = "人机功能" })

local n = 16
local o = false

l:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(p)
        if p then
            local s = game:GetService("UserInputService")
            local t
            t = s.JumpRequest:Connect(function()
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
            getgenv().u = t
        elseif getgenv().u then
            getgenv().u:Disconnect()
            getgenv().u = nil
        end
    end
})

m:Toggle({
    Title = "夜视模式",
    Default = false,
    Callback = function(p)
        if p then
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

m:Toggle({
    Title = "自动互动",
    Default = false,
    Callback = function(p)
        if p then
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

m:Toggle({
    Title = "神秘隐身脚本",
    Default = false,
    Callback = function(p)
        if p then
            loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
        end
    end
})

m:Toggle({
    Title = "一键偷别人东西",
    Default = false,
    Callback = function(p)
        if p then
            for i,v in pairs (game.Players:GetChildren()) do
                wait()
                for i,b in pairs (v.Backpack:GetChildren()) do
                    b.Parent = game.Players.LocalPlayer.Backpack
                end
            end
        end
    end
})

m:Button({
    Title = "神秘黑客脚本",
    Desc = "v6",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v6x/source.lua"))()
    end
})

m:Button({
    Title = "位置坐标",
    Desc = "获取当前位置坐标",
    Callback = function()
        if game.Players.LocalPlayer.Character then
            local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local z = string.format("X: %.2f, Y: %.2f, Z: %.2f", y.X, y.Y, y.Z)
            setclipboard(z)
        end
    end
})

local A = e:Section({ Title = "通用功能" })
local B = e:Section({ Title = "游戏脚本" })

A:Button({
    Title = "IY指令",
    Desc = "加载Infinite Yield脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
    end
})

A:Button({
    Title = "神秘穿墙脚本",
    Desc = "穿墙",
    Callback = function(p1_0)
        local Success_50, Error_Message_50 = pcall(function(...)
            local Players_14 = game.Players
            local LocalPlayer_13 = game.Players.LocalPlayer
            local Character_6 = LocalPlayer_13.Character
            local Children = Character_6:GetChildren()
            for i, v in pairs(Children) do
                local var269 = (i and 14741302) -- 14741302
                local IsA = v.IsA
                local BasePart = v:IsA("BasePart")
                local var270 = (BasePart and 12076731) -- 12076731
                local var271 = (var270 or 13981523)
                local Not_P1_0 = not p1_0
                v.CanCollide = Not_P1_0
            end
        end)
    end
})

A:Button({
    Title = "击杀NPC",
    Desc = "不知道",
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

A:Button({
    Title = "点击传送工具",
    Desc = "点击即可传送",
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

A:Button({
    Title = "lil auto click",
    Desc = "errors",
    Callback = function()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "ToolActivationGui"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

        local draggableFrame = Instance.new("Frame")
        draggableFrame.Name = "DraggableFrame"
        draggableFrame.Size = UDim2.new(0, 150, 0, 40)
        draggableFrame.Position = UDim2.new(0.5, -75, 0.5, -20)
        draggableFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        draggableFrame.BorderSizePixel = 0
        draggableFrame.Parent = screenGui

        local title = Instance.new("TextLabel")
        title.Text = "Tool Activation"
        title.Size = UDim2.new(1, 0, 0, 20)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 14
        title.Parent = draggableFrame

        local continuousButton = Instance.new("TextButton")
        continuousButton.Text = "Continuous Activation"
        continuousButton.Size = UDim2.new(0.5, 0, 0.5, 0)
        continuousButton.Position = UDim2.new(0, 0, 0.5, 0)
        continuousButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        continuousButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        continuousButton.Font = Enum.Font.SourceSansBold
        continuousButton.TextSize = 12
        continuousButton.Parent = draggableFrame

        local equipButton = Instance.new("TextButton")
        equipButton.Text = "Equip Next Tool"
        equipButton.Size = UDim2.new(0.5, 0, 0.5, 0)
        equipButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        equipButton.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
        equipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        equipButton.Font = Enum.Font.SourceSansBold
        equipButton.TextSize = 12
        equipButton.Parent = draggableFrame

        local isActivating = false

        local function activateAllTools()
            local character = game.Players.LocalPlayer.Character
            if not character then return end

            local tools = character:GetChildren()
            for _, tool in ipairs(tools) do
                if tool:IsA("Tool") then
                    tool:Activate()
                end
            end
        end

        local function startActivation()
            isActivating = true
            while isActivating do
                activateAllTools()
                wait(0.1)
            end
        end

        continuousButton.MouseButton1Click:Connect(function()
            if isActivating then
                isActivating = false
                continuousButton.Text = "Continuous Activation"
            else
                isActivating = true
                task.spawn(startActivation)
                continuousButton.Text = "Stop Activation"
            end
        end)

        local lastEquippedToolIndex = 0
        local function equipNextTool()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
            local tools = backpack:GetChildren()

            for i = 1, #tools do
                local tool = tools[i]
                if tool:IsA("Tool") and tool.Parent == backpack then
                    if i > lastEquippedToolIndex then
                        tool.Parent = player.Character
                        lastEquippedToolIndex = i
                        return
                    end
                end
            end

            lastEquippedToolIndex = 0
        end

        equipButton.MouseButton1Click:Connect(function()
            equipNextTool()
        end)

        local dragging = false
        local dragInput, mousePos, framePos

        title.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                mousePos = input.Position
                framePos = draggableFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - mousePos
                draggableFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            end
        end)
    end
})

A:Button({
    Title = "绕过管理员检测",
    Desc = "null",
    Callback = function()
        local var198 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua"))
        var198()
    end
})

A:Button({
    Title = "防止傻逼小学生甩飞",
    Desc = "null",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/protezzx/Player-joined-left/refs/heads/main/Antifling%20script", true))()
        end)
    end
})

A:Button({
    Title = "Kenny甩飞",
    Desc = "null",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/DHJB%E7%94%A9%E9%A3%9E.txt"))()
    end
})

A:Button({
    Title = "自瞄NPC",
    Desc = "null",
    Callback = function()
        --[[
        WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
        ]]
        -- made by yee_kunkun(my roblox user name haha)
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

A:Button({
    Title = "外部房间发言",
    Desc = "需要和朋友商量房间号",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://latlat.lat/script/raw/Chat"))()
        end)
    end
})

A:Button({
    Title = "DM飞行脚本",
    Desc = "旧冬",
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

A:Button({
    Title = "飞行脚本",
    Desc = "加载飞行脚本",
    Callback = function()
        pcall(function()
            loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\104\97\114\107\105\110\100\101\118\101\108\111\112\101\114\47\98\57\97\98\49\55\51\56\53\97\48\48\50\49\48\49\51\57\53\49\50\52\100\53\49\49\98\49\56\102\56\55\53\52\102\55\49\55\50\55\51\47\114\97\119\47\55\50\99\51\56\54\101\100\101\54\52\102\100\54\48\50\99\52\52\98\48\51\98\48\57\51\102\55\50\56\99\50\100\48\53\49\54\52\98\49\55\55\49\55\48\51\47\102\108\121\46\108\117\97\39\41\41\41\40\41")()
        end)
    end
})

A:Button({
    Title = "回溯脚本",
    Desc = "unknown",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MSTTOPPER/Scripts/refs/heads/main/FlashBack"))()
        end)
    end
})

A:Button({
    Title = "无头加断腿",
    Desc = "可以装牛逼",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()
    end
})

A:Button({
    Title = "增加FPS",
    Desc = "测试可以用",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/hun/ee906e570c0f5b22e580a20decaba23757533569/fps"))()
    end
})

A:Button({
    Title = "透视NPC功能",
    Desc = "null",
    Callback = function(Value)
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        
        if Value then
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
            
        else
            if getgenv().NPCESP then
                if getgenv().NPCESP.ScanConnection then
                    getgenv().NPCESP.ScanConnection:Disconnect()
                end
                if getgenv().NPCESP.DescendantConnection then
                    getgenv().NPCESP.DescendantConnection:Disconnect()
                end
                
                for npc, espData in pairs(getgenv().NPCESP.Table) do
                    RemoveNPCESP(npc)
                end
                
                getgenv().NPCESP = nil
            end
            
            for _, descendant in pairs(Workspace:GetDescendants()) do
                if descendant:IsA("Model") then
                    for _, child in ipairs(descendant:GetDescendants()) do
                        if child:IsA("BillboardGui") and string.find(child.Name, "NPCESP_") then
                            child:Destroy()
                        end
                        if child:IsA("Highlight") and child.Name == "NPCESP_Highlight" then
                            child:Destroy()
                        end
                    end
                end
            end
        end
    end
})

A:Button({
    Title = "傻逼功能",
    Desc = "我不知道",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ShutUpJamesTheLoserAlt/hatspin/refs/heads/main/hat"))()
    end
})

A:Button({
    Title = "西格玛spy",
    Desc = "null",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"))()
    end
})

B:Button({
    Title = "俄亥俄州功能",
    Desc = "子追",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
        end)
    end
})

B:Button({
    Title = "doors脚本",
    Desc = "加载doors游戏脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SxnwDev/Pixelate/main/Doors.lua"))()
        end)
    end
})

B:Button({
    Title = "最强战场",
    Desc = "勺子汉化",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/shaozi886/xy/refs/heads/main/xy"))()
        end)
    end
})

B:Button({
    Title = "死铁轨",
    Desc = "功能不知道自己测",
    Callback = function()
        pcall(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEventStart = ReplicatedStorage.Shared.Network.RemoteEvent.RequestStartDrag
            local RemoteEventStop = ReplicatedStorage.Shared.Network.RemoteEvent.RequestStopDrag
            local Players = game:GetService("Players")
            local UserInputService = game:GetService("UserInputService")
            local LocalPlayer = Players.LocalPlayer
            local processedModels = {}
            local activeDrags = {}
            local draggingEnabled = false

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "ButtonGui"
            screenGui.Parent = LocalPlayer.PlayerGui

            local dragButton = Instance.new("TextButton")
            dragButton.Name = "DragButton"
            dragButton.Text = "OFF"
            dragButton.Size = UDim2.new(0, 160, 0, 50)
            dragButton.Position = UDim2.new(0.5, -80, 0.5, -25)
            dragButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
            dragButton.BorderSizePixel = 0
            dragButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            dragButton.Font = Enum.Font.GothamBold
            dragButton.TextSize = 20
            dragButton.Parent = screenGui

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 10)
            buttonCorner.Parent = dragButton

            local buttonShadow = Instance.new("UIStroke")
            buttonShadow.Thickness = 2
            buttonShadow.Color = Color3.fromRGB(0, 0, 0)
            buttonShadow.Transparency = 0.5
            buttonShadow.Parent = dragButton

            local dragging
            local dragInput
            local dragStart
            local startPos

            local function updateInput(input)
                local delta = input.Position - dragStart
                dragButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end

            dragButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    startPos = dragButton.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)

            dragButton.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    dragInput = input
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    updateInput(input)
                end
            end)

            dragButton.MouseEnter:Connect(function()
                dragButton.BackgroundColor3 = Color3.fromRGB(80, 80, 140)
                dragButton.TextSize = 22
            end)

            dragButton.MouseLeave:Connect(function()
                dragButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100)
                dragButton.TextSize = 20
            end)

            local function applyHighlight(model, isEgg)
                local highlight = model:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", model)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.FillColor = isEgg and Color3.fromRGB(128, 0, 128) or Color3.fromRGB(0, 255, 0)
                if isEgg and model.PrimaryPart then
                    local billboard = model.PrimaryPart:FindFirstChild("EggNameBillboard") or Instance.new("BillboardGui")
                    billboard.Name = "EggNameBillboard"
                    billboard.AlwaysOnTop = true
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    local textLabel = billboard:FindFirstChildOfClass("TextLabel") or Instance.new("TextLabel", billboard)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.Text = model.Name
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.TextScaled = true
                    billboard.Parent = model.PrimaryPart
                end
            end

            local function checkAndGrabEgg(model)
                if not draggingEnabled or not model:IsA("Model") or not model.Name:lower():find("egg") or not model.PrimaryPart or processedModels[model] then
                    return
                end
                local character = LocalPlayer.Character
                if not character or not character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                local distance = (character.HumanoidRootPart.Position - model.PrimaryPart.Position).Magnitude
                if distance <= 25 then
                    processedModels[model] = true
                    activeDrags[model] = tick()
                    RemoteEventStart:FireServer(model)
                    applyHighlight(model, true)
                end
            end

            dragButton.MouseButton1Click:Connect(function()
                draggingEnabled = not draggingEnabled
                dragButton.Text = draggingEnabled and "ON" or "OFF"
                if draggingEnabled then
                    for _, model in ipairs(workspace.RuntimeItems:GetChildren()) do
                        if model:IsA("Model") then
                            applyHighlight(model, model.Name:lower():find("egg") ~= nil)
                            checkAndGrabEgg(model)
                        end
                    end
                else
                    for model in pairs(activeDrags) do
                        if model.Parent then
                            RemoteEventStop:FireServer()
                        end
                    end
                    activeDrags = {}
                    processedModels = {}
                end
            end)

            workspace.RuntimeItems.ChildAdded:Connect(function(model)
                checkAndGrabEgg(model)
            end)

            spawn(function()
                while true do
                    wait(1)
                    local currentTime = tick()
                    for model, startTime in pairs(activeDrags) do
                        if currentTime - startTime > 100 and model.Parent then
                            RemoteEventStop:FireServer()
                            activeDrags[model] = nil
                        end
                    end
                end
            end)
        end)
    end
})

B:Button({
    Title = "最强战场91",
    Desc = "与防反有关",
    Callback = function()
        pcall(function()
            local players = game:GetService("Players")
            local runservice = game:GetService("RunService")
            local virtualinputmanager = game:GetService("VirtualInputManager")
            local tweenservice = game:GetService("TweenService")

            local localplayer = players.LocalPlayer

            local screengui = Instance.new("ScreenGui")
            screengui.Name = "autocounter"
            screengui.ResetOnSpawn = false
            screengui.Parent = localplayer:WaitForChild("PlayerGui")

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(0, 150, 0, 75)
            frame.Position = UDim2.new(0.5, -75, 0.5, -37.5)
            frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            frame.BackgroundTransparency = 0.5
            frame.Parent = screengui

            local uicorner = Instance.new("UICorner")
            uicorner.CornerRadius = UDim.new(0, 10)
            uicorner.Parent = frame

            local shadow = Instance.new("ImageLabel")
            shadow.Size = UDim2.new(1, 20, 1, 20)
            shadow.Position = UDim2.new(-0.1, 0, -0.1, 0)
            shadow.Image = "rbxassetid://10590477450"
            shadow.BackgroundTransparency = 1
            shadow.Parent = frame

            local button = Instance.new("ImageButton")
            button.Size = UDim2.new(0, 75, 0, 37.5)
            button.Position = UDim2.new(0.5, -37.5, 0.5, -18.75)
            button.Image = "rbxassetid://10590477450"
            button.BackgroundTransparency = 1
            button.Parent = frame

            local textlabel = Instance.new("TextLabel")
            textlabel.Size = UDim2.new(1, 0, 1, 0)
            textlabel.Position = UDim2.new(0, 0, 0, 0)
            textlabel.Text = "OFF"
            textlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textlabel.Font = Enum.Font.SourceSansBold
            textlabel.TextSize = 18
            textlabel.BackgroundTransparency = 1
            textlabel.Parent = button

            local buttonuicorner = Instance.new("UICorner")
            buttonuicorner.CornerRadius = UDim.new(0, 10)
            buttonuicorner.Parent = button

            local buttonuistroke = Instance.new("UIStroke")
            buttonuistroke.Thickness = 2
            buttonuistroke.Parent = button

            local rainbowcolors = {
                Color3.fromRGB(255, 0, 0),
                Color3.fromRGB(255, 165, 0),
                Color3.fromRGB(255, 255, 0),
                Color3.fromRGB(0, 128, 0),
                Color3.fromRGB(0, 0, 255),
                Color3.fromRGB(128, 0, 128)
            }

            local function rainbowanimation()
                local colorindex = 1
                while true do
                    buttonuistroke.Color = rainbowcolors[colorindex]
                    colorindex = (colorindex % #rainbowcolors) + 1
                    wait(0.1)
                end
            end

            spawn(rainbowanimation)

            local function onbuttonclick()
                local info = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                local goal = {Size = UDim2.new(0, 70, 0, 32.5)}
                tweenservice:Create(button, info, goal):Play()
                wait(0.1)
                goal = {Size = UDim2.new(0, 75, 0, 37.5)}
                tweenservice:Create(button, info, goal):Play()
            end

            local ison = false
            button.MouseButton1Click:Connect(function()
                ison = not ison
                textlabel.Text = ison and "ON" or "OFF"
                onbuttonclick()
            end)

            local dragging, dragstart, startpos
            frame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragstart = input.Position
                    startpos = frame.Position
                end
            end)

            frame.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local delta = input.Position - dragstart
                    frame.Position = UDim2.new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)
                end
            end)

            frame.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)

            local targetids = {
                [14046756619] = true,
                [13309500827] = true,
                [13376962659] = true,
                [15290930205] = true,
                [13630786846] = true,
                [16597912086] = true,
                [10468665991] = true
            }
            local sixmeterids = {
                [10466974800] = true,
                [17799224866] = true,
                [12534735382] = true,
                [10470104242] = true
            }
            local sevenpointfivemeterids = {
                [15295895753] = true
            }
            local fifteenmeterids = {
                [16597912086] = true,
                [16431491215] = true
            }
            local specialid = 16139108718
            local timecheckids = {
                [12272894215] = true,
                [12296882427] = true
            }
            local delayids = {
                [12509505723] = true,
                [17857788598] = true,
                [14299135500] = true,
                [14351441234] = true
            }
            local delayidranges = {
                [12509505723] = 36,
                [17857788598] = 36,
                [14299135500] = 9,
                [14351441234] = 10
            }

            local function activateanddeactivatetool()
                local backpack = localplayer:FindFirstChild("Backpack")
                if not backpack then return end
                local tool = backpack:FindFirstChild("Prey's Peril") or backpack:FindFirstChild("Split Second Counter")
                if tool and tool:IsA("Tool") then
                    tool.Parent = localplayer.Character
                    tool.Parent = backpack
                end
            end

            local function singlekeypress(key)
                virtualinputmanager:SendKeyEvent(true, key, false, nil)
                virtualinputmanager:SendKeyEvent(false, key, false, nil)
                virtualinputmanager:SendKeyEvent(true, key, false, nil)
                virtualinputmanager:SendKeyEvent(false, key, false, nil)
            end

            local function getcurrentanimationids(player)
                local character = player.Character
                if not character then return {} end
                local humanoid = character:FindFirstChild("Humanoid")
                if not humanoid then return {} end
                local animator = humanoid:FindFirstChild("Animator")
                if not animator then return {} end
                local animdata = {}
                for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                    if track.IsPlaying then
                        local animid = tonumber(track.Animation.AnimationId:match("%d+$"))
                        if animid then
                            animdata[animid] = track.TimePosition
                        end
                    end
                end
                return animdata
            end

            local function checkplayers()
                if not ison then return end
                local localcharacter = localplayer.Character
                if not localcharacter or not localcharacter.PrimaryPart then return end
                local localposition = localcharacter.PrimaryPart.Position
                for _, player in pairs(players:GetPlayers()) do
                    if player ~= localplayer then
                        local character = player.Character
                        if character and character.PrimaryPart then
                            local distance = (character.PrimaryPart.Position - localposition).Magnitude
                            if distance <= 36 then
                                local currentanimdata = getcurrentanimationids(player)
                                for animid, timeposition in pairs(currentanimdata) do
                                    if animid == 15295895753 then
                                        task.delay(0.5, activateanddeactivatetool)
                                    elseif animid == 14351441234 then
                                        if timeposition < 0.45 and distance <= delayidranges[animid] then
                                            activateanddeactivatetool()
                                        end
                                    elseif timecheckids[animid] then
                                        if timeposition < 0.15 and distance <= 10 then
                                            activateanddeactivatetool()
                                        end
                                    elseif delayids[animid] then
                                        local range = delayidranges[animid]
                                        if range and distance <= range then
                                            task.delay(0.15, activateanddeactivatetool)
                                        end
                                    else
                                        if fifteenmeterids[animid] and distance <= 15 then
                                            activateanddeactivatetool()
                                        elseif sevenpointfivemeterids[animid] and distance <= 10 then
                                            activateanddeactivatetool()
                                        elseif sixmeterids[animid] and distance <= 9 then
                                            activateanddeactivatetool()
                                        elseif distance <= 36 then
                                            if animid == specialid then
                                                singlekeypress(Enum.KeyCode.F)
                                            elseif targetids[animid] then
                                                activateanddeactivatetool()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            runservice.RenderStepped:Connect(checkplayers)
        end)
    end
})

B:Button({
    Title = "最强战场error404",
    Desc = "垃圾桶脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man",true))()
        end)
    end
})

B:Button({
    Title = "俄亥俄州",
    Desc = "有可能会多缝几个",
    Callback = function()
        pcall(function()
            local ItemFarm
            local ItemFarmFunc
            local AutoRobBank
            local AutoRobBankFunc

            local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
            local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

            wait(1)
            Notification:Notify(
                {Title = "俄亥俄州脚本", Description = "正在加载"},
                {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
                {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)}
            )
            wait(2)
            Notification:Notify(
                {Title = "俄亥俄州", Description = "准备好了！"},
                {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
                {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)}
            )
            wait(0.2)
            Notification:Notify(
                {Title = "缝合", Description = "秋晚by"},
                {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "image"},
                {Image = "http://www.roblox.com/asset/?id=4483345998", ImageColor = Color3.fromRGB(255, 84, 84)}
            )
            wait(0.4)

            local ScreenGui = Instance.new("ScreenGui")
            local Frame = Instance.new("Frame")
            local TextButton = Instance.new("TextButton")
            local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
            local UICorner = Instance.new("UICorner")

            ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ScreenGui.ResetOnSpawn = false

            Frame.Parent = ScreenGui
            Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            Frame.BackgroundTransparency = 0.500
            Frame.Position = UDim2.new(0.858712733, 0, 0.0237762257, 0)
            Frame.Size = UDim2.new(0.129513338, 0, 0.227972031, 0)

            TextButton.Parent = Frame
            TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.BackgroundTransparency = 1.000
            TextButton.Size = UDim2.new(1, 0, 1, 0)
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = "关闭"
            TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.TextScaled = true
            TextButton.TextSize = 50.000
            TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextStrokeTransparency = 0.000
            TextButton.TextWrapped = true
            TextButton.MouseButton1Down:Connect(function()
                if TextButton.Text == "关闭" then
                    TextButton.Text = "打开"
                else
                    TextButton.Text = "关闭"
                end
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E" , false , game)
            end)

            UITextSizeConstraint.Parent = TextButton
            UITextSizeConstraint.MaxTextSize = 30

            local lib = loadstring(game:HttpGet"https://pastebin.com/raw/aDQ86WZA")()

            local win = lib:Window("俄亥俄州",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E)

            local tab = win:Tab("主要")

            tab:Toggle("收集物品现金", false, function(v)
                ItemFarm = v
                if ItemFarm then
                    pcall(function()
                        ItemFarmFunc()
                    end)
                end
            end)

            function GetItems()
                local cache = {}
                for i,v in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
                    table.insert(cache,v)
                end
                for i,v in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                    table.insert(cache,v)
                end
                return cache
            end

            function Collect(item)
                if item:FindFirstChildOfClass("ClickDetector") then
                    fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
                elseif item:FindFirstChildOfClass("Part") then
                    local maincrap = item:FindFirstChildOfClass("Part")
                    fireclickdetector(maincrap:FindFirstChildOfClass("ClickDetector"))
                end
            end

            ItemFarmFunc = function()
                while ItemFarm and task.wait() do
                    local allitems = GetItems()
                    for i,v in pairs(allitems) do
                        if ItemFarm == false then break end
                        pcall(function()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame
                            task.wait(0.5)
                            Collect(v)
                            task.wait(0.5)
                        end)
                    end
                end
            end

            tab:Toggle("自动抢银行", false, function(v)
                AutoRobBank = v
                if AutoRobBank then
                    pcall(function()
                        AutoRobBankFunc()
                    end)
                end
            end)

            AutoRobBankFunc = function()
                while AutoRobBank and task.wait() do
                    local bankthing = game:GetService("Workspace").BankRobbery.BankCash
                    if #bankthing.Cash:GetChildren() > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = bankthing.Main.CFrame
                        task.wait()
                        fireproximityprompt(game:GetService("Workspace").BankRobbery.BankCash.Main.Attachment.ProximityPrompt)
                    end
                end
            end
        end)
    end
})

B:Button({
    Title = "后车厅",
    Desc = "有点牛逼",
    Callback = function()
        pcall(function()
            local OpenUI = Instance.new("ScreenGui")
            local ImageButton = Instance.new("ImageButton")
            local UICorner = Instance.new("UICorner")
            OpenUI.Name = "OpenUI"
            OpenUI.Parent = game.CoreGui
            OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ImageButton.Parent = OpenUI
            ImageButton.BackgroundColor3 = Color3.fromRGB(5, 6, 7)
            ImageButton.BackgroundTransparency = 0.500
            ImageButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0)
            ImageButton.Size = UDim2.new(0, 50, 0, 50)
            ImageButton.Image = "rbxassetid://15613380753"
            ImageButton.Draggable = true
            UICorner.CornerRadius = UDim.new(0, 200)
            UICorner.Parent = ImageButton
            local uihide = false
            
            ImageButton.MouseButton1Click:Connect(function()
                if uihide == false then
                    uihide = true
                    if game.CoreGui:FindFirstChild("ui") then
                        game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
                    end
                else
                    uihide = false
                    if game.CoreGui:FindFirstChild("ui") then
                        game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
                    end
                end
            end)

            local lib = loadstring(game:HttpGet"https://pastebin.com/raw/aDQ86WZA")()

            local win = lib:Window("铲雪模拟器",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E)

            local tab = win:Tab("主要")

            tab:Toggle("自动收集雪", false, function(Value)
                local toggle = Value
                while toggle do wait()
                    local args = {
                        [1] = workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
                        [2] = "Snow1",
                        [3] = "MagicWand"
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(args))
                end
            end)
        end)
    end
})

B:Button({
    Title = "99夜老外脚本",
    Desc = "老外脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
        end)
    end
})

B:Button({
    Title = "彩虹朋友",
    Desc = "还行的",
    Callback = function()
        pcall(function()
            local OpenUI = Instance.new("ScreenGui")
            local ImageButton = Instance.new("ImageButton")
            local UICorner = Instance.new("UICorner")
            OpenUI.Name = "OpenUI"
            OpenUI.Parent = game.CoreGui
            OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ImageButton.Parent = OpenUI
            ImageButton.BackgroundColor3 = Color3.fromRGB(5, 6, 7)
            ImageButton.BackgroundTransparency = 0.500
            ImageButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0)
            ImageButton.Size = UDim2.new(0, 50, 0, 50)
            ImageButton.Image = "rbxassetid://15613380753"
            ImageButton.Draggable = true
            UICorner.CornerRadius = UDim.new(0, 200)
            UICorner.Parent = ImageButton
            local uihide = false
            
            ImageButton.MouseButton1Click:Connect(function()
                if uihide == false then
                    uihide = true
                    if game.CoreGui:FindFirstChild("ui") then
                        game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
                    end
                else
                    uihide = false
                    if game.CoreGui:FindFirstChild("ui") then
                        game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
                    end
                end
            end)

            local lib = loadstring(game:HttpGet"https://pastebin.com/raw/aDQ86WZA")()

            local win = lib:Window("彩虹朋友",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E)

            local tab = win:Tab("主要")

            tab:Button("自动收集", function()
                local attempts = 0
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("TouchTrigger") and attempts < 10 then
                        attempts = attempts + 1
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.TouchTrigger,0)
                    end
                end
            end)

            tab:Button("自动放置", function()
                local trigger = game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true)
                if trigger then
                    firetouchinterest(trigger, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                    task.wait()
                    firetouchinterest(trigger, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                end
            end)

            tab:Toggle("怪物透视", false, function(bool)
                if bool then
                    local runService = game:GetService("RunService")
                    local event = runService.RenderStepped:Connect(function()
                        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                            if not v:FindFirstChild("Lol") then
                                local esp = Instance.new("Highlight", v)
                                esp.Name = "Lol"
                                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                esp.FillColor = Color3.new(0, 0, 255)
                            end
                        end
                    end)
                    getgenv().MonsterESP = event
                else
                    if getgenv().MonsterESP then
                        getgenv().MonsterESP:Disconnect()
                    end
                    for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                        local lol = v:FindFirstChild("Lol")
                        if lol then
                            lol:Destroy()
                        end
                    end
                end
            end)

            tab:Toggle("物品透视", false, function(bool)
                if bool then
                    local runService = game:GetService("RunService")
                    local event = runService.RenderStepped:Connect(function()
                        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                            if v:FindFirstChild("TouchTrigger") then
                                if not v:FindFirstChild("Lol") then
                                    local esp = Instance.new("Highlight", v)
                                    esp.Name = "Lol"
                                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    esp.FillColor = Color3.new(0, 255, 0)
                                end
                            end
                        end
                    end)
                    getgenv().ItemESP = event
                else
                    if getgenv().ItemESP then
                        getgenv().ItemESP:Disconnect()
                    end
                    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:FindFirstChild("TouchTrigger") then
                            local lol = v:FindFirstChild("Lol")
                            if lol then
                                lol:Destroy()
                            end
                        end
                    end
                end
            end)
        end)
    end
})

B:Button({
    Title = "画我脚本",
    Desc = "可以放照片使用MT管理器",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/KENNY画我.lua"))()
        end)
    end
})

B:Button({
    Title = "Slap Battle",
    Desc = "Slap Battle-全勋章",
    Callback = function()
        pcall(function()
            local function NetworkFunc(Name)
                for i,v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
                    if v:IsA("RemoteEvent") then
                        v:FireServer(Name)
                    end
                end
            end

            local GaypassGloves = {"OVERKILL", "CUSTOM", "Spectator", "Titan", "Ultra Instinct", "Acrobat"}
            for i,v in pairs(game:GetService("Workspace").Lobby:GetChildren()) do
                pcall(function()
                    if v.CFrame.Z < -18 and not table.find(GaypassGloves, v.Name) then
                        NetworkFunc(v.Name)
                    end
                end)
            end
            NetworkFunc("potato")
        end)
    end
})

B:Button({
    Title = "战斗勇士",
    Desc = "修改为300体力",
    Callback = function()
        pcall(function()
            local player = game.Players.LocalPlayer
            local RunService = game:GetService("RunService")
            local UserInputService = game:GetService("UserInputService")

            local TARGET = 300
            local enabled = true
            local staminaCache = {}

            for i, v in pairs(getgc(true)) do
                if typeof(v) == "table" then
                    if rawget(v, "_stamina") and rawget(v, "_baseMaxStamina") and rawget(v, "_maxStamina") then
                        local originalStamina = v._stamina
                        local originalBase = v._baseMaxStamina
                        local originalMax = v._maxStamina
                        v._stamina = TARGET
                        v._baseMaxStamina = TARGET
                        v._maxStamina = TARGET
                        if rawget(v, "setStamina") then
                            local old = v.setStamina
                            v.setStamina = function(self, value)
                                return old(self, TARGET)
                            end
                        end
                        if rawget(v, "getStamina") then
                            v.getStamina = function(self)
                                return TARGET
                            end
                        end
                        if rawget(v, "enableDrain") then
                            v.enableDrain = function()
                                return function() end
                            end
                        end
                        table.insert(staminaCache, {
                            obj = v,
                            original = {
                                stamina = originalStamina,
                                baseMax = originalBase,
                                max = originalMax
                            }
                        })
                    end
                end
            end

            local frameCount = 0
            local FRAME_SKIP = 30

            RunService.Heartbeat:Connect(function()
                if not enabled then return end
                frameCount = frameCount + 1
                if frameCount >= FRAME_SKIP then
                    frameCount = 0
                    for _, cache in pairs(staminaCache) do
                        local v = cache.obj
                        if typeof(v) == "table" and rawget(v, "_stamina") then
                            if v._stamina ~= TARGET then
                                v._stamina = TARGET
                                v._baseMaxStamina = TARGET
                                v._maxStamina = TARGET
                            end
                        end
                    end
                end
            end)

            local function selfDestruct()
                enabled = false
                local restored = 0
                for _, cache in pairs(staminaCache) do
                    local v = cache.obj
                    if typeof(v) == "table" and rawget(v, "_stamina") then
                        v._stamina = cache.original.stamina
                        v._baseMaxStamina = cache.original.baseMax
                        v._maxStamina = cache.original.max
                        restored = restored + 1
                    end
                end
                staminaCache = {}
                script:Destroy()
            end

            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.KeyCode == Enum.KeyCode.K then
                    selfDestruct()
                end
            end)
        end)
    end
})

A:Button({
    Title = "ESP透视",
    Desc = "启用玩家ESP透视",
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
    end
})

B:Button({
    Title = "GB防反作弊",
    Desc = "先点这个不然会封号",
    Callback = function()
        pcall(function()
            local character = script.Parent
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:WaitForChild("Humanoid")
            local originalPosition = humanoidRootPart.Position

            game:GetService("RunService").Stepped:Connect(function()
                if humanoidRootPart.AssemblyLinearVelocity.Magnitude > 100 then
                    humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    humanoidRootPart.CFrame = CFrame.new(originalPosition) * humanoidRootPart.CFrame.Rotation
                else
                    originalPosition = humanoidRootPart.Position
                end
            end)

            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {
                workspace:WaitForChild("Players"),
                workspace:FindFirstChild("IgnoreParts"),
                workspace:WaitForChild("Zombies")
            }
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
            raycastParams.IgnoreWater = true

            local lastPlatformCFrame = nil

            game:GetService("RunService").Heartbeat:Connect(function()
                local raycastResult = workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -10, 0), raycastParams)
                if raycastResult and raycastResult.Instance.Parent and raycastResult.Instance.Parent:HasTag("MovingPlatform") then
                    local platform = raycastResult.Instance.Parent
                    if platform.PrimaryPart then
                        local currentPlatformCFrame = platform.PrimaryPart.CFrame
                        if lastPlatformCFrame == nil then
                            lastPlatformCFrame = currentPlatformCFrame
                        end
                        local platformMovement = currentPlatformCFrame * lastPlatformCFrame:Inverse()
                        lastPlatformCFrame = currentPlatformCFrame
                        if not character:HasTag("OnCannon") then
                            humanoidRootPart.CFrame = platformMovement * humanoidRootPart.CFrame
                        end
                    else
                        lastPlatformCFrame = nil
                        return
                    end
                else
                    lastPlatformCFrame = nil
                    return
                end
            end)
        end)
    end
})

B:Button({
    Title = "GB爆头",
    Desc = "牛逼的",
    Callback = function()
        pcall(function()
            local hookEnabled = false
            local oldNamecall
            local hookButton

            local function enableHook()
                if oldNamecall then return end
                local mt = getrawmetatable(game)
                setreadonly(mt, false)
                oldNamecall = mt.__namecall
                mt.__namecall = newcclosure(function(self, ...)
                    local args = {...}
                    local method = getnamecallmethod()
                    if hookEnabled and method == "FireServer" and tostring(self) == "RemoteEvent" then
                        if args[1] == "HitZombie" then
                            args[4] = true
                            args[6] = "Head"
                        end
                    end
                    return oldNamecall(self, unpack(args))
                end)
            end

            local function disableHook()
                hookEnabled = false
            end

            local gui = Instance.new("ScreenGui")
            gui.Name = "gui"
            gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 150, 0, 40)
            Button.Position = UDim2.new(0.7, 0, 0.2, 0)
            Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.Font = Enum.Font.SourceSansBold
            Button.TextSize = 18
            Button.Text = "刀刀爆头"
            Button.Draggable = true
            Button.Parent = gui

            Button.MouseButton1Click:Connect(function()
                hookEnabled = not hookEnabled
                if hookEnabled then
                    Button.Text = "刀刀爆头"
                    Button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
                    enableHook()
                else
                    Button.Text = "刀刀爆头"
                    Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    disableHook()
                end
            end)
        end)
    end
})

B:Button({
    Title = "GB飞行无回拉",
    Desc = "艾斯比柳叶制作",
    Callback = function()
        local success, result = pcall(function()
            local code = game:HttpGet("https://raw.githubusercontent.com/wzhxll/GB-/refs/heads/main/README.md")            
            local loadedFunction = loadstring(code)
            if loadedFunction then
                loadedFunction()
            else
                warn("加载脚本失败：无效的Lua代码")
            end
        end)
        
        if not success then
            warn("执行脚本时出错:", result)
        end
    end
})

A:Button({
    Title = "双环黑洞",
    Desc = "黑洞",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%8F%8C%E7%8E%AF%E6%8E%A7%E5%88%B6%E9%BB%91%E6%B4%9E.txt"))()
        end)
    end
})

A:Button({
    Title = "哥特风黑洞",
    Desc = "神秘",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%93%A5%E7%89%B9%E9%A3%8E%E9%BB%91%E6%B4%9E.txt"))()
        end)
    end
})

A:Button({
    Title = "旋转脚本",
    Desc = "eeeg",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end
})

A:Button({
    Title = "ragebot",
    Desc = "愤怒机器人",
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
                            if plr.Team == LocalPlayer.Team then continue end
                            local head = char.Head
                            local dist = (head.Position - myPos).Magnitude
                            if dist < minDist then
                                minDist = dist
                                nearest = head
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

A:Button({
    Title = "德与中山",
    Desc = "非常有实力的脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/Deyu-Zhongshan/refs/heads/main/%E5%BE%B7%E4%B8%8E%E4%B8%AD%E5%B1%B1.txt"))()
        end)
    end
})

local J = f:Section({ Title = "热门游戏" })
local K = f:Section({ Title = "位置传送" })

local L = {
    {"极速传奇", 3101667897},
    {"鲨口求生2", 8908228901},
    {"忍者传奇", 3956818381},
    {"监狱人生", 155615604}
}

for M, N in ipairs(L) do
    J:Button({
        Title = N[1],
        Desc = "点击传送到游戏",
        Callback = function()
            task.wait(1)
            game:GetService("TeleportService"):Teleport(N[2])
        end
    })
end

K:Button({
    Title = "传送到出生点",
    Desc = "传送回出生位置",
    Callback = function()
        if game.Players.LocalPlayer.Character then
            local O = workspace:FindFirstChild("SpawnLocation") or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if O then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = O.CFrame
            end
        end
    end
})

local P = g:Section({ Title = "界面设置" })
local Q = g:Section({ Title = "信息" })

P:Toggle({
    Title = "反挂机系统",
    Desc = "防止被踢出游戏",
    Default = false,
    Callback = function(p)
        if p then
            local R = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                R:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                R:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})

local S
P:Toggle({
    Title = "显示FPS",
    Desc = "在屏幕上显示FPS",
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

P:Button({
    Title = "重新加入服务器",
    Desc = "重新加入当前服务器",
    Callback = function()
        task.wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})

P:Button({
    Title = "关闭界面",
    Desc = "关闭脚本界面",
    Callback = function()
        b:Close()
        if S then
            S:Destroy()
        end
    end
})

Q:Button({
    Title = "脚本信息",
    Desc = "点击显示脚本信息",
    Callback = function()
        a:Notify({
            Title = "QW脚本中心 v3",
            Content = "制作人: Q1 / 五月天\nQQ: 3335753204\n更新时间: 2026年1月19日",
            Duration = 5
        })
    end
})

task.spawn(function()
    if b and b.UIElements and b.UIElements.Main then
        local a0 = Instance.new("UIStroke")
        a0.Name = "a1"
        a0.Thickness = 2
        a0.Color = Color3.new(1, 1, 1)
        a0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local a2 = Instance.new("UIGradient")
        a2.Name = "a3"
        a2.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 130, 238))
        })
        a2.Enabled = true
        a0.Parent = b.UIElements.Main
        a2.Parent = a0
        while b and b.UIElements and b.UIElements.Main and b.UIElements.Main.Parent do
            a2.Rotation = (a2.Rotation + 15) % 360
            task.wait(0.05)
        end
    end
    b:SelectTab(1)
end)