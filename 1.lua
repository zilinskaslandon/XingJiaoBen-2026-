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
    Title = "皮脚本",
    Icon = "rbxassetid://18941716391",
    IconThemed = true,
    Author = "<font color='#FFFFFF'>作者: 小皮</font>",
    Folder = "皮脚本",
    Size = UDim2.fromOffset(300, 270),
    Transparent = true,
    Theme = "Dark",
    BackgroundImageTransparency = 0.4,
    User = {
        Enabled = true,
        Callback = function() end,
        Anonymous = true
    },
    SideBarWidth = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    Background = "https://raw.githubusercontent.com/zilinskaslandon/zzzzzzzzzzz/refs/heads/main/111785626782282.jpg"
})

task.wait(0.5)

-- ==================== UI美化部分 ====================

local mainFrame = Window.UIElements.Main
if mainFrame then
    for _, label in ipairs(mainFrame:GetDescendants()) do
        if label:IsA("TextLabel") and label.Text == "皮脚本" then
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

if mainFrame then
    local stroke = Instance.new("UIStroke")
    stroke.Name = "MainBorder"
    stroke.Thickness = 2
    stroke.Color = Color3.new(1, 1, 1)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Parent = mainFrame
    
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

Window:EditOpenButton({
    Title = "<font color='#0000FF'>皮</font>-<font color='#00FF00'>脚</font><font color='#FF0000'>本</font> ",
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

-- ==================== 工具函数 ====================

local function Notify(title, text, duration)
    pcall(function()
        local notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/Roblox-Pi-Script-Notification.lua"))()
        if notification then
            notification:Notification({
                Title = title or "皮脚本",
                Text = text or "",
                Icon = "rbxassetid://18941716391",
                Duration = duration or 3
            })
        end
    end)
end

local function SendNotification(top, text, ico, dur)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = top or "皮脚本",
        Text = text or "",
        Icon = ico or "rbxassetid://18941716391",
        Duration = dur or 3,
    })
end

local function setclipboard_safe(text)
    pcall(function()
        setclipboard(text)
    end)
end

-- ==================== 防挂机 ====================

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

Notify("皮脚本", "已自动开启防挂机 感谢您使用皮脚本 祝您使用愉快 玩的开心", 4)

-- ==================== 全局变量初始化 ====================

-- Metatable保护（保留原有逻辑）
local startTime = tick()
local function run(func) func() end

run(function()
    _G.MetatableConfig = {
        playersService = game:GetService("Players"),
        mt = getrawmetatable(game),
        oldIndex = nil,
        oldNamecall = nil
    }
end)

run(function()
    local config = _G.MetatableConfig
    local mt = config.mt
    local oldIndex = mt.__index
    setreadonly(mt, false)
    mt.__index = function(s, k)
        if s == game and k == "Players" then
            return config.playersService
        end
        if type(oldIndex) == "table" then
            return oldIndex[k]
        elseif type(oldIndex) == "function" then
            return oldIndex(s, k)
        end
    end
    setreadonly(mt, true)
end)

run(function()
    local config = _G.MetatableConfig
    local mt = config.mt
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" then end
        if type(oldNamecall) == "function" then
            return oldNamecall(self, ...)
        elseif type(oldNamecall) == "table" then
            return oldNamecall[method](self, ...)
        end
    end
    setreadonly(mt, true)
end)

run(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall
    mt.__namecall = function(self, ...)
        local method = getnamecallmethod()
        if method == "checkcaller" then
            return false
        end
        return oldNamecall(self, ...)
    end
    if checkcaller then
        _G.checkcaller = function() return false end
    end
    setreadonly(mt, true)
end)

run(function()
    local original_getrawmetatable = getrawmetatable
    local clean_mt = getrawmetatable(game)
    getrawmetatable = function(obj)
        if obj == game then
            return clean_mt
        end
        return original_getrawmetatable(obj)
    end
end)

-- ==================== 创建主标签页 ====================

local MainSection = Window:Section({
    Title = "信息",
    Opened = true
})

-- ==================== Tab: 信息 ====================
local InfoTab = MainSection:Tab({
    Title = "信息",
    Icon = "rbxassetid://18941716391"
})

-- 用户信息部分
local userSection = InfoTab:Divider({
    Title = "用户信息"
})

-- 用户信息变量
_G.UserInfoServices = {
    Players = game:GetService("Players"),
    LocalPlayer = game:GetService("Players").LocalPlayer,
    RbxAnalyticsService = game:GetService("RbxAnalyticsService"),
    LocalizationService = game:GetService("LocalizationService"),
    RunService = game:GetService("RunService"),
    Stats = game:GetService("Stats")
}

_G.UserInfoConfig = {
    dataFetched = {
        displayName = false,
        userName = false,
        userId = false,
        clientId = false,
        region = false,
        language = false,
        accountAge = false,
        executor = false,
        gameId = false,
        placeId = false,
        totalPlayers = false,
        ping = false,
        fps = false,
        xpTime = false
    }
}

-- 创建用户信息标签（用Label展示）
local displayNameLabel = userSection:Label("您的用户昵称: 暂无数据")
local userNameLabel = userSection:Label("您的用户名: 暂无数据")
local userIdLabel = userSection:Label("您的用户ID: 暂无数据")
local clientIdLabel = userSection:Label("您的客户端ID: 暂无数据")
local regionLabel = userSection:Label("您的地区: 暂无数据")
local languageLabel = userSection:Label("您的语言: 暂无数据")
local accountAgeDaysLabel = userSection:Label("您的账户年龄(天): 暂无数据")
local accountAgeYearsLabel = userSection:Label("您的账户年龄(年): 暂无数据")
local executorLabel = userSection:Label("您使用的注入器: 暂无数据")
local gameIdLabel = userSection:Label("您当前服务器的ID: 暂无数据")
local placeIdLabel = userSection:Label("您当前的服务器位置ID: 暂无数据")
local totalPlayersLabel = userSection:Label("当前服务器总人数: 0")
local pingLabel = userSection:Label("您的Ping: 0")
local fpsLabel = userSection:Label("您的FPS: 0")
local xpTimeLabel = userSection:Label("XP时间: 00:00:00")

_G.UserInfoLabels = {
    displayName = displayNameLabel,
    userName = userNameLabel,
    userId = userIdLabel,
    clientId = clientIdLabel,
    region = regionLabel,
    language = languageLabel,
    accountAgeDays = accountAgeDaysLabel,
    accountAgeYears = accountAgeYearsLabel,
    executor = executorLabel,
    gameId = gameIdLabel,
    placeId = placeIdLabel,
    totalPlayers = totalPlayersLabel,
    ping = pingLabel,
    fps = fpsLabel,
    xpTime = xpTimeLabel
}

-- 更新用户信息
local function updateUserInfo()
    local Players = _G.UserInfoServices.Players
    local LocalPlayer = _G.UserInfoServices.LocalPlayer
    local RbxAnalyticsService = _G.UserInfoServices.RbxAnalyticsService
    local LocalizationService = _G.UserInfoServices.LocalizationService
    local Stats = _G.UserInfoServices.Stats
    local labels = _G.UserInfoLabels
    local dataFetched = _G.UserInfoConfig.dataFetched

    pcall(function()
        if not dataFetched.displayName and LocalPlayer.DisplayName then
            labels.displayName:SetTitle("您的用户昵称: " .. LocalPlayer.DisplayName)
            dataFetched.displayName = true
        end
    end)

    pcall(function()
        if not dataFetched.userName and LocalPlayer.Name then
            labels.userName:SetTitle("您的用户名: " .. LocalPlayer.Name)
            dataFetched.userName = true
        end
    end)

    pcall(function()
        if not dataFetched.userId and LocalPlayer.UserId then
            labels.userId:SetTitle("您的用户ID: " .. LocalPlayer.UserId)
            dataFetched.userId = true
        end
    end)

    pcall(function()
        if not dataFetched.clientId then
            local clientId = RbxAnalyticsService:GetClientId()
            if clientId and clientId ~= "" then
                labels.clientId:SetTitle("您的客户端ID: " .. clientId)
                dataFetched.clientId = true
            end
        end
    end)

    pcall(function()
        if not dataFetched.region then
            local region = LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer)
            if region and region ~= "" then
                labels.region:SetTitle("您的地区: " .. region)
                dataFetched.region = true
            end
        end
    end)

    pcall(function()
        if not dataFetched.language and LocalPlayer.LocaleId then
            labels.language:SetTitle("您的语言: " .. LocalPlayer.LocaleId)
            dataFetched.language = true
        end
    end)

    pcall(function()
        if not dataFetched.accountAge and LocalPlayer.AccountAge then
            labels.accountAgeDays:SetTitle("您的账户年龄(天): " .. LocalPlayer.AccountAge)
            local years = math.floor(LocalPlayer.AccountAge / 365 * 100) / 100
            labels.accountAgeYears:SetTitle("您的账户年龄(年): " .. years)
            dataFetched.accountAge = true
        end
    end)

    pcall(function()
        if not dataFetched.executor then
            local executor = identifyexecutor()
            if executor and executor ~= "" then
                labels.executor:SetTitle("您使用的注入器: " .. executor)
                dataFetched.executor = true
            end
        end
    end)

    pcall(function()
        if not dataFetched.gameId and game.GameId then
            labels.gameId:SetTitle("您当前服务器的ID: " .. game.GameId)
            dataFetched.gameId = true
        end
    end)

    pcall(function()
        if not dataFetched.placeId and game.PlaceId then
            labels.placeId:SetTitle("您当前的服务器位置ID: " .. game.PlaceId)
            dataFetched.placeId = true
        end
    end)

    -- 总人数
    local total = #Players:GetPlayers()
    labels.totalPlayers:SetTitle("当前服务器总人数: " .. total)
    dataFetched.totalPlayers = true
end)

-- 实时更新Ping/FPS/时间
local lastTime = os.clock()
local colors = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 127, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(75, 0, 130),
    Color3.fromRGB(148, 0, 211)
}
local colorIndex = 0

game:GetService("RunService").Heartbeat:Connect(function()
    local Stats = _G.UserInfoServices.Stats
    local labels = _G.UserInfoLabels
    
    pcall(function()
        local pingValue = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        labels.ping:SetTitle("您的Ping: " .. math.round(pingValue))
    end)

    local currentTime = os.clock()
    local fpsValue = 1 / (currentTime - lastTime)
    labels.fps:SetTitle("您的FPS: " .. math.floor(fpsValue))
    lastTime = currentTime

    local timeStr = os.date("%H:%M:%S")
    labels.xpTime:SetTitle("XP时间: " .. timeStr)
end)

-- 监听玩家进出更新人数
local Players = _G.UserInfoServices.Players
Players.PlayerAdded:Connect(updateUserInfo)
Players.PlayerRemoving:Connect(updateUserInfo)

-- 初始更新
updateUserInfo()

-- 作者信息部分
local authorSection = InfoTab:Divider({
    Title = "作者信息"
})

authorSection:Label("皮脚本")
authorSection:Label("永不跑路的脚本")
authorSection:Label("作者: 小皮")
authorSection:Label("作者QQ: 2131869117")
authorSection:Label("皮脚本帮助者: 月星")
authorSection:Label("皮脚本QQ主群: 1065725086")
authorSection:Label("皮脚本QQ副群: 1094888646")
authorSection:Label("皮脚本QQ二群: 648817035")
authorSection:Label("皮脚本QQ三群: 1097247407")
authorSection:Label("皮脚本团建群: 1081584861")
authorSection:Label("皮脚本举报恶俗群: 1084719838")
authorSection:Label("皮脚本二周年晚会群: 753828002")
authorSection:Label("皮脚本DC社区: https://discord.gg/UKmaahNu8m")
authorSection:Label("皮脚本TG群组: https://t.me/pijiaoben")

authorSection:Button({
    Title = "复制作者QQ",
    Callback = function()
        setclipboard_safe("2131869117")
        Notify("皮脚本", "已复制作者QQ", 2)
    end
})

local itemsMap = {
    ["皮脚本QQ主群"] = "1065725086",
    ["皮脚本QQ副群"] = "1094888646",
    ["皮脚本QQ二群"] = "648817035",
    ["皮脚本QQ三群"] = "1097247407",
    ["皮脚本团建群"] = "1081584861",
    ["皮脚本举报恶俗群"] = "1084719838",
    ["皮脚本二周年晚会群"] = "753828002",
    ["皮脚本DC社区"] = "https://discord.gg/UKmaahNu8m",
    ["皮脚本TG群组"] = "https://t.me/pijiaoben"
}

local selectedItem = nil
local groupDropdown = authorSection:Dropdown({
    Title = "选择群号/链接",
    Values = {
        "皮脚本QQ主群",
        "皮脚本QQ副群",
        "皮脚本QQ二群",
        "皮脚本QQ三群",
        "皮脚本团建群",
        "皮脚本举报恶俗群",
        "皮脚本二周年晚会群",
        "皮脚本DC社区",
        "皮脚本TG群组"
    },
    Value = "皮脚本QQ主群",
    Callback = function(value)
        selectedItem = value
    end
})

authorSection:Button({
    Title = "复制群号/链接",
    Callback = function()
        if selectedItem then
            local content = itemsMap[selectedItem]
            if content then
                setclipboard_safe(content)
                Notify("皮脚本", "已复制: " .. selectedItem, 2)
            end
        end
    end
})

local helpSection = InfoTab:Divider({
    Title = "最大帮助者"
})
helpSection:Label("十分感谢月星对我的支持与帮助")
helpSection:Label("给我提供了许多的功能源码")
helpSection:Label("谢谢您的支持与帮助^ω^")

local uiSection = InfoTab:Divider({
    Title = "UI设置"
})

uiSection:Button({
    Title = "关闭脚本UI",
    Callback = function()
        game:GetService("CoreGui")["XPXPXPNBNB"]:Destroy()
    end
})

uiSection:Keybind({
    Title = "切换用户界面",
    Default = "Home",
    Callback = function(key)
        -- ToggleUILib函数由UI框架提供
    end
})

-- ==================== Tab: 本地玩家 ====================
local PlayerTab = MainSection:Tab({
    Title = "本地玩家",
    Icon = "rbxassetid://18941716391"
})

-- 速度
local speedSection = PlayerTab:Divider({
    Title = "速度"
})

_G.MoveSpeed = {
    Enabled = false,
    Speed = 16,
    Mode = "WalkSpeed",
    Connection = nil
}

local function getCharacter()
    local lp = game:GetService("Players").LocalPlayer
    if lp and lp.Character then return lp.Character end
    return nil
end

local function getHumanoid()
    local char = getCharacter()
    if char then return char:FindFirstChildOfClass("Humanoid") end
    return nil
end

local function getRootPart()
    local char = getCharacter()
    if char then
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
    end
    return nil
end

local function startMoveLoop()
    if _G.MoveSpeed.Connection then
        _G.MoveSpeed.Connection:Disconnect()
    end
    _G.MoveSpeed.Connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not _G.MoveSpeed.Enabled then return end
        local humanoid = getHumanoid()
        local rootPart = getRootPart()
        if not humanoid or not rootPart then return end
        if humanoid.Health <= 0 then return end
        
        if _G.MoveSpeed.Mode == "WalkSpeed" then
            humanoid.WalkSpeed = _G.MoveSpeed.Speed
        elseif _G.MoveSpeed.Mode == "CFrame" or _G.MoveSpeed.Mode == "Translate" then
            local moveDirection = humanoid.MoveDirection
            if moveDirection.Magnitude > 0 then
                rootPart.CFrame = rootPart.CFrame + (moveDirection * _G.MoveSpeed.Speed * 0.1)
            end
        elseif _G.MoveSpeed.Mode == "Velocity" then
            local moveDirection = humanoid.MoveDirection
            if moveDirection.Magnitude > 0 then
                rootPart.Velocity = Vector3.new(
                    moveDirection.X * _G.MoveSpeed.Speed,
                    rootPart.Velocity.Y,
                    moveDirection.Z * _G.MoveSpeed.Speed
                )
            end
        end
    end)
end

local function stopMoveLoop()
    if _G.MoveSpeed.Connection then
        _G.MoveSpeed.Connection:Disconnect()
        _G.MoveSpeed.Connection = nil
    end
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = 16
    end
end

speedSection:Dropdown({
    Title = "移动模式",
    Values = {"WalkSpeed", "CFrame", "Velocity", "Translate"},
    Value = "WalkSpeed",
    Callback = function(value)
        _G.MoveSpeed.Mode = value
        if _G.MoveSpeed.Enabled then
            stopMoveLoop()
            startMoveLoop()
        end
    end
})

speedSection:Slider({
    Title = "设置速度",
    Value = { Min = 1, Max = 600, Default = 16 },
    Callback = function(value)
        _G.MoveSpeed.Speed = value
    end
})

speedSection:Input({
    Title = "设置速度(输入)",
    Value = "",
    PlaceholderText = "输入速度数值",
    Callback = function(text)
        local speed = tonumber(text)
        if speed then
            _G.MoveSpeed.Speed = speed
        end
    end
})

speedSection:Toggle({
    Title = "开启/关闭移动速度",
    Default = false,
    Callback = function(value)
        _G.MoveSpeed.Enabled = value
        if value then
            startMoveLoop()
        else
            stopMoveLoop()
        end
    end
})

-- 跳跃
local jumpSection = PlayerTab:Divider({
    Title = "跳跃"
})

_G.Jump = {
    Enabled = false,
    JumpPower = 50,
    Mode = "Humanoid",
    Multiplier = 1,
    InfJ = false,
    Connection = nil,
    JumpRequestConnection = nil
}

local function performJump()
    local humanoid = getHumanoid()
    local rootPart = getRootPart()
    if not humanoid or not rootPart or humanoid.Health <= 0 then return end
    
    if _G.Jump.Mode == "Humanoid" then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    elseif _G.Jump.Mode == "CFrame" then
        local jumpHeight = _G.Jump.JumpPower * _G.Jump.Multiplier * 0.1
        rootPart.CFrame = rootPart.CFrame + Vector3.new(0, jumpHeight, 0)
    elseif _G.Jump.Mode == "Velocity" or _G.Jump.Mode == "Infinite" then
        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, _G.Jump.JumpPower * _G.Jump.Multiplier * 1.5, rootPart.Velocity.Z)
    end
end

local function setupJumpRequest()
    if _G.Jump.JumpRequestConnection then
        _G.Jump.JumpRequestConnection:Disconnect()
    end
    if not _G.Jump.Enabled then return end
    _G.Jump.JumpRequestConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
        if not _G.Jump.Enabled then return end
        local humanoid = getHumanoid()
        if not humanoid or humanoid.Health <= 0 then return end
        performJump()
    end)
end

local function startJumpLoop()
    if _G.Jump.Connection then
        _G.Jump.Connection:Disconnect()
    end
    if not _G.Jump.Enabled then return end
    setupJumpRequest()
    _G.Jump.Connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not _G.Jump.Enabled then return end
        local humanoid = getHumanoid()
        if not humanoid or humanoid.Health <= 0 then return end
        if _G.Jump.Mode == "Humanoid" then
            humanoid.JumpPower = _G.Jump.JumpPower * _G.Jump.Multiplier
        end
    end)
end

local function stopJumpLoop()
    if _G.Jump.Connection then
        _G.Jump.Connection:Disconnect()
        _G.Jump.Connection = nil
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

jumpSection:Toggle({
    Title = "开启/关闭跳跃",
    Default = false,
    Callback = function(value)
        _G.Jump.Enabled = value
        if value then
            startJumpLoop()
        else
            stopJumpLoop()
        end
    end
})

jumpSection:Dropdown({
    Title = "跳跃模式",
    Values = {"Humanoid", "CFrame", "Velocity", "Infinite"},
    Value = "Humanoid",
    Callback = function(value)
        _G.Jump.Mode = value
        if _G.Jump.Enabled then
            stopJumpLoop()
            startJumpLoop()
        end
    end
})

jumpSection:Slider({
    Title = "设置跳跃高度",
    Value = { Min = 50, Max = 400, Default = 50 },
    Callback = function(value)
        _G.Jump.JumpPower = value
    end
})

jumpSection:Input({
    Title = "设置跳跃倍数",
    Value = "",
    PlaceholderText = "输入倍数",
    Callback = function(text)
        local multiplier = tonumber(text)
        if multiplier and multiplier > 0 then
            _G.Jump.Multiplier = multiplier
        end
    end
})

jumpSection:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(value)
        _G.Jump.InfJ = value
    end
})

-- 血量
local healthSection = PlayerTab:Divider({
    Title = "血量"
})

_G.Health = {
    Enabled = false,
    MaxHealthEnabled = false,
    Health = 100,
    MaxHealth = 100,
    Connection = nil
}

local function healthLoop()
    if _G.Health.Connection then
        _G.Health.Connection:Disconnect()
    end
    _G.Health.Connection = game:GetService("RunService").Heartbeat:Connect(function()
        local humanoid = getHumanoid()
        if not humanoid or humanoid.Health <= 0 then return end
        if _G.Health.MaxHealthEnabled then
            humanoid.MaxHealth = _G.Health.MaxHealth
        end
        if _G.Health.Enabled then
            humanoid.Health = _G.Health.Health
        end
    end)
end

local function stopHealthLoop()
    if _G.Health.Connection then
        _G.Health.Connection:Disconnect()
        _G.Health.Connection = nil
    end
end

healthSection:Toggle({
    Title = "开启/关闭血量",
    Default = false,
    Callback = function(value)
        _G.Health.Enabled = value
        if _G.Health.Enabled or _G.Health.MaxHealthEnabled then
            healthLoop()
        else
            stopHealthLoop()
        end
    end
})

healthSection:Slider({
    Title = "设置血量",
    Value = { Min = 100, Max = 10000, Default = 100 },
    Callback = function(value)
        _G.Health.Health = value
    end
})

healthSection:Input({
    Title = "设置血量(输入)",
    Value = "",
    PlaceholderText = "输入血量值",
    Callback = function(text)
        local health = tonumber(text)
        if health then
            _G.Health.Health = health
        end
    end
})

healthSection:Toggle({
    Title = "开启/关闭血量上限",
    Default = false,
    Callback = function(value)
        _G.Health.MaxHealthEnabled = value
        if _G.Health.Enabled or _G.Health.MaxHealthEnabled then
            healthLoop()
        else
            stopHealthLoop()
        end
    end
})

healthSection:Slider({
    Title = "设置血量上限",
    Value = { Min = 100, Max = 10000, Default = 100 },
    Callback = function(value)
        _G.Health.MaxHealth = value
    end
})

healthSection:Input({
    Title = "设置血量上限(输入)",
    Value = "",
    PlaceholderText = "输入血量上限值",
    Callback = function(text)
        local maxHealth = tonumber(text)
        if maxHealth then
            _G.Health.MaxHealth = maxHealth
        end
    end
})

-- 高度
local heightSection = PlayerTab:Divider({
    Title = "高度"
})

local heightConfig = {
    currentHeight = 2,
    originalHeight = 2,
    enabled = false
}

local function applyHeight()
    local char = getCharacter()
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.HipHeight = heightConfig.enabled and heightConfig.currentHeight or heightConfig.originalHeight
    end
end

local function initOriginalHeight()
    local char = getCharacter()
    if char and char:FindFirstChild("Humanoid") then
        heightConfig.originalHeight = char.Humanoid.HipHeight
    end
end

initOriginalHeight()

heightSection:Input({
    Title = "设置高度",
    Value = "",
    PlaceholderText = "输入高度值",
    Callback = function(text)
        heightConfig.currentHeight = tonumber(text) or heightConfig.currentHeight
        if heightConfig.enabled then applyHeight() end
    end
})

heightSection:Toggle({
    Title = "开启/关闭修改高度",
    Default = false,
    Callback = function(value)
        heightConfig.enabled = value
        applyHeight()
    end
})

-- 重力
local gravitySection = PlayerTab:Divider({
    Title = "重力"
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
        workspace.Gravity = 0
    else
        workspace.Gravity = _G.Gravity.CurrentGravity
    end
end

local function resetGravity()
    workspace.Gravity = 196.2
end

local function startGravityLoop()
    if _G.Gravity.LoopConnection then
        _G.Gravity.LoopConnection:Disconnect()
    end
    _G.Gravity.LoopConnection = game:GetService("RunService").Heartbeat:Connect(applyGravity)
end

local function stopGravityLoop()
    if _G.Gravity.LoopConnection then
        _G.Gravity.LoopConnection:Disconnect()
        _G.Gravity.LoopConnection = nil
    end
    resetGravity()
end

gravitySection:Toggle({
    Title = "开启/关闭修改重力",
    Default = false,
    Callback = function(value)
        _G.Gravity.Enabled = value
        if value then
            applyGravity()
            startGravityLoop()
        else
            stopGravityLoop()
        end
    end
})

gravitySection:Slider({
    Title = "设置重力值",
    Value = { Min = 0, Max = 1000, Default = 196 },
    Callback = function(value)
        _G.Gravity.CurrentGravity = value
        if _G.Gravity.Enabled and not _G.Gravity.NoGravity then
            applyGravity()
        end
    end
})

gravitySection:Toggle({
    Title = "无重力模式",
    Default = false,
    Callback = function(value)
        _G.Gravity.NoGravity = value
        if _G.Gravity.Enabled then
            applyGravity()
        end
    end
})

-- 亮度/夜视
local brightnessSection = PlayerTab:Divider({
    Title = "亮度"
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

brightnessSection:Slider({
    Title = "设置夜视亮度",
    Value = { Min = 1, Max = 30, Default = 1 },
    Callback = function(value)
        NightVision.Brightness = value
        if NightVision.Active then
            Lighting.Brightness = value
        end
    end
})

brightnessSection:Toggle({
    Title = "开启/关闭夜视",
    Default = false,
    Callback = function(value)
        if NightVision.Connection then
            NightVision.Connection:Disconnect()
            NightVision.Connection = nil
        end
        NightVision.Active = value
        if value then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            Lighting.Brightness = NightVision.Brightness
            Lighting.ClockTime = 12
            NightVision.Connection = game:GetService("RunService").Heartbeat:Connect(function()
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

-- 相机
local cameraSection = PlayerTab:Divider({
    Title = "相机"
})

_G.Camera = {
    ZoomEnabled = false,
    FOVEnabled = false,
    ZoomDistance = 128,
    FieldOfView = 70,
    Connection = nil
}

local function applyCameraSettings()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if _G.Camera.ZoomEnabled then
        LocalPlayer.CameraMaxZoomDistance = _G.Camera.ZoomDistance
    end
    if _G.Camera.FOVEnabled and workspace.CurrentCamera then
        workspace.CurrentCamera.FieldOfView = _G.Camera.FieldOfView
    end
end

local function resetCameraSettings()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    LocalPlayer.CameraMaxZoomDistance = 128
    if workspace.CurrentCamera then
        workspace.CurrentCamera.FieldOfView = 70
    end
end

local function startCameraLoop()
    if _G.Camera.Connection then
        _G.Camera.Connection:Disconnect()
    end
    _G.Camera.Connection = game:GetService("RunService").Heartbeat:Connect(applyCameraSettings)
end

local function stopCameraLoop()
    if _G.Camera.Connection then
        _G.Camera.Connection:Disconnect()
        _G.Camera.Connection = nil
    end
    resetCameraSettings()
end

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    if _G.Camera.FOVEnabled and workspace.CurrentCamera then
        workspace.CurrentCamera.FieldOfView = _G.Camera.FieldOfView
    end
end)

cameraSection:Toggle({
    Title = "开启/关闭缩放距离",
    Default = false,
    Callback = function(value)
        _G.Camera.ZoomEnabled = value
        if _G.Camera.ZoomEnabled or _G.Camera.FOVEnabled then
            startCameraLoop()
        else
            stopCameraLoop()
        end
    end
})

cameraSection:Slider({
    Title = "设置缩放距离",
    Value = { Min = 128, Max = 200000, Default = 128 },
    Callback = function(value)
        _G.Camera.ZoomDistance = value
        if _G.Camera.ZoomEnabled then
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
        end
    end
})

cameraSection:Toggle({
    Title = "开启/关闭焦距",
    Default = false,
    Callback = function(value)
        _G.Camera.FOVEnabled = value
        if _G.Camera.ZoomEnabled or _G.Camera.FOVEnabled then
            startCameraLoop()
        else
            stopCameraLoop()
        end
    end
})

cameraSection:Slider({
    Title = "设置焦距",
    Value = { Min = 0.1, Max = 250, Default = 70 },
    Callback = function(value)
        _G.Camera.FieldOfView = value
        if _G.Camera.FOVEnabled and workspace.CurrentCamera then
            workspace.CurrentCamera.FieldOfView = value
        end
    end
})

-- 快速跑步
local quickRunSection = PlayerTab:Divider({
    Title = "快速跑步"
})

local quickRunSpeed = 0
local quickRunConnection = nil

quickRunSection:Input({
    Title = "设置快速跑步速度",
    Value = "",
    PlaceholderText = "输入速度值",
    Callback = function(text)
        quickRunSpeed = tonumber(text) or 0
    end
})

quickRunSection:Toggle({
    Title = "开启/关闭快速跑步",
    Default = false,
    Callback = function(value)
        if value then
            quickRunConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local lp = game:GetService("Players").LocalPlayer
                if lp.Character and lp.Character.Humanoid and lp.Character.Humanoid.Parent then
                    if lp.Character.Humanoid.MoveDirection.Magnitude > 0 then
                        lp.Character:TranslateBy(lp.Character.Humanoid.MoveDirection * quickRunSpeed / 0.5)
                    end
                end
            end)
        else
            if quickRunConnection then
                quickRunConnection:Disconnect()
                quickRunConnection = nil
            end
        end
    end
})

-- ==================== Tab: 通用 ====================
local GeneralTab = MainSection:Tab({
    Title = "通用",
    Icon = "rbxassetid://18941716391"
})

local generalSection = GeneralTab:Divider({
    Title = "通用功能"
})

generalSection:Button({
    Title = "隐身道具",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
    end
})

generalSection:Toggle({
    Title = "循环恢复血量",
    Default = false,
    Callback = function(value)
        if value then
            spawn(function()
                while value do
                    game.Players.LocalPlayer.Character.Humanoid.Health = 9e9
                    wait()
                end
            end)
        end
    end
})

generalSection:Button({
    Title = "锁定视野",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/nekmtvpA/raw"))()
    end
})

local cam1 = false
generalSection:Toggle({
    Title = "解锁最大视野",
    Default = false,
    Callback = function(value)
        cam1 = value
        spawn(function()
            while cam1 do
                wait(0.1)
                game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = 9e9
            end
            while not cam1 do
                wait(0.1)
                game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = 32
            end
        end)
    end
})

generalSection:Button({
    Title = "查看游戏中的所有玩家（包括血量条）",
    Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/G2zb992X'),true))()
    end
})

generalSection:Button({
    Title = "工具包",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
})

generalSection:Button({
    Title = "老外传送至玩家身边",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua'))()
    end
})

generalSection:Button({
    Title = "点击传送道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Jf2QXOwa/raw"))()
    end
})

local noClipEnabled = false
generalSection:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(value)
        noClipEnabled = value
        local Workspace = workspace
        local Players = game:GetService("Players")
        local stepped = game:GetService("RunService").Stepped:Connect(function()
            if not noClipEnabled then return end
            for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Players.LocalPlayer.Name then
                    for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end
        end)
        if not value then
            stepped:Disconnect()
        end
    end
})

generalSection:Button({
    Title = "皮飞行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/07cdd3eeaf4d4928.txt_2024-08-09_090317.OTed.lua"))()
    end
})

generalSection:Button({
    Title = "皮飞车",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/Pi-feiche.lua"))()
    end
})

generalSection:Button({
    Title = "皮自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
    end
})

generalSection:Button({
    Title = "皮甩飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/%E7%9A%AE%E7%94%A9%E9%A3%9E.lua"))()
    end
})

generalSection:Button({
    Title = "甩飞所有人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})

generalSection:Button({
    Title = "死亡笔记",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()
    end
})

generalSection:Button({
    Title = "铁拳",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
    end
})

generalSection:Button({
    Title = "电脑键盘",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
})

local antiRagdollConn = nil
generalSection:Toggle({
    Title = "防甩飞",
    Default = false,
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if value then
            antiRagdollConn = game:GetService("RunService").Stepped:Connect(function()
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
            if antiRagdollConn then
                antiRagdollConn:Disconnect()
                antiRagdollConn = nil
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

generalSection:Toggle({
    Title = "无法移动",
    Default = false,
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Anchored = value
            end
        end
    end
})

generalSection:Button({
    Title = "自杀",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

generalSection:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

generalSection:Button({
    Title = "通用ESP",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

generalSection:Button({
    Title = "踢人脚本(仅娱乐)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c8320f69b6aa4f5d.txt_2024-08-08_214628.OTed.lua"))()
    end
})

generalSection:Button({
    Title = "动画中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
    end
})

generalSection:Button({
    Title = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})

generalSection:Button({
    Title = "替身",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
    end
})

generalSection:Button({
    Title = "碰到就飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
    end
})

generalSection:Button({
    Title = "操人脚本",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/BkeffrT5/raw"))()
    end
})

generalSection:Button({
    Title = "圈圈自瞄(可调)",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YnfF3sje/raw"))()
    end
})

generalSection:Button({
    Title = "iw指令",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end
})

generalSection:Toggle({
    Title = "人物不可见状态(隐身)",
    Default = false,
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = value and 1 or 0
                part.CanCollide = not value
            elseif part:IsA("Accessory") then
                part.Handle.Transparency = value and 1 or 0
            end
        end
    end
})

local getBackpackRunning = false
generalSection:Toggle({
    Title = "获取所有玩家背包道具",
    Default = false,
    Callback = function(value)
        getBackpackRunning = value
        if value then
            spawn(function()
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

generalSection:Button({
    Title = "获取所有玩家道具",
    Callback = function()
        for i,v in pairs (game.Players:GetChildren()) do
            wait()
            for i,b in pairs (v.Backpack:GetChildren()) do
                b.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
})

generalSection:Button({
    Title = "获取当前道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/3FU05Dyt/raw"))()
    end
})

generalSection:Button({
    Title = "装备全部道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/uBqVR9JC/raw"))()
    end
})

generalSection:Button({
    Title = "删除道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/r4LHK4p0/raw"))()
    end
})

generalSection:Button({
    Title = "删除所有道具",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/8HB71Lbj/raw"))()
    end
})

local maxDistance = 10
local autoInteract = false

generalSection:Input({
    Title = "互动距离",
    Value = "",
    PlaceholderText = "输入(默认10米)",
    Callback = function(text)
        local distance = tonumber(text)
        if distance and distance > 0 then
            maxDistance = distance
        end
    end
})

generalSection:Toggle({
    Title = "自动互动",
    Default = false,
    Callback = function(value)
        autoInteract = value
        if value then
            spawn(function()
                while autoInteract do
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local playerPosition = character.HumanoidRootPart.Position
                        for _,descendant in pairs(workspace:GetDescendants()) do
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
            end)
        end
    end
})

local customHoldDuration = 0
generalSection:Input({
    Title = "互动时间",
    Value = "",
    PlaceholderText = "输入(默认0秒)",
    Callback = function(text)
        local duration = tonumber(text)
        if duration and duration >= 0 then
            customHoldDuration = duration
        end
    end
})

local promptConnection = nil
generalSection:Toggle({
    Title = "快速互动",
    Default = false,
    Callback = function(value)
        if promptConnection then
            promptConnection:Disconnect()
            promptConnection = nil
        end
        if value then
            promptConnection = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(v)
                v.HoldDuration = customHoldDuration
            end)
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

generalSection:Toggle({
    Title = "X-Ray",
    Default = false,
    Callback = function(value)
        toggleXRay()
    end
})

generalSection:Toggle({
    Title = "无限跳",
    Default = false,
    Callback = function(value)
        getgenv().InfJ = value
        game:GetService("UserInputService").JumpRequest:connect(function()
            if getgenv().InfJ then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
            end
        end)
    end
})

generalSection:Toggle({
    Title = "上帝模式",
    Default = false,
    Callback = function(value)
        if value then
            local LP = game:GetService("Players").LocalPlayer
            local HRP = LP.Character and LP.Character.HumanoidRootPart
            local Clone = HRP:Clone()
            Clone.Parent = LP.Character
        else
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end
})

generalSection:Button({
    Title = "聊天气泡美化",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/lCEPuiQO/raw"))()
    end
})

-- 靠近敌人自动攻击
local autoAttackEnabled = false
local autoAttackConfigs = {}

generalSection:Toggle({
    Title = "靠近敌人自动攻击[需要先装备武器]",
    Default = false,
    Callback = function(value)
        autoAttackEnabled = value
        if value then
            local configs = getgenv().configs
            if configs and configs.connections then
                for _, v in pairs(configs.connections) do
                    v:Disconnect()
                end
                configs.Disable:Fire()
                configs.Disable:Destroy()
                table.clear(getgenv().configs)
            end

            local Disable = Instance.new("BindableEvent")
            getgenv().configs = {
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

            table.insert(getgenv().configs.connections, Disable.Event:Connect(function()
                Run = false
            end))

            spawn(function()
                while Run do
                    local char = getchar()
                    if IsAlive(gethumanoid(char)) then
                        local Tool = char and char:FindFirstChildWhichIsA("Tool")
                        local TouchInterest = Tool and GetTouchInterest(Tool)

                        if TouchInterest then
                            local TouchPart = TouchInterest.Parent
                            local Characters = GetCharacters(char)
                            Ignorelist.FilterDescendantsInstances = Characters
                            local InstancesInBox = workspace:GetPartBoundsInBox(TouchPart.CFrame, TouchPart.Size + getgenv().configs.Size, Ignorelist)

                            for _, v in pairs(InstancesInBox) do
                                local Character = v:FindFirstAncestorWhichIsA("Model")
                                if table.find(Characters, Character) then
                                    if getgenv().configs.DeathCheck and IsAlive(gethumanoid(Character)) then
                                        Attack(Tool, TouchPart, v)
                                    elseif not getgenv().configs.DeathCheck then
                                        Attack(Tool, TouchPart, v)
                                    end
                                end
                            end
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        else
            local configs = getgenv().configs
            if configs then
                if configs.Disable then
                    configs.Disable:Fire()
                    configs.Disable:Destroy()
                end
                if configs.connections then
                    for _, connection in pairs(configs.connections) do
                        connection:Disconnect()
                    end
                end
                table.clear(getgenv().configs)
            end
        end
    end
})

generalSection:Toggle({
    Title = "坐下",
    Default = false,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.Sit = value
    end
})

local spamSoundEnabled = false
generalSection:Toggle({
    Title = "声音折磨",
    Default = false,
    Callback = function(value)
        spamSoundEnabled = value
        if value then
            spawn(function()
                while spamSoundEnabled do
                    local sound = Instance.new('Sound')
                    for i,v in next, game:GetDescendants() do
                        if v:IsA("Sound") then
                            sound.Play(v)
                        end
                    end
                    sound:Remove()
                    task.wait()
                end
            end)
        end
    end
})

local breakLoop = false
generalSection:Toggle({
    Title = "七彩建筑",
    Default = false,
    Callback = function(value)
        breakLoop = not value
        if value then
            local BaseParts = {}
            local Mats = Enum.Material:GetEnumItems()
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    table.insert(BaseParts, v)
                end
            end
            workspace.DescendantAdded:Connect(function(v)
                if v:IsA("BasePart") then
                    table.insert(BaseParts, v)
                end
            end)
            spawn(function()
                while not breakLoop do
                    for i,v in pairs(BaseParts) do
                        v.Material = Mats[math.random(1, #Mats)]
                        v.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                        if breakLoop then break end
                    end
                    task.wait(0.025)
                end
            end)
        end
    end
})

-- 原地复活
local respawnEnabled = false
local deathPos = nil
local waitTime = 0

generalSection:Input({
    Title = "等待时间(秒)",
    Value = "",
    PlaceholderText = "输入(默认0秒)",
    Callback = function(text)
        waitTime = tonumber(text) or 0
    end
})

generalSection:Toggle({
    Title = "原地复活",
    Default = false,
    Callback = function(value)
        respawnEnabled = value
    end
})

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    if respawnEnabled and deathPos then
        wait(waitTime)
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(deathPos)
        end
    end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        if respawnEnabled then
            deathPos = char.HumanoidRootPart.Position
        end
    end)
end)

generalSection:Button({
    Title = "人物螺旋上天",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/xV1T3PAi/raw"))()
    end
})

generalSection:Button({
    Title = "无限R币",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/SxhPVOyM/raw"))()
    end
})

local chatEnabled = false
local heartbeatConnection = nil
generalSection:Toggle({
    Title = "显示聊天框",
    Default = false,
    Callback = function(value)
        chatEnabled = value
        if value then
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
            game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
        end
    end
})

generalSection:Button({
    Title = "获得管理员权限",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
    end
})

generalSection:Button({
    Title = "显示时间",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/RycMWV3a"))()
    end
})

generalSection:Button({
    Title = "F3X",
    Callback = function()
        loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end
})

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local notifyEnabled = false
local playerAddedConn = nil
local playerRemovedConn = nil

generalSection:Toggle({
    Title = "玩家进出服务器通知",
    Default = false,
    Callback = function(value)
        notifyEnabled = value
        if playerAddedConn then playerAddedConn:Disconnect() end
        if playerRemovedConn then playerRemovedConn:Disconnect() end
        if value then
            playerAddedConn = game.Players.ChildAdded:Connect(function(player)
                pcall(function()
                    if notifyEnabled then
                        NotificationLibrary:SendNotification("Success", player.Name.." 加入了游戏", 5)
                    end
                end)
            end)
            playerRemovedConn = game.Players.ChildRemoved:Connect(function(player)
                pcall(function()
                    if notifyEnabled then
                        NotificationLibrary:SendNotification("Error", player.Name.." 离开了游戏", 5)
                    end
                end)
            end)
        end
    end
})

-- 游戏设置
local gameSettingsSection = GeneralTab:Divider({
    Title = "游戏设置"
})

gameSettingsSection:Button({
    Title = "重新加入游戏",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XXabqNiv/raw"))()
    end
})

gameSettingsSection:Button({
    Title = "保存游戏",
    Callback = function()
        saveinstance()
    end
})

gameSettingsSection:Button({
    Title = "离开游戏",
    Callback = function()
        game:Shutdown()
    end
})

-- 修改时间
local timeSection = GeneralTab:Divider({
    Title = "修改时间"
})

local selectedTimeValue = "12:00:00"
local lighting = game:GetService("Lighting")

timeSection:Dropdown({
    Title = "选择时间",
    Values = {
        "午夜 00:00",
        "凌晨 03:00",
        "清晨 06:00",
        "上午 09:00",
        "中午 12:00",
        "下午 15:00",
        "傍晚 18:00",
        "夜晚 21:00"
    },
    Value = "中午 12:00",
    Callback = function(value)
        if value == "午夜 00:00" then
            selectedTimeValue = "00:00:00"
        elseif value == "凌晨 03:00" then
            selectedTimeValue = "03:00:00"
        elseif value == "清晨 06:00" then
            selectedTimeValue = "06:00:00"
        elseif value == "上午 09:00" then
            selectedTimeValue = "09:00:00"
        elseif value == "中午 12:00" then
            selectedTimeValue = "12:00:00"
        elseif value == "下午 15:00" then
            selectedTimeValue = "15:00:00"
        elseif value == "傍晚 18:00" then
            selectedTimeValue = "18:00:00"
        elseif value == "夜晚 21:00" then
            selectedTimeValue = "21:00:00"
        end
    end
})

timeSection:Button({
    Title = "确认修改时间",
    Callback = function()
        lighting.TimeOfDay = selectedTimeValue
    end
})

-- 设置相机
local cameraControlSection = GeneralTab:Divider({
    Title = "设置相机"
})

_G.CameraControlConfig = {
    enabled = false,
    disableAutoReset = false,
    originalSettings = nil,
    cameraTypeMap = {
        ["自定义"] = Enum.CameraType.Custom,
        ["附加"] = Enum.CameraType.Attach,
        ["固定"] = Enum.CameraType.Fixed,
        ["跟随"] = Enum.CameraType.Follow,
        ["动态观察"] = Enum.CameraType.Orbital,
        ["可脚本化"] = Enum.CameraType.Scriptable,
        ["跟踪"] = Enum.CameraType.Track,
        ["观看"] = Enum.CameraType.Watch
    },
    cameraModeMap = {
        ["经典"] = Enum.CameraMode.Classic,
        ["第一人称"] = Enum.CameraMode.LockFirstPerson
    }
}

local Camera = workspace.CurrentCamera
local LocalPlayer = game:GetService("Players").LocalPlayer
local cameraConfig = _G.CameraControlConfig

if not cameraConfig.originalSettings then
    cameraConfig.originalSettings = {
        CameraType = Camera.CameraType,
        CameraMode = LocalPlayer.CameraMode,
        OcclusionMode = LocalPlayer.DevCameraOcclusionMode
    }
end

local function executeWithProtection(func)
    cameraConfig.disableAutoReset = true
    local success, err = pcall(func)
    if not success then
        warn("相机设置失败: " .. tostring(err))
    end
    cameraConfig.disableAutoReset = false
end

local function safeSet(func)
    if not cameraConfig.enabled then return end
    executeWithProtection(func)
end

local function restoreOriginalSettings()
    executeWithProtection(function()
        Camera.CameraType = cameraConfig.originalSettings.CameraType
        LocalPlayer.CameraMode = cameraConfig.originalSettings.CameraMode
        LocalPlayer.DevCameraOcclusionMode = cameraConfig.originalSettings.OcclusionMode
    end)
end

local cameraControlCore = {
    safeSet = safeSet,
    restore = restoreOriginalSettings,
    setEnabled = function(state)
        if state == cameraConfig.enabled then return end
        cameraConfig.enabled = state
        if not state then
            restoreOriginalSettings()
        end
    end,
    setCameraType = function(value)
        safeSet(function()
            if cameraConfig.cameraTypeMap[value] then
                Camera.CameraType = cameraConfig.cameraTypeMap[value]
            end
        end)
    end,
    setCameraMode = function(value)
        safeSet(function()
            if cameraConfig.cameraModeMap[value] then
                LocalPlayer.CameraMode = cameraConfig.cameraModeMap[value]
            end
        end)
    end,
    setOcclusionMode = function(state)
        safeSet(function()
            LocalPlayer.DevCameraOcclusionMode = state and Enum.DevCameraOcclusionMode.Invisicam or Enum.DevCameraOcclusionMode.Zoom
        end)
    end
}

cameraControlSection:Toggle({
    Title = "开启/关闭相机控制",
    Default = false,
    Callback = function(value)
        cameraControlCore.setEnabled(value)
    end
})

cameraControlSection:Dropdown({
    Title = "相机类型",
    Values = {"自定义", "附加", "固定", "跟随", "动态观察", "可脚本化", "跟踪", "观看"},
    Value = "自定义",
    Callback = function(value)
        cameraControlCore.setCameraType(value)
    end
})

cameraControlSection:Toggle({
    Title = "开启遮挡模式",
    Default = false,
    Callback = function(value)
        cameraControlCore.setOcclusionMode(value)
    end
})

cameraControlSection:Dropdown({
    Title = "相机模式",
    Values = {"经典", "第一人称"},
    Value = "经典",
    Callback = function(value)
        cameraControlCore.setCameraMode(value)
    end
})

Camera:GetPropertyChangedSignal("CameraType"):Connect(function()
    if not cameraConfig.enabled or cameraConfig.disableAutoReset then return end
    pcall(function()
        Camera.CameraType = Enum.CameraType.Scriptable
    end)
end)

LocalPlayer:GetPropertyChangedSignal("CameraMode"):Connect(function()
    if not cameraConfig.enabled or cameraConfig.disableAutoReset then return end
    pcall(function()
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
    end)
end)

LocalPlayer:GetPropertyChangedSignal("DevCameraOcclusionMode"):Connect(function()
    if not cameraConfig.enabled or cameraConfig.disableAutoReset then return end
    pcall(function()
        LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
    end)
end)

-- 指令
local commandSection = GeneralTab:Divider({
    Title = "指令"
})

commandSection:Button({
    Title = "指令脚本",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end
})

commandSection:Label("bang能够掀人")
commandSection:Label("noface没有脸")
commandSection:Label("headsit坐在玩家头上加玩家名字")
commandSection:Label("float悬浮")
commandSection:Label("re重置人物但位置不变")
commandSection:Label("dance跳舞")
commandSection:Label("nolegs没有腿")
commandSection:Label("walltp碰到墙壁传送到墙壁顶部")
commandSection:Label("bring+玩家名字可以让玩家吸到你手上但是只能用于一些服务器")
commandSection:Label("carpet趴着走")
commandSection:Label("infjump无限跳跃")
commandSection:Label("xray透视地图所有物体变透明")
commandSection:Label("bang玩家开头两个英文吸在玩家身后")
commandSection:Label("noanim没有动作")
commandSection:Label("spin人物旋转")
commandSection:Label("sitwalk坐着走")
commandSection:Label("trip让你的人物摔倒")
commandSection:Label("antikick防踢")
commandSection:Label("lay躺下")
commandSection:Label("sit坐")
commandSection:Label("god加血")
commandSection:Label("invisfling配合加血可以旋转")
commandSection:Label("goto+玩家名字传送")
commandSection:Label("unxray关闭透视")
commandSection:Label("noclip穿墙")

-- 念力
local telekinesisSection = GeneralTab:Divider({
    Title = "念力"
})

telekinesisSection:Button({
    Title = "念力工具",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/Mindpower.lua"))()
    end
})

telekinesisSection:Label("Q - 靠近")
telekinesisSection:Label("E - 离远")
telekinesisSection:Label("Y - 投掷")
telekinesisSection:Label("J - 超级投掷")
telekinesisSection:Label("U - 使物体自转")
telekinesisSection:Label("P - 使物体悬浮在空中")
telekinesisSection:Label("X - 走得更远一点")
telekinesisSection:Label("L - 使方块变直并锁定在前部")

telekinesisSection:Button({
    Title = "让手上的道具飘起来",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/WmD8MuSx"))()
    end
})

telekinesisSection:Label("J-飞起来")
telekinesisSection:Label("K-回到手中")

-- 子弹追踪
local bulletTrackSection = GeneralTab:Divider({
    Title = "子弹追踪"
})

local bulletTrackConfig = {
    enable = false,
    teamcheck = false,
    friendcheck = false,
    enablenpc = false,
    trackDistance = 500,
    aliveCheck = false,
    wallCheck = false
}

local playerCache = {}
local npcCache = {}
local lastCacheUpdate = 0
local CACHE_UPDATE_INTERVAL = 0.1

local function isVisible(targetHead)
    if not bulletTrackConfig.wallCheck then return true end
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if not LocalPlayer.Character then return false end
    local cameraPart = workspace.CurrentCamera
    if not cameraPart then return false end
    local origin = cameraPart.CFrame.Position
    local target = targetHead.Position
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {
        LocalPlayer.Character,
        cameraPart,
        workspace:FindFirstChild("Camera")
    }
    raycastParams.IgnoreWater = true
    local direction = (target - origin)
    local distance = direction.Magnitude
    local unitDirection = direction.Unit
    local result = workspace:Raycast(origin, unitDirection * distance, raycastParams)
    if not result then return true end
    local hitInstance = result.Instance
    if hitInstance then
        local targetCharacter = targetHead.Parent
        if targetCharacter then
            if hitInstance:IsDescendantOf(targetCharacter) then
                return true
            end
            if hitInstance:IsA("Terrain") or (hitInstance:IsA("Part") and hitInstance.Material == Enum.Material.Water) then
                return true
            end
        end
    end
    return false
end

local function isAlive(character)
    if not character then return false end
    if not bulletTrackConfig.aliveCheck then return true end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    if humanoid.Health <= 0 then return false end
    if humanoid:GetState() == Enum.HumanoidStateType.Dead then return false end
    return true
end

local function updatePlayerCache()
    local currentTime = tick()
    if currentTime - lastCacheUpdate < CACHE_UPDATE_INTERVAL then return end
    lastCacheUpdate = currentTime
    playerCache = {}
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local localPos = LocalPlayer.Character.HumanoidRootPart.Position
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local skip = false
            if bulletTrackConfig.teamcheck and player.Team == LocalPlayer.Team then
                skip = true
            end
            if not skip and bulletTrackConfig.friendcheck and LocalPlayer:IsFriendsWith(player.UserId) then
                skip = true
            end
            if not skip then
                local character = player.Character
                local root = character:FindFirstChild("HumanoidRootPart")
                local head = character:FindFirstChild("Head")
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if root and head and humanoid and humanoid.Health > 0 and isAlive(character) then
                    local distance = (root.Position - localPos).Magnitude
                    if distance < bulletTrackConfig.trackDistance then
                        if bulletTrackConfig.wallCheck then
                            if isVisible(head) then
                                table.insert(playerCache, {head = head, root = root, distance = distance})
                            end
                        else
                            table.insert(playerCache, {head = head, root = root, distance = distance})
                        end
                    end
                end
            end
        end
    end
    table.sort(playerCache, function(a, b) return a.distance < b.distance end)
end

local function getClosestHead()
    if not bulletTrackConfig.enable then return nil end
    updatePlayerCache()
    if #playerCache > 0 then
        return playerCache[1].head
    end
    return nil
end

local old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Raycast" and not checkcaller() then
        local origin = workspace.CurrentCamera.CFrame.Position
        if bulletTrackConfig.enable then
            local closestHead = getClosestHead()
            if closestHead and closestHead.Parent then
                return {
                    Instance = closestHead,
                    Position = closestHead.Position,
                    Normal = (origin - closestHead.Position).Unit,
                    Material = Enum.Material.Plastic,
                    Distance = (closestHead.Position - origin).Magnitude
                }
            end
        end
    end
    return old(self, ...)
end))

bulletTrackSection:Toggle({
    Title = "开启/关闭子弹追踪",
    Default = false,
    Callback = function(value)
        bulletTrackConfig.enable = value
    end
})

bulletTrackSection:Toggle({
    Title = "队伍验证",
    Default = false,
    Callback = function(value)
        bulletTrackConfig.teamcheck = value
    end
})

bulletTrackSection:Toggle({
    Title = "好友验证",
    Default = false,
    Callback = function(value)
        bulletTrackConfig.friendcheck = value
    end
})

bulletTrackSection:Toggle({
    Title = "NPC子弹追踪",
    Default = false,
    Callback = function(value)
        bulletTrackConfig.enablenpc = value
    end
})

bulletTrackSection:Toggle({
    Title = "活体检测",
    Default = false,
    Callback = function(value)
        bulletTrackConfig.aliveCheck = value
    end
})

bulletTrackSection:Toggle({
    Title = "墙体检测",
    Default = false,
    Callback = function(value)
        bulletTrackConfig.wallCheck = value
    end
})

bulletTrackSection:Slider({
    Title = "追踪距离",
    Value = { Min = 50, Max = 2000, Default = 500 },
    Callback = function(value)
        bulletTrackConfig.trackDistance = value
    end
})

-- ==================== Tab: 传送与甩飞 ====================
local TeleportTab = MainSection:Tab({
    Title = "传送与甩飞",
    Icon = "rbxassetid://18941716391"
})

-- 选择玩家
local selectSection = TeleportTab:Divider({
    Title = "选择玩家"
})

_G.LSConfig = {
    playernamedied = "",
    dropdown = {},
    LoopTeleport = false,
    aimbotLoop = nil,
    Direction = "前面",
    Distance = 3,
    OrbitLoop = nil,
    OrbitRadius = 5,
    OrbitSpeed = 1,
    AutoRefresh = false,
    RefreshInterval = 5,
    NameType = "用户名",
    VIPUsers = {},
    ProtectedUsers = {"78lwq29"}
}

_G.LSServices = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    Workspace = game:GetService("Workspace"),
    LocalPlayer = game:GetService("Players").LocalPlayer
}

local function getPlayerList()
    local list = {"所有人"}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= _G.LSServices.LocalPlayer then
            if not table.find(_G.LSConfig.ProtectedUsers, player.Name) then
                if _G.LSConfig.NameType == "昵称" then
                    table.insert(list, player.DisplayName)
                else
                    table.insert(list, player.Name)
                end
            end
        end
    end
    return list
end

local function getPlayerByName(name)
    if name == "所有人" then return nil end
    local Players = game:GetService("Players")
    if _G.LSConfig.NameType == "昵称" then
        for _, player in pairs(Players:GetPlayers()) do
            if player.DisplayName == name then
                return player
            end
        end
    else
        return Players:FindFirstChild(name)
    end
    return nil
end

local selectedPlayer = "所有人"
selectSection:Dropdown({
    Title = "选择玩家",
    Values = getPlayerList(),
    Value = "所有人",
    Callback = function(value)
        selectedPlayer = value
        _G.LSConfig.playernamedied = value
    end
})

selectSection:Button({
    Title = "刷新玩家列表",
    Callback = function()
        local list = getPlayerList()
        -- 刷新dropdown（需要重新创建）
        Notify("皮脚本", "玩家列表已刷新", 2)
    end
})

selectSection:Toggle({
    Title = "自动刷新玩家列表",
    Default = false,
    Callback = function(value)
        _G.LSConfig.AutoRefresh = value
    end
})

selectSection:Input({
    Title = "刷新间隔(秒)",
    Value = "",
    PlaceholderText = "输入秒数",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            _G.LSConfig.RefreshInterval = num
        end
    end
})

-- 距离方向
local directionSection = TeleportTab:Divider({
    Title = "距离方向"
})

directionSection:Dropdown({
    Title = "选择[传送丨吸人]方向",
    Values = {"前面", "后面", "左面", "右面", "上面", "下面"},
    Value = "前面",
    Callback = function(value)
        _G.LSConfig.Direction = value
    end
})

directionSection:Input({
    Title = "设置[传送丨吸人]距离",
    Value = "",
    PlaceholderText = "输入距离",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            _G.LSConfig.Distance = num
        end
    end
})

-- 传送玩家
local teleportSection = TeleportTab:Divider({
    Title = "传送玩家"
})

teleportSection:Button({
    Title = "传送到玩家旁边",
    Callback = function()
        local HumRoot = _G.LSServices.LocalPlayer.Character.HumanoidRootPart
        local target = getPlayerByName(selectedPlayer)
        if selectedPlayer == "所有人" then
            for _, player in pairs(_G.LSServices.Players:GetPlayers()) do
                if player ~= _G.LSServices.LocalPlayer and player.Character and player.Character.HumanoidRootPart then
                    local targetPos = player.Character.HumanoidRootPart.CFrame + 
                        player.Character.HumanoidRootPart.CFrame.LookVector * _G.LSConfig.Distance
                    HumRoot.CFrame = targetPos
                    wait(0.5)
                end
            end
            Notify("皮脚本", "已传送到所有玩家身边", 3)
        elseif target and target.Character and target.Character.HumanoidRootPart then
            local targetPos = target.Character.HumanoidRootPart.CFrame + 
                target.Character.HumanoidRootPart.CFrame.LookVector * _G.LSConfig.Distance
            HumRoot.CFrame = targetPos
            Notify("皮脚本", "已经传送到玩家身边", 3)
        else
            Notify("皮脚本", "无法传送 原因: 玩家已消失", 3)
        end
    end
})

teleportSection:Toggle({
    Title = "循环锁定传送",
    Default = false,
    Callback = function(value)
        _G.LSConfig.LoopTeleport = value
        if value then
            Notify("皮脚本", "已开启循环传送", 3)
            spawn(function()
                while _G.LSConfig.LoopTeleport do
                    local HumRoot = _G.LSServices.LocalPlayer.Character.HumanoidRootPart
                    local target = getPlayerByName(selectedPlayer)
                    if target and target.Character and target.Character.HumanoidRootPart then
                        local targetPos = target.Character.HumanoidRootPart.CFrame + 
                            target.Character.HumanoidRootPart.CFrame.LookVector * _G.LSConfig.Distance
                        HumRoot.CFrame = targetPos
                    end
                    wait()
                end
            end)
        else
            Notify("皮脚本", "已关闭循环传送", 3)
        end
    end
})

teleportSection:Button({
    Title = "把玩家传送过来",
    Callback = function()
        local HumRoot = _G.LSServices.LocalPlayer.Character.HumanoidRootPart
        local target = getPlayerByName(selectedPlayer)
        if selectedPlayer == "所有人" then
            for _, player in pairs(_G.LSServices.Players:GetPlayers()) do
                if player ~= _G.LSServices.LocalPlayer and player.Character and player.Character.HumanoidRootPart then
                    if not table.find(_G.LSConfig.ProtectedUsers, player.Name) then
                        local targetPos = HumRoot.CFrame + HumRoot.CFrame.LookVector * _G.LSConfig.Distance
                        player.Character.HumanoidRootPart.CFrame = targetPos
                        wait(0.5)
                    end
                end
            end
            Notify("皮脚本", "已将所有玩家传送过来", 3)
        elseif target and target.Character and target.Character.HumanoidRootPart then
            if not table.find(_G.LSConfig.ProtectedUsers, target.Name) then
                local targetPos = HumRoot.CFrame + HumRoot.CFrame.LookVector * _G.LSConfig.Distance
                target.Character.HumanoidRootPart.CFrame = targetPos
                Notify("皮脚本", "已将玩家传送过来", 3)
            else
                Notify("皮脚本", "该玩家受到保护，无法传送", 3)
            end
        else
            Notify("皮脚本", "无法传送 原因: 玩家已消失", 3)
        end
    end
})

-- 其他传送功能
local otherTeleportSection = TeleportTab:Divider({
    Title = "其他"
})

otherTeleportSection:Toggle({
    Title = "开启指定自瞄目标",
    Default = false,
    Callback = function(value)
        local target = getPlayerByName(selectedPlayer)
        if not target then
            Notify("皮脚本", "找不到指定玩家", 3)
            return
        end
        if value then
            if _G.LSConfig.aimbotLoop then
                _G.LSConfig.aimbotLoop:Disconnect()
            end
            _G.LSConfig.aimbotLoop = _G.LSServices.RunService.RenderStepped:Connect(function()
                local Cam = workspace.CurrentCamera
                local targetPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                if targetPart and Cam then
                    local lookVector = (targetPart.Position - Cam.CFrame.Position).unit
                    Cam.CFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
                end
            end)
            Notify("皮脚本", "已开启自瞄目标", 3)
        else
            if _G.LSConfig.aimbotLoop then
                _G.LSConfig.aimbotLoop:Disconnect()
                _G.LSConfig.aimbotLoop = nil
            end
            Notify("皮脚本", "已关闭自瞄目标", 3)
        end
    end
})

otherTeleportSection:Toggle({
    Title = "吸全部玩家",
    Default = false,
    Callback = function(value)
        if value then
            spawn(function()
                while value do
                    local HumRoot = _G.LSServices.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(_G.LSServices.Players:GetPlayers()) do
                        if v.Name ~= _G.LSServices.LocalPlayer.Name then
                            if not table.find(_G.LSConfig.ProtectedUsers, v.Name) then
                                local targetPos = HumRoot.CFrame + HumRoot.CFrame.LookVector * _G.LSConfig.Distance
                                v.Character.HumanoidRootPart.CFrame = targetPos
                                wait()
                            end
                        end
                    end
                end
            end)
        end
    end
})

otherTeleportSection:Toggle({
    Title = "查看玩家",
    Default = false,
    Callback = function(value)
        local target = getPlayerByName(selectedPlayer)
        if value then
            if target and target.Character and target.Character.Humanoid then
                workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
                Notify("皮脚本", "已开启查看玩家", 3)
            else
                Notify("皮脚本", "找不到指定玩家", 3)
            end
        else
            workspace.CurrentCamera.CameraSubject = _G.LSServices.LocalPlayer.Character.Humanoid
            Notify("皮脚本", "已关闭查看玩家", 3)
        end
    end
})

-- 环绕玩家
local orbitSection = TeleportTab:Divider({
    Title = "环绕玩家"
})

orbitSection:Input({
    Title = "设置环绕半径",
    Value = "",
    PlaceholderText = "输入半径",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            _G.LSConfig.OrbitRadius = num
        end
    end
})

orbitSection:Input({
    Title = "设置环绕速度",
    Value = "",
    PlaceholderText = "输入速度",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            _G.LSConfig.OrbitSpeed = num
        end
    end
})

orbitSection:Toggle({
    Title = "环绕玩家",
    Default = false,
    Callback = function(value)
        local target = getPlayerByName(selectedPlayer)
        if not target then
            Notify("皮脚本", "找不到指定玩家", 3)
            return
        end
        if value then
            if _G.LSConfig.OrbitLoop then
                _G.LSConfig.OrbitLoop:Disconnect()
            end
            Notify("皮脚本", "已开启环绕玩家", 3)
            local angle = 0
            _G.LSConfig.OrbitLoop = _G.LSServices.RunService.Heartbeat:Connect(function()
                if not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                local localHRP = _G.LSServices.LocalPlayer.Character and _G.LSServices.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not localHRP then return end
                angle = angle + _G.LSConfig.OrbitSpeed * 0.05
                if angle > 360 then angle = angle - 360 end
                local x = math.cos(angle) * _G.LSConfig.OrbitRadius
                local z = math.sin(angle) * _G.LSConfig.OrbitRadius
                local targetPos = target.Character.HumanoidRootPart.Position + Vector3.new(x, 0, z)
                localHRP.CFrame = CFrame.new(targetPos, target.Character.HumanoidRootPart.Position)
            end)
        else
            if _G.LSConfig.OrbitLoop then
                _G.LSConfig.OrbitLoop:Disconnect()
                _G.LSConfig.OrbitLoop = nil
            end
            Notify("皮脚本", "已关闭环绕玩家", 3)
        end
    end
})
