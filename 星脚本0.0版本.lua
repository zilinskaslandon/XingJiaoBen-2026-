local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/main%20(1).lua"))()

local function setThemeColors()
    local themes = WindUI.GetThemes()
    if themes and themes.Dark then
        themes.Dark.Text = Color3.fromHex("00FFFF") 
        themes.Dark.Placeholder = Color3.fromHex("00FFFF") 
        themes.Dark.Button = Color3.fromHex("00FFFF") 
        themes.Dark.TabTitle = Color3.fromHex("00FFFF") 
    end
    WindUI:SetTheme("Dark")
end

setThemeColors()

local Window = WindUI:CreateWindow({
    Title = "星脚本", 
    Icon = "rbxassetid://18941716391", 
    IconThemed = true, 
    Author = "<font color='#FFFFFF'>作者: 小皮</font>", 
    Folder = "星脚本", 
    Size = UDim2.fromOffset(300, 270), 
    Transparent = true, 
    Theme = "Dark", 
    BackgroundImageTransparency = 0.4,  
    User = {
        Enabled = true,
        Callback = function()            
        end,
        Anonymous = true
    },
    SideBarWidth = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    Background = "https://raw.githubusercontent.com/zilinskaslandon/zzzzzzzzzzz/refs/heads/main/111785626782282.jpg"
})

task.wait(0.5)

local mainFrame = Window.UIElements.Main
if mainFrame then
    for _, label in ipairs(mainFrame:GetDescendants()) do
        if label:IsA("TextLabel") and label.Text == "星脚本" then
            local gradient = Instance.new("UIGradient")
            gradient.Name = "TitleRainbow"
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
                ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
                ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
                ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
                ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
                ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
                ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))
            })
            gradient.Rotation = 0
            gradient.Parent = label
            label.TextColor3 = Color3.fromHex("#FFFFFF")
            
            game:GetService("RunService").Heartbeat:Connect(function()
                if gradient and gradient.Parent then
                    gradient.Rotation = (gradient.Rotation + 1.5) % 360
                end
            end)
            break
        end
    end
end

local mainFrame2 = Window.UIElements.Main
if mainFrame2 then
    local stroke = Instance.new("UIStroke")
    stroke.Name = "MainBorder"
    stroke.Thickness = 2
    stroke.Color = Color3.new(1, 1, 1)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Parent = mainFrame2
    
    local gradient = Instance.new("UIGradient")
    gradient.Name = "BorderGradient"
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))
    })
    gradient.Rotation = 0
    gradient.Parent = stroke
    
    game:GetService("RunService").Heartbeat:Connect(function()
        if gradient and gradient.Parent then
            gradient.Rotation = (gradient.Rotation + 1.5) % 360
        end
    end)
end

local TimeTag = Window:Tag({
    Title = "当前时间: 00:00:00",
    Icon = "clock",
    Color = Color3.fromHex("#FFFFFF"),
    Border = true
})

local rainbowGradient = nil

local function setupRainbowText()
    wait(0.5)
    if Window and Window.UIElements then
        local mainFrame = Window.UIElements.Main
        if mainFrame then
            local textLabels = {}
            for _, descendant in ipairs(mainFrame:GetDescendants()) do
                if descendant:IsA("TextLabel") and descendant.Visible then
                    table.insert(textLabels, descendant)
                end
            end
            for _, label in ipairs(textLabels) do
                if label.Text and string.find(label.Text, "当前时间") then
                    local oldGradient = label:FindFirstChild("RainbowTextGradient")
                    if oldGradient then oldGradient:Destroy() end
                    rainbowGradient = Instance.new("UIGradient")
                    rainbowGradient.Name = "RainbowTextGradient"
                    rainbowGradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
                        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
                        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
                        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
                        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
                        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
                        ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))
                    })
                    rainbowGradient.Rotation = 0
                    rainbowGradient.Parent = label
                    label.TextColor3 = Color3.fromHex("#FFFFFF")
                    return
                end
            end
        end
    end
    wait(1)
    setupRainbowText()
end

spawn(setupRainbowText)

local RunService = game:GetService("RunService")
local lastUpdate = 0

RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - lastUpdate >= 0.1 then
        local bjTime = os.date("!%H:%M:%S", os.time() + 28800)
        TimeTag:SetTitle("当前时间: " .. bjTime)
        lastUpdate = now
    end
    if rainbowGradient and rainbowGradient.Parent then
        rainbowGradient.Rotation = (rainbowGradient.Rotation + 1.5) % 360
    end
end)

local originalOpen = Window.Open
Window.Open = function(...)
    local result = originalOpen(...)
    wait(0.5)
    setupRainbowText()
    return result
end

Window:EditOpenButton({
    Title = "<font color='#0000FF'>脚本</font>-<font color='#00FF00'>xx</font> ",
    Icon = "rbxassetid://18941716391",
    CornerRadius = UDim.new(1, 14),  
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))
    })
})

_G.MoveSpeed = {
    Mode = "WalkSpeed",
    Speed = 16,
    Enabled = false
}

_G.MoveSpeedFunctions = {
    start = function()
        print("移动速度已开启，模式：" .. _G.MoveSpeed.Mode .. "，速度：" .. _G.MoveSpeed.Speed)
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = _G.MoveSpeed.Speed
            end
        end
    end,
    stop = function()
        print("移动速度已关闭")
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
}

local MainSection = Window:Section({
    Title = "打开侧边栏",
    Opened = true
})

local about = MainSection:Tab({
    Title = "本地玩家",
    Icon = "rbxassetid://18941716391",
    PremiumOnly = true
})

about:Dropdown({
    Title = "移动模式",
    Values = {"WalkSpeed", "CFrame", "Velocity", "Translate"},
    Value = "WalkSpeed",
    Callback = function(Value)
        _G.MoveSpeed.Mode = Value
        if _G.MoveSpeed.Enabled then
            _G.MoveSpeedFunctions.stop()
            _G.MoveSpeedFunctions.start()
        end
    end
})

about:Slider({
    Title = "设置速度",
    Value = { Min = 1, Max = 600, Default = 16 },
    Callback = function(Value)
        _G.MoveSpeed.Speed = Value
        if _G.MoveSpeed.Enabled then
            _G.MoveSpeedFunctions.start()
        end
    end
})

about:Input({
    Title = "设置速度",
    Value = "",
    PlaceholderText = "输入速度",
    ClearTextOnFocus = false,
    Callback = function(Value)
        local speed = tonumber(Value)
        if speed then
            _G.MoveSpeed.Speed = speed
            if _G.MoveSpeed.Enabled then
                _G.MoveSpeedFunctions.start()
            end
        end
    end
})

about:Toggle({
    Title = "开启/关闭移动速度",
    Default = false,
    Callback = function(Value)
        _G.MoveSpeed.Enabled = Value
        if Value then
            _G.MoveSpeedFunctions.start()
        else
            _G.MoveSpeedFunctions.stop()
        end
    end
})

_G.Jump = {
    Enabled = false,
    JumpPower = 50,
    Mode = "Humanoid",
    Multiplier = 1,
    InfJ = false,
    Connection = nil,
    InfJConnection = nil,
    JumpRequestConnection = nil
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local function getCharacter()
    if LocalPlayer and LocalPlayer.Character then
        return LocalPlayer.Character
    end
    return nil
end

local function getHumanoid()
    local char = getCharacter()
    if char then
        return char:FindFirstChildOfClass("Humanoid")
    end
    return nil
end

local function getRootPart()
    local char = getCharacter()
    if char then
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
    end
    return nil
end

local function checkGrounded()
    local humanoid = getHumanoid()
    if humanoid then
        return humanoid:GetState() == Enum.HumanoidStateType.Landed or 
               humanoid:GetState() == Enum.HumanoidStateType.Running or
               humanoid:GetState() == Enum.HumanoidStateType.Walking
    end
    return false
end

local function humanoidJump(power, multiplier)
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.JumpPower = power * multiplier
    end
end

local function performJump()
    local humanoid = getHumanoid()
    local rootPart = getRootPart()
    if not humanoid or not rootPart or humanoid.Health <= 0 then return end
    if _G.Jump.Mode == "Humanoid" then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    elseif _G.Jump.Mode == "CFrame" then
        local jumpHeight = _G.Jump.JumpPower * _G.Jump.Multiplier * 0.1
        rootPart.CFrame = rootPart.CFrame + Vector3.new(0, jumpHeight, 0)
    elseif _G.Jump.Mode == "Velocity" then
        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, _G.Jump.JumpPower * _G.Jump.Multiplier * 1.5, rootPart.Velocity.Z)
    elseif _G.Jump.Mode == "Infinite" then
        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, _G.Jump.JumpPower * _G.Jump.Multiplier * 1.5, rootPart.Velocity.Z)
    end
end

local function setupJumpRequest()
    if _G.Jump.JumpRequestConnection then
        _G.Jump.JumpRequestConnection:Disconnect()
        _G.Jump.JumpRequestConnection = nil
    end
    if not _G.Jump.Enabled then return end
    _G.Jump.JumpRequestConnection = UserInputService.JumpRequest:Connect(function()
        if not _G.Jump.Enabled then return end
        local humanoid = getHumanoid()
        if not humanoid or humanoid.Health <= 0 then return end
        if not _G.Jump.InfJ and _G.Jump.Mode ~= "Infinite" then
            if not checkGrounded() then return end
        end
        performJump()
    end)
end

local function startJumpLoop()
    if _G.Jump.Connection then
        _G.Jump.Connection:Disconnect()
        _G.Jump.Connection = nil
    end
    if not _G.Jump.Enabled then return end
    setupJumpRequest()
    _G.Jump.Connection = RunService.Heartbeat:Connect(function()
        if not _G.Jump.Enabled then return end
        local humanoid = getHumanoid()
        if not humanoid then return end
        if humanoid.Health <= 0 then return end
        if _G.Jump.Mode == "Humanoid" then
            humanoidJump(_G.Jump.JumpPower, _G.Jump.Multiplier)
        end
    end)
end

local function stopJumpLoop()
    if _G.Jump.Connection then
        _G.Jump.Connection:Disconnect()
        _G.Jump.Connection = nil
    end
    if _G.Jump.InfJConnection then
        _G.Jump.InfJConnection:Disconnect()
        _G.Jump.InfJConnection = nil
    end
    if _G.Jump.JumpRequestConnection then
        _G.Jump.JumpRequestConnection:Disconnect()
        _G.Jump.JumpRequestConnection = nil
    end
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.JumpPower = 50
    end
end

_G.JumpFunctions = {
    start = startJumpLoop,
    stop = stopJumpLoop
}

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if _G.Jump.Enabled then
        stopJumpLoop()
        startJumpLoop()
    end
end)

about:Toggle({
    Title = "开启/关闭跳跃",
    Default = false,
    Callback = function(Value)
        _G.Jump.Enabled = Value
        if Value then
            _G.JumpFunctions.start()
        else
            _G.JumpFunctions.stop()
        end
    end
})

about:Dropdown({
    Title = "跳跃模式",
    Values = {"Humanoid", "CFrame", "Velocity", "Infinite"},
    Value = "Humanoid",
    Callback = function(Value)
        _G.Jump.Mode = Value
        if _G.Jump.Enabled then
            _G.JumpFunctions.stop()
            _G.JumpFunctions.start()
        end
    end
})

about:Slider({
    Title = "设置跳跃高度",
    Value = { Min = 50, Max = 400, Default = 50 },
    Callback = function(Value)
        _G.Jump.JumpPower = Value
    end
})

about:Input({
    Title = "设置跳跃倍数",
    Value = "",
    PlaceholderText = "输入倍数",
    ClearTextOnFocus = false,
    Callback = function(Value)
        local multiplier = tonumber(Value)
        if multiplier and multiplier > 0 then
            _G.Jump.Multiplier = multiplier
        end
    end
})

about:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(Value)
        _G.Jump.InfJ = Value
    end
})

_G.Health = {
    Enabled = false,
    MaxHealthEnabled = false,
    Health = 100,
    MaxHealth = 100,
    Connection = nil
}

local function getCharacter()
    if LocalPlayer and LocalPlayer.Character then
        return LocalPlayer.Character
    end
    return nil
end

local function getHumanoid()
    local char = getCharacter()
    if char then
        return char:FindFirstChildOfClass("Humanoid")
    end
    return nil
end

local function setHealth(value)
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.Health = value
    end
end

local function setMaxHealth(value)
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.MaxHealth = value
    end
end

local function startHealthLoop()
    if _G.Health.Connection then
        _G.Health.Connection:Disconnect()
    end
    _G.Health.Connection = RunService.Heartbeat:Connect(function()
        local humanoid = getHumanoid()
        if not humanoid then return end
        if humanoid.Health <= 0 then return end
        if _G.Health.MaxHealthEnabled then
            setMaxHealth(_G.Health.MaxHealth)
        end
        if _G.Health.Enabled then
            setHealth(_G.Health.Health)
        end
    end)
end

local function stopHealthLoop()
    if _G.Health.Connection then
        _G.Health.Connection:Disconnect()
        _G.Health.Connection = nil
    end
end

_G.HealthFunctions = {
    start = startHealthLoop,
    stop = stopHealthLoop
}

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if _G.Health.Enabled or _G.Health.MaxHealthEnabled then
        stopHealthLoop()
        startHealthLoop()
    end
end)

about:Toggle({
    Title = "开启/关闭血量",
    Default = false,
    Callback = function(Value)
        _G.Health.Enabled = Value
        if _G.Health.Enabled or _G.Health.MaxHealthEnabled then
            _G.HealthFunctions.start()
        else
            _G.HealthFunctions.stop()
        end
    end
})

about:Slider({
    Title = "设置血量",
    Value = { Min = 100, Max = 10000, Default = 100 },
    Callback = function(Value)
        _G.Health.Health = Value
    end
})

about:Input({
    Title = "设置血量",
    Value = "",
    PlaceholderText = "输入血量值",
    ClearTextOnFocus = false,
    Callback = function(Value)
        local health = tonumber(Value)
        if health then
            _G.Health.Health = health
        end
    end
})

about:Toggle({
    Title = "开启/关闭血量上限",
    Default = false,
    Callback = function(Value)
        _G.Health.MaxHealthEnabled = Value
        if _G.Health.Enabled or _G.Health.MaxHealthEnabled then
            _G.HealthFunctions.start()
        else
            _G.HealthFunctions.stop()
        end
    end
})

about:Slider({
    Title = "设置血量上限",
    Value = { Min = 100, Max = 10000, Default = 100 },
    Callback = function(Value)
        _G.Health.MaxHealth = Value
    end
})

about:Input({
    Title = "设置血量上限",
    Value = "",
    PlaceholderText = "输入血量上限值",
    ClearTextOnFocus = false,
    Callback = function(Value)
        local maxHealth = tonumber(Value)
        if maxHealth then
            _G.Health.MaxHealth = maxHealth
        end
    end
})

_G.Gravity = {
    Enabled = false,
    NoGravity = false,
    CurrentGravity = 196.2,
    LoopConnection = nil
}

local function applyGravity()
    if not _G.Gravity.Enabled then return end
    if _G.Gravity.NoGravity then
        game.Workspace.Gravity = 0
    else
        game.Workspace.Gravity = _G.Gravity.CurrentGravity
    end
end

local function resetGravity()
    game.Workspace.Gravity = 196.2
end

local function startGravityLoop()
    if _G.Gravity.LoopConnection then
        _G.Gravity.LoopConnection:Disconnect()
    end
    _G.Gravity.LoopConnection = RunService.Heartbeat:Connect(function()
        applyGravity()
    end)
end

local function stopGravityLoop()
    if _G.Gravity.LoopConnection then
        _G.Gravity.LoopConnection:Disconnect()
        _G.Gravity.LoopConnection = nil
    end
    resetGravity()
end

_G.GravityFunctions = {
    apply = applyGravity,
    reset = resetGravity,
    start = startGravityLoop,
    stop = stopGravityLoop
}

about:Toggle({
    Title = "开启/关闭修改重力",
    Default = false,
    Callback = function(state)
        _G.Gravity.Enabled = state
        if state then
            _G.GravityFunctions.apply()
            _G.GravityFunctions.start()
        else
            _G.GravityFunctions.stop()
        end
    end
})

about:Slider({
    Title = "设置重力值",
    Value = { Min = 0, Max = 1000, Default = 196.2 },
    Callback = function(Value)
        _G.Gravity.CurrentGravity = tonumber(Value) or _G.Gravity.CurrentGravity
        if _G.Gravity.Enabled and not _G.Gravity.NoGravity then
            _G.GravityFunctions.apply()
        end
    end
})

about:Toggle({
    Title = "无重力模式",
    Default = false,
    Callback = function(Value)
        _G.Gravity.NoGravity = Value
        if _G.Gravity.Enabled then
            _G.GravityFunctions.apply()
        end
    end
})

local Lighting = game:GetService("Lighting")
local NightVision = {
    Active = false,
    Brightness = 1,
    OriginalSettings = {
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        Brightness = Lighting.Brightness,
        ClockTime = Lighting.ClockTime
    },
    Connection = nil
}

about:Slider({
    Title = "设置夜视亮度",
    Value = { Min = 1, Max = 30, Default = 1 },
    Callback = function(Value)
        NightVision.Brightness = Value
        if NightVision.Active then
            Lighting.Brightness = Value
        end
    end
})

about:Toggle({
    Title = "开启/关闭夜视",
    Default = false,
    Callback = function(Enabled)
        if NightVision.Connection then
            NightVision.Connection:Disconnect()
            NightVision.Connection = nil
        end
        NightVision.Active = Enabled
        if Enabled then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            Lighting.Brightness = NightVision.Brightness
            Lighting.ClockTime = 12
            NightVision.Connection = RunService.Heartbeat:Connect(function()
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                Lighting.Brightness = NightVision.Brightness
            end)
        else
            for setting, value in pairs(NightVision.OriginalSettings) do
                Lighting[setting] = value
            end
        end
    end
})

_G.Camera = {
    ZoomEnabled = false,
    FOVEnabled = false,
    ZoomDistance = 128,
    FieldOfView = 70,
    Connection = nil
}

local function applyCameraSettings()
    if not LocalPlayer then return end
    if _G.Camera.ZoomEnabled then
        LocalPlayer.CameraMaxZoomDistance = _G.Camera.ZoomDistance
    end
    if _G.Camera.FOVEnabled and game.Workspace.CurrentCamera then
        game.Workspace.CurrentCamera.FieldOfView = _G.Camera.FieldOfView
    end
end

local function resetCameraSettings()
    if LocalPlayer then
        LocalPlayer.CameraMaxZoomDistance = 128
    end
    if game.Workspace.CurrentCamera then
        game.Workspace.CurrentCamera.FieldOfView = 70
    end
end

local function startCameraLoop()
    if _G.Camera.Connection then
        _G.Camera.Connection:Disconnect()
    end
    _G.Camera.Connection = RunService.Heartbeat:Connect(function()
        applyCameraSettings()
    end)
end

local function stopCameraLoop()
    if _G.Camera.Connection then
        _G.Camera.Connection:Disconnect()
        _G.Camera.Connection = nil
    end
    resetCameraSettings()
end

game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    if _G.Camera.FOVEnabled and game.Workspace.CurrentCamera then
        game.Workspace.CurrentCamera.FieldOfView = _G.Camera.FieldOfView
    end
end)

_G.CameraFunctions = {
    apply = applyCameraSettings,
    reset = resetCameraSettings,
    start = startCameraLoop,
    stop = stopCameraLoop
}

about:Toggle({
    Title = "开启/关闭缩放距离",
    Default = false,
    Callback = function(Value)
        _G.Camera.ZoomEnabled = Value
        if _G.Camera.ZoomEnabled or _G.Camera.FOVEnabled then
            _G.CameraFunctions.start()
        else
            _G.CameraFunctions.stop()
        end
    end
})

about:Slider({
    Title = "设置缩放距离",
    Value = { Min = 128, Max = 200000, Default = 128 },
    Callback = function(Value)
        _G.Camera.ZoomDistance = Value
        if _G.Camera.ZoomEnabled then
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
        end
    end
})

about:Toggle({
    Title = "开启/关闭焦距",
    Default = false,
    Callback = function(Value)
        _G.Camera.FOVEnabled = Value
        if _G.Camera.ZoomEnabled or _G.Camera.FOVEnabled then
            _G.CameraFunctions.start()
        else
            _G.CameraFunctions.stop()
        end
    end
})

about:Slider({
    Title = "设置焦距",
    Value = { Min = 0.1, Max = 250, Default = 70 },
    Callback = function(Value)
        _G.Camera.FieldOfView = Value
        if _G.Camera.FOVEnabled and game.Workspace.CurrentCamera then
            game.Workspace.CurrentCamera.FieldOfView = Value
        end
    end
})

local heightConfig = {
    currentHeight = 2,
    originalHeight = 2,
    enabled = false
}

local function applyHeight()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.HipHeight = heightConfig.enabled and heightConfig.currentHeight or heightConfig.originalHeight
    end
end

local function initOriginalHeight()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        heightConfig.originalHeight = char.Humanoid.HipHeight
    end
end

initOriginalHeight()

LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    heightConfig.originalHeight = char.Humanoid.HipHeight
    applyHeight()
end)

about:Input({
    Title = "设置高度",
    Value = "",
    PlaceholderText = "输入高度值",
    ClearTextOnFocus = false,
    Callback = function(value)
        heightConfig.currentHeight = tonumber(value) or heightConfig.currentHeight
        if heightConfig.enabled then applyHeight()
    end
})

about:Toggle({
    Title = "开启/关闭修改高度",
    Default = false,
    Callback = function(state)
        heightConfig.enabled = state
        applyHeight()
    end
})

local Speed = 0
local sudu = nil

about:Input({
    Title = "设置快速跑步",
    Value = "",
    PlaceholderText = "输入速度",
    ClearTextOnFocus = false,
    Callback = function(v)
        Speed = tonumber(v) or 0
    end
})

about:Toggle({
    Title = "开启/关闭快速跑步",
    Default = false,
    Callback = function(v)
        if v == true then
            sudu = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character.Humanoid and LocalPlayer.Character.Humanoid.Parent then
                    if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection * Speed / 0.5)
                    end
                end
            end)
        elseif not v and sudu then
            sudu:Disconnect()
            sudu = nil
        end
    end
})

local about2 = MainSection:Tab({ 
    Title = "通用功能", 
    Icon = "rbxassetid://18941716391",
    PremiumOnly = true
})

about2:Button({
    Title = "隐身道具",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
    end
})

about2:Toggle({
    Title = "循环恢复血量",
    Default = false,
    Callback = function(HF)
        _G.HealLoop = HF
        spawn(function()
            while _G.HealLoop do
                pcall(function()
                    game.Players.LocalPlayer.Character.Humanoid.Health = 9e9
                end)
                task.wait(0.1)
            end
        end)
    end
})

about2:Button({
    Title = "锁定视野",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/nekmtvpA/raw"))()
    end
})

local Cam1 = false
local Cam2 = function()
    while Cam1 do
        wait(0.1)
        game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = 9e9
    end
    while not Cam1 do
        wait(0.1)
        game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = 32
    end
end

about2:Toggle({
    Title = "解锁最大视野",
    Default = false,
    Callback = function(Value)
        Cam1 = Value
        if Cam1 then
            Cam2()
        end
    end
})

about2:Button({
    Title = "查看游戏中的所有玩家（包括血量条）",
    Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/G2zb992X'), true))()
    end
})

about2:Button({
    Title = "工具包",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
})

about2:Button({
    Title = "老外传送至玩家身边",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua'))()
    end
})

about2:Button({
    Title = "点击传送道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Jf2QXOwa/raw"))()
    end
})

local Clipon = false
local Stepped = nil
about2:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(NC)
        Clipon = NC
        if Stepped then Stepped:Disconnect() end
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if not Clipon then return end
            local char = game.Players.LocalPlayer.Character
            if char then
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end
})

about2:Button({
    Title = "皮飞行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/07cdd3eeaf4d4928.txt_2024-08-09_090317.OTed.lua"))()
    end
})

about2:Button({
    Title = "皮飞车",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/Pi-feiche.lua"))()
    end
})

about2:Button({
    Title = "皮自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
    end
})

about2:Button({
    Title = "皮甩飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/%E7%9A%AE%E7%94%A9%E9%A3%9E.lua"))()
    end
})

about2:Button({
    Title = "甩飞所有人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})

about2:Button({
    Title = "死亡笔记",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()
    end
})

about2:Button({
    Title = "铁拳",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
    end
})

about2:Button({
    Title = "电脑键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

local AntiRagdoll = nil
about2:Toggle({
    Title = "防甩飞",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        if state then
            AntiRagdoll = game:GetService("RunService").Stepped:Connect(function()
                for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player and otherPlayer.Character then
                        local char = otherPlayer.Character
                        for _, v in pairs(char:GetDescendants()) do
                            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                                v.CanCollide = false
                                v.Massless = true
                            end
                        end
                        local rootPart = char:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.Massless = true
                        end
                    end
                end
            end)
        else
            if AntiRagdoll then
                AntiRagdoll:Disconnect()
                AntiRagdoll = nil
            end
            for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character then
                    local char = otherPlayer.Character
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                            v.Massless = false
                        end
                    end
                end
            end
        end
    end
})

about2:Toggle({
    Title = "无法移动",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Anchored = state
            end
        end
    end
})

about2:Button({
    Title = "自杀",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

about2:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

about2:Button({
    Title = "通用ESP",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

about2:Button({
    Title = "踢人脚本(仅娱乐)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c8320f69b6aa4f5d.txt_2024-08-08_214628.OTed.lua"))()
    end
})

about2:Button({
    Title = "动画中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end
})

about2:Button({
    Title = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

about2:Button({
    Title = "替身",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
    end
})

about2:Button({
    Title = "碰到就飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
    end
})

about2:Button({
    Title = "操人脚本",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/BkeffrT5/raw"))()
    end
})

about2:Button({
    Title = "圈圈自瞄(可调)",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YnfF3sje/raw"))()
    end
})

about2:Button({
    Title = "iw指令",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
    end
})

about2:Toggle({
    Title = "人物不可见状态(隐身)",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = state and 1 or 0
                part.CanCollide = not state
            elseif part:IsA("Accessory") then
                part.Handle.Transparency = state and 1 or 0
            end
        end
    end
})

local getBackpackRunning = false
about2:Toggle({
    Title = "获取所有玩家背包道具",
    Default = false,
    Callback = function(state)
        getBackpackRunning = state
        if state then
            task.spawn(function()
                while getBackpackRunning do
                    for _, player in ipairs(game.Players:GetPlayers()) do
                        if not getBackpackRunning then break end
                        if player ~= game.Players.LocalPlayer then
                            for _, item in ipairs(player.Backpack:GetChildren()) do
                                if not getBackpackRunning then break end
                                pcall(function()
                                    item.Parent = game.Players.LocalPlayer.Backpack
                                end)
                                task.wait()
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

about2:Button({
    Title = "获取所有玩家道具",
    Callback = function()
        for i, v in pairs(game.Players:GetChildren()) do
            wait()
            for i, b in pairs(v.Backpack:GetChildren()) do
                b.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
})

about2:Button({
    Title = "获取当前道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/3FU05Dyt/raw"))()
    end
})

about2:Button({
    Title = "装备全部道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uBqVR9JC/raw"))()
    end
})

about2:Button({
    Title = "删除道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/r4LHK4p0/raw"))()
    end
})

about2:Button({
    Title = "删除所有道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/8HB71Lbj/raw"))()
    end
})

local maxDistance = 10
about2:Input({
    Title = "互动距离",
    Value = "",
    PlaceholderText = "输入(默认10米)",
    ClearTextOnFocus = false,
    Callback = function(text)
        local distance = tonumber(text)
        if distance and distance > 0 then
            maxDistance = distance
        else
            warn("请输入有效的距离数值")
        end
    end
})

local autoInteract = false
about2:Toggle({
    Title = "自动互动",
    Default = false,
    Callback = function(state)
        autoInteract = state
        while autoInteract do
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local playerPosition = character.HumanoidRootPart.Position
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        local objectPosition = descendant.Parent and descendant.Parent:IsA("BasePart") and descendant.Parent.Position
                        if objectPosition then
                            local distance = (playerPosition - objectPosition).Magnitude
                            if distance <= maxDistance then
                                fireproximityprompt(descendant)
                            end
                        else
                            fireproximityprompt(descendant)
                        end
                    end
                end
            end
            task.wait(0.25)
        end
    end
})

local customHoldDuration = 0
about2:Input({
    Title = "互动时间",
    Value = "",
    PlaceholderText = "输入(默认0秒)",
    ClearTextOnFocus = false,
    Callback = function(text)
        local duration = tonumber(text)
        if duration and duration >= 0 then
            customHoldDuration = duration
        else
            warn("请输入有效的时间数值")
        end
    end
})

local promptConnection = nil
about2:Toggle({
    Title = "快速互动",
    Default = false,
    Callback = function(Value)
        if Value then
            promptConnection = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(v)
                v.HoldDuration = customHoldDuration
            end)
        else
            if promptConnection then
                promptConnection:Disconnect()
                promptConnection = nil
            end
        end
    end
})

local xrayOn = false
local function toggleXRay()
    xrayOn = not xrayOn
    for i, descendant in pairs(workspace:GetDescendants()) do
        if descendant:IsA("BasePart") then
            if xrayOn then
                if not descendant:FindFirstChild("OriginalTransparency") then
                    local originalTransparency = Instance.new("NumberValue")
                    originalTransparency.Name = "OriginalTransparency"
                    originalTransparency.Value = descendant.Transparency
                    originalTransparency.Parent = descendant
                end
                descendant.Transparency = 0.5
            else
                if descendant:FindFirstChild("OriginalTransparency") then
                    descendant.Transparency = descendant.OriginalTransparency.Value
                end
            end
        end
    end
end

about2:Toggle({
    Title = "X-Ray",
    Default = false,
    Callback = function(Value)
        if Value then
            toggleXRay()
        else
            toggleXRay()
        end
    end
})

about2:Toggle({
    Title = "无限跳",
    Default = false,
    Callback = function(IJ)
        _G.InfJ = IJ
        game:GetService("UserInputService").JumpRequest:connect(function()
            if _G.InfJ == true then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
            end
        end)
    end
})

about2:Toggle({
    Title = "上帝模式",
    Default = false,
    Callback = function(Value)
        if Value then
            local LP = game:GetService("Players").LocalPlayer
            local HRP = LP.Character and LP.Character.HumanoidRootPart
            local Clone = HRP:Clone()
            Clone.Parent = LP.Character
        else
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end
})

about2:Button({
    Title = "聊天气泡美化",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/lCEPuiQO/raw"))()
    end
})

about2:Toggle({
    Title = "靠近敌人自动攻击[需要先装备武器]",
    Default = false,
    Callback = function(state)
        if state then
            local connections = _G.configs and _G.configs.connections
            if connections then
                local Disable = _G.configs.Disable
                for _, v in pairs(connections) do
                    v:Disconnect()
                end
                Disable:Fire()
                Disable:Destroy()
                table.clear(_G.configs)
            end
            
            local Disable = Instance.new("BindableEvent")
            _G.configs = {
                connections = {},
                Disable = Disable,
                Size = Vector3.new(10, 10, 10),
                DeathCheck = true
            }
            
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local lp = Players.LocalPlayer
            local Run = true
            local Ignorelist = OverlapParams.new()
            Ignorelist.FilterType = Enum.RaycastFilterType.Include
            
            local function getchar(plr)
                plr = plr or lp
                return plr.Character
            end
            
            local function gethumanoid(plr)
                local char = plr:IsA("Model") and plr or getchar(plr)
                if char then
                    return char:FindFirstChildWhichIsA("Humanoid")
                end
            end
            
            local function IsAlive(Humanoid)
                return Humanoid and Humanoid.Health > 0
            end
            
            local function GetTouchInterest(Tool)
                return Tool and Tool:FindFirstChildWhichIsA("TouchTransmitter", true)
            end
            
            local function GetCharacters(LocalPlayerChar)
                local Characters = {}
                for _, v in pairs(Players:GetPlayers()) do
                    table.insert(Characters, getchar(v))
                end
                for i, char in pairs(Characters) do
                    if char == LocalPlayerChar then
                        table.remove(Characters, i)
                        break
                    end
                end
                return Characters
            end
            
            local function Attack(Tool, TouchPart, ToTouch)
                if Tool:IsDescendantOf(workspace) then
                    Tool:Activate()
                    firetouchinterest(TouchPart, ToTouch, 1)
                    firetouchinterest(TouchPart, ToTouch, 0)
                end
            end
            
            table.insert(_G.configs.connections, Disable.Event:Connect(function()
                Run = false
            end))
            
            while Run do
                local char = getchar()
                if IsAlive(gethumanoid(char)) then
                    local Tool = char and char:FindFirstChildWhichIsA("Tool")
                    local TouchInterest = Tool and GetTouchInterest(Tool)
                    
                    if TouchInterest then
                        local TouchPart = TouchInterest.Parent
                        local Characters = GetCharacters(char)
                        Ignorelist.FilterDescendantsInstances = Characters
                        local InstancesInBox = workspace:GetPartBoundsInBox(TouchPart.CFrame, TouchPart.Size + _G.configs.Size, Ignorelist)
                        
                        for _, v in pairs(InstancesInBox) do
                            local Character = v:FindFirstAncestorWhichIsA("Model")
                            if table.find(Characters, Character) then
                                if _G.configs.DeathCheck and IsAlive(gethumanoid(Character)) then
                                    Attack(Tool, TouchPart, v)
                                elseif not _G.configs.DeathCheck then
                                    Attack(Tool, TouchPart, v)
                                end
                            end
                        end
                    end
                end
                RunService.Heartbeat:Wait()
            end
        else
            local Disable = _G.configs.Disable
            if Disable then
                Disable:Fire()
                Disable:Destroy()
            end
            for _, connection in pairs(_G.configs.connections) do
                connection:Disconnect()
            end
            table.clear(_G.configs.connections)
            Run = false
        end
    end
})

about2:Toggle({
    Title = "坐下",
    Default = false,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Sit = Value
    end
})

local function spamSound()
    while _G.spamSoond == true do
        local class_check = game.IsA
        local sound = Instance.new('Sound')
        local sound_stop = sound.Play
        local get_descendants = game.GetDescendants
        for i, v in next, get_descendants(game) do
            if class_check(v, "Sound") then
                sound_stop(v)
            end
        end
        get_descendants = nil
        sound:Remove()
        get_descendants = nil
        sound_stop = nil
        task.wait()
    end
end

about2:Toggle({
    Title = "声音折磨",
    Default = false,
    Callback = function(bool)
        _G.spamSoond = bool
        if bool then
            spawn(spamSound)
        end
    end
})

local Break = false
about2:Toggle({
    Title = "七彩建筑",
    Default = false,
    Callback = function(Value)
        if Value then
            Break = false
            local BaseParts = {}
            local Mats = Enum.Material:GetEnumItems()
            for i, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    table.insert(BaseParts, v)
                end
            end
            game.Workspace.DescendantAdded:Connect(function(v)
                if v:IsA("BasePart") then
                    table.insert(BaseParts, v)
                end
            end)
            spawn(function()
                while task.wait(0.025) do
                    if Break then break end
                    for i, v in pairs(BaseParts) do
                        v.Material = Mats[math.random(1, #Mats)]
                        v.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                    end
                end
            end)
        else
            Break = true
        end
    end
})

local enabled = false
local deathPos = nil
local waitTime = 0

about2:Input({
    Title = "等待时间(秒)",
    Value = "",
    PlaceholderText = "输入(默认0秒)",
    ClearTextOnFocus = false,
    Callback = function(time)
        waitTime = tonumber(time) or 0
    end
})

about2:Toggle({
    Title = "原地复活",
    Default = false,
    Callback = function(state)
        enabled = state
    end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    if enabled and deathPos then
        wait(waitTime)
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(deathPos)
        end
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        if enabled then
            deathPos = char.HumanoidRootPart.Position
        end
    end)
end)

about2:Button({
    Title = "人物螺旋上天",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/xV1T3PAi/raw"))()
    end
})

about2:Button({
    Title = "无限R币",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/SxhPVOyM/raw"))()
    end
})

local originalChatVisible = nil
local heartbeatConnection = nil
local chatEnabled = false

about2:Toggle({
    Title = "显示聊天框",
    Default = false,
    Callback = function(state)
        chatEnabled = state
        if state then
            if originalChatVisible == nil then
                originalChatVisible = game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
            end
            game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
            if heartbeatConnection then heartbeatConnection:Disconnect() end
            heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
            end)
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
            if originalChatVisible ~= nil then
                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, originalChatVisible)
            else
                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
            end
        end
    end
})

about2:Button({
    Title = "获得管理员权限",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
    end
})

about2:Button({
    Title = "显示时间",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/RycMWV3a"))()
    end
})

about2:Button({
    Title = "F3X",
    Callback = function()
        loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end
})

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
local notifyEnabled = false
local playerAddedConn = nil
local playerRemovedConn = nil

about2:Toggle({
    Title = "玩家进出服务器通知",
    Default = false,
    Callback = function(state)
        notifyEnabled = state
        if playerAddedConn then playerAddedConn:Disconnect() end
        if playerRemovedConn then playerRemovedConn:Disconnect() end
        if state then
            playerAddedConn = game.Players.ChildAdded:Connect(function(player)
                pcall(function()
                    if notifyEnabled then
                        NotificationLibrary:SendNotification("Success", player.Name .. " 加入了游戏", 5)
                    end
                end)
            end)
            playerRemovedConn = game.Players.ChildRemoved:Connect(function(player)
                pcall(function()
                    if notifyEnabled then
                        NotificationLibrary:SendNotification("Error", player.Name .. " 离开了游戏", 5)
                    end
                end)
            end)
        end
    end
})