-- Chèn LocalScript này vào StarterGui > ScreenGui

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId

-- Tạo UI chính
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AccountGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Khung chính có thể kéo
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 360, 0, 240)
mainFrame.Position = UDim2.new(0.5, -180, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
mainFrame.BackgroundTransparency = 0.1
mainFrame.ClipsDescendants = true

-- Avatar
local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0, 50, 0, 50)
avatar.Position = UDim2.new(0, 10, 0, 10)
avatar.BackgroundTransparency = 1
avatar.Image = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%s&width=420&height=420&format=png", userId)
avatar.Parent = mainFrame

-- Che tên người chơi bằng ###
local username = player.Name
local visibleName = username
if #username > 4 then
    visibleName = username:sub(1, #username - 4) .. "####"
end

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, -70, 0, 50)
usernameLabel.Position = UDim2.new(0, 70, 0, 10)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Text = "Tài khoản: " .. visibleName
usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
usernameLabel.Font = Enum.Font.GothamBold
usernameLabel.TextSize = 20
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
usernameLabel.Parent = mainFrame

-- Hộp ghi chú (không có placeholder)
local noteBox = Instance.new("TextBox")
noteBox.Size = UDim2.new(1, -8, 1, -8)
noteBox.Position = UDim2.new(0, 4, 0, 4)
noteBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
noteBox.TextColor3 = Color3.fromRGB(0, 0, 0)
noteBox.ClearTextOnFocus = false
noteBox.PlaceholderText = "" -- Bỏ "Tự động ghi chú"
noteBox.Font = Enum.Font.Gotham
noteBox.TextSize = 18
noteBox.Text = ""
noteBox.TextWrapped = true
noteBox.TextXAlignment = Enum.TextXAlignment.Left
noteBox.TextYAlignment = Enum.TextYAlignment.Top
noteBox.Parent = greenBorder

-- Nút lưu ghi chú
local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(0, 140, 0, 40)
saveButton.Position = UDim2.new(0.5, -70, 0, 145)
saveButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
saveButton.Text = "💾 Lưu "
saveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
saveButton.Font = Enum.Font.GothamBold
saveButton.TextSize = 18
saveButton.Parent = mainFrame
saveButton.BorderSizePixel = 0
saveButton.AutoButtonColor = true

-- Nhãn thông báo lưu
local savedLabel = Instance.new("TextLabel")
savedLabel.Size = UDim2.new(1, 0, 0, 30)
savedLabel.Position = UDim2.new(0, 0, 1, -30)
savedLabel.BackgroundTransparency = 1
savedLabel.Text = "✅ Đã lưu !"
savedLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
savedLabel.Font = Enum.Font.GothamSemibold
savedLabel.TextSize = 16
savedLabel.Visible = false
savedLabel.Parent = mainFrame

-- Xử lý lưu
saveButton.MouseButton1Click:Connect(function()
	local note = noteBox.Text
	print("[" .. player.Name .. "] đã lưu : " .. note)

	savedLabel.Visible = true
	wait(2)
	savedLabel.Visible = false
end)
