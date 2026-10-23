local ScreenGui = game:GetService("CoreGui"):FindFirstChild("IslamLightHub") or Instance.new("ScreenGui")
if ScreenGui.ClassName == "ScreenGui" then ScreenGui:Destroy() end

ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "IslamLightHub"
ScreenGui.Parent = game:GetService("CoreGui")

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
MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 320, 0, 200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner") do UICorner.CornerRadius = UDim.new(0, 12) UICorner.Parent = MainFrame end

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "ISLAM HUB LIGHT v1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13

local EspBtn = Instance.new("TextButton")
EspBtn.Parent = MainFrame
EspBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
EspBtn.Position = UDim2.new(0.05, 0, 0.28, 0)
EspBtn.Size = UDim2.new(0.9, 0, 0, 38)
EspBtn.Font = Enum.Font.GothamBold
EspBtn.Text = "Highlight ESP: OFF"
EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBtn.TextSize = 12
local C1 = Instance.new("UICorner") do C1.CornerRadius = UDim.new(0, 6) C1.Parent = EspBtn end

local AimBtn = Instance.new("TextButton")
AimBtn.Parent = MainFrame
AimBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
AimBtn.Position = UDim2.new(0.05, 0, 0.54, 0)
AimBtn.Size = UDim2.new(0.9, 0, 0, 38)
AimBtn.Font = Enum.Font.GothamBold
AimBtn.Text = "Legit Aimbot: OFF"
AimBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AimBtn.TextSize = 12
local C2 = Instance.new("UICorner") do C2.CornerRadius = UDim.new(0, 6) C2.Parent = AimBtn end

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.78, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "Made For Abu Salem"
StatusLabel.TextColor3 = Color3.fromRGB(215, 90, 0)
StatusLabel.TextSize = 11

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local EspActive, AimActive = false, false

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
    EspActive = not EspActive
    EspBtn.BackgroundColor3 = EspActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    EspBtn.Text = EspActive and "Highlight ESP: ON" or "Highlight ESP: OFF"
    if EspActive then
        for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then ApplyIslamESP(p) end end
    else
        for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("IslamESP") then p.Character.IslamESP:Destroy() end end
    end
end)

AimBtn.MouseButton1Click:Connect(function()
    AimActive = not AimActive
    AimBtn.BackgroundColor3 = AimActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(220, 50, 50)
    AimBtn.Text = AimActive and "Legit Aimbot: ON" or "Legit Aimbot: OFF"
end)

local function GetClosestEnemyBody()
    local Target = nil local ShortestDistance = 300
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.Health > 0 then
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

RunService.RenderStepped:Connect(function()
    if AimActive and LocalPlayer.Character and (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)) then
        local TargetBody = GetClosestEnemyBody()
        if TargetBody then
            local TargetCFrame = CFrame.new(Camera.CFrame.Position, TargetBody.Position)
            Camera.CFrame = Camera.CFrame:Lerp(TargetCFrame, 0.08)
        end
    end
end)
