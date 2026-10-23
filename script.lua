-- ==========================================
--    🔥 ISLAM HUB - ULTIMATE COMBAT MENU 🔥    
-- ==========================================

local ScreenGui = game:GetService("CoreGui"):FindFirstChild("IslamUltimateHub") or Instance.new("ScreenGui")
if ScreenGui.ClassName == "ScreenGui" then ScreenGui:Destroy() end

ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "IslamUltimateHub"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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

local EspBtn = CreateMenuButton("👁️ Highlight ESP", 0.14)
local AimBtn = CreateMenuButton("🎯 Legit Body Lock Aimbot", 0.24)
local TracerBtn = CreateMenuButton("⚡ Neon Bullet Tracers", 0.34)
local DamageBtn = CreateMenuButton("💥 Flying Damage Indicators", 0.44)
local SpeedBtn = CreateMenuButton("👟 Safe Legit WalkSpeed", 0.54)
local JumpBtn = CreateMenuButton("🚀 Stable Low JumpPower", 0.64)
local AntiKickBtn = CreateMenuButton("🛡️ Anti-Kick Bypass Protection", 0.74)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.88, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "Made Specially For Abu Salem 👑"
StatusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
StatusLabel.TextSize = 12

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local EspActive, AimActive, TracerActive, DamageActive, SpeedActive, JumpActive, AntiKickActive = false, false, false, false, false, false, false

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

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
    if not LocalPlayer or not LocalPlayer.Character then return end
    EspActive = not EspActive
    EspBtn.BackgroundColor3 = EspActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    EspBtn.Text = EspActive and "👁️ Highlight ESP: ON" or "👁️ Highlight ESP: OFF"
    if EspActive then
        for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then ApplyIslamESP(p) end end
    else
        for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("IslamESP") then p.Character.IslamESP:Destroy() end end
    end
end)

AimBtn.MouseButton1Click:Connect(function()
    AimActive = not AimActive
    AimBtn.BackgroundColor3 = AimActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    AimBtn.Text = AimActive and "🎯 Legit Body Lock Aimbot: ON" or "🎯 Legit Body Lock Aimbot: OFF"
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

TracerBtn.MouseButton1Click:Connect(function()
    TracerActive = not TracerActive
    TracerBtn.BackgroundColor3 = TracerActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    TracerBtn.Text = TracerActive and "⚡ Neon Bullet Tracers: ON" or "⚡ Neon Bullet Tracers: OFF"
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
    DamageBtn.Text = DamageActive and "💥 Flying Damage Indicators: ON" or "💥 Flying Damage Indicators: OFF"
end)

SpeedBtn.MouseButton1Click:Connect(function()
    SpeedActive = not SpeedActive
    SpeedBtn.BackgroundColor3 = SpeedActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    SpeedBtn.Text = SpeedActive and "👟 Safe Legit WalkSpeed: ON" or "👟 Safe Legit WalkSpeed: OFF"
end)

JumpBtn.MouseButton1Click:Connect(function()
    JumpActive = not JumpActive
    JumpBtn.BackgroundColor3 = JumpActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    JumpBtn.Text = JumpActive and "🚀 Stable Low JumpPower: ON" or "🚀 Stable Low JumpPower: OFF"
end)

AntiKickBtn.MouseButton1Click:Connect(function()
    AntiKickActive = not AntiKickActive
    AntiKickBtn.BackgroundColor3 = AntiKickActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    AntiKickBtn.Text = AntiKickActive and "🛡️ Anti-Kick Bypass Protection: ON" or "🛡️ Anti-Kick Bypass Protection: OFF"
end)

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

UserInputService.MouseButton1Down:Connect(function()
    if TracerActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local Handle = Tool:FindFirstChild("Handle") or Tool:FindFirstChildOfClass("Part")
        if Handle then
                
