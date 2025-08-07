-- ObsidianRedFusion.lua
-- Modular UI Library: ObsidianRedFusion (Obsidian visual style, Shittibitch system)

local ObsidianRedFusion = {}
ObsidianRedFusion.__index = ObsidianRedFusion

-- Create a new window
function ObsidianRedFusion:CreateWindow(options)
    local CoreGui = game:GetService("CoreGui")
    local UserInputService = game:GetService("UserInputService")

    -- Remove any previous UI
    local old = CoreGui:FindFirstChild("ObsidianRedUI")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "ObsidianRedUI"
    gui.Parent = CoreGui
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Main window
    local Window = Instance.new("Frame")
    Window.Name = "MainWindow"
    Window.Size = UDim2.new(0, 420, 0, 320)
    Window.Position = UDim2.new(0.5, -210, 0.5, -160)
    Window.BackgroundColor3 = Color3.fromRGB(15,15,15)
    Window.BorderSizePixel = 0
    Window.Parent = gui

    local UICorner = Instance.new("UICorner", Window)
    UICorner.CornerRadius = UDim.new(0, 7)

    -- Accent bar
    local Accent = Instance.new("Frame", Window)
    Accent.Size = UDim2.new(1, 0, 0, 4)
    Accent.BackgroundColor3 = Color3.fromRGB(125,85,255)
    Accent.BorderSizePixel = 0
    local AccentUICorner = Instance.new("UICorner", Accent)
    AccentUICorner.CornerRadius = UDim.new(0, 2)

    -- Title label
    local Title = Instance.new("TextLabel", Window)
    Title.Size = UDim2.new(1, 0, 0, 34)
    Title.BackgroundTransparency = 1
    Title.Text = options.Title or "Obsidian Red Fusion"
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.TextSize = 20
    Title.Font = Enum.Font.Code

    -- Draggable system
    local dragging, dragStart, startPos
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Window.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Tab bar
    local TabBar = Instance.new("Frame", Window)
    TabBar.Name = "TabBar"
    TabBar.Position = UDim2.new(0, 0, 0, 38)
    TabBar.Size = UDim2.new(1, 0, 0, 34)
    TabBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
    TabBar.BorderSizePixel = 0
    local TabBarCorner = Instance.new("UICorner", TabBar)
    TabBarCorner.CornerRadius = UDim.new(0, 7)

    local TabList = Instance.new("UIListLayout", TabBar)
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 6)

    -- Tab pages container
    local PageContainer = Instance.new("Frame", Window)
    PageContainer.Position = UDim2.new(0, 0, 0, 72)
    PageContainer.Size = UDim2.new(1, 0, 1, -72)
    PageContainer.BackgroundTransparency = 1

    local Tabs = {}
    local tabApiList = {}

    local function AddTab(tabName)
        local Tab = Instance.new("TextButton")
        Tab.Size = UDim2.new(0, 110, 1, 0)
        Tab.BackgroundTransparency = 1
        Tab.Text = tabName
        Tab.TextColor3 = Color3.fromRGB(200, 200, 200)
        Tab.TextSize = 16
        Tab.Font = Enum.Font.Code
        Tab.Parent = TabBar

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = PageContainer

        local Content = Instance.new("Frame")
        Content.Name = "Content"
        Content.BackgroundTransparency = 1
        Content.Size = UDim2.new(1, -24, 1, -20)
        Content.Position = UDim2.new(0, 12, 0, 10)
        Content.Parent = Page

        local layout = Instance.new("UIListLayout")
        layout.Parent = Content
        layout.Padding = UDim.new(0, 10)
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        Tab.MouseButton1Click:Connect(function()
            for _, t in pairs(Tabs) do
                t.Page.Visible = false
                t.Tab.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
            Page.Visible = true
            Tab.TextColor3 = Color3.fromRGB(125,85,255)
        end)

        table.insert(Tabs, {Tab = Tab, Page = Page, Content = Content})
        if #Tabs == 1 then
            Tab:Fire("MouseButton1Click")
        end

        -- API for this tab
        local tabApi = {}

        function tabApi:AddToggle(label, state, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, -24, 0, 34)
            frame.BackgroundTransparency = 1
            frame.Parent = Content

            local text = Instance.new("TextLabel", frame)
            text.Position = UDim2.new(0, 0, 0, 0)
            text.Size = UDim2.new(0, 140, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = label
            text.TextColor3 = Color3.fromRGB(220,220,220)
            text.Font = Enum.Font.Code
            text.TextSize = 15

            local toggle = Instance.new("TextButton", frame)
            toggle.Position = UDim2.new(1, -56, 0.5, -15)
            toggle.Size = UDim2.new(0, 48, 0, 30)
            toggle.BackgroundColor3 = state and Color3.fromRGB(125,85,255) or Color3.fromRGB(30,30,30)
            toggle.Text = ""
            toggle.AutoButtonColor = false

            local corner = Instance.new("UICorner", toggle)
            corner.CornerRadius = UDim.new(0, 12)

            local circle = Instance.new("Frame", toggle)
            circle.Size = UDim2.new(0, 24, 0, 24)
            circle.Position = state and UDim2.new(0, 20, 0, 3) or UDim2.new(0, 4, 0, 3)
            circle.BackgroundColor3 = Color3.fromRGB(240,240,240)
            local circCorner = Instance.new("UICorner", circle)
            circCorner.CornerRadius = UDim.new(1, 0)

            toggle.MouseButton1Click:Connect(function()
                state = not state
                toggle.BackgroundColor3 = state and Color3.fromRGB(125,85,255) or Color3.fromRGB(30,30,30)
                circle.Position = state and UDim2.new(0, 20, 0, 3) or UDim2.new(0, 4, 0, 3)
                if callback then callback(state) end
            end)
        end

        function tabApi:AddButton(label, callback)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, -24, 0, 34)
            button.BackgroundColor3 = Color3.fromRGB(36,36,36)
            button.Text = label
            button.TextColor3 = Color3.fromRGB(255,255,255)
            button.Font = Enum.Font.Code
            button.TextSize = 15
            button.Parent = Content

            local corner = Instance.new("UICorner", button)
            corner.CornerRadius = UDim.new(0, 7)

            button.MouseButton1Click:Connect(callback)
        end

        function tabApi:AddLabel(label)
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, -24, 0, 28)
            lbl.BackgroundTransparency = 1
            lbl.Text = label
            lbl.TextColor3 = Color3.fromRGB(180,180,180)
            lbl.Font = Enum.Font.Code
            lbl.TextSize = 15
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = Content
        end

        function tabApi:AddSlider(label, min, max, value, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, -24, 0, 44)
            frame.BackgroundTransparency = 1
            frame.Parent = Content

            local text = Instance.new("TextLabel", frame)
            text.Position = UDim2.new(0, 0, 0, 0)
            text.Size = UDim2.new(1, 0, 0, 18)
            text.BackgroundTransparency = 1
            text.Text = string.format("%s: %d", label, value)
            text.TextColor3 = Color3.fromRGB(200,200,200)
            text.Font = Enum.Font.Code
            text.TextSize = 15
            text.TextXAlignment = Enum.TextXAlignment.Left

            local sliderBg = Instance.new("Frame", frame)
            sliderBg.Position = UDim2.new(0, 0, 0, 24)
            sliderBg.Size = UDim2.new(1, 0, 0, 12)
            sliderBg.BackgroundColor3 = Color3.fromRGB(36,36,36)
            sliderBg.BorderSizePixel = 0
            local sliderCorner = Instance.new("UICorner", sliderBg)
            sliderCorner.CornerRadius = UDim.new(0, 5)

            local sliderBar = Instance.new("Frame", sliderBg)
            sliderBar.BackgroundColor3 = Color3.fromRGB(125,85,255)
            sliderBar.BorderSizePixel = 0
            sliderBar.Size = UDim2.new((value - min)/(max-min), 0, 1, 0)
            local barCorner = Instance.new("UICorner", sliderBar)
            barCorner.CornerRadius = UDim.new(0, 5)

            local dragging = false
            sliderBg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            sliderBg.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local abs = sliderBg.AbsolutePosition.X
                    local size = sliderBg.AbsoluteSize.X
                    local rel = math.clamp((input.Position.X - abs) / size, 0, 1)
                    local newValue = math.floor(min + (max-min)*rel + 0.5)
                    sliderBar.Size = UDim2.new(rel, 0, 1, 0)
                    text.Text = string.format("%s: %d", label, newValue)
                    if callback then callback(newValue) end
                end
            end)
        end

        function tabApi:AddTextbox(label, default, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, -24, 0, 38)
            frame.BackgroundTransparency = 1
            frame.Parent = Content

            local text = Instance.new("TextLabel", frame)
            text.Position = UDim2.new(0, 0, 0, 0)
            text.Size = UDim2.new(0, 112, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = label
            text.TextColor3 = Color3.fromRGB(220,220,220)
            text.Font = Enum.Font.Code
            text.TextSize = 15
            text.TextXAlignment = Enum.TextXAlignment.Left

            local box = Instance.new("TextBox", frame)
            box.Size = UDim2.new(0, 180, 0, 28)
            box.Position = UDim2.new(0, 120, 0.5, -14)
            box.BackgroundColor3 = Color3.fromRGB(36,36,36)
            box.TextColor3 = Color3.fromRGB(255,255,255)
            box.Text = default or ""
            box.Font = Enum.Font.Code
            box.TextSize = 15
            box.ClearTextOnFocus = false

            local corner = Instance.new("UICorner", box)
            corner.CornerRadius = UDim.new(0, 6)

            box.FocusLost:Connect(function(enter)
                if enter and callback then
                    callback(box.Text)
                end
            end)
        end

        return tabApi
    end

    local self = setmetatable({
        Window = Window,
        AddTab = AddTab
    }, ObsidianRedFusion)

    return self
end

return setmetatable({}, {__index = ObsidianRedFusion})
