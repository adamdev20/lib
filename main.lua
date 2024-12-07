local UILib = {}

-- Fungsi untuk membuat window utama dengan fitur minimalkan dan drag
function UILib:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local MinimizeButton = Instance.new("TextButton")
    local isMinimized = false  -- Variabel untuk status minimalkan
    local isDragging = false  -- Untuk mengecek status dragging
    local dragStart = nil
    local startPos = nil

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

    -- Properti TitleLabel
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.Text = title or "Script UI"
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.SourceSans
    TitleLabel.TextSize = 20

    -- Properti MinimizeButton
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = MainFrame
    MinimizeButton.Text = "-"
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -30, 0, 0)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Fungsi untuk mengubah status minimalkan
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            MainFrame.Size = UDim2.new(0, 300, 0, 30)  -- Ubah ukuran menjadi minimal
        else
            MainFrame.Size = UDim2.new(0, 300, 0, 400)  -- Kembalikan ukuran asli
        end
    end)

    -- Fitur Drag untuk geser-geser window
    TitleLabel.MouseButton1Down:Connect(function(input)
        isDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end)

    TitleLabel.MouseMoved:Connect(function(input)
        if isDragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    TitleLabel.MouseButton1Up:Connect(function()
        isDragging = false
    end)

    return MainFrame
end

return UILib
