local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ParKe001/ParKe/refs/heads/main/ui.lua"))()
local Window = WindUI:CreateWindow({
    Title = "WYT",
    Icon = "crown",
    IconThemed = false,
    Author = "WTY",
    Folder = "WYTHub",
    Size = UDim2.fromOffset(500, 390),
    Theme = "Dark",
    User = { 
        Enabled = true,
        Callback = function()
        --点击名片可以执行的代码
        end
    },
    SideBarWidth = 240,
    ScrollBarEnabled = true,
    NewElements = false,
    AutoScale = true,
    Resizable = true,
})

Window:EditOpenButton({
    Title = "WYTHub",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("#484848"),
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

task.spawn(function()
    while not Window.UIElements or not Window.UIElements.Main do
        task.wait(0.1)
    end
    
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "RainbowStroke"
        stroke.Thickness = 1
        stroke.Color = Color3.new(1, 1, 1)
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        
        local gradient = Instance.new("UIGradient")
        gradient.Name = "RainbowGradient"
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 165, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 130, 238))
        })--你可以更改这边框的颜色
        gradient.Enabled = true
        gradient.Offset = Vector2.new(0, 0)
        
        stroke.Parent = mainContainer
        gradient.Parent = stroke
        
        task.spawn(function()
            local rotationSpeed = 50
            while mainContainer and mainContainer.Parent do
                task.wait(0.1)
                gradient.Rotation = (gradient.Rotation + rotationSpeed * 0.1) % 360
            end
        end)
    end
end)

local MainTab = Window:Tab({ Title = "主要功能", Icon = "" })
local PlayerTab = Window:Tab({ Title = "玩家功能", Icon = "" })
local CombatTab = Window:Tab({ Title = "战斗功能", Icon = "" })
local MoneyTab = Window:Tab({ Title = "刷钱功能", Icon = "" })
local WeaponsTab = Window:Tab({ Title = "武器功能", Icon = "" })
local TeleportTab = Window:Tab({ Title = "传送功能", Icon = "" })
local MiscTab = Window:Tab({ Title = "其他功能", Icon = "" })

Window:SelectTab(1)

local FlyingEnabled = false
local FlightSpeed = 50
local CurrentAO, CurrentLV, CurrentMoverAttachment
local FlightConnection
local SpeedHack = false
local SpeedValue = 16
local JumpConn
local ForceLoadAll = false
local AutoShoot = false
local AutoRegister = false
local ImmuneTurret = false
local OldFireServer
local AutoBankCash = false
local AutoGold = false
local AutoWorldItem = false
local AutoSilverBar = false
local AutoSapphire = false
local AutoSell = false

PlayerTab:Slider({
    Title = "速度设置",
    Value = {
        Min = 1,
        Max = 150,
        Default = 16
    },
    Step = 1,
    Callback = function(v)
        SpeedValue = v
    end
})

PlayerTab:Toggle({
    Title = "速度增加",
    Value = false,
    Callback = function(v)
        SpeedHack = v
        if v then
            task.spawn(function()
                local speedConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if SpeedHack and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        local hum = game.Players.LocalPlayer.Character.Humanoid
                        if hum.MoveDirection.Magnitude > 0 then
                            game.Players.LocalPlayer.Character:TranslateBy(hum.MoveDirection * SpeedValue / 10)
                        end
                    end
                end)
                while SpeedHack do
                    task.wait()
                end
                speedConnection:Disconnect()
            end)
        end
    end
})

PlayerTab:Toggle({
    Title = "飞行模式",
    Value = false,
    Callback = function(v)
        if v then
            startFlying()
        else
            stopFlying()
        end
    end
})

PlayerTab:Toggle({
    Title = "无限跳",
    Value = false,
    Callback = function(v)
        if v then
            JumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                local humanoid = game:GetService("Players").LocalPlayer.Character and
                                 game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if JumpConn then
                JumpConn:Disconnect()
                JumpConn = nil
            end
        end
    end
})

CombatTab:Toggle({
    Title = "强制加载所有数据",
    Value = false,
    Callback = function(v)
        ForceLoadAll = v
        if v then
            task.spawn(function()
                while ForceLoadAll do
                    pcall(function()
                        local devv = require(game:GetService("ReplicatedStorage").Devv)
                        local Network = devv.load("Network")
                        if Network then
                            Network.InvokeServer("requestStreamAround", Vector3.new(0,0,0), 1000)
                            Network.FireServer("setReplicationFocus", Vector3.new(0,0,0))
                        end
                    end)
                    task.wait(5)
                end
            end)
        end
    end
})

CombatTab:Toggle({
    Title = "绕过炮塔伤害",
    Value = false,
    Callback = function(v)
        ImmuneTurret = v
        if v then
            OldFireServer = game:GetService("ReplicatedStorage").Shared.Core.Network.FireServer
            game:GetService("ReplicatedStorage").Shared.Core.Network.FireServer = function(self, event, ...)
                if event == "registerLocalHit" and ... == "Turret" then
                    return nil
                end
                return OldFireServer(self, event, ...)
            end
        else
            if OldFireServer then
                game:GetService("ReplicatedStorage").Shared.Core.Network.FireServer = OldFireServer
            end
        end
    end
})

CombatTab:Toggle({
    Title = "自动ATM",
    Value = false,
    Callback = function(v)
        AutoRegister = v
        if v then
            task.spawn(function()
                while AutoRegister do
                    local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local RootPart = Character:WaitForChild("HumanoidRootPart", 5)
                    local GizmoFolder = workspace:FindFirstChild("Local") and workspace.Local:FindFirstChild("Gizmos") and workspace.Local.Gizmos:FindFirstChild("White")
                    
                    if GizmoFolder and RootPart then
                        for _, item in ipairs(GizmoFolder:GetChildren()) do
                            if item:GetAttribute("gizmoType") == "Register" and AutoRegister then
                                local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart", true)
                                if part then
                                    RootPart.CFrame = part.CFrame * CFrame.new(0, 5, 0)
                                    task.wait(0.3)
                                    for i = 1, 20 do
                                        if not AutoRegister then break end
                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                        task.wait(0.05)
                                        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                        task.wait(0.1)
                                    end
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

CombatTab:Toggle({
    Title = "愤怒机器人",
    Value = false,
    Callback = function(v)
        AutoShoot = v
        if v then
            task.spawn(function()
                while AutoShoot do
                    local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                    if tool then
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
                        task.wait(0.05)
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
                    end
                    task.wait(0.2)
                end
            end)
        end
    end
})

MoneyTab:Toggle({
    Title = "自动抢银行",
    Value = false,
    Callback = function(v)
        AutoBankCash = v
        if v then
            task.spawn(function()
                while AutoBankCash do
                    local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local RootPart = Character:WaitForChild("HumanoidRootPart", 5)
                    local White = workspace:FindFirstChild("Local") and workspace.Local:FindFirstChild("Gizmos") and workspace.Local.Gizmos:FindFirstChild("White")
                    
                    if White and RootPart and White:FindFirstChild("MainBankCash") and AutoBankCash then
                        local Item = White.MainBankCash
                        local Target = Item.PrimaryPart or Item:FindFirstChildWhichIsA("BasePart", true)
                        
                        if Target then
                            RootPart.CFrame = Target.CFrame * CFrame.new(0, 0, -2.5)
                            task.wait(0.2)
                            
                            while AutoBankCash and White:FindFirstChild("MainBankCash") do
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                task.wait(0.05)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                task.wait(0.5)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

MoneyTab:Toggle({
    Title = "自动收集神秘礼盒",
    Value = false,
    Callback = function(v)
        AutoWorldItem = v
        if v then
            task.spawn(function()
                while AutoWorldItem do
                    local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local RootPart = Character:WaitForChild("HumanoidRootPart", 5)
                    local White = workspace:FindFirstChild("Local") and workspace.Local:FindFirstChild("Gizmos") and workspace.Local.Gizmos:FindFirstChild("White")
                    
                    if White and RootPart then
                        for _, Item in ipairs(White:GetChildren()) do
                            if Item.Name == "WorldItem" and AutoWorldItem then
                                local Target = Item.PrimaryPart or Item:FindFirstChildWhichIsA("BasePart", true)
                                
                                if Target then
                                    RootPart.CFrame = Target.CFrame * CFrame.new(0, 0, -2.5)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(0.05)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                    task.wait(0.5)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

MoneyTab:Toggle({
    Title = "自动拾取银条",
    Value = false,
    Callback = function(v)
        AutoSilverBar = v
        if v then
            task.spawn(function()
                while AutoSilverBar do
                    local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local RootPart = Character:WaitForChild("HumanoidRootPart", 5)
                    local White = workspace:FindFirstChild("Local") and workspace.Local:FindFirstChild("Gizmos") and workspace.Local.Gizmos:FindFirstChild("White")
                    
                    if White and RootPart then
                        for _, Item in ipairs(White:GetChildren()) do
                            if Item.Name == "Silver Bar" and AutoSilverBar then
                                local Target = Item.PrimaryPart or Item:FindFirstChildWhichIsA("BasePart", true)
                                
                                if Target then
                                    RootPart.CFrame = Target.CFrame * CFrame.new(0, 0, -2.5)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(0.05)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                    task.wait(0.5)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

MoneyTab:Toggle({
    Title = "自动拾取金条",
    Value = false,
    Callback = function(v)
        AutoGold = v
        if v then
            task.spawn(function()
                while AutoGold do
                    local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local RootPart = Character:WaitForChild("HumanoidRootPart", 5)
                    local White = workspace:FindFirstChild("Local") and workspace.Local:FindFirstChild("Gizmos") and workspace.Local.Gizmos:FindFirstChild("White")
                    
                    if White and RootPart then
                        for _, Item in ipairs(White:GetChildren()) do
                            if Item.Name == "Gold Bar" and AutoGold then
                                local Target = Item.PrimaryPart or Item:FindFirstChildWhichIsA("BasePart", true)
                                
                                if Target then
                                    RootPart.CFrame = Target.CFrame * CFrame.new(0, 0, -2.5)
                                    task.wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(0.05)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                    task.wait(0.5)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

MoneyTab:Toggle({
    Title = "自动售卖",
    Value = false,
    Callback = function(v)
        AutoSell = v
        if v then
            task.spawn(function()
                while AutoSell do
                    pcall(function()
                        for _, a in ipairs(game:GetService("ReplicatedStorage").Shared.Core.Network:GetChildren()) do
                            if a:IsA("RemoteFunction") or a:IsA("RemoteEvent") then
                                if not a.Name:find("moveHouse") and not a.Name:find("House") then
                                    pcall(function() a:InvokeServer() end)
                                end
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end
})

WeaponsTab:Button({
    Title = "无限子弹",
    Callback = function()
        local success, Shooter = pcall(function()
            return require(game:GetService("ReplicatedStorage").Client.Wanted.Objects.ClientTool.Components.Guns.Shooter)
        end)
        
        if success and Shooter then
            local originalShoot = Shooter._shoot
            Shooter._shoot = function(self)
                if self then
                    self.ammo = 9999
                    self.totalAmmo = 9999
                end
                return originalShoot(self)
            end
        end
    end
})

WeaponsTab:Button({
    Title = "无后坐力",
    Callback = function()
        local success, Shooter = pcall(function()
            return require(game:GetService("ReplicatedStorage").Client.Wanted.Objects.ClientTool.Components.Guns.Shooter)
        end)
        
        if success and Shooter then
            local originalShoot = Shooter._shoot
            Shooter._shoot = function(self)
                if self then
                    self.recoil = {firstShotKick = 0, climb = 0, spread = 0}
                end
                return originalShoot(self)
            end
        end
    end
})

WeaponsTab:Button({
    Title = "无装弹时间",
    Callback = function()
        pcall(function()
            local Shooter = require(game:GetService("ReplicatedStorage").Client.Wanted.Objects.ClientTool.Components.Guns.Shooter)
            local originalShoot = Shooter._shoot
            Shooter._shoot = function(self)
                if self then
                    self.ammoData = {reloadTime = 0, magSize = 9999}
                end
                return originalShoot(self)
            end
        end)
    end
})

WeaponsTab:Button({
    Title = "快速射击",
    Callback = function()
        local success, Shooter = pcall(function()
            return require(game:GetService("ReplicatedStorage").Client.Wanted.Objects.ClientTool.Components.Guns.Shooter)
        end)
        
        if success and Shooter then
            local originalShoot = Shooter._shoot
            Shooter._shoot = function(self)
                if self and self.tool then
                    self.tool.fireDebounce = 0
                    self.tool.fireMode = "auto"
                end
                return originalShoot(self)
            end
        end
    end
})

TeleportTab:Button({
    Title = "银行",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        h.CFrame = CFrame.new(-431.537354, 39.6113892, -1400.08313, -0.901108384, -1.61008e-8, -0.433593899, -5.2681104e-9, 1, -2.618487e-8, 0.433593899, -2.1311186e-8, -0.901108384)
    end
})

TeleportTab:Button({
    Title = "警察局",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        h.CFrame = CFrame.new(2578.02393, 119.169289, -718.579773, -0.395326763, -5.9598324e-8, -0.918540537, -9.65633e-9, 1, -5.232432e-8, 0.918540537, 7.947669e-8, -0.395326763)
    end
})

TeleportTab:Button({
    Title = "金库",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        h.CFrame = CFrame.new(-400.492279, 163.151733, -1242.72632, -0.912052214, -1.09039995e-8, -0.410074085, 1.4650267e-8, 1, -5.9174205e-8, 0.410074085, -5.997766e-8, -0.912052214)
    end
})

TeleportTab:Button({
    Title = "绿洲警察",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        h.CFrame = CFrame.new(2578.02393, 119.169289, -718.579773, -0.395326763, -5.9598324e-8, -0.918540537, -9.65633e-9, 1, -5.232432e-8, 0.918540537, 7.947669e-8, -0.395326763)
    end
})

TeleportTab:Button({
    Title = "罪犯基地",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        h.CFrame = CFrame.new(-5981.50586, 37.2680244, 1245.22046, -0.733384013, -3.6538985e-8, -0.679814577, -1.7351333e-8, 1, -3.502984e-8, 0.679814577, -1.38946366e-8, -0.733384013)
    end
})

TeleportTab:Button({
    Title = "烈焰要塞",
    Callback = function()
        local p = game.Players.LocalPlayer
        local c = p.Character or p.CharacterAdded:Wait()
        local h = c:WaitForChild("HumanoidRootPart")
        h.CFrame = CFrame.new(-1494.58496, 41.16481, 3364.56055, 0.961387396, 1.07588015e-7, 0.275198698, -9.5233396e-8, 1, -5.8255473e-8, -0.275198698, 2.97983e-8, 0.961387396)
    end
})

_G.AUTO_CHAT_TEXT = "缝合不收费开源就开了吧"
_G.AUTO_CHAT_ENABLED = false
_G.AUTO_CHAT_INTERVAL = 3

MiscTab:Toggle({
    Title = "自动发言",
    Value = false,
    Callback = function(v)
        _G.AUTO_CHAT_ENABLED = v
        if v then
            task.spawn(function()
                while _G.AUTO_CHAT_ENABLED do
                    task.wait(_G.AUTO_CHAT_INTERVAL)
                    pcall(function()
                        local TextChatService = game:GetService("TextChatService")
                        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral") or
                                       TextChatService.TextChannels:FindFirstChild("RBXGeneralChannel")
                        if channel and channel.SendAsync then
                            channel:SendAsync(_G.AUTO_CHAT_TEXT)
                        end
                    end)
                    pcall(function()
                        local events = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
                        local req = events and events:FindFirstChild("SayMessageRequest")
                        if req then
                            req:FireServer(_G.AUTO_CHAT_TEXT, "All")
                        end
                    end)
                end
            end)
        end
    end
})

MiscTab:Input({
    Title = "发言内容",
    Placeholder = "输入发言内容",
    Default = "缝合不收费开源就开了吧",
    Callback = function(v)
        _G.AUTO_CHAT_TEXT = v
    end
})

function startFlying()
    if FlyingEnabled then return end
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    
    if not character then return end
    
    FlyingEnabled = true
    
    if CurrentAO then CurrentAO:Destroy() end
    if CurrentLV then CurrentLV:Destroy() end
    if CurrentMoverAttachment then CurrentMoverAttachment:Destroy() end
    
    local hrp = character:WaitForChild("HumanoidRootPart")
    local moverParent = workspace:FindFirstChildOfClass("Terrain") or workspace
    
    local moverAttachment = Instance.new("Attachment", hrp)
    moverAttachment.Name = "FlightAttachment"
    
    local alignOrientation = Instance.new('AlignOrientation')
    alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    alignOrientation.RigidityEnabled = true
    alignOrientation.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    alignOrientation.CFrame = hrp.CFrame
    alignOrientation.Attachment0 = moverAttachment
    alignOrientation.Parent = moverParent
    
    local linearVelocity = Instance.new('LinearVelocity')
    linearVelocity.VectorVelocity = Vector3.new(0, 0, 0)
    linearVelocity.MaxForce = 9e9
    linearVelocity.Attachment0 = moverAttachment
    linearVelocity.Parent = moverParent
    
    CurrentAO, CurrentLV, CurrentMoverAttachment = alignOrientation, linearVelocity, moverAttachment
    
    FlightConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not FlyingEnabled or not CurrentLV or not CurrentAO then
            if FlightConnection then
                FlightConnection:Disconnect()
                FlightConnection = nil
            end
            return
        end
        
        local UserInputService = game:GetService("UserInputService")
        local Control = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then Control.F = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then Control.B = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then Control.L = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then Control.R = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then Control.Q = 1 end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then Control.E = 1 end
        
        local camera = workspace.CurrentCamera
        local flightVector = (camera.CFrame.LookVector * (Control.F - Control.B) +
                             camera.CFrame.RightVector * (Control.R - Control.L) +
                             Vector3.new(0, 1, 0) * (Control.Q - Control.E))
        
        if flightVector.Magnitude > 0 then
            CurrentLV.VectorVelocity = flightVector.Unit * FlightSpeed
        else
            CurrentLV.VectorVelocity = Vector3.new(0, 0, 0)
        end
        
        CurrentAO.CFrame = workspace.CurrentCamera.CFrame
        
        if character.HumanoidRootPart then
            character.Humanoid.PlatformStand = true
        end
    end)
end

function stopFlying()
    if not FlyingEnabled then return end
    
    FlyingEnabled = false
    
    if FlightConnection then
        FlightConnection:Disconnect()
        FlightConnection = nil
    end
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local character = LocalPlayer.Character
    
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.PlatformStand = false
    end
    
    if CurrentAO then
        CurrentAO:Destroy()
        CurrentAO = nil
    end
    
    if CurrentLV then
        CurrentLV:Destroy()
        CurrentLV = nil
    end
    
    if CurrentMoverAttachment then
        CurrentMoverAttachment:Destroy()
        CurrentMoverAttachment = nil
    end
end

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    if FlyingEnabled then
        stopFlying()
    end
end)

Window:OnClose(function()
end)