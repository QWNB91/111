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
    Title = "服务器：棒子增量",
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

local sbyx = false
Tab:Toggle({
    Title = "自动捡取棒子(包括所有类型)",
    Default = false,
    Image = "check",
    Callback = function(state)
        sbyx = state
    while sbyx and wait() do
for _,s in next,workspace.World.Sticks:GetChildren() do
    if s.Name:find"Stick" then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PickUp"):FireServer("GoldStick")
end
end
end
    end
})

local sbns = Tab:Paragraph({
    Title = "重生显示(括号中是当前可增加重生次数)",
    Desc = "当前重生:"  .. workspace.World.UpgradeUnlocks.RebirthGUI.UpgradesFrame.RebirthFrame.CollectAmountReb.RebAmount.Text,
    Color = "Blue"
})
spawn(function()
    pcall(function()
        while wait() do
            sbns:SetDesc("当前重生:"  .. workspace.World.UpgradeUnlocks.RebirthGUI.UpgradesFrame.RebirthFrame.CollectAmountReb.RebAmount.Text)
        end
    end)
end)

Tab:Button({
   Title = "点击重生",
    Icon = "check",
    Callback = function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer()
    end
})