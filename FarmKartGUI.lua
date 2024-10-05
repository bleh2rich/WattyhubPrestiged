
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")


local Player = Players.LocalPlayer
local BuyKart = Workspace:WaitForChild("BarbStores"):WaitForChild("FarmKart"):WaitForChild("CustomerSeat")
local Karts = Workspace:WaitForChild("Karts")
local RiceFolder = Workspace:WaitForChild("Rice")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
local AutofarmEnabled = false
local AutofarmThread


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Shadow = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local TextSizeConstraint = Instance.new("UITextSizeConstraint")

ScreenGui.Parent = Player:WaitForChild("PlayerGui")


Shadow.Parent = ScreenGui
Shadow.Size = UDim2.new(0, 160, 0, 210)
Shadow.Position = UDim2.new(0.5, -80, 0.5, -105)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.8
Shadow.BorderSizePixel = 0


Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 150, 0, 200)
Frame.Position = UDim2.new(0.5, -75, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderSizePixel = 0


UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 15)


TopBar.Parent = Frame
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderSizePixel = 0


Title.Parent = TopBar
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "Fixed By Dood3"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.Cartoon
Title.TextScaled = true


ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(0, 100, 0, 100)
ToggleButton.Position = UDim2.new(0.5, -50, 0.55, -50)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.new(255, 255, 255)
ToggleButton.Font = Enum.Font.Cartoon
ToggleButton.TextScaled = true
ToggleButton.BorderSizePixel = 0


TextSizeConstraint.Parent = ToggleButton
TextSizeConstraint.MaxTextSize = 20

UICorner.Parent = ToggleButton
UICorner.CornerRadius = UDim.new(1, 0)

local ButtonShadow = Instance.new("Frame")
ButtonShadow.Parent = Frame
ButtonShadow.Size = ToggleButton.Size + UDim2.new(0, 20, 0, 20)
ButtonShadow.Position = ToggleButton.Position - UDim2.new(0, 10, 0, 10)
ButtonShadow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ButtonShadow.BackgroundTransparency = 0.5
ButtonShadow.BorderSizePixel = 0
ButtonShadow.ZIndex = ToggleButton.ZIndex - 1


local dragging = false
local dragStart
local startPos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        Shadow.Position = Frame.Position + UDim2.new(0, -5, 0, -5)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)


function GetTool(Name)
    local Tool = Player.Character and Player.Character:FindFirstChild(Name) or Player.Backpack:FindFirstChild(Name)
    if Tool and Player.Character then
        Tool.Parent = Player.Character
        task.wait()
        return Tool
    end
end


function GetRice()
    for _, Rice in next, RiceFolder:GetChildren() do
        local Model = Rice:FindFirstChildOfClass("Model")
        if Model and Model.PrimaryPart and Rice:FindFirstChild("Health") and Rice.Health.Value > 0 and Rice:FindFirstChild("Reward") and Rice.Reward.Value > 0 then
            return Rice, Model.PrimaryPart
        end
    end
end


function UseKart(Kart)
    task.wait()
    if Kart.Name == Player.Name then
        local Sickles = {Kart:WaitForChild("LeftSickle"), Kart:WaitForChild("RightSickle")}
        while Kart.Parent == Karts and task.wait() and AutofarmEnabled do
            if Kart:FindFirstChild("VehicleSeat") and Kart.VehicleSeat.Occupant ~= Player.Character.Humanoid then
                Kart.VehicleSeat:Sit(Player.Character.Humanoid)
            end
            local Rice, Part = GetRice()
            if Rice and Kart.PrimaryPart then
                Kart:SetPrimaryPartCFrame(Part.CFrame * CFrame.new(0, 5, -3))
                for _, Sickle in next, Sickles do
                    firetouchinterest(Sickle, Part, 0)
                    firetouchinterest(Sickle, Part, 1)
                end
            end
        end
    end
end


function Autofarm()
    while AutofarmEnabled do
        if not Karts:FindFirstChild(Player.Name) then
            local Tool = GetTool("FarmKart")
            local Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
            if Humanoid and Humanoid.Health <= 0 then
                RemoteEvent:FireServer("Respawn")
            elseif Tool then
                Tool:Activate()
            else
                BuyKart:Sit(Player.Character.Humanoid)
            end
        else
            UseKart(Karts[Player.Name])
        end
        task.wait(2.3)
    end
end


ToggleButton.MouseButton1Click:Connect(function()
    AutofarmEnabled = not AutofarmEnabled
    if AutofarmEnabled then
        ToggleButton.Text = "ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) 
        ButtonShadow.BackgroundColor3 = Color3.fromRGB(0, 255, 0) 
        if not AutofarmThread then
            AutofarmThread = task.spawn(Autofarm)
        end
    else
        ToggleButton.Text = "OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        ButtonShadow.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
        AutofarmEnabled = false
        AutofarmThread = nil
    end
end)


local CloseButton = Instance.new("TextButton")
CloseButton.Parent = ScreenGui
CloseButton.Size = UDim2.new(0, 120, 0, 40)
CloseButton.Position = UDim2.new(0, 15, 0.55, 0) 
CloseButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
CloseButton.BackgroundTransparency = 0.5
CloseButton.Text = "Close GUI"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.Cartoon
CloseButton.TextScaled = true
CloseButton.BorderSizePixel = 0


local CloseButtonShadow = Instance.new("Frame")
CloseButtonShadow.Parent = ScreenGui
CloseButtonShadow.Size = CloseButton.Size + UDim2.new(0, 10, 0, 10)
CloseButtonShadow.Position = CloseButton.Position - UDim2.new(0, 5, 0, 5)
CloseButtonShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseButtonShadow.BackgroundTransparency = 0.6
CloseButtonShadow.BorderSizePixel = 0
CloseButtonShadow.ZIndex = CloseButton.ZIndex - 1


local CloseButtonTextSizeConstraint = Instance.new("UITextSizeConstraint")
CloseButtonTextSizeConstraint.Parent = CloseButton
CloseButtonTextSizeConstraint.MaxTextSize = 24


CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)


local HideButton = Instance.new("TextButton")
HideButton.Parent = ScreenGui
HideButton.Size = UDim2.new(0, 120, 0, 40)
HideButton.Position = UDim2.new(0, 15, 0.67, 0) 
HideButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
HideButton.BackgroundTransparency = 0.5
HideButton.Text = "Hide GUI"
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HideButton.Font = Enum.Font.Cartoon
HideButton.TextScaled = true
HideButton.BorderSizePixel = 0


local HideButtonShadow = Instance.new("Frame")
HideButtonShadow.Parent = ScreenGui
HideButtonShadow.Size = HideButton.Size + UDim2.new(0, 10, 0, 10)
HideButtonShadow.Position = HideButton.Position - UDim2.new(0, 5, 0, 5)
HideButtonShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HideButtonShadow.BackgroundTransparency = 0.6
HideButtonShadow.BorderSizePixel = 0
HideButtonShadow.ZIndex = HideButton.ZIndex - 1


local HideButtonTextSizeConstraint = Instance.new("UITextSizeConstraint")
HideButtonTextSizeConstraint.Parent = HideButton
HideButtonTextSizeConstraint.MaxTextSize = 24


local GUIVisible = true
HideButton.MouseButton1Click:Connect(function()
    GUIVisible = not GUIVisible
    Frame.Visible = GUIVisible
    Shadow.Visible = GUIVisible
    HideButton.Text = GUIVisible and "Hide GUI" or "Open GUI"
end)
