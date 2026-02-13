
local IMAGE_ID = "89260669622248"
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "ImageDisplayGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
mainContainer.Position = UDim2.new(0.5, 0, 0.4, 0)
mainContainer.Size = UDim2.new(0, 250, 0, 250)
mainContainer.BackgroundTransparency = 1
mainContainer.Parent = gui

local roundedFrame = Instance.new("Frame")
roundedFrame.Name = "RoundedImageContainer"
roundedFrame.AnchorPoint = Vector2.new(0.5, 0.5)
roundedFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
roundedFrame.Size = UDim2.new(1, 0, 1, 0)
roundedFrame.BackgroundTransparency = 1
roundedFrame.ClipsDescendants = true

local containerCorner = Instance.new("UICorner")
containerCorner.Name = "ContainerRoundedCorners"
containerCorner.CornerRadius = UDim.new(0, 20)
containerCorner.Parent = roundedFrame

local stroke = Instance.new("UIStroke")
stroke.Name = "RainbowStroke"
stroke.Thickness = 4
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Parent = roundedFrame

local gradient = Instance.new("UIGradient")
gradient.Name = "RainbowGradient"
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(200, 0, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 100, 100)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(200, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))
})
gradient.Enabled = true
gradient.Offset = Vector2.new(0, 0)
gradient.Parent = stroke

local imageContainer = Instance.new("Frame")
imageContainer.Name = "ImageContainer"
imageContainer.Size = UDim2.new(1, 0, 1, 0)
imageContainer.BackgroundTransparency = 1
imageContainer.ClipsDescendants = true
imageContainer.ZIndex = 1

local imageCorner = Instance.new("UICorner")
imageCorner.Name = "ImageRoundedCorners"
imageCorner.CornerRadius = UDim.new(0, 20)
imageCorner.Parent = imageContainer

local image = Instance.new("ImageLabel")
image.Name = "DisplayImage"
image.Size = UDim2.new(1, 0, 1, 0)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://" .. IMAGE_ID
image.ScaleType = Enum.ScaleType.Crop
image.Parent = imageContainer

local imageLabelCorner = Instance.new("UICorner")
imageLabelCorner.Name = "ImageLabelRoundedCorners"
imageLabelCorner.CornerRadius = UDim.new(0, 20)
imageLabelCorner.Parent = image

imageContainer.Parent = roundedFrame

local rotationSpeed = 50

task.spawn(function()
    while gui and gui.Parent do
        task.wait(0.01)
        gradient.Rotation = (gradient.Rotation + rotationSpeed * 0.1) % 360
    end
end)

roundedFrame.Parent = mainContainer

local mouseDetector = Instance.new("TextButton")
mouseDetector.Name = "MouseDetector"
mouseDetector.Size = UDim2.new(1, 0, 1, 0)
mouseDetector.BackgroundTransparency = 1
mouseDetector.Text = ""
mouseDetector.AutoButtonColor = false
mouseDetector.ZIndex = 2
mouseDetector.Parent = roundedFrame

local function onMouseEnter()
    stroke.Thickness = 6
    rotationSpeed = 80
end

local function onMouseLeave()
    stroke.Thickness = 4
    rotationSpeed = 50
end

mouseDetector.MouseEnter:Connect(onMouseEnter)
mouseDetector.MouseLeave:Connect(onMouseLeave)

mouseDetector.MouseButton1Click:Connect(function()
    local originalThickness = stroke.Thickness
    stroke.Thickness = 8
    task.wait(0.1)
    stroke.Thickness = originalThickness
end)

local tweenService = game:GetService("TweenService")

mouseDetector.MouseButton1Down:Connect(function()
    local scaleTween = tweenService:Create(
        roundedFrame,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.95, 0, 0.95, 0)}
    )
    scaleTween:Play()
end)

mouseDetector.MouseButton1Up:Connect(function()
    local scaleTween = tweenService:Create(
        roundedFrame,
        TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
        {Size = UDim2.new(1, 0, 1, 0)}
    )
    scaleTween:Play()
end)

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
            if c and c:IsA('TextLabel') or c:IsA('TextButton') or c:IsA('Message') then
                if string.find(string.lower(c.Text), 'http') then
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
local an = {
"LightKorzo",
"Kehcdc1",
"kumamlkan1",
"Realsigmadeeepseek",
"Ping4HelP",
"RedRubyyy611",
"Recall612",
"Davydevv",
"FEARLESS4654",
"jbear314",
"amogus12342920",
"kumamikan1",
"RedRubyyy611",
"whyrally",
"Davydevv",
"HagahZet",
"alvis220",
"na3k7",
"fakest_reallty",
"Bogdanpro55555",
"Suponjibobu00",
"Realsigmadeepseek",
}

local acc = nil

local function cp()
local localPlayer = game:GetService("Players").LocalPlayer
for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
for _, name in ipairs(an) do
if plr.Name == name then
localPlayer:Kick("管理员:" .. name .. "\nSE自动捡物已退出")
return
end
end
end
end

local function eap()
if acc then
acc:Disconnect()
acc = nil
end
acc = game:GetService("RunService").Heartbeat:Connect(function()
cp()
end)
end

local function dap()
if acc then
acc:Disconnect()
acc = nil
end
end

local function arp()
cp()
eap()
end
arp()

local game = game

local autoArmorEnabled = true
local autoArmorConnection = nil

autoArmorConnection = game:GetService("RunService").Heartbeat:Connect(function()
    if not autoArmorEnabled then
        return
    end
    
    pcall(function()
        local player = game:GetService('Players').LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        
        if humanoid and humanoid.Health > 35 then
            local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
            local hasLightVest = false
            
            for i, v in next, b1 do
                if v.name == "Light Vest" then
                    hasLightVest = true
                    local light = v.guid
                    local armor = player:GetAttribute('armor')
                    
                    if armor == nil or armor <= 0 then
                        require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("equip", light)
                        require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("useConsumable", light)
                        require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("removeItem", light)
                    end
                    break
                end
            end
            
            if not hasLightVest then
                require(game:GetService("ReplicatedStorage").devv).load("Signal").InvokeServer("attemptPurchase", "Light Vest")
            end
        end
    end)
end)

local task = task

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local Mask = character:FindFirstChild("Hockey Mask")
            local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
            local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
            if not Mask then
                Signal.InvokeServer("attemptPurchase", "Hockey Mask")
                for i, v in next, b1 do
                    if v.name == "Hockey Mask" then
                        local sugid = v.guid
                        if not Mask then
                            Signal.FireServer("equip", sugid)
                            Signal.FireServer("wearMask", sugid)
                        end
                        break
                    end
                end
            end
        end)
    end
end)
local game = game

local autoArmorEnabled = true
local autoArmorConnection = nil

autoArmorConnection = game:GetService("RunService").Heartbeat:Connect(function()
    if not autoArmorEnabled then
        return
    end
    
    pcall(function()
        local player = game:GetService('Players').LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        
        if humanoid and humanoid.Health > 35 then
            local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
            local hasLightVest = false
            
            for i, v in next, b1 do
                if v.name == "Light Vest" then
                    hasLightVest = true
                    local light = v.guid
                    local armor = player:GetAttribute('armor')
                    
                    if armor == nil or armor <= 0 then
                        require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("equip", light)
                        require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("useConsumable", light)
                        require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("removeItem", light)
                    end
                    break
                end
            end
            
            if not hasLightVest then
                require(game:GetService("ReplicatedStorage").devv).load("Signal").InvokeServer("attemptPurchase", "Light Vest")
            end
        end
    end)
end)
local paker2 = game:GetService("HttpService")
local paker3 = game:GetService("Players")
local paker4 = game:GetService("TeleportService")
local paker5 = game:GetService("RunService")
local paker6 = paker3.LocalPlayer

local paker7 = {
    "Money Printer", "Blue Candy Cane", "Bunny Balloon", "Ghost Balloon", "Clover Balloon",
    "Bat Balloon", "Gold Clover Balloon", "Golden Rose", "Black Rose", "Heart Balloon",
    "Diamond Ring", "Diamond", "Void Gem", "Dark Matter Gem", "Rollie", "RemoteBot Grenade",
    "Nuclear Missile Launcher", "Suitcase Nuke", "Car", "Helicopter", "Trident", "Golden Cup", 
    "Easter Basket", "Military Armory Keycard", "Treasure Map", "Holy Grail"
}

local function paker8()
    local paker9 = paker6.Character
    if not paker9 then return end
    local paker10 = paker9:FindFirstChildOfClass("Humanoid")
    if paker10 then
        paker10:Move(Vector3.new(0, 0, 1), true)
        task.wait(0.01)
        paker10:Move(Vector3.new(0, 0, 0), false)
    end
end

local paker11 = "https://games.roblox.com/v1/games/"
local paker12 = game.PlaceId
local paker13 = paker11 .. paker12 .. "/servers/Public?sortOrder=Asc&limit=100"

function paker14(paker15)
    local paker16 = paker13 .. (paker15 and "&cursor=" .. paker15 or "")
    local paker17, paker18 = pcall(function()
        return game:HttpGet(paker16)
    end)
    if not paker17 then
        return nil
    end
    return paker2:JSONDecode(paker18)
end

local function paker19()
    local paker20, paker21
    repeat
        local paker22 = paker14(paker21)
        if not paker22 then break end
        local paker23 = {}
        for _, paker24 in ipairs(paker22.data) do
            if paker24.id ~= game.JobId and paker24.playing < paker24.maxPlayers then
                table.insert(paker23, paker24)
            end
        end
        if #paker23 > 0 then
            local paker25 = math.random(1, #paker23)
            paker20 = paker23[paker25]
        end
        paker21 = paker22.nextPageCursor
    until paker20 or not paker21
    return paker20
end

local paker26 = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ParKe001/ParKe/refs/heads/main/SE"))()
]]
local function paker27(paker28)
    if not paker28 then return end
    local paker29 = paker28:FindFirstChild("ForceField")
    if paker29 then
        pcall(function() paker29:Destroy() end)
    end
    if paker29 and paker29:IsA("ForceField") then
        pcall(function()
            paker29.Visible = false
            paker29.Enabled = false
        end)
    end
    local paker30 = paker28:FindFirstChild("HumanoidRootPart")
    if paker30 then
        pcall(function() paker30.CanCollide = false end)
    end
end

repeat
    task.wait()
    paker8()
    paker27(paker6.Character)
    task.wait(0.01)
until not (paker6.Character and paker6.Character:FindFirstChild("ForceField"))

local function paker31(paker32, paker33)
    local paker34 = paker33:FindFirstChild("HumanoidRootPart")
    local paker35 = paker33:FindFirstChildOfClass("Humanoid")
    if not paker34 or not paker35 then return false end
    local paker36 = paker34.CanCollide
    paker34.CanCollide = false
    local paker37 = paker34.CFrame
    local paker38 = 10
    for paker39 = 1, paker38 do
        paker34.CFrame = paker37:Lerp(paker32, paker39 / paker38)
        paker5.Heartbeat:Wait()
    end
    paker34.CanCollide = paker36
    return true
end

local function paker40()
    local paker41 = {}
    if workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("Entities") and workspace.Game.Entities:FindFirstChild("ItemPickup") then
        for _, paker42 in ipairs(workspace.Game.Entities.ItemPickup:GetChildren()) do
            local paker43 = paker42.PrimaryPart
            if paker43 then
                local paker44 = paker43:FindFirstChildOfClass("ProximityPrompt")
                if paker44 and table.find(paker7, paker44.ObjectText) then
                    table.insert(paker41, {
                        part = paker43,
                        prompt = paker44,
                        instance = paker42,
                        type = paker44.ObjectText
                    })
                end
            end
        end
    end
    return paker41
end

local function paker45(paker46)
    if paker46.instance and paker46.instance:FindFirstChild("PickupFunction") then
        local paker47, paker48 = pcall(function()
            return paker46.instance.PickupFunction:InvokeServer(paker6)
        end)
        if paker47 then return true end
    end
    if game:GetService("ReplicatedStorage"):FindFirstChild("PickupItem") then
        local paker47, paker48 = pcall(function()
            game.ReplicatedStorage.PickupItem:FireServer(paker46.instance)
        end)
        if paker47 then return true end
    end
    return false
end

local function paker49(paker46, paker50)
    if not paker50 then return false end
    if not paker46.instance:IsDescendantOf(game) then
        return true 
    end
    paker27(paker50)
    if paker45(paker46) then
        task.wait(0.5)
        if not paker46.instance:IsDescendantOf(game) then
            return true
        end
    end
    local paker51 = paker46.part.CFrame * CFrame.new(0, 1, -3)
    local paker52 = paker31(paker51, paker50)
    if not paker52 then return false end
    task.wait(0.5)
    local paker53 = pcall(function()
        fireproximityprompt(paker46.prompt, 1)
    end)
    if paker53 then
        task.wait(1)
        if not paker46.instance:IsDescendantOf(game) then
            return true
        else
            return false
        end
    else
        return false
    end
end

local function paker54()
    local maxAttempts = 3
    local currentAttempt = 0
    while currentAttempt < maxAttempts do
        currentAttempt = currentAttempt + 1
        local paker55 = paker40()
        local paker56 = paker19()
        if #paker55 == 0 then
            if paker56 then
                queue_on_teleport(paker26)
                task.wait(1)
                paker4:TeleportToPlaceInstance(paker12, paker56.id, paker6)
                return true
            end
        end
        local collectedCount = 0
        for paker39, paker58 in ipairs(paker55) do
            local paker64 = paker6.Character or paker6.CharacterAdded:Wait()
            paker27(paker64)
            local paker52 = paker49(paker58, paker64)
            if paker52 then
                collectedCount = collectedCount + 1
            end
            task.wait(0.5)
        end
        if paker56 then
            queue_on_teleport(paker26)
            task.wait(1)
            paker4:TeleportToPlaceInstance(paker12, paker56.id, paker6)
            return true
        end
    end
    return false
end

local function safeMain()
    while true do
        local success = false
        local ok, err = pcall(function()
            success = paker54()
        end)
        if not ok then
            task.wait(5)
        elseif not success then
            task.wait(10)
        else
            task.wait(10)
        end
    end
end

spawn(function()
    safeMain()
end)