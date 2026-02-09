workspace["."].Head.BillboardGui.TextLabel.Text = "吸吸唉替"

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
    Title = "服务器：矿井",
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

local Tab = TabSection:Tab({Title = "Main", Icon = "check"})

Tab:Button({
    Title = "最大力量",
    Image = "check",
    Callback = function(state)
    WindUI:Notify({
        Title = "苏脚本",
        Content = "已开启!(没有文字显示但是正常使用)",
        Duration = 3,
        Icon = "bird",
    })
    local old
        old = hookmetamethod(game:GetService("ReplicatedStorage")["shared/network/MiningNetwork@GlobalMiningEvents"].Mine, "__namecall", function(self, ...)
    local args = {...}
    if getnamecallmethod() == "FireServer" then
        args[2] = 1
    end
      return old(self, unpack(args))
    end)
    end
})

local sblinni = false
Tab:Toggle({
    Title = "自动收集矿物",
    Default = false,
    Image = "check",
    Callback = function(state)
     WindUI:Notify({
        Title = "苏脚本",
        Content = "请进入洞穴中以便自动拾取矿物",
        Duration = 3,
        Icon = "bird",
    })
        sblinni = state
    while sblinni and wait() do
        for _, v in pairs(workspace.Items:GetChildren()) do
            if v then
                local args = {
                    v.Name
                }
                game:GetService("ReplicatedStorage"):FindFirstChild("shared/network/MiningNetwork@GlobalMiningEvents").CollectItem:FireServer(unpack(args))
            end
        end
    end
    end
})

local sbleng = false
Tab:Toggle({
    Title = "操吸吸唉替(自动售卖)",
    Default = false,
    Image = "check",
    Callback = function(state)
        sbleng = state
    while sbleng and wait() do
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:GetAttribute("Name") == "Trader Tom" then
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame
                game:GetService("ReplicatedStorage").Ml.SellInventory:FireServer()
                break
            end
        end
     end
    end
})