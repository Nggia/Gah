local RedUI = {}

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

-- Constants
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Animation configs
local TWEEN_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local FAST_TWEEN = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Color scheme
local COLORS = {
    Primary = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(15, 15, 15),
    Secondary = Color3.fromRGB(25, 25, 25),
    Tertiary = Color3.fromRGB(35, 35, 35),
    Outline = Color3.fromRGB(55, 55, 55),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(200, 200, 200),
    TextDim = Color3.fromRGB(155, 155, 155),
    Accent = Color3.fromRGB(153, 0, 102),
    Success = Color3.fromRGB(0, 255, 0),
    Warning = Color3.fromRGB(255, 255, 0),
    Error = Color3.fromRGB(255, 100, 100)
}

-- Utility functions
local function CreateInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function TweenObject(object, properties, tweenInfo)
    tweenInfo = tweenInfo or TWEEN_INFO
    local tween = TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

local function MakeDraggable(frame, dragObject)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    dragObject = dragObject or frame
    
    dragObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X, 
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local function CreateCorner(radius)
    return CreateInstance("UICorner", {
        CornerRadius = UDim.new(0, radius)
    })
end

local function CreateStroke(color, thickness, transparency)
    return CreateInstance("UIStroke", {
        Color = color,
        Thickness = thickness or 1,
        Transparency = transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    })
end

-- Main Library
function RedUI:CreateWindow(config)
    config = config or {}
    local windowTitle = config.Title or "Red UI Library"
    local windowSize = config.Size or UDim2.fromOffset(650, 500)
    
    -- Destroy existing UI
    local existingUI = CoreGui:FindFirstChild("RedUILibrary")
    if existingUI then
        existingUI:Destroy()
    end
    
    -- Create main ScreenGui
    local screenGui = CreateInstance("ScreenGui", {
        Name = "RedUILibrary",
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
    
    -- Main container
    local mainFrame = CreateInstance("Frame", {
        Name = "MainFrame",
        Parent = screenGui,
        Size = UDim2.fromOffset(0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = COLORS.Background,
        BorderSizePixel = 0
    })
    
    local corner = CreateCorner(8)
    corner.Parent = mainFrame

    local stroke = CreateStroke(COLORS.Primary, 2, 0.3)
    stroke.Parent = mainFrame

    -- Animate window opening
    TweenObject(mainFrame, {Size = windowSize}, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out))
    
    -- Title bar
    local titleBar = CreateInstance("Frame", {
        Name = "TitleBar",
        Parent = mainFrame,
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = COLORS.Secondary,
        BorderSizePixel = 0
    })
    local titleBarCorner = CreateCorner(8)
    titleBarCorner.Parent = titleBar
    
    local titleLabel = CreateInstance("TextLabel", {
        Name = "Title",
        Parent = titleBar,
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.new(0, 20, 0, 0),
        BackgroundTransparency = 1,
        Text = windowTitle,
        TextColor3 = COLORS.Primary,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold
    })
    
    -- Close button
    local closeButton = CreateInstance("TextButton", {
        Name = "CloseButton",
        Parent = titleBar,
        Size = UDim2.fromOffset(30, 30),
        Position = UDim2.new(1, -40, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = COLORS.Error,
        Text = "×",
        TextColor3 = COLORS.Text,
        TextSize = 20,
        Font = Enum.Font.GothamBold
    })
    local closeButtonCorner = CreateCorner(15)
    closeButtonCorner.Parent = closeButton
    
    -- Minimize button
    local minimizeButton = CreateInstance("TextButton", {
        Name = "MinimizeButton",
        Parent = titleBar,
        Size = UDim2.fromOffset(30, 30),
        Position = UDim2.new(1, -80, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = COLORS.Warning,
        Text = "−",
        TextColor3 = COLORS.Background,
        TextSize = 16,
        Font = Enum.Font.GothamBold
    })
    local minimizeButtonCorner = CreateCorner(15)
    minimizeButtonCorner.Parent = minimizeButton
    
    -- Content area
    local contentArea = CreateInstance("Frame", {
        Name = "ContentArea",
        Parent = mainFrame,
        Size = UDim2.new(1, 0, 1, -50),
        Position = UDim2.new(0, 0, 0, 50),
        BackgroundTransparency = 1
    })
    
    -- Sidebar
    local sidebar = CreateInstance("Frame", {
        Name = "Sidebar",
        Parent = contentArea,
        Size = UDim2.new(0, 180, 1, 0),
        BackgroundColor3 = COLORS.Secondary,
        BorderSizePixel = 0
    })
    
    local sidebarCorner = CreateCorner(0)
    sidebarCorner.Parent = sidebar
    
    -- Main content
    local mainContent = CreateInstance("ScrollingFrame", {
        Name = "MainContent",
        Parent = contentArea,
        Size = UDim2.new(1, -180, 1, 0),
        Position = UDim2.new(0, 180, 0, 0),
        BackgroundColor3 = COLORS.Background,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = COLORS.Primary,
        CanvasSize = UDim2.fromOffset(0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    })
    
    local contentPadding = CreateInstance("UIPadding", {
        Parent = mainContent,
        PaddingTop = UDim.new(0, 15),
        PaddingBottom = UDim.new(0, 15),
        PaddingLeft = UDim.new(0, 15),
        PaddingRight = UDim.new(0, 15)
    })
    
    local contentLayout = CreateInstance("UIListLayout", {
        Parent = mainContent,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10)
    })
    
    -- Tab system
    local tabs = {}
    local currentTab = nil
    
    -- Window object
    local Window = {
        MainFrame = mainFrame,
        Sidebar = sidebar,
        MainContent = mainContent,
        Tabs = tabs,
        Minimized = false
    }
    
    -- Make draggable
    MakeDraggable(mainFrame, titleBar)
    
    -- Close functionality
    closeButton.MouseButton1Click:Connect(function()
        TweenObject(mainFrame, {Size = UDim2.fromOffset(0, 0)}, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In))
        wait(0.3)
        screenGui:Destroy()
    end)
    
    -- Minimize functionality
    minimizeButton.MouseButton1Click:Connect(function()
        if not Window.Minimized then
            Window.Minimized = true
            TweenObject(mainFrame, {Size = UDim2.new(0, windowSize.X.Offset, 0, 50)})
            TweenObject(minimizeButton, {Rotation = 180})
        else
            Window.Minimized = false
            TweenObject(mainFrame, {Size = windowSize})
            TweenObject(minimizeButton, {Rotation = 0})
        end
    end)
    
    -- Tab creation
    function Window:CreateTab(config)
        config = config or {}
        local tabName = config.Name or "Tab"
        local tabIcon = config.Icon
        
        local tabButton = CreateInstance("TextButton", {
            Name = tabName,
            Parent = sidebar,
            Size = UDim2.new(1, 0, 0, 45),
            BackgroundColor3 = COLORS.Tertiary,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = tabName,
            TextColor3 = COLORS.TextDim,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham
        })
        
        local tabPadding = CreateInstance("UIPadding", {
            Parent = tabButton,
            PaddingLeft = UDim.new(0, 20),
            PaddingRight = UDim.new(0, 10)
        })
        
        local tabContent = CreateInstance("Frame", {
            Name = tabName .. "Content",
            Parent = mainContent,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
            Visible = false,
            AutomaticSize = Enum.AutomaticSize.Y
        })
        
        local tabContentLayout = CreateInstance("UIListLayout", {
            Parent = tabContent,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        })
        
        local tab = {
            Button = tabButton,
            Content = tabContent,
            Name = tabName,
            Active = false
        }
        
        tabs[tabName] = tab
        
        -- Tab switching
        tabButton.MouseButton1Click:Connect(function()
            -- Deactivate all tabs
            for _, otherTab in pairs(tabs) do
                otherTab.Active = false
                otherTab.Content.Visible = false
                TweenObject(otherTab.Button, {
                    BackgroundTransparency = 1,
                    TextColor3 = COLORS.TextDim
                })
            end
            
            -- Activate current tab
            tab.Active = true
            tab.Content.Visible = true
            TweenObject(tabButton, {
                BackgroundTransparency = 0,
                BackgroundColor3 = COLORS.Primary,
                TextColor3 = COLORS.Text
            })
            
            currentTab = tab
        end)
        
        -- Hover effects
        tabButton.MouseEnter:Connect(function()
            if not tab.Active then
                TweenObject(tabButton, {
                    BackgroundTransparency = 0.7,
                    BackgroundColor3 = COLORS.Primary,
                    TextColor3 = COLORS.TextSecondary
                })
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if not tab.Active then
                TweenObject(tabButton, {
                    BackgroundTransparency = 1,
                    TextColor3 = COLORS.TextDim
                })
            end
        end)
        
        -- Auto-select first tab
        if #tabs == 1 then
            tabButton.MouseButton1Click:Fire()
        end
        
        -- Tab methods
        function tab:CreateSection(config)
            config = config or {}
            local sectionName = config.Name or "Section"
            
            local sectionFrame = CreateInstance("Frame", {
                Name = sectionName,
                Parent = tabContent,
                Size = UDim2.new(1, 0, 0, 0),
                BackgroundColor3 = COLORS.Secondary,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y
            })
           local sectionCorner = CreateCorner(6)
           sectionCorner.Parent = sectionFrame

           local sectionStroke = CreateStroke(COLORS.Outline, 1, 0.5)
           sectionStroke.Parent = sectionFrame

            local sectionHeader = CreateInstance("TextLabel", {
                Name = "Header",
                Parent = sectionFrame,
                Size = UDim2.new(1, 0, 0, 35),
                BackgroundColor3 = COLORS.Tertiary,
                BorderSizePixel = 0,
                Text = sectionName,
                TextColor3 = COLORS.Text,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                Font = Enum.Font.GothamSemibold
            })
            local headerCorner = CreateCorner(6)
            headerCorner.Parent = sectionHeader

            local headerPadding = CreateInstance("UIPadding", {
                Parent = sectionHeader,
                PaddingLeft = UDim.new(0, 15)
            })
            
            local sectionContent = CreateInstance("Frame", {
                Name = "Content",
                Parent = sectionFrame,
                Size = UDim2.new(1, 0, 0, 0),
                Position = UDim2.new(0, 0, 0, 35),
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.Y
            })
            
            local sectionLayout = CreateInstance("UIListLayout", {
                Parent = sectionContent,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            })
            
            local sectionPadding = CreateInstance("UIPadding", {
                Parent = sectionContent,
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 15),
                PaddingRight = UDim.new(0, 15)
            })
            
            -- Hover effect for section
            sectionFrame.MouseEnter:Connect(function()
                TweenObject(sectionFrame, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
            end)
            
            sectionFrame.MouseLeave:Connect(function()
                TweenObject(sectionFrame, {BackgroundColor3 = COLORS.Secondary})
            end)
            
            local section = {
                Frame = sectionFrame,
                Content = sectionContent,
                Name = sectionName
            }
            
            -- Section methods
            function section:CreateToggle(config)
                config = config or {}
                local toggleName = config.Name or "Toggle"
                local defaultValue = config.Default or false
                local callback = config.Callback or function() end
                
                local toggleFrame = CreateInstance("Frame", {
                    Name = toggleName,
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 35),
                    BackgroundTransparency = 1
                })
                
                local toggleLabel = CreateInstance("TextLabel", {
                    Name = "Label",
                    Parent = toggleFrame,
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = toggleName,
                    TextColor3 = COLORS.TextSecondary,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham
                })
                
                local toggleSwitch = CreateInstance("Frame", {
                    Name = "Switch",
                    Parent = toggleFrame,
                    Size = UDim2.fromOffset(45, 22),
                    Position = UDim2.new(1, -50, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = COLORS.Outline,
                    BorderSizePixel = 0
                })
                toggleSwitch:AddChild(CreateCorner(11))
                
                local toggleSlider = CreateInstance("Frame", {
                    Name = "Slider",
                    Parent = toggleSwitch,
                    Size = UDim2.fromOffset(18, 18),
                    Position = UDim2.fromOffset(2, 2),
                    BackgroundColor3 = COLORS.Text,
                    BorderSizePixel = 0
                })
                toggleSlider:AddChild(CreateCorner(9))
                
                local toggleButton = CreateInstance("TextButton", {
                    Name = "Button",
                    Parent = toggleFrame,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = ""
                })
                
                local toggle = {
                    Value = defaultValue,
                    Callback = callback
                }
                
                local function updateToggle()
                    if toggle.Value then
                        TweenObject(toggleSwitch, {BackgroundColor3 = COLORS.Primary})
                        TweenObject(toggleSlider, {Position = UDim2.fromOffset(25, 2)})
                        TweenObject(toggleLabel, {TextColor3 = COLORS.Text})
                    else
                        TweenObject(toggleSwitch, {BackgroundColor3 = COLORS.Outline})
                        TweenObject(toggleSlider, {Position = UDim2.fromOffset(2, 2)})
                        TweenObject(toggleLabel, {TextColor3 = COLORS.TextSecondary})
                    end
                    
                    pcall(callback, toggle.Value)
                end
                
                toggleButton.MouseButton1Click:Connect(function()
                    toggle.Value = not toggle.Value
                    updateToggle()
                end)
                
                -- Hover effects
                toggleButton.MouseEnter:Connect(function()
                    TweenObject(toggleFrame, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}, FAST_TWEEN)
                end)
                
                toggleButton.MouseLeave:Connect(function()
                    TweenObject(toggleFrame, {BackgroundTransparency = 1}, FAST_TWEEN)
                end)
                
                -- Initialize
                updateToggle()
                
                function toggle:SetValue(value)
                    toggle.Value = value
                    updateToggle()
                end
                
                return toggle
            end
            
            function section:CreateButton(config)
                config = config or {}
                local buttonName = config.Name or "Button"
                local callback = config.Callback or function() end
                
                local buttonFrame = CreateInstance("TextButton", {
                    Name = buttonName,
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 35),
                    BackgroundColor3 = COLORS.Primary,
                    BorderSizePixel = 0,
                    Text = buttonName,
                    TextColor3 = COLORS.Text,
                    TextSize = 14,
                    Font = Enum.Font.GothamSemibold
                })
                buttonFrame:AddChild(CreateCorner(6))
                
                buttonFrame.MouseButton1Click:Connect(function()
                    -- Click animation
                    TweenObject(buttonFrame, {BackgroundColor3 = COLORS.Accent}, FAST_TWEEN)
                    TweenObject(buttonFrame, {Size = UDim2.new(1, -10, 0, 30)}, FAST_TWEEN)
                    
                    wait(0.1)
                    
                    TweenObject(buttonFrame, {BackgroundColor3 = COLORS.Primary}, FAST_TWEEN)
                    TweenObject(buttonFrame, {Size = UDim2.new(1, 0, 0, 35)}, FAST_TWEEN)
                    
                    pcall(callback)
                end)
                
                -- Hover effects
                buttonFrame.MouseEnter:Connect(function()
                    TweenObject(buttonFrame, {BackgroundColor3 = Color3.fromRGB(220, 0, 0)}, FAST_TWEEN)
                end)
                
                buttonFrame.MouseLeave:Connect(function()
                    TweenObject(buttonFrame, {BackgroundColor3 = COLORS.Primary}, FAST_TWEEN)
                end)
                
                return {
                    Button = buttonFrame,
                    SetText = function(_, text)
                        buttonFrame.Text = text
                    end
                }
            end
            
            function section:CreateSlider(config)
                config = config or {}
                local sliderName = config.Name or "Slider"
                local minValue = config.Min or 0
                local maxValue = config.Max or 100
                local defaultValue = config.Default or 50
                local callback = config.Callback or function() end
                
                local sliderFrame = CreateInstance("Frame", {
                    Name = sliderName,
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 50),
                    BackgroundTransparency = 1
                })
                
                local sliderLabel = CreateInstance("TextLabel", {
                    Name = "Label",
                    Parent = sliderFrame,
                    Size = UDim2.new(1, -50, 0, 20),
                    BackgroundTransparency = 1,
                    Text = sliderName,
                    TextColor3 = COLORS.TextSecondary,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham
                })
                
                local valueLabel = CreateInstance("TextLabel", {
                    Name = "Value",
                    Parent = sliderFrame,
                    Size = UDim2.fromOffset(40, 20),
                    Position = UDim2.new(1, -45, 0, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(defaultValue),
                    TextColor3 = COLORS.Primary,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    Font = Enum.Font.GothamSemibold
                })
                
                local sliderTrack = CreateInstance("Frame", {
                    Name = "Track",
                    Parent = sliderFrame,
                    Size = UDim2.new(1, 0, 0, 6),
                    Position = UDim2.new(0, 0, 0, 30),
                    BackgroundColor3 = COLORS.Outline,
                    BorderSizePixel = 0
                })
                sliderTrack:AddChild(CreateCorner(3))
                
                local sliderFill = CreateInstance("Frame", {
                    Name = "Fill",
                    Parent = sliderTrack,
                    Size = UDim2.fromScale((defaultValue - minValue) / (maxValue - minValue), 1),
                    BackgroundColor3 = COLORS.Primary,
                    BorderSizePixel = 0
                })
                sliderFill:AddChild(CreateCorner(3))
                
                local sliderThumb = CreateInstance("Frame", {
                    Name = "Thumb",
                    Parent = sliderTrack,
                    Size = UDim2.fromOffset(14, 14),
                    Position = UDim2.new((defaultValue - minValue) / (maxValue - minValue), -7, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = COLORS.Text,
                    BorderSizePixel = 0
                })
                sliderThumb:AddChild(CreateCorner(7))
                
                local sliderButton = CreateInstance("TextButton", {
                    Name = "Button",
                    Parent = sliderFrame,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = ""
                })
                
                local slider = {
                    Value = defaultValue,
                    Callback = callback
                }
                
                local function updateSlider(value)
                    value = math.clamp(value, minValue, maxValue)
                    slider.Value = value
                    
                    local percentage = (value - minValue) / (maxValue - minValue)
                    
                    TweenObject(sliderFill, {Size = UDim2.fromScale(percentage, 1)})
                    TweenObject(sliderThumb, {Position = UDim2.new(percentage, -7, 0.5, 0)})
                    
                    valueLabel.Text = tostring(math.floor(value))
                    pcall(callback, value)
                end
                
                local dragging = false
                
                sliderButton.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        
                        local function update()
                            local percentage = math.clamp(
                                (Mouse.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X,
                                0, 1
                            )
                            local value = minValue + (maxValue - minValue) * percentage
                            updateSlider(value)
                        end
                        
                        update()
                        
                        local connection
                        connection = Mouse.Move:Connect(function()
                            if dragging then
                                update()
                            else
                                connection:Disconnect()
                            end
                        end)
                    end
                end)
                
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                
                -- Hover effects
                sliderButton.MouseEnter:Connect(function()
                    TweenObject(sliderThumb, {Size = UDim2.fromOffset(16, 16)}, FAST_TWEEN)
                    TweenObject(sliderFrame, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}, FAST_TWEEN)
                end)
                
                sliderButton.MouseLeave:Connect(function()
                    TweenObject(sliderThumb, {Size = UDim2.fromOffset(14, 14)}, FAST_TWEEN)
                    TweenObject(sliderFrame, {BackgroundTransparency = 1}, FAST_TWEEN)
                end)
                
                function slider:SetValue(value)
                    updateSlider(value)
                end
                
                return slider
            end
            
            function section:CreateTextBox(config)
                config = config or {}
                local textBoxName = config.Name or "TextBox"
                local placeholder = config.Placeholder or "Enter text..."
                local defaultValue = config.Default or ""
                local callback = config.Callback or function() end
                
                local textBoxFrame = CreateInstance("Frame", {
                    Name = textBoxName,
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 60),
                    BackgroundTransparency = 1
                })
                
                local textBoxLabel = CreateInstance("TextLabel", {
                    Name = "Label",
                    Parent = textBoxFrame,
                    Size = UDim2.new(1, 0, 0, 20),
                    BackgroundTransparency = 1,
                    Text = textBoxName,
                    TextColor3 = COLORS.TextSecondary,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham
                })
                
                local textBoxInput = CreateInstance("TextBox", {
                    Name = "Input",
                    Parent = textBoxFrame,
                    Size = UDim2.new(1, 0, 0, 30),
                    Position = UDim2.new(0, 0, 0, 25),
                    BackgroundColor3 = COLORS.Tertiary,
                    BorderSizePixel = 0,
                    Text = defaultValue,
                    PlaceholderText = placeholder,
                    PlaceholderColor3 = COLORS.TextDim,
                    TextColor3 = COLORS.Text,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false
                })
                local inputCorner = CreateCorner(6)
                inputCorner.Parent = textBoxInput

                local inputStroke = CreateStroke(COLORS.Outline, 1, 0.7)
                inputStroke.Parent = textBoxInput
                
                local inputPadding = CreateInstance("UIPadding", {
                    Parent = textBoxInput,
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                })
                
                local textBox = {
                    Value = defaultValue,
                    Callback = callback
                }
                
                -- Focus effects
                textBoxInput.Focused:Connect(function()
                    TweenObject(textBoxInput, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
                    TweenObject(textBoxLabel, {TextColor3 = COLORS.Primary})
                end)
                
                textBoxInput.FocusLost:Connect(function()
                    TweenObject(textBoxInput, {BackgroundColor3 = COLORS.Tertiary})
                    TweenObject(textBoxLabel, {TextColor3 = COLORS.TextSecondary})
                    
                    textBox.Value = textBoxInput.Text
                    pcall(callback, textBox.Value)
                end)
                
                -- Hover effects
                textBoxInput.MouseEnter:Connect(function()
                    if not textBoxInput:IsFocused() then
                        TweenObject(textBoxInput, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
                    end
                end)
                
                textBoxInput.MouseLeave:Connect(function()
                    if not textBoxInput:IsFocused() then
                        TweenObject(textBoxInput, {BackgroundColor3 = COLORS.Tertiary})
                    end
                end)
                
                function textBox:SetValue(value)
                    textBox.Value = value
                    textBoxInput.Text = value
                end
                
                return textBox
            end
            
            function section:CreateDropdown(config)
                config = config or {}
                local dropdownName = config.Name or "Dropdown"
                local options = config.Options or {"Option 1", "Option 2", "Option 3"}
                local defaultValue = config.Default or options[1]
                local callback = config.Callback or function() end
                
                local dropdownFrame = CreateInstance("Frame", {
                    Name = dropdownName,
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 60),
                    BackgroundTransparency = 1
                })
                
                local dropdownLabel = CreateInstance("TextLabel", {
                    Name = "Label",
                    Parent = dropdownFrame,
                    Size = UDim2.new(1, 0, 0, 20),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = COLORS.TextSecondary,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham
                })
                
                local dropdownButton = CreateInstance("TextButton", {
                    Name = "Button",
                    Parent = dropdownFrame,
                    Size = UDim2.new(1, 0, 0, 30),
                    Position = UDim2.new(0, 0, 0, 25),
                    BackgroundColor3 = COLORS.Tertiary,
                    BorderSizePixel = 0,
                    Text = defaultValue,
                    TextColor3 = COLORS.Text,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham
                })
                local dropdownCorner = CreateCorner(6)
                dropdownCorner.Parent = dropdownButton

                local dropdownStroke = CreateStroke(COLORS.Outline, 1, 0.7)
                dropdownStroke.Parent = dropdownButton

                local buttonPadding = CreateInstance("UIPadding", {
                    Parent = dropdownButton,
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 35)
                })
                
                local dropdownArrow = CreateInstance("TextLabel", {
                    Name = "Arrow",
                    Parent = dropdownButton,
                    Size = UDim2.fromOffset(20, 20),
                    Position = UDim2.new(1, -25, 0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    Text = "▼",
                    TextColor3 = COLORS.TextDim,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Font = Enum.Font.Gotham
                })
                
                local dropdownList = CreateInstance("Frame", {
                    Name = "List",
                    Parent = dropdownFrame,
                    Size = UDim2.new(1, 0, 0, 0),
                    Position = UDim2.new(0, 0, 0, 55),
                    BackgroundColor3 = COLORS.Secondary,
                    BorderSizePixel = 0,
                    Visible = false,
                    ZIndex = 10
                })
                local dropdownListCorner = CreateCorner(6)
                dropdownListCorner.Parent = dropdownList

                local dropdownListStroke = CreateStroke(COLORS.Primary, 1, 0.5)
                dropdownListStroke.Parent = dropdownList

                local listLayout = CreateInstance("UIListLayout", {
                    Parent = dropdownList,
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
                
                local dropdown = {
                    Value = defaultValue,
                    Callback = callback,
                    Open = false,
                    Options = options
                }
                
                -- Create option buttons
                for i, option in ipairs(options) do
                    local optionButton = CreateInstance("TextButton", {
                        Name = "Option" .. i,
                        Parent = dropdownList,
                        Size = UDim2.new(1, 0, 0, 30),
                        BackgroundColor3 = COLORS.Secondary,
                        BorderSizePixel = 0,
                        Text = option,
                        TextColor3 = COLORS.TextSecondary,
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Font = Enum.Font.Gotham
                    })
                    
                    local optionPadding = CreateInstance("UIPadding", {
                        Parent = optionButton,
                        PaddingLeft = UDim.new(0, 15)
                    })
                    
                    optionButton.MouseButton1Click:Connect(function()
                        dropdown.Value = option
                        dropdownButton.Text = option
                        pcall(callback, option)
                        
                        -- Close dropdown
                        dropdown.Open = false
                        dropdownList.Visible = false
                        TweenObject(dropdownArrow, {Rotation = 0})
                        dropdownFrame.Size = UDim2.new(1, 0, 0, 60)
                    end)
                    
                    -- Hover effects
                    optionButton.MouseEnter:Connect(function()
                        TweenObject(optionButton, {
                            BackgroundColor3 = COLORS.Primary,
                            TextColor3 = COLORS.Text
                        }, FAST_TWEEN)
                    end)
                    
                    optionButton.MouseLeave:Connect(function()
                        TweenObject(optionButton, {
                            BackgroundColor3 = COLORS.Secondary,
                            TextColor3 = COLORS.TextSecondary
                        }, FAST_TWEEN)
                    end)
                end
                
                -- Toggle dropdown
                dropdownButton.MouseButton1Click:Connect(function()
                    dropdown.Open = not dropdown.Open
                    
                    if dropdown.Open then
                        dropdownList.Visible = true
                        local listHeight = #options * 30
                        dropdownList.Size = UDim2.new(1, 0, 0, listHeight)
                        dropdownFrame.Size = UDim2.new(1, 0, 0, 60 + listHeight)
                        TweenObject(dropdownArrow, {Rotation = 180})
                    else
                        dropdownList.Visible = false
                        dropdownFrame.Size = UDim2.new(1, 0, 0, 60)
                        TweenObject(dropdownArrow, {Rotation = 0})
                    end
                end)
                
                -- Hover effects
                dropdownButton.MouseEnter:Connect(function()
                    TweenObject(dropdownButton, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
                    TweenObject(dropdownLabel, {TextColor3 = COLORS.Primary})
                end)
                
                dropdownButton.MouseLeave:Connect(function()
                    TweenObject(dropdownButton, {BackgroundColor3 = COLORS.Tertiary})
                    TweenObject(dropdownLabel, {TextColor3 = COLORS.TextSecondary})
                end)
                
                function dropdown:SetValue(value)
                    dropdown.Value = value
                    dropdownButton.Text = value
                end
                
                function dropdown:SetOptions(newOptions)
                    dropdown.Options = newOptions
                    -- Clear existing options
                    for _, child in ipairs(dropdownList:GetChildren()) do
                        if child:IsA("TextButton") then
                            child:Destroy()
                        end
                    end
                    
                    -- Create new options
                    for i, option in ipairs(newOptions) do
                        local optionButton = CreateInstance("TextButton", {
                            Name = "Option" .. i,
                            Parent = dropdownList,
                            Size = UDim2.new(1, 0, 0, 30),
                            BackgroundColor3 = COLORS.Secondary,
                            BorderSizePixel = 0,
                            Text = option,
                            TextColor3 = COLORS.TextSecondary,
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Font = Enum.Font.Gotham
                        })
                        
                        local optionPadding = CreateInstance("UIPadding", {
                            Parent = optionButton,
                            PaddingLeft = UDim.new(0, 15)
                        })
                        
                        optionButton.MouseButton1Click:Connect(function()
                            dropdown.Value = option
                            dropdownButton.Text = option
                            pcall(callback, option)
                            
                            dropdown.Open = false
                            dropdownList.Visible = false
                            TweenObject(dropdownArrow, {Rotation = 0})
                            dropdownFrame.Size = UDim2.new(1, 0, 0, 60)
                        end)
                        
                        optionButton.MouseEnter:Connect(function()
                            TweenObject(optionButton, {
                                BackgroundColor3 = COLORS.Primary,
                                TextColor3 = COLORS.Text
                            }, FAST_TWEEN)
                        end)
                        
                        optionButton.MouseLeave:Connect(function()
                            TweenObject(optionButton, {
                                BackgroundColor3 = COLORS.Secondary,
                                TextColor3 = COLORS.TextSecondary
                            }, FAST_TWEEN)
                        end)
                    end
                end
                
                return dropdown
            end
            
            function section:CreateLabel(config)
                config = config or {}
                local labelText = config.Text or "Label"
                local textSize = config.Size or 14
                
                local labelFrame = CreateInstance("TextLabel", {
                    Name = "Label",
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 25),
                    BackgroundTransparency = 1,
                    Text = labelText,
                    TextColor3 = COLORS.TextSecondary,
                    TextSize = textSize,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    Font = Enum.Font.Gotham
                })
                
                local label = {
                    Frame = labelFrame
                }
                
                function label:SetText(text)
                    labelFrame.Text = text
                end
                
                function label:SetColor(color)
                    labelFrame.TextColor3 = color
                end
                
                return label
            end
            
            function section:CreateKeybind(config)
                config = config or {}
                local keybindName = config.Name or "Keybind"
                local defaultKey = config.Default or Enum.KeyCode.E
                local callback = config.Callback or function() end
                
                local keybindFrame = CreateInstance("Frame", {
                    Name = keybindName,
                    Parent = sectionContent,
                    Size = UDim2.new(1, 0, 0, 35),
                    BackgroundTransparency = 1
                })
                
                local keybindLabel = CreateInstance("TextLabel", {
                    Name = "Label",
                    Parent = keybindFrame,
                    Size = UDim2.new(1, -80, 1, 0),
                    BackgroundTransparency = 1,
                    Text = keybindName,
                    TextColor3 = COLORS.TextSecondary,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Font = Enum.Font.Gotham
                })
                
                local keybindButton = CreateInstance("TextButton", {
                    Name = "Button",
                    Parent = keybindFrame,
                    Size = UDim2.fromOffset(70, 25),
                    Position = UDim2.new(1, -75, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = COLORS.Tertiary,
                    BorderSizePixel = 0,
                    Text = defaultKey.Name,
                    TextColor3 = COLORS.Text,
                    TextSize = 12,
                    Font = Enum.Font.GothamSemibold
                })
                local keybindCorner = CreateCorner(4)
                keybindCorner.Parent = keybindButton

                local keybindStroke = CreateStroke(COLORS.Outline, 1, 0.7)
                keybindStroke.Parent = keybindButton

                local keybind = {
                    Key = defaultKey,
                    Callback = callback,
                    Binding = false
                }
                
                -- Key detection
                keybindButton.MouseButton1Click:Connect(function()
                    if keybind.Binding then return end
                    
                    keybind.Binding = true
                    keybindButton.Text = "..."
                    TweenObject(keybindButton, {BackgroundColor3 = COLORS.Primary})
                    
                    local connection
                    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                        if gameProcessed then return end
                        
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            keybind.Key = input.KeyCode
                            keybindButton.Text = input.KeyCode.Name
                            keybind.Binding = false
                            TweenObject(keybindButton, {BackgroundColor3 = COLORS.Tertiary})
                            connection:Disconnect()
                        end
                    end)
                end)
                
                -- Key activation
                UserInputService.InputBegan:Connect(function(input, gameProcessed)
                    if gameProcessed or keybind.Binding then return end
                    
                    if input.KeyCode == keybind.Key then
                        pcall(callback)
                        
                        -- Visual feedback
                        TweenObject(keybindButton, {BackgroundColor3 = COLORS.Primary}, FAST_TWEEN)
                        TweenObject(keybindButton, {BackgroundColor3 = COLORS.Tertiary}, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
                    end
                end)
                
                -- Hover effects
                keybindButton.MouseEnter:Connect(function()
                    if not keybind.Binding then
                        TweenObject(keybindButton, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
                    end
                end)
                
                keybindButton.MouseLeave:Connect(function()
                    if not keybind.Binding then
                        TweenObject(keybindButton, {BackgroundColor3 = COLORS.Tertiary})
                    end
                end)
                
                function keybind:SetKey(key)
                    keybind.Key = key
                    keybindButton.Text = key.Name
                end
                
                return keybind
            end
            
            return section
        end
        
        return tab
    end
    
    -- Notification system
    function Window:CreateNotification(config)
        config = config or {}
        local title = config.Title or "Notification"
        local text = config.Text or "This is a notification"
        local duration = config.Duration or 3
        local type = config.Type or "info" -- info, success, warning, error
        
        local notificationColors = {
            info = COLORS.Primary,
            success = COLORS.Success,
            warning = COLORS.Warning,
            error = COLORS.Error
        }
        
        local notificationFrame = CreateInstance("Frame", {
            Name = "Notification",
            Parent = screenGui,
            Size = UDim2.fromOffset(0, 80),
            Position = UDim2.new(1, 10, 0, 50),
            BackgroundColor3 = COLORS.Secondary,
            BorderSizePixel = 0
        })
        local notifCorner = CreateCorner(8)
        notifCorner.Parent = notificationFrame

        local notifStroke = CreateStroke(notificationColors[type], 2, 0.3)
        notifStroke.Parent = notificationFrame

        local titleLabel = CreateInstance("TextLabel", {
            Name = "Title",
            Parent = notificationFrame,
            Size = UDim2.new(1, -20, 0, 25),
            Position = UDim2.fromOffset(10, 10),
            BackgroundTransparency = 1,
            Text = title,
            TextColor3 = notificationColors[type],
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.GothamBold
        })
        
        local textLabel = CreateInstance("TextLabel", {
            Name = "Text",
            Parent = notificationFrame,
            Size = UDim2.new(1, -20, 0, 40),
            Position = UDim2.fromOffset(10, 35),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = COLORS.Text,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            Font = Enum.Font.Gotham
        })
        
        -- Animate in
        TweenObject(notificationFrame, {
            Size = UDim2.fromOffset(300, 80),
            Position = UDim2.new(1, -310, 0, 50)
        }, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out))
        
        -- Auto remove after duration
        task.wait(duration)
        TweenObject(notificationFrame, {
            Position = UDim2.new(1, 10, 0, 50)
        }, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In))
        
        task.wait(0.3)
        notificationFrame:Destroy()
    end
    
    return Window
end

return RedUI
