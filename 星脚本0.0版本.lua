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

local mainFrame = Window.UIElements.Main
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
    Title = "通用功能页~", 
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

    generalSection:Button({
        Title = "隐身道具",
        Callback = function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
        end
    })
    
    generalSection:Toggle({
        Title = "循环恢复血量",
        Default = false,
        Callback = function(HF)
            if HF then
                while true do
                    game.Players.LocalPlayer.Character.Humanoid.Health = 9e9
                    wait()
                end
            end
        end
    })
    
    
    generalSection:Button({
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
    
    generalSection:Toggle({
        Title = "解锁最大视野",
        Default = false,
        Callback = function(Value)
            Cam1 = Value
            if Cam1 then
                Cam2()
            end
        end
    })
    
    
    generalSection:Button({
        Title = "查看游戏中的所有玩家（包括血量条）",
        Callback = function()
            loadstring(game:HttpGet(('https://pastebin.com/raw/G2zb992X'), true))()
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
    
    
    local Clipon = false
    local Stepped = nil
    generalSection:Toggle({
        Title = "穿墙",
        Default = false,
        Callback = function(NC)
            local Workspace = game:GetService("Workspace")
            local Players = game:GetService("Players")
            if NC then 
                Clipon = true 
            else 
                Clipon = false 
            end
            Stepped = game:GetService("RunService").Stepped:Connect(function()
                if not Clipon == false then
                    for a, b in pairs(Workspace:GetChildren()) do
                        if b.Name == Players.LocalPlayer.Name then
                            for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                else
                    Stepped:Disconnect()
                end
            end)
        end
    })
    
    -- 皮飞行
    generalSection:Button({
        Title = "皮飞行",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/07cdd3eeaf4d4928.txt_2024-08-09_090317.OTed.lua"))()
        end
    })
    
    -- 皮飞车
    generalSection:Button({
        Title = "皮飞车",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/Pi-feiche.lua"))()
        end
    })
    
    -- 皮自瞄
    generalSection:Button({
        Title = "皮自瞄",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/3683e49998644fb7.txt_2024-08-09_094310.OTed.lua"))()
        end
    })
    
    -- 皮甩飞
    generalSection:Button({
        Title = "皮甩飞",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/%E7%9A%AE%E7%94%A9%E9%A3%9E.lua"))()
        end
    })
    
    -- 甩飞所有人
    generalSection:Button({
        Title = "甩飞所有人",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
        end
    })
    
    -- 死亡笔记
    generalSection:Button({
        Title = "死亡笔记",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/1_1.txt_2024-08-08_153358.OTed.lua"))()
        end
    })
    
    -- 铁拳
    generalSection:Button({
        Title = "铁拳",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
        end
    })
    
    -- 电脑键盘
    generalSection:Button({
        Title = "电脑键盘",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
        end
    })
    
    -- 防甩飞
    local AntiRagdoll = nil
    generalSection:Toggle({
        Title = "防甩飞",
        Default = false,
        Callback = function(state)
            local player = game.Players.LocalPlayer
            local runService = game:GetService("RunService")
            
            if state then
                AntiRagdoll = runService.Stepped:Connect(function()
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
    
    -- 无法移动
    generalSection:Toggle({
        Title = "无法移动",
        Default = false,
        Callback = function(state)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            
            if state then
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Anchored = true
                    end
                end
            else
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Anchored = false
                    end
                end
            end
        end
    })
    
    -- 自杀
    generalSection:Button({
        Title = "自杀",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    })
    
    -- 踏空行走
    generalSection:Button({
        Title = "踏空行走",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
        end
    })
    
    -- 通用ESP
    generalSection:Button({
        Title = "通用ESP",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
        end
    })
    
    -- 踢人脚本
    generalSection:Button({
        Title = "踢人脚本(仅娱乐)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/c8320f69b6aa4f5d.txt_2024-08-08_214628.OTed.lua"))()
        end
    })
    
    -- 动画中心
    generalSection:Button({
        Title = "动画中心",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
        end
    })
    
    -- 爬墙
    generalSection:Button({
        Title = "爬墙",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
        end
    })
    
    -- 替身
    generalSection:Button({
        Title = "替身",
        Callback = function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
        end
    })
    
    -- 碰到就飞
    generalSection:Button({
        Title = "碰到就飞",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
        end
    })
    
    -- 操人脚本
    generalSection:Button({
        Title = "操人脚本",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/BkeffrT5/raw"))()
        end
    })
    
    -- 圈圈自瞄
    generalSection:Button({
        Title = "圈圈自瞄(可调)",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/YnfF3sje/raw"))()
        end
    })
    
    -- iw指令
    generalSection:Button({
        Title = "iw指令",
        Callback = function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
        end
    })
    
    -- 隐身
    generalSection:Toggle({
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
    
    -- 获取所有玩家背包道具
    local getBackpackRunning = false
    generalSection:Toggle({
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
    
    -- 获取所有玩家道具
    generalSection:Button({
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
    
    -- 获取当前道具
    generalSection:Button({
        Title = "获取当前道具",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/3FU05Dyt/raw"))()
        end
    })
    
    -- 装备全部道具
    generalSection:Button({
        Title = "装备全部道具",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/uBqVR9JC/raw"))()
        end
    })
    
    -- 删除道具
    generalSection:Button({
        Title = "删除道具",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/r4LHK4p0/raw"))()
        end
    })
    
    -- 删除所有道具
    generalSection:Button({
        Title = "删除所有道具",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/8HB71Lbj/raw"))()
        end
    })
    
    -- 互动距离
    local maxDistance = 10
    generalSection:Input({
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
    
    -- 自动互动
    local autoInteract = false
    generalSection:Toggle({
        Title = "自动互动",
        Default = false,
        Callback = function(state)
            if state then
                autoInteract = true
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
            else
                autoInteract = false
            end
        end
    })
    
    -- 互动时间
    local customHoldDuration = 0
    generalSection:Input({
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
    
    -- 快速互动
    local promptConnection = nil
    generalSection:Toggle({
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
    
    -- X-Ray
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
        Callback = function(Value)
            if Value then
                toggleXRay()
            else
                toggleXRay()
            end
        end
    })
    
    -- 无限跳
    generalSection:Toggle({
        Title = "无限跳",
        Default = false,
        Callback = function(IJ)
            getgenv().InfJ = IJ
            game:GetService("UserInputService").JumpRequest:connect(function()
                if InfJ == true then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
                end
            end)
        end
    })
    
    -- 上帝模式
    generalSection:Toggle({
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
    
    -- 聊天气泡美化
    generalSection:Button({
        Title = "聊天气泡美化",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/lCEPuiQO/raw"))()
        end
    })
    
    -- 靠近敌人自动攻击
    generalSection:Toggle({
        Title = "靠近敌人自动攻击[需要先装备武器]",
        Default = false,
        Callback = function(state)
            if state then
                local connections = getgenv().configs and getgenv().configs.connections
                if connections then
                    local Disable = getgenv().configs.Disable
                    for _, v in pairs(connections) do
                        v:Disconnect()
                    end
                    Disable:Fire()
                    Disable:Destroy()
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
            else
                local Disable = getgenv().configs.Disable
                if Disable then
                    Disable:Fire()
                    Disable:Destroy()
                end
                for _, connection in pairs(getgenv().configs.connections) do
                    connection:Disconnect()
                end
                table.clear(getgenv().configs.connections)
                Run = false
            end
        end
    })
    
    -- 坐下
    generalSection:Toggle({
        Title = "坐下",
        Default = false,
        Callback = function(Value)
            if Value then
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
            else
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    })
    
    -- 声音折磨
    local function spamSound()
        while getgenv().spamSoond == true do
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
    
    generalSection:Toggle({
        Title = "声音折磨",
        Default = false,
        Callback = function(bool)
            getgenv().spamSoond = bool
            if bool then
                spamSound()
            end
        end
    })
    
    -- 七彩建筑
    local Break = false
    generalSection:Toggle({
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
                
                while task.wait(0.025) do
                    for i, v in pairs(BaseParts) do
                        v.Material = Mats[math.random(1, #Mats)]
                        v.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                        if Break then break end
                    end
                end
            else
                Break = true
            end
        end
    })
    
    -- 原地复活
    local enabled = false
    local deathPos = nil
    local waitTime = 0
    
    generalSection:Input({
        Title = "等待时间(秒)",
        Value = "",
        PlaceholderText = "输入(默认0秒)",
        ClearTextOnFocus = false,
        Callback = function(time)
            waitTime = tonumber(time) or 0
        end
    })
    
    generalSection:Toggle({
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
    
    -- 人物螺旋上天
    generalSection:Button({
        Title = "人物螺旋上天",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/xV1T3PAi/raw"))()
        end
    })
    
    -- 无限R币
    generalSection:Button({
        Title = "无限R币",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/SxhPVOyM/raw"))()
        end
    })
    
    -- 显示聊天框
    local originalChatVisible = nil
    local heartbeatConnection = nil
    local chatEnabled = false
    
    generalSection:Toggle({
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
    
    -- 获得管理员权限
    generalSection:Button({
        Title = "获得管理员权限",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
        end
    })
    
    -- 显示时间
    generalSection:Button({
        Title = "显示时间",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/RycMWV3a"))()
        end
    })
    
    -- F3X
    generalSection:Button({
        Title = "F3X",
        Callback = function()
            loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
        end
    })
    
    -- 玩家进出服务器通知
    local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
    local notifyEnabled = false
    local playerAddedConn = nil
    local playerRemovedConn = nil
    
    generalSection:Toggle({
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
end)