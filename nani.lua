local ui = game:GetService("CoreGui"):FindFirstChild("dawidlib")
    if ui then
        ui:Destroy()
local lib = {CurrentlyBinding = false,RainbowColorValue = 0, HueSelectionPosition = 0}

local themes = {
Light = {
Color1 = Color3.fromRGB(255,255,255),
Color2 = Color3.fromRGB(240,240,240),
Color3 = Color3.fromRGB(228,228,228),
TabColor = Color3.fromRGB(220, 220, 220),
ScrollBar = Color3.fromRGB(213, 213, 213),
TextColor = Color3.fromRGB(0,0,0)
},
Dark = {
Color1 = Color3.fromRGB(35,35,35),
Color2 = Color3.fromRGB(38,38,38),
Color3 = Color3.fromRGB(31,31,31),
TabColor = Color3.fromRGB(45,45,45),
ScrollBar = Color3.fromRGB(58, 58, 58),
TextColor = Color3.fromRGB(255,255,255)
}
}
local HttpService = game:GetService("HttpService")
local loadedinfo = {}
local selectedtheme = "Light"
local watermarkpos = "BottomLeft"
local watermarktext = "dawid hub"

pcall(function()
loadedinfo = HttpService:JSONDecode(readfile("dawidhubinfo.txt"))
selectedtheme = loadedinfo["theme"] or "Light"
watermarktext = loadedinfo["watermarktext"] or "dawid hub"
watermarkpos = loadedinfo["watermarkpos"] or "BottomLeft"
end)

local function saveinfo()
loadedinfo["theme"] = selectedtheme
loadedinfo["watermarktext"] = watermarktext
loadedinfo["watermarkpos"] = watermarkpos
writefile("dawidhubinfo.txt", HttpService:JSONEncode(loadedinfo))
end




coroutine.wrap(
function()
while wait() do
lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
lib.HueSelectionPosition = lib.HueSelectionPosition + 1

if lib.RainbowColorValue >= 1 then
lib.RainbowColorValue = 0
end

if lib.HueSelectionPosition == 80 then
lib.HueSelectionPosition = 0
end
end
end
)()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function MakeDraggable(topbarobject, object)
local Dragging = nil
local DragInput = nil
local DragStart = nil
local StartPosition = nil

local function Update(input)
local Delta = input.Position - DragStart
local pos =
UDim2.new(
StartPosition.X.Scale,
StartPosition.X.Offset + Delta.X,
StartPosition.Y.Scale,
StartPosition.Y.Offset + Delta.Y
)
object.Position = pos
end

topbarobject.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
Dragging = true
DragStart = input.Position
StartPosition = object.Position

input.Changed:Connect(
function()
if input.UserInputState == Enum.UserInputState.End then
Dragging = false
end
end
)
end
end
)

topbarobject.InputChanged:Connect(
function(input)
if
input.UserInputType == Enum.UserInputType.MouseMovement or
input.UserInputType == Enum.UserInputType.Touch
then
DragInput = input
end
end
)

UserInputService.InputChanged:Connect(
function(input)
if input == DragInput and Dragging then
Update(input)
end
end
)
end

local dawidlib = Instance.new("ScreenGui")
dawidlib.Name = "dawidlib"
dawidlib.Parent = game.CoreGui
dawidlib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function loadwatermark()
local WatermarkFrame = Instance.new("Frame")
local WatermarkLabel = Instance.new("TextLabel")

WatermarkFrame.Name = "WatermarkFrame"
WatermarkFrame.Parent = dawidlib
WatermarkFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WatermarkFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WatermarkFrame.BackgroundTransparency = 1.000
WatermarkFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
WatermarkFrame.Size = UDim2.new(1, 0, 1, 0)

WatermarkLabel.Name = "WatermarkLabel"
WatermarkLabel.Parent = WatermarkFrame
WatermarkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
WatermarkLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WatermarkLabel.BackgroundTransparency = 1.000
WatermarkLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
WatermarkLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
WatermarkLabel.Size = UDim2.new(1, -25, 1, -25)
WatermarkLabel.Font = Enum.Font.Gotham
WatermarkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WatermarkLabel.TextSize = 16.000
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Bottom
WatermarkLabel.Text = watermarktext

coroutine.wrap(
function()
while wait() do
WatermarkLabel.Text = watermarktext
if watermarkpos == "BottomLeft" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Bottom
elseif watermarkpos == "BottomRight" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Bottom
elseif watermarkpos == "TopLeft" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Left
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Top
elseif watermarkpos == "TopRight" then
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Right
WatermarkLabel.TextYAlignment = Enum.TextYAlignment.Top
end
end
end
)()
end

function lib:ChangeTheme(theme)
selectedtheme = theme
saveinfo()
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()


local function errornotif(text)

local error = Instance.new("ScreenGui")
local ErrorMain = Instance.new("Frame")
local ErrorMainCircle = Instance.new("Frame")
local ErrorMainCircleImg = Instance.new("ImageLabel")
local ErrorMainCircleCorner = Instance.new("UICorner")
local ErrorText = Instance.new("TextLabel")


error.Name = "error"
error.Parent = game.CoreGui
error.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ErrorMain.Name = "ErrorMain"
ErrorMain.Parent = error
ErrorMain.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
ErrorMain.BackgroundTransparency = 1.000
ErrorMain.BorderSizePixel = 0
ErrorMain.Size = UDim2.new(1, 0, 1, 0)

ErrorMainCircle.Name = "ErrorMainCircle"
ErrorMainCircle.Parent = ErrorMain
ErrorMainCircle.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorMainCircle.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ErrorMainCircle.BackgroundTransparency = 1.000
ErrorMainCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
ErrorMainCircle.Size = UDim2.new(0, 100, 0, 100)

ErrorMainCircleImg.Name = "ErrorMainCircleImg"
ErrorMainCircleImg.Parent = ErrorMainCircle
ErrorMainCircleImg.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorMainCircleImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ErrorMainCircleImg.BackgroundTransparency = 1.000
ErrorMainCircleImg.Position = UDim2.new(0.5, 0, 0.5, 0)
ErrorMainCircleImg.Size = UDim2.new(0, 75, 0, 75)
ErrorMainCircleImg.Image = "http://www.roblox.com/asset/?id=6031260781"
ErrorMainCircleImg.ImageColor3 = Color3.fromRGB(17, 17, 17)
ErrorMainCircleImg.ImageTransparency = 1.000

ErrorMainCircleCorner.CornerRadius = UDim.new(1, 8)
ErrorMainCircleCorner.Name = "ErrorMainCircleCorner"
ErrorMainCircleCorner.Parent = ErrorMainCircle

ErrorText.Name = "ErrorText"
ErrorText.Parent = ErrorMain
ErrorText.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ErrorText.BackgroundTransparency = 1.000
ErrorText.Position = UDim2.new(0.5, 0, 0.5, 50)
ErrorText.Size = UDim2.new(0, 200, 0, 50)
ErrorText.Font = Enum.Font.Gotham
ErrorText.Text = text
ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
ErrorText.TextSize = 18.000
ErrorText.TextTransparency = 1.000

TweenService:Create(
ErrorMain,
TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()

wait(.5)

TweenService:Create(
ErrorMainCircle,
TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
ErrorMainCircleImg,
TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ImageTransparency = 0}
):Play()

wait(.8)

ErrorMainCircle:TweenPosition(UDim2.new(0.5, 0, 0.5, -25), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .4, true)

wait(.1)

TweenService:Create(
ErrorText,
TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
end


function lib:Window()
local fs = false
local Main = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local LeftFrame = Instance.new("Frame")
local LeftFrame1 = Instance.new("Frame")
local CloseBtn = Instance.new("TextButton")
local CloseBtnCorner = Instance.new("UICorner")
local CloseBtnImg = Instance.new("ImageLabel")
local TabHold = Instance.new("Frame")
local TabHoldLayout = Instance.new("UIListLayout")
local Line = Instance.new("Frame")
local LeftFrameCorner = Instance.new("UICorner")
local TabFolder = Instance.new("Folder")
local DragFrame = Instance.new("Frame")

Main.Name = "Main"
Main.Parent = dawidlib
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.5, 0, 0.498903513, 0)
Main.Size = UDim2.new(0, 541, 0, 368)
Main.BorderSizePixel = 0

MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

LeftFrame.Name = "LeftFrame"
LeftFrame.Parent = Main
LeftFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
LeftFrame.Position = UDim2.new(-0.00047751033, 0, 0, 0)
LeftFrame.Size = UDim2.new(0, 162, 0, 368)

LeftFrame1.Name = "LeftFrame1"
LeftFrame1.Parent = LeftFrame
LeftFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
LeftFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
LeftFrame1.BorderSizePixel = 0
LeftFrame1.Position = UDim2.new(0.971977353, 0, 0.500343084, 0)
LeftFrame1.Size = UDim2.new(0, 9, 1, 0)

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = LeftFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(244, 96, 86)
CloseBtn.Position = UDim2.new(0.126000002, 0, 0.0649999976, 0)
CloseBtn.Size = UDim2.new(0, 13, 0, 13)
CloseBtn.AutoButtonColor = false
CloseBtn.Font = Enum.Font.SourceSans
CloseBtn.Text = ""
CloseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.TextSize = 14.000

CloseBtnCorner.CornerRadius = UDim.new(1, 0)
CloseBtnCorner.Name = "CloseBtnCorner"
CloseBtnCorner.Parent = CloseBtn

CloseBtnImg.Name = "CloseBtnImg"
CloseBtnImg.Parent = CloseBtn
CloseBtnImg.BackgroundColor3 = Color3.fromRGB(244, 96, 86)
CloseBtnImg.BackgroundTransparency = 1.000
CloseBtnImg.Position = UDim2.new(0.144999996, 0, 0.144999996, 0)
CloseBtnImg.Size = UDim2.new(0, 9, 0, 9)
CloseBtnImg.Image = "http://www.roblox.com/asset/?id=6031094678"
CloseBtnImg.ImageColor3 = Color3.fromRGB(170, 65, 60)
CloseBtnImg.ImageTransparency = 1.000

DragFrame.Name = "DragFrame"
DragFrame.Parent = LeftFrame
DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragFrame.BackgroundTransparency = 1.000
DragFrame.Size = UDim2.new(0, 161, 0, 36)

TabHold.Name = "TabHold"
TabHold.Parent = LeftFrame
TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHold.BackgroundTransparency = 1.000
TabHold.Position = UDim2.new(0.063000001, 0, 0.119999997, 0)
TabHold.Size = UDim2.new(0, 143, 0, 313)

TabHoldLayout.Name = "TabHoldLayout"
TabHoldLayout.Parent = TabHold
TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabHoldLayout.Padding = UDim.new(0, 4)

Line.Name = "Line"
Line.Parent = LeftFrame
Line.BackgroundColor3 = Color3.fromRGB(228, 228, 228)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.9941926, 0, 0.000451792846, 0)
Line.Size = UDim2.new(0, 2, 0, 368)

LeftFrameCorner.CornerRadius = UDim.new(0, 10)
LeftFrameCorner.Name = "LeftFrameCorner"
LeftFrameCorner.Parent = LeftFrame

TabFolder.Name = "TabFolder"
TabFolder.Parent = LeftFrame

MakeDraggable(DragFrame,Main)
loadwatermark()

CloseBtn.MouseButton1Click:Connect(function()
Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
end)

CloseBtn.MouseEnter:Connect(function()
CloseBtnImg.ImageTransparency = 0
end)

CloseBtn.MouseLeave:Connect(function()
CloseBtnImg.ImageTransparency = 1
end)

coroutine.wrap(
function()
while wait() do
Main.BackgroundColor3 = themes[selectedtheme].Color1
LeftFrame.BackgroundColor3 = themes[selectedtheme].Color2
LeftFrame1.BackgroundColor3 = themes[selectedtheme].Color2
Line.BackgroundColor3 = themes[selectedtheme].Color3
end
end
)()


function lib:Notification(text,desc,icotext,btntext)
local NotificationHold = Instance.new("TextButton")
local NotificationHoldCorner = Instance.new("UICorner")
local Notification = Instance.new("Frame")
local NotificationTitle = Instance.new("TextLabel")
local NotificationCorner = Instance.new("UICorner")
local NotificationIco = Instance.new("ImageLabel")
local NotificationBtn = Instance.new("TextButton")
local NotificationBtnCorner = Instance.new("UICorner")
local NotificationDesc = Instance.new("TextLabel")
local NotificationHoldScale = Instance.new("UIScale")

NotificationHold.Name = "NotificationHold"
NotificationHold.Parent = Main
NotificationHold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationHold.BackgroundTransparency = 1.000
NotificationHold.Position = UDim2.new(0, 0, 8.2928203e-08, 0)
NotificationHold.Size = UDim2.new(1, 29, 1, 20)
NotificationHold.AutoButtonColor = false
NotificationHold.Font = Enum.Font.SourceSans
NotificationHold.Text = ""
NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
NotificationHold.TextSize = 14.000

NotificationHoldCorner.CornerRadius = UDim.new(0, 10)
NotificationHoldCorner.Name = "NotificationHoldCorner"
NotificationHoldCorner.Parent = NotificationHold

Notification.Name = "Notification"
Notification.Parent = NotificationHold
Notification.AnchorPoint = Vector2.new(0.5, 0.5)
Notification.BackgroundColor3 = themes[selectedtheme].Color1
Notification.BackgroundTransparency = 1.000
Notification.Position = UDim2.new(0.5, 0, 0.5, 0)
Notification.Selectable = true
Notification.Size = UDim2.new(0, 142, 0, 179)

NotificationTitle.Name = "NotificationTitle"
NotificationTitle.Parent = Notification
NotificationTitle.BackgroundColor3 = themes[selectedtheme].TextColor
NotificationTitle.BackgroundTransparency = 1.000
NotificationTitle.Position = UDim2.new(0, 0, 0.5, -17)
NotificationTitle.Size = UDim2.new(1, 0, 0, 15)
NotificationTitle.Font = Enum.Font.GothamSemibold
NotificationTitle.Text = text
NotificationTitle.TextColor3 = themes[selectedtheme].TextColor
NotificationTitle.TextSize = 16.000
NotificationTitle.TextTransparency = 1.000

NotificationCorner.CornerRadius = UDim.new(0, 7)
NotificationCorner.Name = "NotificationCorner"
NotificationCorner.Parent = Notification

NotificationIco.Name = "NotificationIco"
NotificationIco.Parent = Notification
NotificationIco.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationIco.BackgroundTransparency = 1.000
NotificationIco.BorderSizePixel = 0
NotificationIco.Position = UDim2.new(0.5, 0, 0.5, -55)
NotificationIco.Size = UDim2.new(0, 60, 0, 60)
NotificationIco.Image = icotext
NotificationIco.ImageColor3 = Color3.fromRGB(31, 118, 219)
NotificationIco.ImageTransparency = 1.000

NotificationBtn.Name = "NotificationBtn"
NotificationBtn.Parent = Notification
NotificationBtn.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationBtn.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
NotificationBtn.BackgroundTransparency = 1.000
NotificationBtn.Position = UDim2.new(0.5, 0, 0.5, 78)
NotificationBtn.Size = UDim2.new(0, 150, 0, 28)
NotificationBtn.Font = Enum.Font.Gotham
NotificationBtn.Text = btntext
NotificationBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationBtn.TextSize = 14.000
NotificationBtn.TextTransparency = 1.000
NotificationBtn.AutoButtonColor = false

NotificationBtnCorner.CornerRadius = UDim.new(0, 5)
NotificationBtnCorner.Name = "NotificationBtnCorner"
NotificationBtnCorner.Parent = NotificationBtn

NotificationDesc.Name = "NotificationDesc"
NotificationDesc.Parent = Notification
NotificationDesc.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationDesc.BackgroundTransparency = 1.000
NotificationDesc.Position = UDim2.new(0.5, 0, 0.458999991, 38)
NotificationDesc.Size = UDim2.new(1.01365006, -25, 0.168424815, 25)
NotificationDesc.Font = Enum.Font.Gotham
NotificationDesc.Text = desc
NotificationDesc.TextColor3 = themes[selectedtheme].TextColor
NotificationDesc.TextSize = 14.000
NotificationDesc.TextTransparency = 1.000
NotificationDesc.TextWrapped = true

NotificationHoldScale.Name = "NotificationHoldScale"
NotificationHoldScale.Parent = NotificationHold
NotificationHoldScale.Scale = 0.950

TweenService:Create(
NotificationHold,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0.7}
):Play()
wait(.2)
Notification:TweenSize(UDim2.new(0, 172, 0, 209), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
TweenService:Create(
NotificationIco,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ImageTransparency = 0}
):Play()
TweenService:Create(
Notification,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 0}
):Play()
TweenService:Create(
NotificationDesc,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()
TweenService:Create(
NotificationTitle,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 0}
):Play()

NotificationBtn.MouseButton1Click:Connect(function()
Notification:TweenSize(UDim2.new(0, 142, 0, 179), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
TweenService:Create(
NotificationIco,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ImageTransparency = 1}
):Play()
TweenService:Create(
Notification,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()
TweenService:Create(
NotificationDesc,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
TweenService:Create(
NotificationBtn,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
TweenService:Create(
NotificationTitle,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{TextTransparency = 1}
):Play()
wait(.2)
TweenService:Create(
NotificationHold,
TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{BackgroundTransparency = 1}
):Play()	
wait(.2)
NotificationHold:Destroy()
end)
end


local tabhold = {}

function tabhold:Label(text)
local labelfunc = {}
local LabelFrame = Instance.new("Frame")
local Label = Instance.new("TextLabel")

LabelFrame.Name = "LabelFrame"
LabelFrame.Parent = TabHold
LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LabelFrame.BackgroundTransparency = 1.000
LabelFrame.Size = UDim2.new(0, 70, 0, 17)

Label.Name = "Label"
Label.Parent = LabelFrame
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Position = UDim2.new(0.139885604, 0, 0, 0)
Label.Size = UDim2.new(0, 134, 0, 17)
Label.Font = Enum.Font.GothamSemibold
Label.Text = text
Label.TextColor3 = Color3.fromRGB(182, 182, 182)
Label.TextSize = 12.000
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.TextYAlignment = Enum.TextYAlignment.Bottom
function labelfunc:Change(tochange)
Label.Text = tochange
end
return labelfunc
end

function tabhold:Tab(text, img, color)
local TabBtn = Instance.new("TextButton")
local TabBtnCorner = Instance.new("UICorner")
local TabBtnTitle = Instance.new("TextLabel")
local TabBtnIco = Instance.new("ImageLabel")

TabBtn.Name = "TabBtn"
TabBtn.Parent = TabHold
TabBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
TabBtn.BackgroundTransparency = 1.000
TabBtn.Position = UDim2.new(0, 0, 0.0849673226, 0)
TabBtn.Size = UDim2.new(0, 143, 0, 26)
TabBtn.AutoButtonColor = false
TabBtn.Font = Enum.Font.SourceSans
TabBtn.Text = ""
TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
TabBtn.TextSize = 14.000

TabBtnCorner.CornerRadius = UDim.new(0, 6)
TabBtnCorner.Name = "TabBtnCorner"
TabBtnCorner.Parent = TabBtn

TabBtnTitle.Name = "TabBtnTitle"
TabBtnTitle.Parent = TabBtn
TabBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabBtnTitle.BackgroundTransparency = 1.000
TabBtnTitle.Position = UDim2.new(0.170713201, 0, 0, 0)
TabBtnTitle.Size = UDim2.new(0, 116, 0, 26)
TabBtnTitle.Font = Enum.Font.Gotham
TabBtnTitle.Text = text
TabBtnTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
TabBtnTitle.TextSize = 13.000
TabBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

TabBtnIco.Name = "TabBtnIco"
TabBtnIco.Parent = TabBtn
TabBtnIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabBtnIco.BackgroundTransparency = 1.000
TabBtnIco.Position = UDim2.new(0.0120000001, 3, 0.170000002, 0)
TabBtnIco.Size = UDim2.new(0, 17, 0, 17)
TabBtnIco.Image = img
TabBtnIco.ImageColor3 = color

local Tab = Instance.new("ScrollingFrame")
local TabLayout = Instance.new("UIListLayout")

Tab.Name = "Tab"
Tab.Parent = TabFolder
Tab.Active = true
Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab.BackgroundTransparency = 1.000
Tab.BorderSizePixel = 0
Tab.Position = UDim2.new(1.09876585, 0, 0.0461956523, 0)
Tab.Size = UDim2.new(0, 352, 0, 335)
Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
Tab.ScrollBarThickness = 5
Tab.Visible = false
Tab.ScrollBarImageColor3 = Color3.fromRGB(213, 213, 213)

TabLayout.Name = "TabLayout"
TabLayout.Parent = Tab
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0, 8)

if fs == false then
fs = true
TabBtn.BackgroundTransparency = 0
Tab.Visible = true
end

TabBtn.MouseButton1Click:Connect(function()
for i,v in next, TabFolder:GetChildren() do
if v.Name == "Tab" then
v.Visible = false
end
Tab.Visible = true
end	
for i,v in next, TabHold:GetChildren() do
if v.Name == "TabBtn" then
v.BackgroundTransparency = 1
TabBtn.BackgroundTransparency = 0
end
end	
end)

coroutine.wrap(
function()
while wait() do
TabBtn.BackgroundColor3 = themes[selectedtheme].TabColor
TabBtnTitle.TextColor3 = themes[selectedtheme].TextColor
Tab.ScrollBarImageColor3 = themes[selectedtheme].ScrollBar
end
end
)()
local tabcontent = {}
function tabcontent:Line(text)
local Line = Instance.new("TextLabel")

Line.Name = "Line"
Line.Parent = Tab
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.BackgroundTransparency = 1.000
Line.Size = UDim2.new(1, 0, 0, 13)
Line.Font = Enum.Font.GothamSemibold
Line.Text = text
Line.TextColor3 = Color3.fromRGB(0, 0, 0)
Line.TextSize = 14.000
Line.TextXAlignment = Enum.TextXAlignment.Left

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
Line.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
function tabcontent:Label(text)
local Label = Instance.new("TextLabel")

Label.Name = "Label"
Label.Parent = Tab
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(1, 0, 0, 13)
Label.Font = Enum.Font.Gotham
Label.Text = text
Label.TextColor3 = Color3.fromRGB(0, 0, 0)
Label.TextSize = 14.000

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
Label.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
function tabcontent:Button(text, callback)
local hovering = false
local Button = Instance.new("TextButton")
local ButtonFrame = Instance.new("Frame")
local ButtonFrameCorner = Instance.new("UICorner")
local ButtonCorner = Instance.new("UICorner")
local ButtonHoverFrame = Instance.new("Frame")
local ButtonHoverFrameCorner = Instance.new("UICorner")
local ButtonText = Instance.new("TextLabel")

Button.Name = "Button"
Button.Parent = Tab
Button.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Button.BorderSizePixel = 0
Button.AutoButtonColor = false
Button.Font = Enum.Font.Gotham
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000

ButtonFrame.Name = "ButtonFrame"
ButtonFrame.Parent = Button
ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonFrame.BorderSizePixel = 0
ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ButtonFrame.Size = UDim2.new(1, -4, 0, 21)

ButtonFrameCorner.CornerRadius = UDim.new(0, 5)
ButtonFrameCorner.Name = "ButtonFrameCorner"
ButtonFrameCorner.Parent = ButtonFrame

ButtonCorner.CornerRadius = UDim.new(0, 5)
ButtonCorner.Name = "ButtonCorner"
ButtonCorner.Parent = Button

ButtonHoverFrame.Name = "ButtonHoverFrame"
ButtonHoverFrame.Parent = Button
ButtonHoverFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonHoverFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ButtonHoverFrame.BackgroundTransparency = 1.000
ButtonHoverFrame.BorderSizePixel = 0
ButtonHoverFrame.Position = UDim2.new(0.5, 0, 0.528750002, 0)
ButtonHoverFrame.Size = UDim2.new(1, 0, 0, 25)

ButtonHoverFrameCorner.CornerRadius = UDim.new(0, 5)
ButtonHoverFrameCorner.Name = "ButtonHoverFrameCorner"
ButtonHoverFrameCorner.Parent = ButtonHoverFrame

ButtonText.Name = "ButtonText"
ButtonText.Parent = Button
ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonText.BackgroundTransparency = 1.000
ButtonText.Size = UDim2.new(1, 0, 1, 0)
ButtonText.Font = Enum.Font.Gotham
ButtonText.Text = text
ButtonText.TextColor3 = Color3.fromRGB(0, 0, 0)
ButtonText.TextSize = 14.000

coroutine.wrap(
function()
while wait() do
Button.BackgroundColor3 = themes[selectedtheme].Color2
ButtonFrame.BackgroundColor3 = themes[selectedtheme].Color1
if hovering == false then
ButtonText.TextColor3 = themes[selectedtheme].TextColor
end
end
end
)()

Button.MouseEnter:Connect(function()
hovering = true
ButtonHoverFrame.BackgroundTransparency = 0
ButtonText.TextColor3 = Color3.fromRGB(255,255,255)
end)

Button.MouseLeave:Connect(function()
hovering = false
ButtonHoverFrame.BackgroundTransparency = 1
ButtonText.TextColor3 = themes[selectedtheme].TextColor
end)

Button.MouseButton1Click:Connect(function()
pcall(callback)
end)

Button.Size = UDim2.new(0, ButtonText.TextBounds.X + 20, 0, 25)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
function tabcontent:Toggle(text, default, callback)
local toggled = false
local Toggle = Instance.new("TextButton")
local ToggleFrame = Instance.new("Frame")
local ToggleFrameCorner = Instance.new("UICorner")
local ToggleFrame1 = Instance.new("Frame")
local ToggleFrame1Corner = Instance.new("UICorner")
local ToggleFrame2 = Instance.new("Frame")
local ToggleFrame2Corner = Instance.new("UICorner")
local ToggleToggledFrame = Instance.new("Frame")
local ToggleToggledFrameCorner = Instance.new("UICorner")
local ToggleTick = Instance.new("ImageLabel")
local ToggleText = Instance.new("TextLabel")

Toggle.Name = "Toggle"
Toggle.Parent = Tab
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0.394886374, 0, 0.0925373137, 0)
Toggle.Size = UDim2.new(0, 71, 0, 16)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

ToggleFrame.Name = "ToggleFrame"
ToggleFrame.Parent = Toggle
ToggleFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ToggleFrame.Size = UDim2.new(0, 16, 0, 16)

ToggleFrameCorner.CornerRadius = UDim.new(0, 5)
ToggleFrameCorner.Name = "ToggleFrameCorner"
ToggleFrameCorner.Parent = ToggleFrame

ToggleFrame1.Name = "ToggleFrame1"
ToggleFrame1.Parent = ToggleFrame
ToggleFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ToggleFrame1.Size = UDim2.new(0, 16, 0, 16)

ToggleFrame1Corner.CornerRadius = UDim.new(0, 5)
ToggleFrame1Corner.Name = "ToggleFrame1Corner"
ToggleFrame1Corner.Parent = ToggleFrame1

ToggleFrame2.Name = "ToggleFrame2"
ToggleFrame2.Parent = ToggleFrame1
ToggleFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
ToggleFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
ToggleFrame2.Size = UDim2.new(0, 12, 0, 12)

ToggleFrame2Corner.CornerRadius = UDim.new(0, 3)
ToggleFrame2Corner.Name = "ToggleFrame2Corner"
ToggleFrame2Corner.Parent = ToggleFrame2

ToggleToggledFrame.Name = "ToggleToggledFrame"
ToggleToggledFrame.Parent = ToggleFrame
ToggleToggledFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ToggleToggledFrame.Position = UDim2.new(0, 0, 0, 0)
ToggleToggledFrame.Size = UDim2.new(0, 16, 0, 16)
ToggleToggledFrame.Visible = false

ToggleToggledFrameCorner.CornerRadius = UDim.new(0, 5)
ToggleToggledFrameCorner.Name = "ToggleToggledFrameCorner"
ToggleToggledFrameCorner.Parent = ToggleToggledFrame

ToggleTick.Name = "ToggleTick"
ToggleTick.Parent = ToggleToggledFrame
ToggleTick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleTick.BackgroundTransparency = 1.000
ToggleTick.Position = UDim2.new(0.0500000007, 0, 0, 1)
ToggleTick.Size = UDim2.new(0, 13, 0, 13)
ToggleTick.Image = "http://www.roblox.com/asset/?id=6031094667"

ToggleText.Name = "ToggleText"
ToggleText.Parent = Toggle
ToggleText.AnchorPoint = Vector2.new(1, 1)
ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleText.BackgroundTransparency = 1.000
ToggleText.Position = UDim2.new(1, 0, 1, 0)
ToggleText.Size = UDim2.new(1, -23, 1, 0)
ToggleText.Font = Enum.Font.Gotham
ToggleText.Text = text
ToggleText.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleText.TextSize = 14.000
ToggleText.TextXAlignment = Enum.TextXAlignment.Left

Toggle.MouseButton1Click:Connect(function()
if toggled == false then
ToggleToggledFrame.Visible = true
else
ToggleToggledFrame.Visible = false
end
toggled = not toggled
pcall(callback, toggled)
end)

coroutine.wrap(
function()
while wait() do
ToggleFrame.BackgroundColor3 = themes[selectedtheme].Color2
ToggleFrame1.BackgroundColor3 = themes[selectedtheme].Color2
ToggleFrame2.BackgroundColor3 = themes[selectedtheme].Color1
ToggleText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
function tabcontent:Slider(text,precise, min, max, start, callback)
local sliderfunc = {}
local dragging = false
local Slider = Instance.new("Frame")
local SliderText = Instance.new("TextLabel")
local SliderFrame = Instance.new("Frame")
local SliderFrameCorner = Instance.new("UICorner")
local SlideCurrent = Instance.new("Frame")
local SlideCurrentCorner = Instance.new("UICorner")
local SlideCircle = Instance.new("Frame")
local SlideCircleCorner = Instance.new("UICorner")
local SlideCircle1 = Instance.new("Frame")
local SlideCircle1Corner = Instance.new("UICorner")
local ValueFrame = Instance.new("Frame")
local ValueFrameCorner = Instance.new("UICorner")
local ValueText = Instance.new("TextLabel")

Slider.Name = "Slider"
Slider.Parent = Tab
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 1.000
Slider.Position = UDim2.new(0.264204532, 0, 0.158208951, 0)
Slider.Size = UDim2.new(0, 148, 0, 65)

SliderText.Name = "SliderText"
SliderText.Parent = Slider
SliderText.AnchorPoint = Vector2.new(1, 1)
SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderText.BackgroundTransparency = 1.000
SliderText.Position = UDim2.new(0.999999166, 0, 0.33968538, 0)
SliderText.Size = UDim2.new(1.16142857, -23, 0.339685708, 0)
SliderText.Font = Enum.Font.Gotham
SliderText.Text = text
SliderText.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderText.TextSize = 14.000
SliderText.TextXAlignment = Enum.TextXAlignment.Left

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = Slider
SliderFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
SliderFrame.Position = UDim2.new(-0.00675675692, 0, 0.477616459, 0)
SliderFrame.Size = UDim2.new(0, 148, 0, 5)

SliderFrameCorner.CornerRadius = UDim.new(0, 15)
SliderFrameCorner.Name = "SliderFrameCorner"
SliderFrameCorner.Parent = SliderFrame

SlideCurrent.Name = "SlideCurrent"
SlideCurrent.Parent = SliderFrame
SlideCurrent.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
SlideCurrent.BorderSizePixel = 0
SlideCurrent.Position = UDim2.new(-0.0001257658, 0, -0.0184065104, 0)
SlideCurrent.Size = UDim2.new((start or 0) / max, 0, 0, 5)

SlideCurrentCorner.CornerRadius = UDim.new(0, 15)
SlideCurrentCorner.Name = "SlideCurrentCorner"
SlideCurrentCorner.Parent = SlideCurrent

SlideCircle.Name = "SlideCircle"
SlideCircle.Parent = SliderFrame
SlideCircle.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
SlideCircle.Position = UDim2.new((start or 0)/max, -6,-1.5, 0)
SlideCircle.Size = UDim2.new(0, 22, 0, 22)

SlideCircleCorner.CornerRadius = UDim.new(1, 0)
SlideCircleCorner.Name = "SlideCircleCorner"
SlideCircleCorner.Parent = SlideCircle

SlideCircle1.Name = "SlideCircle1"
SlideCircle1.Parent = SlideCircle
SlideCircle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlideCircle1.Position = UDim2.new(0.0450000018, 0, 0.0410000011, 0)
SlideCircle1.Size = UDim2.new(0, 20, 0, 20)

SlideCircle1Corner.CornerRadius = UDim.new(1, 0)
SlideCircle1Corner.Name = "SlideCircle1Corner"
SlideCircle1Corner.Parent = SlideCircle1

ValueFrame.Name = "ValueFrame"
ValueFrame.Parent = Slider
ValueFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ValueFrame.Position = UDim2.new(0, 0, 0.769924223, 0)
ValueFrame.Size = UDim2.new(0, 45, 0, 14)

ValueFrameCorner.CornerRadius = UDim.new(0, 3)
ValueFrameCorner.Name = "ValueFrameCorner"
ValueFrameCorner.Parent = ValueFrame

ValueText.Name = "ValueText"
ValueText.Parent = ValueFrame
ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ValueText.BackgroundTransparency = 1.000
ValueText.Size = UDim2.new(1, 0, 0, 14)
ValueText.Font = Enum.Font.GothamSemibold
ValueText.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
ValueText.TextColor3 = Color3.fromRGB(182, 182, 182)
ValueText.TextSize = 11.000

local function move(input)
local pos =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
-6,
-1.5,
0
)
local pos1 =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
0,
0,
5
)
SlideCurrent.Size = pos1
SlideCircle.Position = pos
local size = math.clamp(Mouse.X - SlideCurrent.AbsolutePosition.X, 0, 148)
local percent = size / 148

local val = math.floor((min + (max- min) * percent) * 10) / 10
if precise == true then
ValueText.Text = tostring(math.ceil(val))
else
ValueText.Text = tostring(val)
end

pcall(callback, val)
end
SlideCircle.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
end
end
)
SlideCircle.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end
)
game:GetService("UserInputService").InputChanged:Connect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
move(input)
end
end)

function sliderfunc:Change(val)
ValueText.Text = tostring(val and math.floor((val / max) * (max - min) + min) or 0)
SlideCircle.Position = UDim2.new((val or 0)/max, -6,-1.5, 0)
SlideCurrent.Size = UDim2.new((val or 0) / max, 0, 0, 5)
end

coroutine.wrap(
function()
while wait() do
ValueFrame.BackgroundColor3 = themes[selectedtheme].Color2
SliderFrame.BackgroundColor3 = themes[selectedtheme].Color2
SlideCircle.BackgroundColor3 = themes[selectedtheme].Color3
SlideCircle1.BackgroundColor3 = themes[selectedtheme].Color1
SliderText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
return sliderfunc 
end
function tabcontent:SlidersHorizontal()
local SlidersHorizontal = Instance.new("Frame")
local SlidersHorizontalLayout = Instance.new("UIListLayout")

SlidersHorizontal.Name = "SlidersHorizontal"
SlidersHorizontal.Parent = Tab
SlidersHorizontal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlidersHorizontal.BackgroundTransparency = 1.000
SlidersHorizontal.Position = UDim2.new(1.35802472, 0, 0.364130437, 0)
SlidersHorizontal.Size = UDim2.new(1, 0, 0, 65)

SlidersHorizontalLayout.Name = "SlidersHorizontalLayout"
SlidersHorizontalLayout.Parent = SlidersHorizontal
SlidersHorizontalLayout.FillDirection = Enum.FillDirection.Horizontal
SlidersHorizontalLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SlidersHorizontalLayout.SortOrder = Enum.SortOrder.LayoutOrder
SlidersHorizontalLayout.Padding = UDim.new(0, 25)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
local SlidersHorizontalHold = {}
function SlidersHorizontalHold:Slider(text,precise, min, max, start, callback)
local sliderfunc = {}
local dragging = false
local Slider = Instance.new("Frame")
local SliderText = Instance.new("TextLabel")
local SliderFrame = Instance.new("Frame")
local SliderFrameCorner = Instance.new("UICorner")
local SlideCurrent = Instance.new("Frame")
local SlideCurrentCorner = Instance.new("UICorner")
local SlideCircle = Instance.new("Frame")
local SlideCircleCorner = Instance.new("UICorner")
local SlideCircle1 = Instance.new("Frame")
local SlideCircle1Corner = Instance.new("UICorner")
local ValueFrame = Instance.new("Frame")
local ValueFrameCorner = Instance.new("UICorner")
local ValueText = Instance.new("TextLabel")

Slider.Name = "Slider"
Slider.Parent = SlidersHorizontal
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 1.000
Slider.Position = UDim2.new(0.264204532, 0, 0.158208951, 0)
Slider.Size = UDim2.new(0, 148, 0, 65)

SliderText.Name = "SliderText"
SliderText.Parent = Slider
SliderText.AnchorPoint = Vector2.new(1, 1)
SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderText.BackgroundTransparency = 1.000
SliderText.Position = UDim2.new(0.999999166, 0, 0.33968538, 0)
SliderText.Size = UDim2.new(1.16142857, -23, 0.339685708, 0)
SliderText.Font = Enum.Font.Gotham
SliderText.Text = text
SliderText.TextColor3 = Color3.fromRGB(0, 0, 0)
SliderText.TextSize = 14.000
SliderText.TextXAlignment = Enum.TextXAlignment.Left

SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = Slider
SliderFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
SliderFrame.Position = UDim2.new(-0.00675675692, 0, 0.477616459, 0)
SliderFrame.Size = UDim2.new(0, 148, 0, 5)

SliderFrameCorner.CornerRadius = UDim.new(0, 15)
SliderFrameCorner.Name = "SliderFrameCorner"
SliderFrameCorner.Parent = SliderFrame

SlideCurrent.Name = "SlideCurrent"
SlideCurrent.Parent = SliderFrame
SlideCurrent.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
SlideCurrent.BorderSizePixel = 0
SlideCurrent.Position = UDim2.new(-0.0001257658, 0, -0.0184065104, 0)
SlideCurrent.Size = UDim2.new((start or 0) / max, 0, 0, 5)

SlideCurrentCorner.CornerRadius = UDim.new(0, 15)
SlideCurrentCorner.Name = "SlideCurrentCorner"
SlideCurrentCorner.Parent = SlideCurrent

SlideCircle.Name = "SlideCircle"
SlideCircle.Parent = SliderFrame
SlideCircle.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
SlideCircle.Position = UDim2.new((start or 0)/max, -6,-1.5, 0)
SlideCircle.Size = UDim2.new(0, 22, 0, 22)

SlideCircleCorner.CornerRadius = UDim.new(1, 0)
SlideCircleCorner.Name = "SlideCircleCorner"
SlideCircleCorner.Parent = SlideCircle

SlideCircle1.Name = "SlideCircle1"
SlideCircle1.Parent = SlideCircle
SlideCircle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SlideCircle1.Position = UDim2.new(0.0450000018, 0, 0.0410000011, 0)
SlideCircle1.Size = UDim2.new(0, 20, 0, 20)

SlideCircle1Corner.CornerRadius = UDim.new(1, 0)
SlideCircle1Corner.Name = "SlideCircle1Corner"
SlideCircle1Corner.Parent = SlideCircle1

ValueFrame.Name = "ValueFrame"
ValueFrame.Parent = Slider
ValueFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ValueFrame.Position = UDim2.new(0, 0, 0.769924223, 0)
ValueFrame.Size = UDim2.new(0, 45, 0, 14)

ValueFrameCorner.CornerRadius = UDim.new(0, 3)
ValueFrameCorner.Name = "ValueFrameCorner"
ValueFrameCorner.Parent = ValueFrame

ValueText.Name = "ValueText"
ValueText.Parent = ValueFrame
ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ValueText.BackgroundTransparency = 1.000
ValueText.Size = UDim2.new(1, 0, 0, 14)
ValueText.Font = Enum.Font.GothamSemibold
ValueText.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
ValueText.TextColor3 = Color3.fromRGB(182, 182, 182)
ValueText.TextSize = 11.000

local function move(input)
local pos =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
-1,
-1.5,
0
)
local pos1 =
UDim2.new(
math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
0,
0,
5
)
SlideCurrent.Size = pos1
SlideCircle.Position = pos
local size = math.clamp(Mouse.X - SlideCurrent.AbsolutePosition.X, 0, 148)
local percent = size / 148

local val = math.floor((min + (max- min) * percent) * 10) / 10
if precise == true then
ValueText.Text = tostring(math.ceil(val))
else
ValueText.Text = tostring(val)
end

pcall(callback, val)
end
SlideCircle.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
end
end
)
SlideCircle.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end
)
game:GetService("UserInputService").InputChanged:Connect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
move(input)
end
end)

function sliderfunc:Change(val)
ValueText.Text = tostring(val and math.floor((val / max) * (max - min) + min) or 0)
SlideCircle.Position = UDim2.new((val or 0)/max, -6,-1.5, 0)
SlideCurrent.Size = UDim2.new((val or 0) / max, 0, 0, 5)
end


coroutine.wrap(
function()
while wait() do
ValueFrame.BackgroundColor3 = themes[selectedtheme].Color2
SliderFrame.BackgroundColor3 = themes[selectedtheme].Color2
SlideCircle.BackgroundColor3 = themes[selectedtheme].Color3
SlideCircle1.BackgroundColor3 = themes[selectedtheme].Color1
SliderText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()
return sliderfunc 
end
return SlidersHorizontalHold
end
function tabcontent:Dropdown(text, list, callback)
local dropfunc = {}
local ItemCount = 0
local DropToggled = false
local Dropdown = Instance.new("Frame")
local DropdownBtn = Instance.new("TextButton")
local DropdownFrameOutline = Instance.new("Frame")
local DropdownFrameOutlineCorner = Instance.new("UICorner")
local DropdownFrame = Instance.new("Frame")
local DropdownFrameCorner = Instance.new("UICorner")
local DropdownIcoFrame = Instance.new("Frame")
local DropdownIcoFrameCorner = Instance.new("UICorner")
local DropdownIco = Instance.new("ImageLabel")
local DropdownText = Instance.new("TextLabel")
local DropdownFrameMainOutline = Instance.new("Frame")
local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
local DropdownFrameMain = Instance.new("Frame")
local DropdownFrameMainCorner = Instance.new("UICorner")
local DropdownMainScrollFrame = Instance.new("ScrollingFrame")
local DropdownMainScrollFrameLayout = Instance.new("UIListLayout")
local DropdownTitle = Instance.new("TextLabel")
local DropdownMainHold = Instance.new("Frame")


Dropdown.Name = "Dropdown"
Dropdown.Parent = Tab
Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.BackgroundTransparency = 1.000
Dropdown.Position = UDim2.new(0.220833331, 0, 0.260726064, 0)
Dropdown.Size = UDim2.new(0, 171, 0, 25)

DropdownBtn.Name = "DropdownBtn"
DropdownBtn.Parent = Dropdown
DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.BackgroundTransparency = 1.000
DropdownBtn.Position = UDim2.new(0.257309943, 0, 0, 0)
DropdownBtn.Size = UDim2.new(0, 170, 0, 25)
DropdownBtn.Font = Enum.Font.SourceSans
DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
DropdownBtn.TextSize = 14.000

DropdownMainHold.Name = "DropdownBtn"
DropdownMainHold.Parent = Tab
DropdownMainHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownMainHold.BackgroundTransparency = 1.000
DropdownMainHold.Position = UDim2.new(0.257309943, 0, 0, 0)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 25)
DropdownMainHold.Visible = false

DropdownFrameOutline.Name = "DropdownFrameOutline"
DropdownFrameOutline.Parent = DropdownBtn
DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
DropdownFrameOutline.Position = UDim2.new(0, 0, -0.00300000003, 0)
DropdownFrameOutline.Size = UDim2.new(0, 171, 0, 25)

DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

DropdownFrame.Name = "DropdownFrame"
DropdownFrame.Parent = DropdownFrameOutline
DropdownFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownFrame.BorderSizePixel = 0
DropdownFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
DropdownFrame.Size = UDim2.new(1, -4, 0, 21)

DropdownFrameCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameCorner.Name = "DropdownFrameCorner"
DropdownFrameCorner.Parent = DropdownFrame

DropdownIcoFrame.Name = "DropdownIcoFrame"
DropdownIcoFrame.Parent = DropdownFrame
DropdownIcoFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
DropdownIcoFrame.Position = UDim2.new(0.884000003, 0, 0.150000006, 0)
DropdownIcoFrame.Size = UDim2.new(0, 15, 1, -6)

DropdownIcoFrameCorner.CornerRadius = UDim.new(0, 5)
DropdownIcoFrameCorner.Name = "DropdownIcoFrameCorner"
DropdownIcoFrameCorner.Parent = DropdownIcoFrame

DropdownIco.Name = "DropdownIco"
DropdownIco.Parent = DropdownIcoFrame
DropdownIco.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownIco.BackgroundTransparency = 1.000
DropdownIco.Position = UDim2.new(0.5, 0, 0.5, 0)
DropdownIco.Rotation = 90.000
DropdownIco.Size = UDim2.new(0, 11, 0, 11)
DropdownIco.Image = "http://www.roblox.com/asset/?id=6022668955"

DropdownText.Name = "DropdownText"
DropdownText.Parent = DropdownFrameOutline
DropdownText.AnchorPoint = Vector2.new(1, 1)
DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownText.BackgroundTransparency = 1.000
DropdownText.Position = UDim2.new(1, 0, 1, 0)
DropdownText.Size = UDim2.new(1, -7, 1.00300002, 0)
DropdownText.Font = Enum.Font.Gotham
DropdownText.Text = ""
DropdownText.TextColor3 = Color3.fromRGB(0, 0, 0)
DropdownText.TextSize = 13.000
DropdownText.TextXAlignment = Enum.TextXAlignment.Left

DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
DropdownFrameMainOutline.Parent = DropdownMainHold
DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
DropdownFrameMainOutline.Position = UDim2.new(0.257309943, 0,0, 0)
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 95)
DropdownFrameMainOutline.Visible = false

DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

DropdownFrameMain.Name = "DropdownFrameMain"
DropdownFrameMain.Parent = DropdownFrameMainOutline
DropdownFrameMain.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownFrameMain.BorderSizePixel = 0
DropdownFrameMain.Position = UDim2.new(0.5, 0, 0.5, 0)
DropdownFrameMain.Size = UDim2.new(1, -4, 1, -4)

DropdownFrameMainCorner.CornerRadius = UDim.new(0, 5)
DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
DropdownFrameMainCorner.Parent = DropdownFrameMain

DropdownMainScrollFrame.Name = "DropdownMainScrollFrame"
DropdownMainScrollFrame.Parent = DropdownFrameMain
DropdownMainScrollFrame.Active = true
DropdownMainScrollFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DropdownMainScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownMainScrollFrame.BackgroundTransparency = 1
DropdownMainScrollFrame.BorderSizePixel = 0
DropdownMainScrollFrame.Position = UDim2.new(0.511976063, 0, 0.50300014, 0)
DropdownMainScrollFrame.Size = UDim2.new(0.0199520998, 155, 1, -13)
DropdownMainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
DropdownMainScrollFrame.ScrollBarThickness = 3
DropdownMainScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(213, 213, 213)

DropdownMainScrollFrameLayout.Name = "DropdownMainScrollFrameLayout"
DropdownMainScrollFrameLayout.Parent = DropdownMainScrollFrame
DropdownMainScrollFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder

DropdownTitle.Name = "DropdownTitle"
DropdownTitle.Parent = Dropdown
DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownTitle.BackgroundTransparency = 1.000
DropdownTitle.BorderSizePixel = 0
DropdownTitle.Position = UDim2.new(0, 37, 0, 0)
DropdownTitle.Size = UDim2.new(0, 0, 0, 25)
DropdownTitle.Font = Enum.Font.Gotham
DropdownTitle.Text = text
DropdownTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
DropdownTitle.TextSize = 14.000
DropdownTitle.TextXAlignment = Enum.TextXAlignment.Right

DropdownBtn.MouseButton1Click:Connect(function()
if DropToggled == false then
DropdownFrameMainOutline.Visible = true
DropdownMainHold.Visible = true
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

else
DropdownFrameMainOutline.Visible = false
DropdownMainHold.Visible = false
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
DropToggled = not DropToggled
end)

coroutine.wrap(
function()
while wait() do
DropdownTitle.TextColor3 = themes[selectedtheme].TextColor
DropdownText.TextColor3 = themes[selectedtheme].TextColor
DropdownFrameOutline.BackgroundColor3 = themes[selectedtheme].Color2
DropdownFrame.BackgroundColor3 = themes[selectedtheme].Color1
DropdownFrameMainOutline.BackgroundColor3 = themes[selectedtheme].Color2
DropdownFrameMain.BackgroundColor3 = themes[selectedtheme].Color1
DropdownMainScrollFrame.ScrollBarImageColor3 = themes[selectedtheme].ScrollBar
end
end
)()

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
for i,v in next, list do
ItemCount = ItemCount + 1
if ItemCount == 1 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 43)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 43)
elseif ItemCount == 2 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 67)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 67)
else
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 92)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 92)
end 
local ItemBtn = Instance.new("TextButton")
local ItemBtnCorner = Instance.new("UICorner")
local ItemText = Instance.new("TextLabel")
local hovering = false

ItemBtn.Name = "ItemBtn"
ItemBtn.Parent = DropdownMainScrollFrame
ItemBtn.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ItemBtn.Size = UDim2.new(0, 154, 0, 25)
ItemBtn.AutoButtonColor = false
ItemBtn.Font = Enum.Font.SourceSans
ItemBtn.Text = ""
ItemBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemBtn.TextSize = 14.000
ItemBtn.BackgroundTransparency = 1

ItemBtnCorner.CornerRadius = UDim.new(0, 5)
ItemBtnCorner.Name = "ItemBtnCorner"
ItemBtnCorner.Parent = ItemBtn

ItemText.Name = "ItemText"
ItemText.Parent = ItemBtn
ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemText.BackgroundTransparency = 1.000
ItemText.Position = UDim2.new(0.038961038, 0, 0, 0)
ItemText.Size = UDim2.new(0, 148, 0, 25)
ItemText.Font = Enum.Font.Gotham
ItemText.Text = v
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemText.TextSize = 14.000
ItemText.TextXAlignment = Enum.TextXAlignment.Left

DropdownMainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, DropdownMainScrollFrameLayout.AbsoluteContentSize.Y)

ItemBtn.MouseButton1Click:Connect(function()
DropdownMainHold.Visible = false
DropToggled = not DropToggled
DropdownText.Text = v
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
pcall(callback, v)

end)

ItemBtn.MouseLeave:Connect(function()
ItemBtn.BackgroundTransparency = 1
hovering = false
end)

ItemBtn.MouseEnter:Connect(function()
ItemBtn.BackgroundTransparency = 0
hovering = true
end)

coroutine.wrap(
function()
while wait() do
if hovering == false then
ItemText.TextColor3 = themes[selectedtheme].TextColor
else
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
end
end
end
)()
end
function dropfunc:Add(toadd)
ItemCount = ItemCount + 1
if ItemCount == 1 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 43)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 43)
elseif ItemCount == 2 then
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 67)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 67)
else
DropdownFrameMainOutline.Size = UDim2.new(0, 171, 0, 92)
DropdownMainHold.Size = UDim2.new(0, 170, 0, 92)
end 
local ItemBtn = Instance.new("TextButton")
local ItemBtnCorner = Instance.new("UICorner")
local ItemText = Instance.new("TextLabel")
local hovering = false

ItemBtn.Name = "ItemBtn"
ItemBtn.Parent = DropdownMainScrollFrame
ItemBtn.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ItemBtn.Size = UDim2.new(0, 154, 0, 25)
ItemBtn.AutoButtonColor = false
ItemBtn.Font = Enum.Font.SourceSans
ItemBtn.Text = ""
ItemBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemBtn.TextSize = 14.000
ItemBtn.BackgroundTransparency = 1

ItemBtnCorner.CornerRadius = UDim.new(0, 5)
ItemBtnCorner.Name = "ItemBtnCorner"
ItemBtnCorner.Parent = ItemBtn

ItemText.Name = "ItemText"
ItemText.Parent = ItemBtn
ItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemText.BackgroundTransparency = 1.000
ItemText.Position = UDim2.new(0.038961038, 0, 0, 0)
ItemText.Size = UDim2.new(0, 148, 0, 25)
ItemText.Font = Enum.Font.Gotham
ItemText.Text = toadd
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemText.TextSize = 14.000
ItemText.TextXAlignment = Enum.TextXAlignment.Left

DropdownMainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, DropdownMainScrollFrameLayout.AbsoluteContentSize.Y)

ItemBtn.MouseButton1Click:Connect(function()
DropdownMainHold.Visible = false
DropToggled = not DropToggled
DropdownText.Text = toadd
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
pcall(callback, toadd)

end)

ItemBtn.MouseLeave:Connect(function()
ItemBtn.BackgroundTransparency = 1
hovering = false
end)

ItemBtn.MouseEnter:Connect(function()
ItemBtn.BackgroundTransparency = 0
hovering = true
end)

coroutine.wrap(
function()
while wait() do
if hovering == false then
ItemText.TextColor3 = themes[selectedtheme].TextColor
else
ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
end
end
end
)()
end
function dropfunc:Clear()
ItemCount = 0
for i,v in next, DropdownMainScrollFrame:GetChildren() do
if v.Name == "ItemBtn" then
v:Destroy()
end
end
end
return dropfunc
end
function tabcontent:Colorpicker(text, preset, callback)
local ColorPickerToggled = false
local OldToggleColor = Color3.fromRGB(0, 0, 0)
local OldColor = Color3.fromRGB(0, 0, 0)
local OldColorSelectionPosition = nil
local OldHueSelectionPosition = nil
local ColorH, ColorS, ColorV = 1, 1, 1
local RainbowColorPicker = false
local ColorPickerInput = nil
local ColorInput = nil
local HueInput = nil
local hovering = false

local Colorpicker = Instance.new("TextButton")
local ColorpickerFrameClr = Instance.new("Frame")
local ColorpickerFrameClrCorner = Instance.new("UICorner")
local ColorpickerText = Instance.new("TextLabel")

Colorpicker.Name = "Colorpicker"
Colorpicker.Parent = Tab
Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Colorpicker.BackgroundTransparency = 1.000
Colorpicker.Position = UDim2.new(0.394886374, 0, 0.0925373137, 0)
Colorpicker.Size = UDim2.new(0, 71, 0, 16)
Colorpicker.Font = Enum.Font.SourceSans
Colorpicker.Text = ""
Colorpicker.TextColor3 = Color3.fromRGB(0, 0, 0)
Colorpicker.TextSize = 14.000

ColorpickerFrameClr.Name = "ColorpickerFrame"
ColorpickerFrameClr.Parent = Colorpicker
ColorpickerFrameClr.BackgroundColor3 = preset
ColorpickerFrameClr.Size = UDim2.new(0, 16, 0, 16)

ColorpickerFrameClrCorner.CornerRadius = UDim.new(1, 0)
ColorpickerFrameClrCorner.Name = "ColorpickerFrameCorner"
ColorpickerFrameClrCorner.Parent = ColorpickerFrameClr

ColorpickerText.Name = "ColorpickerText"
ColorpickerText.Parent = Colorpicker
ColorpickerText.AnchorPoint = Vector2.new(1, 1)
ColorpickerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorpickerText.BackgroundTransparency = 1.000
ColorpickerText.Position = UDim2.new(1, 0, 1, 0)
ColorpickerText.Size = UDim2.new(1, -23, 1, 0)
ColorpickerText.Font = Enum.Font.Gotham
ColorpickerText.Text = text
ColorpickerText.TextColor3 = Color3.fromRGB(0, 0, 0)
ColorpickerText.TextSize = 14.000
ColorpickerText.TextXAlignment = Enum.TextXAlignment.Left

local ColorPickerOutlineFrame = Instance.new("Frame")
local ColorPickerOutlineFrameCorner = Instance.new("UICorner")
local ColorPickerFrame = Instance.new("Frame")
local ColorPickerFrameCorner = Instance.new("UICorner")
local Color = Instance.new("ImageLabel")
local ColorCorner = Instance.new("UICorner")
local ColorSelection = Instance.new("ImageLabel")
local Hue = Instance.new("ImageLabel")
local HueCorner = Instance.new("UICorner")
local HueGradient = Instance.new("UIGradient")
local HueSelection = Instance.new("ImageLabel")
local ConfirmBtn = Instance.new("TextButton")
local ConfirmBtnFrame = Instance.new("Frame")
local ConfirmBtnFrameCorner = Instance.new("UICorner")
local ConfirmBtnCorner = Instance.new("UICorner")
local ConfirmBtnHoverFrame = Instance.new("Frame")
local ConfirmBtnHoverFrameCorner = Instance.new("UICorner")
local ConfirmBtnText = Instance.new("TextLabel")
local RainbowToggle = Instance.new("TextButton")
local RainbowToggleText = Instance.new("TextLabel")
local RainbowToggleFrame = Instance.new("Frame")
local RainbowToggleFrameCorner = Instance.new("UICorner")
local RainbowToggleFrame1 = Instance.new("Frame")
local RainbowToggleFrame1Corner = Instance.new("UICorner")
local RainbowToggleFrame2 = Instance.new("Frame")
local RainbowToggleFrame2Corner = Instance.new("UICorner")
local RainbowToggleToggledFrame = Instance.new("Frame")
local RainbowToggleToggledFrameCorner = Instance.new("UICorner")
local ToggleTick = Instance.new("ImageLabel")


ColorPickerOutlineFrame.Name = "ColorPickerOutlineFrame"
ColorPickerOutlineFrame.Parent = Tab
ColorPickerOutlineFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ColorPickerOutlineFrame.Position = UDim2.new(0.213314757, 0, 0.19295603, 0)
ColorPickerOutlineFrame.Size = UDim2.new(0, 139, 0, 161)
ColorPickerOutlineFrame.Visible = false

ColorPickerOutlineFrameCorner.CornerRadius = UDim.new(0, 5)
ColorPickerOutlineFrameCorner.Name = "ColorPickerOutlineFrameCorner"
ColorPickerOutlineFrameCorner.Parent = ColorPickerOutlineFrame

ColorPickerFrame.Name = "ColorPickerFrame"
ColorPickerFrame.Parent = ColorPickerOutlineFrame
ColorPickerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorPickerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ColorPickerFrame.Size = UDim2.new(1, -4, 1, -4)

ColorPickerFrameCorner.CornerRadius = UDim.new(0, 5)
ColorPickerFrameCorner.Name = "ColorPickerFrameCorner"
ColorPickerFrameCorner.Parent = ColorPickerFrame

Color.Name = "Color"
Color.Parent = ColorPickerFrame
Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
Color.Position = UDim2.new(0, 7, 0, 10)
Color.Size = UDim2.new(0, 94, 0, 89)
Color.ZIndex = 10
Color.Image = "rbxassetid://4155801252"

ColorCorner.CornerRadius = UDim.new(0, 3)
ColorCorner.Name = "ColorCorner"
ColorCorner.Parent = Color

ColorSelection.Name = "ColorSelection"
ColorSelection.Parent = Color
ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ColorSelection.BackgroundTransparency = 1.000
ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
ColorSelection.Size = UDim2.new(0, 18, 0, 18)
ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
ColorSelection.ScaleType = Enum.ScaleType.Fit

Hue.Name = "Hue"
Hue.Parent = ColorPickerFrame
Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hue.Position = UDim2.new(0, 107, 0, 10)
Hue.Size = UDim2.new(0, 20, 0, 87)
Hue.ImageTransparency = 1.000

HueCorner.CornerRadius = UDim.new(0, 3)
HueCorner.Name = "HueCorner"
HueCorner.Parent = Hue

HueGradient.Color = ColorSequence.new {
ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
}
HueGradient.Rotation = 270
HueGradient.Name = "HueGradient"
HueGradient.Parent = Hue

HueSelection.Name = "HueSelection"
HueSelection.Parent = Hue
HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HueSelection.BackgroundTransparency = 1.000
HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
HueSelection.Size = UDim2.new(0, 18, 0, 18)
HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

ConfirmBtn.Name = "ConfirmBtn"
ConfirmBtn.Parent = ColorPickerFrame
ConfirmBtn.AnchorPoint = Vector2.new(0.5, 0)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
ConfirmBtn.BorderSizePixel = 0
ConfirmBtn.Position = UDim2.new(0.5, 0, 0, 105)
ConfirmBtn.Size = UDim2.new(0, 71, 0, 25)
ConfirmBtn.AutoButtonColor = false
ConfirmBtn.Font = Enum.Font.Gotham
ConfirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfirmBtn.TextSize = 14.000

ConfirmBtnFrame.Name = "ConfirmBtnFrame"
ConfirmBtnFrame.Parent = ConfirmBtn
ConfirmBtnFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmBtnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtnFrame.BorderSizePixel = 0
ConfirmBtnFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ConfirmBtnFrame.Size = UDim2.new(1, -4, 0, 21)

ConfirmBtnFrameCorner.CornerRadius = UDim.new(0, 5)
ConfirmBtnFrameCorner.Name = "ConfirmBtnFrameCorner"
ConfirmBtnFrameCorner.Parent = ConfirmBtnFrame

ConfirmBtnCorner.CornerRadius = UDim.new(0, 5)
ConfirmBtnCorner.Name = "ConfirmBtnCorner"
ConfirmBtnCorner.Parent = ConfirmBtn

ConfirmBtnHoverFrame.Name = "ConfirmBtnHoverFrame"
ConfirmBtnHoverFrame.Parent = ConfirmBtn
ConfirmBtnHoverFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmBtnHoverFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
ConfirmBtnHoverFrame.BackgroundTransparency = 1.000
ConfirmBtnHoverFrame.BorderSizePixel = 0
ConfirmBtnHoverFrame.Position = UDim2.new(0.5, 0, 0.528750002, 0)
ConfirmBtnHoverFrame.Size = UDim2.new(1, 0, 0, 25)

ConfirmBtnHoverFrameCorner.CornerRadius = UDim.new(0, 5)
ConfirmBtnHoverFrameCorner.Name = "ConfirmBtnHoverFrameCorner"
ConfirmBtnHoverFrameCorner.Parent = ConfirmBtnHoverFrame

ConfirmBtnText.Name = "ConfirmBtnText"
ConfirmBtnText.Parent = ConfirmBtn
ConfirmBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtnText.BackgroundTransparency = 1.000
ConfirmBtnText.Size = UDim2.new(1, 0, 1, 0)
ConfirmBtnText.Font = Enum.Font.Gotham
ConfirmBtnText.Text = "Confirm"
ConfirmBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfirmBtnText.TextSize = 14.000

RainbowToggle.Name = "RainbowToggle"
RainbowToggle.Parent = ColorPickerFrame
RainbowToggle.AnchorPoint = Vector2.new(0.5, 0)
RainbowToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowToggle.BackgroundTransparency = 1.000
RainbowToggle.Position = UDim2.new(0.5, 0, 0, 135)
RainbowToggle.Size = UDim2.new(0, 83, 0, 16)
RainbowToggle.Font = Enum.Font.SourceSans
RainbowToggle.Text = ""
RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
RainbowToggle.TextSize = 14.000

RainbowToggleText.Name = "RainbowToggleText"
RainbowToggleText.Parent = RainbowToggle
RainbowToggleText.AnchorPoint = Vector2.new(1, 1)
RainbowToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowToggleText.BackgroundTransparency = 1.000
RainbowToggleText.Position = UDim2.new(1.13727927, 0, 1, 0)
RainbowToggleText.Size = UDim2.new(1.13727927, -23, 1, 0)
RainbowToggleText.Font = Enum.Font.Gotham
RainbowToggleText.Text = "Rainbow"
RainbowToggleText.TextColor3 = Color3.fromRGB(0, 0, 0)
RainbowToggleText.TextSize = 14.000
RainbowToggleText.TextXAlignment = Enum.TextXAlignment.Left

RainbowToggleFrame.Name = "RainbowToggleFrame"
RainbowToggleFrame.Parent = RainbowToggle
RainbowToggleFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RainbowToggleFrame.Size = UDim2.new(0, 16, 0, 16)

RainbowToggleFrameCorner.CornerRadius = UDim.new(0, 5)
RainbowToggleFrameCorner.Name = "RainbowToggleFrameCorner"
RainbowToggleFrameCorner.Parent = RainbowToggleFrame

RainbowToggleFrame1.Name = "RainbowToggleFrame1"
RainbowToggleFrame1.Parent = RainbowToggleFrame
RainbowToggleFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RainbowToggleFrame1.Size = UDim2.new(0, 16, 0, 16)

RainbowToggleFrame1Corner.CornerRadius = UDim.new(0, 5)
RainbowToggleFrame1Corner.Name = "RainbowToggleFrame1Corner"
RainbowToggleFrame1Corner.Parent = RainbowToggleFrame1

RainbowToggleFrame2.Name = "RainbowToggleFrame2"
RainbowToggleFrame2.Parent = RainbowToggleFrame1
RainbowToggleFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
RainbowToggleFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RainbowToggleFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
RainbowToggleFrame2.Size = UDim2.new(0, 12, 0, 12)

RainbowToggleFrame2Corner.CornerRadius = UDim.new(0, 3)
RainbowToggleFrame2Corner.Name = "RainbowToggleFrame2Corner"
RainbowToggleFrame2Corner.Parent = RainbowToggleFrame2

RainbowToggleToggledFrame.Name = "RainbowToggleToggledFrame"
RainbowToggleToggledFrame.Parent = RainbowToggleFrame
RainbowToggleToggledFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
RainbowToggleToggledFrame.Position = UDim2.new(0, 0, 0, 0)
RainbowToggleToggledFrame.Size = UDim2.new(0, 16, 0, 16)
RainbowToggleToggledFrame.Visible = false

RainbowToggleToggledFrameCorner.CornerRadius = UDim.new(0, 5)
RainbowToggleToggledFrameCorner.Name = "RainbowToggleToggledFrameCorner"
RainbowToggleToggledFrameCorner.Parent = RainbowToggleToggledFrame

ToggleTick.Name = "ToggleTick"
ToggleTick.Parent = RainbowToggleToggledFrame
ToggleTick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleTick.BackgroundTransparency = 1.000
ToggleTick.Position = UDim2.new(0.0500000007, 0, 0, 1)
ToggleTick.Size = UDim2.new(0, 13, 0, 13)
ToggleTick.Image = "http://www.roblox.com/asset/?id=6031094667"

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)


Colorpicker.MouseButton1Click:Connect(function()
if ColorPickerToggled == false then
ColorPickerOutlineFrame.Visible = true
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
else
ColorPickerOutlineFrame.Visible = false
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
ColorPickerToggled = not ColorPickerToggled
end)

local function UpdateColorPicker(nope)
ColorpickerFrameClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

pcall(callback, ColorpickerFrameClr.BackgroundColor3)
end

ColorH =
1 -
(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
Hue.AbsoluteSize.Y)
ColorS =
(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
Color.AbsoluteSize.X)
ColorV =
1 -
(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
Color.AbsoluteSize.Y)

ColorpickerFrameClr.BackgroundColor3 = preset
Color.BackgroundColor3 = preset
pcall(callback, ColorpickerFrameClr.BackgroundColor3)

Color.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if RainbowColorPicker then
return
end

if ColorInput then
ColorInput:Disconnect()
end

ColorInput =
RunService.RenderStepped:Connect(
function()
local ColorX =
(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
Color.AbsoluteSize.X)
local ColorY =
(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
Color.AbsoluteSize.Y)

ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
ColorS = ColorX
ColorV = 1 - ColorY

UpdateColorPicker(true)
end
)
end
end
)

Color.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if ColorInput then
ColorInput:Disconnect()
end
end
end
)

Hue.InputBegan:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if RainbowColorPicker then
return
end

if HueInput then
HueInput:Disconnect()
end

HueInput =
RunService.RenderStepped:Connect(
function()
local HueY =
(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
Hue.AbsoluteSize.Y)

HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
ColorH = 1 - HueY

UpdateColorPicker(true)
end
)
end
end
)

Hue.InputEnded:Connect(
function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
if HueInput then
HueInput:Disconnect()
end
end
end
)

RainbowToggle.MouseButton1Down:Connect(
function()
RainbowColorPicker = not RainbowColorPicker

if ColorInput then
ColorInput:Disconnect()
end

if HueInput then
HueInput:Disconnect()
end

if RainbowColorPicker then
RainbowToggleToggledFrame.Visible = true
OldToggleColor = ColorpickerFrameClr.BackgroundColor3
OldColor = Color.BackgroundColor3
OldColorSelectionPosition = ColorSelection.Position
OldHueSelectionPosition = HueSelection.Position

while RainbowColorPicker do
ColorpickerFrameClr.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
Color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

ColorSelection.Position = UDim2.new(1, 0, 0, 0)
HueSelection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

pcall(callback, ColorpickerFrameClr.BackgroundColor3)
wait()
end
elseif not RainbowColorPicker then
RainbowToggleToggledFrame.Visible = false

Colorpicker.BackgroundColor3 = OldToggleColor
Color.BackgroundColor3 = OldColor

ColorSelection.Position = OldColorSelectionPosition
HueSelection.Position = OldHueSelectionPosition

pcall(callback, ColorpickerFrameClr.BackgroundColor3)
end
end
)

ConfirmBtn.MouseButton1Click:Connect(
function()
ColorPickerToggled = not ColorPickerToggled
ColorPickerOutlineFrame.Visible = false
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
end
)

ConfirmBtn.MouseEnter:Connect(function()
ConfirmBtnHoverFrame.BackgroundTransparency = 0
hovering = true
end)

ConfirmBtn.MouseLeave:Connect(function()
ConfirmBtnHoverFrame.BackgroundTransparency = 1
hovering = false
end)

coroutine.wrap(
function()
while wait() do
ColorPickerOutlineFrame.BackgroundColor3 = themes[selectedtheme].Color2
ColorPickerFrame.BackgroundColor3 = themes[selectedtheme].Color1
ColorpickerText.TextColor3 = themes[selectedtheme].TextColor
ConfirmBtn.BackgroundColor3 = themes[selectedtheme].Color2
ConfirmBtnFrame.BackgroundColor3 = themes[selectedtheme].Color1
RainbowToggleFrame.BackgroundColor3 = themes[selectedtheme].Color2
RainbowToggleFrame1.BackgroundColor3 = themes[selectedtheme].Color2
RainbowToggleFrame2.BackgroundColor3 = themes[selectedtheme].Color1
RainbowToggleText.TextColor3 = themes[selectedtheme].TextColor
if hovering == false then
ConfirmBtnText.TextColor3 = themes[selectedtheme].TextColor
else
ConfirmBtnText.TextColor3 = Color3.fromRGB(255, 255, 255)
end
end
end
)()

end
function tabcontent:RadioButtons(text, list, callback)
local FrameSize = 0
local fr = false
local RadioButtonsFrame = Instance.new("Frame")
local RadioButtonsTitle = Instance.new("TextLabel")
local RadioButtonsHolder = Instance.new("Frame")
local RadioButtonsHolderLayout = Instance.new("UIListLayout")

RadioButtonsFrame.Name = "RadioButtonsFrame"
RadioButtonsFrame.Parent = Tab
RadioButtonsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioButtonsFrame.BackgroundTransparency = 1.000
RadioButtonsFrame.Position = UDim2.new(0.453125, 0, 0.558208883, 0)
RadioButtonsFrame.Size = UDim2.new(0, 11, 0, 0)

RadioButtonsTitle.Name = "RadioButtonsTitle"
RadioButtonsTitle.Parent = RadioButtonsFrame
RadioButtonsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioButtonsTitle.BackgroundTransparency = 1.000
RadioButtonsTitle.BorderSizePixel = 0
RadioButtonsTitle.Size = UDim2.new(0, 0, 0, 16)
RadioButtonsTitle.Font = Enum.Font.Gotham
RadioButtonsTitle.Text = text
RadioButtonsTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
RadioButtonsTitle.TextSize = 14.000
RadioButtonsTitle.TextXAlignment = Enum.TextXAlignment.Right

RadioButtonsHolder.Name = "RadioButtonsHolder"
RadioButtonsHolder.Parent = RadioButtonsFrame
RadioButtonsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioButtonsHolder.BackgroundTransparency = 1.000
RadioButtonsHolder.Position = UDim2.new(0.727272749, 0, 0, 0)
RadioButtonsHolder.Size = UDim2.new(0, 100, 0, 16)

RadioButtonsHolderLayout.Name = "RadioButtonsHolderLayout"
RadioButtonsHolderLayout.Parent = RadioButtonsHolder
RadioButtonsHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
RadioButtonsHolderLayout.Padding = UDim.new(0, 4)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
RadioButtonsTitle.TextColor3 = themes[selectedtheme].TextColor
end
end
)()

for i,v in next, list do
FrameSize = FrameSize + 20
RadioButtonsFrame.Size = UDim2.new(0, 11, 0, FrameSize)
Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
local RadioBtn = Instance.new("TextButton")
local RadioBtnText = Instance.new("TextLabel")
local RadioBtnFrame = Instance.new("Frame")
local RadioBtnFrame1 = Instance.new("Frame")
local RadioBtnFrame1Corner = Instance.new("UICorner")
local RadioBtnFrame2 = Instance.new("Frame")
local RadioBtnFrame2Corner = Instance.new("UICorner")
local RadioBtnToggledFrame = Instance.new("Frame")
local RadioBtnToggledFrameCorner = Instance.new("UICorner")
local RadioBtnToggledFrame_2 = Instance.new("Frame")
local RadioBtnToggledFrameCorner_2 = Instance.new("UICorner")
local RadioBtnCorner = Instance.new("UICorner")

RadioBtn.Name = "RadioBtn"
RadioBtn.Parent = RadioButtonsHolder
RadioBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtn.BackgroundTransparency = 1.000
RadioBtn.Size = UDim2.new(0, 791, 0, 16)
RadioBtn.Font = Enum.Font.SourceSans
RadioBtn.Text = ""
RadioBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
RadioBtn.TextSize = 14.000

RadioBtnText.Name = "RadioBtnText"
RadioBtnText.Parent = RadioBtn
RadioBtnText.AnchorPoint = Vector2.new(1, 1)
RadioBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtnText.BackgroundTransparency = 1.000
RadioBtnText.Position = UDim2.new(1, 0, 1, 0)
RadioBtnText.Size = UDim2.new(1, -23, 1, 0)
RadioBtnText.Font = Enum.Font.Gotham
RadioBtnText.Text = v
RadioBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)
RadioBtnText.TextSize = 14.000
RadioBtnText.TextXAlignment = Enum.TextXAlignment.Left

RadioBtnFrame.Name = "RadioBtnFrame"
RadioBtnFrame.Parent = RadioBtn
RadioBtnFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RadioBtnFrame.Size = UDim2.new(0, 16, 0, 16)

RadioBtnFrame1.Name = "RadioBtnFrame1"
RadioBtnFrame1.Parent = RadioBtnFrame
RadioBtnFrame1.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
RadioBtnFrame1.Size = UDim2.new(0, 16, 0, 16)

RadioBtnFrame1Corner.CornerRadius = UDim.new(1, 0)
RadioBtnFrame1Corner.Name = "RadioBtnFrame1Corner"
RadioBtnFrame1Corner.Parent = RadioBtnFrame1

RadioBtnFrame2.Name = "RadioBtnFrame2"
RadioBtnFrame2.Parent = RadioBtnFrame1
RadioBtnFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
RadioBtnFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtnFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
RadioBtnFrame2.Size = UDim2.new(0, 12, 0, 12)

RadioBtnFrame2Corner.CornerRadius = UDim.new(1, 0)
RadioBtnFrame2Corner.Name = "RadioBtnFrame2Corner"
RadioBtnFrame2Corner.Parent = RadioBtnFrame2

RadioBtnToggledFrame.Name = "RadioBtnToggledFrame"
RadioBtnToggledFrame.Parent = RadioBtnFrame
RadioBtnToggledFrame.BackgroundColor3 = Color3.fromRGB(31, 118, 219)
RadioBtnToggledFrame.Size = UDim2.new(0, 16, 0, 16)
RadioBtnToggledFrame.Visible = false

RadioBtnToggledFrameCorner.CornerRadius = UDim.new(1, 0)
RadioBtnToggledFrameCorner.Name = "RadioBtnToggledFrameCorner"
RadioBtnToggledFrameCorner.Parent = RadioBtnToggledFrame

RadioBtnToggledFrame_2.Name = "RadioBtnToggledFrame"
RadioBtnToggledFrame_2.Parent = RadioBtnToggledFrame
RadioBtnToggledFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
RadioBtnToggledFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RadioBtnToggledFrame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
RadioBtnToggledFrame_2.Size = UDim2.new(1, -9, 1, -9)

RadioBtnToggledFrameCorner_2.CornerRadius = UDim.new(1, 0)
RadioBtnToggledFrameCorner_2.Name = "RadioBtnToggledFrameCorner"
RadioBtnToggledFrameCorner_2.Parent = RadioBtnToggledFrame_2

RadioBtnCorner.CornerRadius = UDim.new(1, 0)
RadioBtnCorner.Name = "RadioBtnCorner"
RadioBtnCorner.Parent = RadioBtnFrame

RadioBtn.MouseButton1Click:Connect(function()
pcall(callback, v)
for i,v in next, RadioButtonsHolder:GetChildren() do
if v.Name == "RadioBtn" then
v.RadioBtnFrame.RadioBtnToggledFrame.Visible = false
end
end
RadioBtnToggledFrame.Visible = true
end)

if fr == false then
fr = true
RadioBtnToggledFrame.Visible = true
pcall(callback, v)
end

coroutine.wrap(
function()
while wait() do
        RadioBtnFrame.BackgroundColor3 = themes[selectedtheme].Color2
RadioBtnFrame1.BackgroundColor3 = themes[selectedtheme].Color2
RadioBtnFrame2.BackgroundColor3 = themes[selectedtheme].Color1
RadioBtnText.TextColor3 = themes[selectedtheme].TextColor
end
end
)()
end
end
function tabcontent:Bind(text, preset, keyboardonly, holdmode, callback )

local OldBind = preset.Name
local LoadFromPreset = false
local JustBinded = false
local HoldModeToggled = false

local NotAllowedKeys = {
Return = true,
Space = true,
Tab = true,
Unknown = true,
MouseButton1 = true
}

local AllowedMouseTypes = {
MouseButton2 = true,
MouseButton3 = true
}

local ShortenedNames = {
LeftShift = "LShift",
RightShift = "RShift",
LeftControl = "LCtrl",
RightControl = "RCtrl",
LeftAlt = "LAlt",
RightAlt = "RAlt",
CapsLock = "Caps",
One = "1",
Two = "2",
Three = "3",
Four = "4",
Five = "5",
Six = "6",
Seven = "7",
Eight = "8",
Nine = "9",
Zero = "0",
KeypadOne = "Num-1",
KeypadTwo = "Num-2",
KeypadThree = "Num-3",
KeypadFour = "Num-4",
KeypadFive = "Num-5",
KeypadSix = "Num-6",
KeypadSeven = "Num-7",
KeypadEight = "Num-8",
KeypadNine = "Num-9",
KeypadZero = "Num-0",
Minus = "-",
Equals = "=",
Tilde = "~",
LeftBracket = "[",
RightBracket = "]",
RightParenthesis = ")",
LeftParenthesis = "(",
Semicolon = ";",
Quote = "'",
BackSlash = "\\",
Comma = ",",
Period = ".",
Slash = "/",
Asterisk = "*",
Plus = "+",
Period = ".",
Backquote = "`",
MouseButton1 = "M1",
MouseButton2 = "M2",
MouseButton3 = "M3"
}



local Bind = Instance.new("Frame")
local BindBtn = Instance.new("TextButton")
local BindBtnFrameOutline = Instance.new("Frame")
local BindBtnFrameOutlineCorner = Instance.new("UICorner")
local BindBtnFrame = Instance.new("Frame")
local BindBtnFrameCorner = Instance.new("UICorner")
local BindBtnText = Instance.new("TextLabel")
local BindTitle = Instance.new("TextLabel")


Bind.Name = "Bind"
Bind.Parent = Tab
Bind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind.BackgroundTransparency = 1.000
Bind.Position = UDim2.new(0.298295468, 0, 0.629850626, 0)
Bind.Size = UDim2.new(0, 120, 0, 25)

BindBtn.Name = "BindBtn"
BindBtn.Parent = Bind
BindBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindBtn.BackgroundTransparency = 1.000
BindBtn.Position = UDim2.new(0.456999987, 0, 0, 0)
BindBtn.Size = UDim2.new(0, 90, 0, 25)
BindBtn.Font = Enum.Font.SourceSans
BindBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
BindBtn.TextSize = 14.000

BindBtnFrameOutline.Name = "BindBtnFrameOutline"
BindBtnFrameOutline.Parent = BindBtn
BindBtnFrameOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
BindBtnFrameOutline.Position = UDim2.new(0, 0, -0.00300048827, 0)
BindBtnFrameOutline.Size = UDim2.new(0, 92, 0, 25)

BindBtnFrameOutlineCorner.CornerRadius = UDim.new(0, 5)
BindBtnFrameOutlineCorner.Name = "BindBtnFrameOutlineCorner"
BindBtnFrameOutlineCorner.Parent = BindBtnFrameOutline

BindBtnFrame.Name = "BindBtnFrame"
BindBtnFrame.Parent = BindBtnFrameOutline
BindBtnFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BindBtnFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindBtnFrame.BorderSizePixel = 0
BindBtnFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BindBtnFrame.Size = UDim2.new(1, -4, 0, 21)

BindBtnFrameCorner.CornerRadius = UDim.new(0, 5)
BindBtnFrameCorner.Name = "BindBtnFrameCorner"
BindBtnFrameCorner.Parent = BindBtnFrame

BindBtnText.Name = "BindBtnText"
BindBtnText.Parent = BindBtnFrameOutline
BindBtnText.AnchorPoint = Vector2.new(1, 1)
BindBtnText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindBtnText.BackgroundTransparency = 1.000
BindBtnText.Position = UDim2.new(0.989130437, 0, 1, 0)
BindBtnText.Size = UDim2.new(1.05434787, -7, 1.00300002, 0)
BindBtnText.Font = Enum.Font.Gotham
BindBtnText.Text = (ShortenedNames[preset.Name] or ShortenedNames[preset] or preset.Name or "None")
BindBtnText.TextColor3 = Color3.fromRGB(0, 0, 0)
BindBtnText.TextSize = 13.000

BindTitle.Name = "BindTitle"
BindTitle.Parent = Bind
BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindTitle.BackgroundTransparency = 1.000
BindTitle.BorderSizePixel = 0
BindTitle.Position = UDim2.new(0, 50, 0, 0)
BindTitle.Size = UDim2.new(0, 0, 0, 25)
BindTitle.Font = Enum.Font.Gotham
BindTitle.Text = text
BindTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
BindTitle.TextSize = 14.000
BindTitle.TextXAlignment = Enum.TextXAlignment.Right	

if preset == Enum.KeyCode.Unknown or preset == "Unknown" then
BindBtnText.Text = "None"
end

BindBtn.MouseButton1Click:Connect(function()
if lib.CurrentlyBinding then return end

BindBtnText.Text = "..."

local Input, Bruh = UserInputService.InputBegan:wait()
lib.CurrentlyBinding = true

if Input.KeyCode.Name == "Backspace" or Input.KeyCode.Name == "Delete" then
BindBtnText.Text = "None"
OldBind = Enum.KeyCode.Unknown.Name
lib.CurrentlyBinding = false
JustBinded = false
return
end

if (Input.UserInputType ~= Enum.UserInputType.Keyboard and (AllowedMouseTypes[Input.UserInputType.Name]) and (not keyboardonly)) or (Input.KeyCode and (not NotAllowedKeys[Input.KeyCode.Name])) then
local BindName = ((Input.UserInputType ~= Enum.UserInputType.Keyboard and Input.UserInputType.Name) or Input.KeyCode.Name)
BindBtnText.Text = ShortenedNames[BindName] or BindName
OldBind = BindName
lib.CurrentlyBinding = false
JustBinded = true
else
BindBtnText.Text = ShortenedNames[OldBind] or OldBind
lib.CurrentlyBinding = false
end
end)

if not holdmode then
UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
if not gameprocessedevent then
if UserInputService:GetFocusedTextBox() then return end
if OldBind == Enum.KeyCode.Unknown.Name then return end
if JustBinded then JustBinded = false return end

local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

if BindName == OldBind then 
pcall(callback)
end
end
end)
else
UserInputService.InputBegan:Connect(function(input, gameprocessedevent) 
if not gameprocessedevent then
if UserInputService:GetFocusedTextBox() then return end
if OldBind == Enum.KeyCode.Unknown.Name then return end
if JustBinded then JustBinded = false return end

local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

if BindName == OldBind then 
pcall(callback, true)
end
end
end)

UserInputService.InputEnded:Connect(function(input, gameprocessedevent) 
if not gameprocessedevent then
if UserInputService:GetFocusedTextBox() then return end
if OldBind == Enum.KeyCode.Unknown.Name then return end
if JustBinded then JustBinded = false return end

HoldModeToggled = false
local BindName = ((input.UserInputType ~= Enum.UserInputType.Keyboard and input.UserInputType.Name) or input.KeyCode.Name)

if BindName == OldBind then 
pcall(callback, false)
end
end
end)
end

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

coroutine.wrap(
function()
while wait() do
BindBtnFrameOutline.BackgroundColor3 = themes[selectedtheme].Color2
BindBtnFrame.BackgroundColor3  = themes[selectedtheme].Color1
BindTitle.TextColor3= themes[selectedtheme].TextColor
BindBtnText.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
function tabcontent:Textbox(text,numbersonly, disapper, callback)
local Textbox = Instance.new("Frame")
local TextboxTitle = Instance.new("TextLabel")
local TextboxFrameOutline = Instance.new("Frame")
local TextboxFrameOutlineCorner = Instance.new("UICorner")
local TextboxFrame = Instance.new("Frame")
local TextboxFrameCorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")

Textbox.Name = "Textbox"
Textbox.Parent = Tab
Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Textbox.BackgroundTransparency = 1.000
Textbox.Position = UDim2.new(0.220833331, 0, 0.260726064, 0)
Textbox.Size = UDim2.new(0, 171, 0, 25)

TextboxTitle.Name = "TextboxTitle"
TextboxTitle.Parent = Textbox
TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxTitle.BackgroundTransparency = 1.000
TextboxTitle.BorderSizePixel = 0
TextboxTitle.Position = UDim2.new(0, 37, 0, 0)
TextboxTitle.Size = UDim2.new(0, 0, 0, 25)
TextboxTitle.Font = Enum.Font.Gotham
TextboxTitle.Text = text
TextboxTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
TextboxTitle.TextSize = 14.000
TextboxTitle.TextXAlignment = Enum.TextXAlignment.Right

TextboxFrameOutline.Name = "TextboxFrameOutline"
TextboxFrameOutline.Parent = Textbox
TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
TextboxFrameOutline.Position = UDim2.new(0.256999999, 0, 0, 0)
TextboxFrameOutline.Size = UDim2.new(0, 171, 0, 25)

TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 5)
TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

TextboxFrame.Name = "TextboxFrame"
TextboxFrame.Parent = TextboxFrameOutline
TextboxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
TextboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextboxFrame.BorderSizePixel = 0
TextboxFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TextboxFrame.Size = UDim2.new(1, -4, 0, 21)
TextboxFrame.ClipsDescendants = true

TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
TextboxFrameCorner.Name = "TextboxFrameCorner"
TextboxFrameCorner.Parent = TextboxFrame

TextBox.Parent = TextboxFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.Position = UDim2.new(0, 7, 0, 0)
TextBox.Size = UDim2.new(1, -7, 1, 0)
TextBox.Font = Enum.Font.Gotham
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left


TextBox.FocusLost:Connect(
function(ep)
if ep then
if #TextBox.Text > 0 then
pcall(callback, TextBox.Text)
if disapper then
TextBox.Text = ""
end
end
end
end
)

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
if numbersonly == true then
TextBox.Text = TextBox.Text:gsub('%D+', '');
end
end)

Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)


coroutine.wrap(
function()
while wait() do
TextboxFrameOutline.BackgroundColor3 = themes[selectedtheme].Color2
TextboxFrame.BackgroundColor3  = themes[selectedtheme].Color1
TextBox.TextColor3= themes[selectedtheme].TextColor
TextboxTitle.TextColor3= themes[selectedtheme].TextColor
end
end
)()
end
return tabcontent
end
return tabhold
end
