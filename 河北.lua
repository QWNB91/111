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
    Title = "服务器：河北唐县",
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
    Title = "自动除草刷钱",
    Default = false,
    Image = "check",
    Callback = function(state)
        sbyx = state
while sbyx and wait(0.3) do
for _,s in next,workspace.Grass:GetChildren() do
    game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Events"):WaitForChild("CutGrass"):WaitForChild("RemoteEvent"):FireServer("Grass")
end
end
    end
})

local sbxp = false
Tab:Toggle({
    Title = "自动捡钱",
    Default = false,
    Image = "check",
    Callback = function(state)
        sbxp = state
while sbxp and wait(0.3) do
for _,s in next,workspace:GetChildren() do
    if s.Name == "Orb" then
   game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Events"):WaitForChild("CollectDrop"):WaitForChild("RemoteEvent"):FireServer(s.Name) 
end
end
end
    end
})