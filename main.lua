local UILib = {}

-- Fungsi untuk membuat frame utama
function UILib:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")

    -- Properti ScreenGui
    ScreenGui.Name = "UILibScreenGui"
    ScreenGui.Parent = game.CoreGui

    -- Properti MainFrame
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true

    -- Properti TitleLabel
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.Text = title or "Script UI"
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.SourceSans
    TitleLabel.TextSize = 20

    return MainFrame
end

-- Fungsi untuk membuat tombol *On/Off*
function UILib:CreateToggle(parent, text, default, callback)
    local ToggleFrame = Instance.new("Frame")
    local ToggleButton = Instance.new("TextButton")
    local ToggleLabel = Instance.new("TextLabel")
    local isOn = default or false

    -- Properti ToggleFrame
    ToggleFrame.Parent = parent
    ToggleFrame.Size = UDim2.new(1, -10, 0, 30)
    ToggleFrame.Position = UDim2.new(0, 5, 0, #parent:GetChildren() * 40)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    -- Properti ToggleLabel
    ToggleLabel.Parent = ToggleFrame
    ToggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleLabel.Text = text or "Toggle"
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Font = Enum.Font.SourceSans
    ToggleLabel.TextSize = 18

    -- Properti ToggleButton
    ToggleButton.Parent = ToggleFrame
    ToggleButton.Size = UDim2.new(0.3, 0, 1, 0)
    ToggleButton.Position = UDim2.new(0.7, 0, 0, 0)
    ToggleButton.Text = isOn and "On" or "Off"
    ToggleButton.BackgroundColor3 = isOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.SourceSans
    ToggleButton.TextSize = 18

    -- Interaksi toggle
    ToggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        ToggleButton.Text = isOn and "On" or "Off"
        ToggleButton.BackgroundColor3 = isOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
        if callback then
            callback(isOn)
        end
    end)
end

return UILib
