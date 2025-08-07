--[[
ObsidianRedFusion.lua
Maximum Shittibitch-style UI, maximum widget support, maximum Obsidian look.
Author: Copilot for Nggia
--]]

local ObsidianRedFusion = {}
ObsidianRedFusion.__index = ObsidianRedFusion

local function createRounded(frame, rad)
    local uic = Instance.new("UICorner")
    uic.CornerRadius = UDim.new(0, rad or 7)
    uic.Parent = frame
    return uic
end

function ObsidianRedFusion:Create(opts)
    local CoreGui = game:GetService("CoreGui")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    -- Clean up old UI
    local old = CoreGui:FindFirstChild("ObsidianRedUI")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = "ObsidianRedUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = CoreGui

    local Window = Instance.new("Frame")
    Window.Name = "MainWindow"
    Window.Size = UDim2.new(0, 530, 0, 410)
    Window.Position = UDim2.new(0.5, -265, 0.5, -205)
    Window.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Window.BorderSizePixel = 0
    Window.Parent = gui
    createRounded(Window, 9)

    local Accent = Instance.new("Frame", Window)
    Accent.Size = UDim2.new(1, 0, 0, 4)
    Accent.BackgroundColor3 = Color3.fromRGB(125,85,255)
    Accent.BorderSizePixel = 0
    createRounded(Accent, 2)

    local Title = Instance.new("TextLabel", Window)
    Title.Size = UDim2.new(1, 0, 0, 38)
    Title.BackgroundTransparency = 1
    Title.Text = opts and opts.Title or "Obsidian Red Fusion"
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.TextSize = 22
    Title.Font = Enum.Font.Code
    Title.TextXAlignment = Enum.TextXAlignment.Center

    -- Draggable
    do
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
    end

    -- Tab Bar
    local TabBar = Instance.new("Frame", Window)
    TabBar.Name = "TabBar"
    TabBar.Position = UDim2.new(0, 0, 0, 38)
    TabBar.Size = UDim2.new(1, 0, 0, 36)
    TabBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
    TabBar.BorderSizePixel = 0
    createRounded(TabBar, 7)

    local TabList = Instance.new("UIListLayout", TabBar)
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 10)

    -- Page Container
    local PageContainer = Instance.new("Frame", Window)
    PageContainer.Position = UDim2.new(0, 0, 0, 74)
    PageContainer.Size = UDim2.new(1, 0, 1, -74)
    PageContainer.BackgroundTransparency = 1

    local pages = {}  -- {["TabName"] = {Tab, Page, Content, api}}
    local tabs = {}   -- {TabBtn order}

    -- Page API
    local function MakePage(Content)
        local pageApi = {}
        function pageApi:Section(txt)
            local section = Instance.new("TextLabel", Content)
            section.Size = UDim2.new(1, 0, 0, 28)
            section.BackgroundTransparency = 1
            section.Text = txt
            section.TextColor3 = Color3.fromRGB(125,85,255)
            section.Font = Enum.Font.Code
            section.TextSize = 17
            section.TextXAlignment = Enum.TextXAlignment.Left
        end

        function pageApi:Divider()
            local div = Instance.new("Frame", Content)
            div.Size = UDim2.new(1, 0, 0, 2)
            div.BackgroundColor3 = Color3.fromRGB(125,85,255)
            div.BackgroundTransparency = 0.5
            div.BorderSizePixel = 0
            createRounded(div, 1)
        end

        function pageApi:Label(txt)
            local lbl = Instance.new("TextLabel", Content)
            lbl.Size = UDim2.new(1, 0, 0, 26)
            lbl.BackgroundTransparency = 1
            lbl.Text = txt
            lbl.TextColor3 = Color3.fromRGB(200,200,200)
            lbl.Font = Enum.Font.Code
            lbl.TextSize = 15
            lbl.TextXAlignment = Enum.TextXAlignment.Left
        end

        function pageApi:Toggle(label, state, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 36)
            frame.BackgroundTransparency = 1
            frame.Parent = Content

            local text = Instance.new("TextLabel", frame)
            text.Position = UDim2.new(0, 0, 0, 0)
            text.Size = UDim2.new(0, 180, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = label
            text.TextColor3 = Color3.fromRGB(220,220,220)
            text.Font = Enum.Font.Code
            text.TextSize = 16
            text.TextXAlignment = Enum.TextXAlignment.Left

            local toggle = Instance.new("TextButton", frame)
            toggle.Position = UDim2.new(1, -54, 0.5, -15)
            toggle.Size = UDim2.new(0, 48, 0, 30)
            toggle.BackgroundColor3 = state and Color3.fromRGB(125,85,255) or Color3.fromRGB(30,30,30)
            toggle.Text = ""
            toggle.AutoButtonColor = false

            createRounded(toggle, 13)

            local circle = Instance.new("Frame", toggle)
            circle.Size = UDim2.new(0, 24, 0, 24)
            circle.Position = state and UDim2.new(0, 20, 0, 3) or UDim2.new(0, 4, 0, 3)
            circle.BackgroundColor3 = Color3.fromRGB(240,240,240)
            createRounded(circle, 12)

            toggle.MouseButton1Click:Connect(function()
                state = not state
                toggle.BackgroundColor3 = state and Color3.fromRGB(125,85,255) or Color3.fromRGB(30,30,30)
                circle.Position = state and UDim2.new(0, 20, 0, 3) or UDim2.new(0, 4, 0, 3)
                if callback then callback(state) end
            end)
        end

        function pageApi:Button(label, callback)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 0, 36)
            button.BackgroundColor3 = Color3.fromRGB(36,36,36)
            button.Text = label
            button.TextColor3 = Color3.fromRGB(255,255,255)
            button.Font = Enum.Font.Code
            button.TextSize = 16
            button.Parent = Content
            createRounded(button, 7)
            button.MouseButton1Click:Connect(callback)
        end

        function pageApi:Slider(label, min, max, value, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 46)
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
            createRounded(sliderBg, 5)

            local rel = (value - min) / (max - min)
            local sliderBar = Instance.new("Frame", sliderBg)
            sliderBar.BackgroundColor3 = Color3.fromRGB(125,85,255)
            sliderBar.BorderSizePixel = 0
            sliderBar.Size = UDim2.new(rel, 0, 1, 0)
            createRounded(sliderBar, 5)

            local dragging = false
            sliderBg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
            end)
            sliderBg.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
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

        function pageApi:Textbox(label, default, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 38)
            frame.BackgroundTransparency = 1
            frame.Parent = Content

            local text = Instance.new("TextLabel", frame)
            text.Position = UDim2.new(0, 0, 0, 0)
            text.Size = UDim2.new(0, 120, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = label
            text.TextColor3 = Color3.fromRGB(220,220,220)
            text.Font = Enum.Font.Code
            text.TextSize = 15
            text.TextXAlignment = Enum.TextXAlignment.Left

            local box = Instance.new("TextBox", frame)
            box.Size = UDim2.new(0, 200, 0, 28)
            box.Position = UDim2.new(0, 130, 0.5, -14)
            box.BackgroundColor3 = Color3.fromRGB(36,36,36)
            box.TextColor3 = Color3.fromRGB(255,255,255)
            box.Text = default or ""
            box.Font = Enum.Font.Code
            box.TextSize = 15
            box.ClearTextOnFocus = false
            createRounded(box, 6)
            box.FocusLost:Connect(function(enter)
                if enter and callback then callback(box.Text) end
            end)
        end

        function pageApi:Keybind(label, curKey, callback)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 38)
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
            text.TextXAlignment = Enum.TextXAlignment.Left

            local button = Instance.new("TextButton", frame)
            button.Size = UDim2.new(0, 90, 0, 28)
            button.Position = UDim2.new(1, -100, 0.5, -14)
            button.BackgroundColor3 = Color3.fromRGB(36,36,36)
            button.TextColor3 = Color3.fromRGB(255,255,255)
            button.Text = tostring(curKey or "None")
            button.Font = Enum.Font.Code
            button.TextSize = 15
            createRounded(button, 6)

            local listening = false
            button.MouseButton1Click:Connect(function()
                button.Text = "..."
                listening = true
            end)
            UserInputService.InputBegan:Connect(function(input, gpe)
                if listening and not gpe then
                    local key = input.KeyCode.Name
                    button.Text = key
                    listening = false
                    if callback then callback(key) end
                end
            end)
        end

        return pageApi
    end

    -- Create or get a page/tab
    function ObsidianRedFusion:Page(tabName)
        if pages[tabName] then return pages[tabName].api end

        -- Tab button
        local Tab = Instance.new("TextButton")
        Tab.Size = UDim2.new(0, 140, 1, 0)
        Tab.BackgroundTransparency = 1
        Tab.Text = tabName
        Tab.TextColor3 = Color3.fromRGB(200, 200, 200)
        Tab.TextSize = 17
        Tab.Font = Enum.Font.Code
        Tab.Parent = TabBar

        -- Page frame
        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = PageContainer

        -- Content frame (padding/margin)
        local Content = Instance.new("Frame", Page)
        Content.BackgroundTransparency = 1
        Content.Size = UDim2.new(1, -36, 1, -26)
        Content.Position = UDim2.new(0, 18, 0, 13)

        -- UIListLayout for stacking controls
        local layout = Instance.new("UIListLayout", Content)
        layout.Padding = UDim.new(0, 10)
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        Tab.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                tab.Page.Visible = false
                tab.Tab.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
            Page.Visible = true
            Tab.TextColor3 = Color3.fromRGB(125,85,255)
        end)

        table.insert(tabs, {Tab = Tab, Page = Page})
        if #tabs == 1 then Tab:Fire("MouseButton1Click") end

        local pageObj = { api = MakePage(Content), Page = Page }
        pages[tabName] = pageObj
        return pageObj.api
    end

    return setmetatable({}, { __index = self })
end

return setmetatable({}, {__index = ObsidianRedFusion})
