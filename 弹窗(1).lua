-- Roblox弹窗公告脚本（双弹窗确认版）
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 创建主屏幕GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnnouncementPopup"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 创建第一个弹窗的主框架
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true

-- 添加圆角
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- 添加阴影
local shadow = Instance.new("UIStroke")
shadow.Color = Color3.fromRGB(0, 0, 0)
shadow.Thickness = 2
shadow.Transparency = 0.7
shadow.Parent = mainFrame

-- 创建图片
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "BackgroundImage"
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://"
imageLabel.ScaleType = Enum.ScaleType.Crop
imageLabel.Parent = mainFrame

-- 创建覆盖层（让文字更清晰）
local overlay = Instance.new("Frame")
overlay.Name = "Overlay"
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.3
overlay.Parent = mainFrame

-- 创建标题
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, -40, 0, 40)
titleLabel.Position = UDim2.new(0, 20, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "WQ Hub公告"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 24
titleLabel.Parent = mainFrame

-- 创建滚动框架
local scrollFrame = Instance.new("Frame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, -40, 0, 120)
scrollFrame.Position = UDim2.new(0, 20, 0, 70)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ClipsDescendants = true
scrollFrame.Parent = mainFrame

-- 创建滚动UI列表布局
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Padding = UDim.new(0, 5)
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Parent = scrollFrame

-- 创建内容文本标签（支持长文本）
local contentLabel = Instance.new("TextLabel")
contentLabel.Name = "Content"
contentLabel.Size = UDim2.new(1, 0, 0, 0) -- 高度自动调整
contentLabel.BackgroundTransparency = 1
contentLabel.Text = [[支持服务器 
 通用
 通缉
 犯罪
 柔术
 战斗勇士
 发电机
 不知道了
  自己看吧
]]
contentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
contentLabel.TextScaled = false
contentLabel.TextSize = 16
contentLabel.TextWrapped = true
contentLabel.TextXAlignment = Enum.TextXAlignment.Left
contentLabel.TextYAlignment = Enum.TextYAlignment.Top
contentLabel.AutomaticSize = Enum.AutomaticSize.Y -- 自动调整高度
contentLabel.Font = Enum.Font.Gotham
contentLabel.Parent = scrollFrame

-- 创建滚动条（可选）
local scrollBar = Instance.new("Frame")
scrollBar.Name = "ScrollBar"
scrollBar.Size = UDim2.new(0, 4, 1, 0)
scrollBar.Position = UDim2.new(1, -2, 0, 0)
scrollBar.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
scrollBar.BorderSizePixel = 0
scrollBar.Visible = false
scrollBar.Parent = scrollFrame

local scrollBarCorner = Instance.new("UICorner")
scrollBarCorner.CornerRadius = UDim.new(0, 2)
scrollBarCorner.Parent = scrollBar

-- 创建按钮容器
local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, -40, 0, 50)
buttonContainer.Position = UDim2.new(0, 20, 1, -80)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- 创建不同意按钮（红色）
local declineButton = Instance.new("TextButton")
declineButton.Name = "DeclineButton"
declineButton.Size = UDim2.new(0.48, 0, 1, 0)
declineButton.Position = UDim2.new(0, 0, 0, 0)
declineButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
declineButton.Text = "不同意"
declineButton.TextColor3 = Color3.fromRGB(255, 255, 255)
declineButton.TextScaled = true
declineButton.Font = Enum.Font.GothamBold
declineButton.TextSize = 18
declineButton.AutoButtonColor = true

-- 添加按钮圆角
local declineCorner = Instance.new("UICorner")
declineCorner.CornerRadius = UDim.new(0, 8)
declineCorner.Parent = declineButton

-- 创建同意按钮（绿色）
local acceptButton = Instance.new("TextButton")
acceptButton.Name = "AcceptButton"
acceptButton.Size = UDim2.new(0.48, 0, 1, 0)
acceptButton.Position = UDim2.new(0.52, 0, 0, 0)
acceptButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
acceptButton.Text = "同意"
acceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
acceptButton.TextScaled = true
acceptButton.Font = Enum.Font.GothamBold
acceptButton.TextSize = 18
acceptButton.AutoButtonColor = true

-- 添加按钮圆角
local acceptCorner = Instance.new("UICorner")
acceptCorner.CornerRadius = UDim.new(0, 8)
acceptCorner.Parent = acceptButton

-- 将按钮添加到容器
declineButton.Parent = buttonContainer
acceptButton.Parent = buttonContainer

-- 添加到GUI树
mainFrame.Parent = screenGui
screenGui.Parent = playerGui

-- 创建第二个确认弹窗
local function createSecondPopup()
    local secondFrame = Instance.new("Frame")
    secondFrame.Name = "SecondPopupFrame"
    secondFrame.Size = UDim2.new(0, 350, 0, 200)
    secondFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    secondFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    secondFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    secondFrame.BorderSizePixel = 0
    secondFrame.ClipsDescendants = true
    secondFrame.Visible = false

    -- 添加圆角
    local secondCorner = Instance.new("UICorner")
    secondCorner.CornerRadius = UDim.new(0, 12)
    secondCorner.Parent = secondFrame

    -- 添加阴影
    local secondShadow = Instance.new("UIStroke")
    secondShadow.Color = Color3.fromRGB(0, 0, 0)
    secondShadow.Thickness = 2
    secondShadow.Transparency = 0.7
    secondShadow.Parent = secondFrame

    -- 创建标题
    local secondTitle = Instance.new("TextLabel")
    secondTitle.Name = "SecondTitle"
    secondTitle.Size = UDim2.new(1, -40, 0, 40)
    secondTitle.Position = UDim2.new(0, 20, 0, 20)
    secondTitle.BackgroundTransparency = 1
    secondTitle.Text = "最终确认"
    secondTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    secondTitle.TextScaled = true
    secondTitle.Font = Enum.Font.GothamBold
    secondTitle.TextSize = 22
    secondTitle.Parent = secondFrame

    -- 创建内容
    local secondContent = Instance.new("TextLabel")
    secondContent.Name = "SecondContent"
    secondContent.Size = UDim2.new(1, -40, 0, 80)
    secondContent.Position = UDim2.new(0, 20, 0, 60)
    secondContent.BackgroundTransparency = 1
    secondContent.Text = "神仇我操你妈\n你妈死了操你妈"
    secondContent.TextColor3 = Color3.fromRGB(255, 255, 255)
    secondContent.TextScaled = true
    secondContent.TextWrapped = true
    secondContent.Font = Enum.Font.Gotham
    secondContent.TextSize = 16
    secondContent.Parent = secondFrame

    -- 创建按钮容器
    local secondButtonContainer = Instance.new("Frame")
    secondButtonContainer.Name = "SecondButtonContainer"
    secondButtonContainer.Size = UDim2.new(1, -40, 0, 40)
    secondButtonContainer.Position = UDim2.new(0, 20, 1, -60)
    secondButtonContainer.BackgroundTransparency = 1
    secondButtonContainer.Parent = secondFrame

    -- 创建取消按钮
    local cancelButton = Instance.new("TextButton")
    cancelButton.Name = "CancelButton"
    cancelButton.Size = UDim2.new(0.48, 0, 1, 0)
    cancelButton.Position = UDim2.new(0, 0, 0, 0)
    cancelButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    cancelButton.Text = "取消"
    cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    cancelButton.TextScaled = true
    cancelButton.Font = Enum.Font.GothamBold
    cancelButton.TextSize = 16
    cancelButton.AutoButtonColor = true

    local cancelCorner = Instance.new("UICorner")
    cancelCorner.CornerRadius = UDim.new(0, 8)
    cancelCorner.Parent = cancelButton

    -- 创建确认按钮
    local confirmButton = Instance.new("TextButton")
    confirmButton.Name = "ConfirmButton"
    confirmButton.Size = UDim2.new(0.48, 0, 1, 0)
    confirmButton.Position = UDim2.new(0.52, 0, 0, 0)
    confirmButton.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
    confirmButton.Text = "确认"
    confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmButton.TextScaled = true
    confirmButton.Font = Enum.Font.GothamBold
    confirmButton.TextSize = 16
    confirmButton.AutoButtonColor = true

    local confirmCorner = Instance.new("UICorner")
    confirmCorner.CornerRadius = UDim.new(0, 8)
    confirmCorner.Parent = confirmButton

    -- 将按钮添加到容器
    cancelButton.Parent = secondButtonContainer
    confirmButton.Parent = secondButtonContainer

    -- 添加到GUI
    secondFrame.Parent = screenGui

    return secondFrame, cancelButton, confirmButton
end

-- 创建第二个弹窗
local secondPopup, cancelButton, confirmButton = createSecondPopup()

-- 响应式设计函数
local function updateLayout()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    
    if viewportSize.X <= 600 then -- 手机端
        local widthPercent = 0.9
        local heightPercent = 0.6
        
        mainFrame.Size = UDim2.new(widthPercent, 0, heightPercent, 0)
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        
        secondPopup.Size = UDim2.new(0.8, 0, 0.4, 0)
        secondPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
        secondPopup.AnchorPoint = Vector2.new(0.5, 0.5)
        
        titleLabel.TextSize = 20
        contentLabel.TextSize = 14
        buttonContainer.Position = UDim2.new(0, 20, 1, -70)
        
    else -- 电脑端
        mainFrame.Size = UDim2.new(0, 400, 0, 300)
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        
        secondPopup.Size = UDim2.new(0, 350, 0, 200)
        secondPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
        secondPopup.AnchorPoint = Vector2.new(0.5, 0.5)
        
        titleLabel.TextSize = 24
        contentLabel.TextSize = 16
        buttonContainer.Position = UDim2.new(0, 20, 1, -80)
    end
end

-- 滚动功能
local function updateScrollVisibility()
    local contentHeight = contentLabel.AbsoluteSize.Y
    local scrollHeight = scrollFrame.AbsoluteSize.Y
    
    if contentHeight > scrollHeight then
        scrollBar.Visible = true
    else
        scrollBar.Visible = false
    end
end

-- 监听内容尺寸变化
contentLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScrollVisibility)
scrollFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScrollVisibility)

-- 初始更新滚动条
coroutine.wrap(function()
    wait(0.1)
    updateScrollVisibility()
end)()

-- 初始布局
updateLayout()

-- 监听屏幕尺寸变化
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    updateLayout()
    wait(0.1)
    updateScrollVisibility()
end)

-- 关闭弹窗函数
local function closePopup(popupFrame)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    local tween = TweenService:Create(popupFrame, tweenInfo, {
        Size = UDim2.new(0, 10, 0, 10),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    
    tween:Play()
    tween.Completed:Wait()
    popupFrame.Visible = false
end

-- 显示弹窗函数
local function showPopup(popupFrame)
    popupFrame.Visible = true
    popupFrame.Size = UDim2.new(0, 10, 0, 10)
    
    local targetSize = UDim2.new(0, 350, 0, 200)
    if workspace.CurrentCamera.ViewportSize.X <= 600 then
        targetSize = UDim2.new(0.8, 0, 0.4, 0)
    end
    
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tween = TweenService:Create(popupFrame, tweenInfo, {
        Size = targetSize
    })
    
    tween:Play()
end

-- 执行最终脚本函数
local function executeFinalScript()
    closePopup(secondPopup)
    
    coroutine.wrap(function()
        wait(0.1)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/QWNB91/111/refs/heads/main/pcall-obfuscated.lua'))()
        end)
        
        if not success then
            warn("脚本加载失败: " .. tostring(result))
        end
    end)()
end

-- 第一个弹窗按钮事件
declineButton.MouseButton1Click:Connect(function()
    player:Kick("你选择不同意自动退出")
end)

acceptButton.MouseButton1Click:Connect(function()
    closePopup(mainFrame)
    wait(0.2)
    showPopup(secondPopup)
end)

-- 第二个弹窗按钮事件
cancelButton.MouseButton1Click:Connect(function()
    closePopup(secondPopup)
    wait(0.2)
    showPopup(mainFrame)
end)

confirmButton.MouseButton1Click:Connect(function()
    executeFinalScript()
end)

-- 触摸设备支持
declineButton.TouchTap:Connect(function()
    player:Kick("你选择不同意自动退出")
end)

acceptButton.TouchTap:Connect(function()
    closePopup(mainFrame)
    wait(0.2)
    showPopup(secondPopup)
end)

cancelButton.TouchTap:Connect(function()
    closePopup(secondPopup)
    wait(0.2)
    showPopup(mainFrame)
end)

confirmButton.TouchTap:Connect(function()
    executeFinalScript()
end)

-- 添加动画效果
local function animatePopup()
    mainFrame.Visible = true
    
    if workspace.CurrentCamera.ViewportSize.X <= 600 then
        mainFrame.Size = UDim2.new(0.1, 0, 0.1, 0)
    else
        mainFrame.Size = UDim2.new(0, 10, 0, 10)
    end
    
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local tween = TweenService:Create(mainFrame, tweenInfo, {
        Size = workspace.CurrentCamera.ViewportSize.X <= 600 and UDim2.new(0.9, 0, 0.6, 0) or UDim2.new(0, 400, 0, 300)
    })
    
    tween:Play()
end

-- 初始隐藏并执行动画
mainFrame.Visible = false
wait(0.1)
animatePopup()

-- 确保弹窗在最前面
screenGui.DisplayOrder = 999

-- 触摸滚动支持（手机端）
local function enableTouchScrolling()
    local scrollingEnabled = false
    local startPosition = nil
    local startScrollPosition = nil
    
    scrollFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            scrollingEnabled = true
            startPosition = input.Position.Y
            startScrollPosition = scrollFrame.Position.Y.Offset
        end
    end)
    
    scrollFrame.InputChanged:Connect(function(input)
        if scrollingEnabled and input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position.Y - startPosition
            -- 这里可以添加更复杂的滚动逻辑
        end
    end)
    
    scrollFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            scrollingEnabled = false
        end
    end)
end

-- 启用触摸滚动
enableTouchScrolling()