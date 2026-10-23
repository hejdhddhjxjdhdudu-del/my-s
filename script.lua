-- ==========================================
--    🔥 ISLAM HUB - ULTIMATE COMBAT MENU 🔥    
-- ==========================================

local ScreenGui = game:GetService("CoreGui"):FindFirstChild("IslamUltimateHub") or Instance.new("ScreenGui")
if ScreenGui.ClassName == "ScreenGui" then ScreenGui:Destroy() end

ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "IslamUltimateHub"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 🔲 زر MENU العائم لفتح وإغلاق القائمة بسهولة على الجوال
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 15, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(215, 90, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "MENU"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 13
local ToggleCorner = Instance.new("UICorner") do ToggleCorner.CornerRadius = UDim.new(1, 0) ToggleCorner.Parent = ToggleBtn end

-- 💻 الإطار الرئيسي للقائمة بتصميم التدرج الناري لـ ISLAM HUB
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.35, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 330, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner") do UICorner.CornerRadius = UDim.new(0, 14) UICorner.Parent = MainFrame end

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 15)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 20, 10)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(215, 90, 0))
})
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 0.6
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "🔥 ISLAM HUB - COMBAT MENU 🔥"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
local TitleCorner = Instance.new("UICorner") do TitleCorner.CornerRadius = UDim.new(0, 14) TitleCorner.Parent = Title end

-- دالة سريعة لصنع أزرار التشغيل والإطفاء داخل القائمة
local function CreateMenuButton(text, pos_y)
    local Btn = Instance.new("TextButton")
    Btn.Parent = MainFrame
    Btn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    Btn.Position = UDim2.new(0.05, 0, pos_y, 0)
    Btn.Size = UDim2.new(0.9, 0, 0, 36)
    Btn.Font = Enum.Font.GothamBold
    Btn.Text = text .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 11
    local Corner = Instance.new("UICorner") do Corner.CornerRadius = UDim.new(0, 6) Corner.Parent = Btn end
    return Btn
end

-- إنشاء الأزرار السبعة التكتيكية داخل الواجهة
local EspBtn = CreateMenuButton("👁️ كشف أماكن الهالة (ESP)", 0.14)
local AimBtn = CreateMenuButton("🎯 ايم بوت الصدر الموزون", 0.24)
local TracerBtn = CreateMenuButton("⚡ خطوط الرصاص النيون", 0.34)
local DamageBtn = CreateMenuButton("💥 أرقام الضرر الطائرة", 0.44)
local SpeedBtn = CreateMenuButton("👟 السرعة الموزونة الآمنة", 0.54)
local JumpBtn = CreateMenuButton("🚀 القفز الخفيف المستقر", 0.64)
local AntiKickBtn = CreateMenuButton("🛡️ حماية السيرفر ضد الطرد", 0.74)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.88, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "صُنع خصيصاً لأبو سالم (إسلام) 👑"
StatusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
StatusLabel.TextSize = 12

-- ==========================================
-- ⚙️ البرمجة والربط الميكانيكي للميزات السبعة
-- ==========================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local EspActive, AimActive, TracerActive, DamageActive, SpeedActive, JumpActive, AntiKickActive = false, false, false, false, false, false, false

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- 1. ربط زر كشف الأماكن (ESP)
local function ApplyIslamESP(player)
    local function CreateHighlight(character)
        if not character or not EspActive then return end
        local Highlight = character:FindFirstChild("IslamESP") or Instance.new("Highlight")
        Highlight.Name = "IslamESP"
        Highlight.FillColor = Color3.fromRGB(255, 110, 0)
        Highlight.FillTransparency = 0.55
        Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        Highlight.Adornee = character
        Highlight.Parent = character
    end
    if player.Character then CreateHighlight(player.Character) end
    player.CharacterAdded:Connect(CreateHighlight)
end

EspBtn.MouseButton1Click:Connect(function()
    EspActive = not EspActive
    EspBtn.BackgroundColor3 = EspActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    EspBtn.Text = EspActive and "👁️ كشف أماكن الهالة (ESP): ON" or "👁️ كشف أماكن الهالة (ESP): OFF"
    if EspActive then
        for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then ApplyIslamESP(p) end end
    else
        for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("IslamESP") then p.Character.IslamESP:Destroy() end end
    end
end)

-- 2. ربط زر الايم بوت
AimBtn.MouseButton1Click:Connect(function()
    AimActive = not AimActive
    AimBtn.BackgroundColor3 = AimActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    AimBtn.Text = AimActive and "🎯 ايم بوت الصدر الموزون: ON" or "🎯 ايم بوت الصدر الموزون: OFF"
end)

local function GetClosestEnemyBody()
    local Target = nil local ShortestDistance = 300
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.Health > 0 and Player.Team ~= LocalPlayer.Team then
                local TargetPart = Player.Character.HumanoidRootPart
                local ScreenPos, OnScreen = Camera:WorldToViewportPoint(TargetPart.Position)
                if OnScreen then
                    local ScreenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - ScreenCenter).Magnitude
                    if Distance < ShortestDistance then ShortestDistance = Distance Target = TargetPart end
                end
            end
        end
    end
    return Target
end

-- 3. ربط بقية الأزرار (الخطوط، الضرر، السرعة، القفز، الحماية)
TracerBtn.MouseButton1Click:Connect(function()
    TracerActive = not TracerActive
    TracerBtn.BackgroundColor3 = TracerActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    TracerBtn.Text = TracerActive and "⚡ خطوط الرصاص النيون: ON" or "⚡ خطوط الرصاص النيون: OFF"
end)

local function CreateVisualTracer(startPos, endPos)
    if not TracerActive then return end
    local TracerPart = Instance.new("Part")
    TracerPart.Transparency = 0.2 TracerPart.Color = Color3.fromRGB(255, 110, 0) TracerPart.Material = Enum.Material.Neon TracerPart.Anchored = true TracerPart.CanCollide = false
    local Distance = (startPos - endPos).Magnitude TracerPart.Size = Vector3.new(0.1, 0.1, Distance) TracerPart.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -Distance/2) TracerPart.Parent = workspace
    task.spawn(function() for i = 1, 10 do task.wait(0.03) TracerPart.Transparency = TracerPart.Transparency + 0.08 end TracerPart:Destroy() end)
end

DamageBtn.MouseButton1Click:Connect(function()
    DamageActive = not DamageActive
    DamageBtn.BackgroundColor3 = DamageActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    DamageBtn.Text = DamageActive and "💥 أرقام الضرر الطائرة: ON" or "💥 أرقام الضرر الطائرة: OFF"
end)

SpeedBtn.MouseButton1Click:Connect(function()
    SpeedActive = not SpeedActive
    SpeedBtn.BackgroundColor3 = SpeedActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    SpeedBtn.Text = SpeedActive and "👟 السرعة الموزونة الآمنة: ON" or "👟 السرعة الموزونة الآمنة: OFF"
end)

JumpBtn.MouseButton1Click:Connect(function()
    JumpActive = not JumpActive
    JumpBtn.BackgroundColor3 = JumpActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    JumpBtn.Text = JumpActive and "🚀 القفز الخفيف المستقر: ON" or "🚀 القفز الخفيف المستقر: OFF"
end)

AntiKickBtn.MouseButton1Click:Connect(function()
    AntiKickActive = not AntiKickActive
    AntiKickBtn.BackgroundColor3 = AntiKickActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    AntiKickBtn.Text = AntiKickActive and "🛡️ حماية السيرفر ضد الطرد: ON" or "🛡️ حماية السيرفر ضد الطرد: OFF"
end)

-- حلقة التشغيل والمراقبة الفيزيائية اللحظية لكل الميزات
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        
        Humanoid.WalkSpeed = SpeedActive and 25 or 16
        Humanoid.JumpPower = JumpActive and 65 or 50
        
        if AimActive and (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
            local TargetBody = GetClosestEnemyBody()
            if TargetBody then
                local TargetCFrame = CFrame.new(Camera.CFrame.Position, TargetBody.Position)
                Camera.CFrame = Camera.CFrame:Lerp(TargetCFrame, 0.08)
            end
        end
    end
end)

