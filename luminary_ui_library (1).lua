-- ts file was generated at discord.gg/25ms


spawn(function()
    while wait() do
        _G.ColorMethod = Color3.fromHSV(tick() * 24 % 255 / 255, 1, 1)
    end
end)
wait(0.5)
local v1 = game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Luminary")
if v1 then
    v1:Destroy()
end
local vu2 = game:GetService("UserInputService")
local vu3 = game:GetService("TweenService")
local vu4 = game:GetService("RunService")
local vu5 = game:GetService("Players").LocalPlayer:GetMouse()
local vu6 = game:GetService("TweenService")
local vu7 = {
    ["RainbowColorValue"] = 0,
    ["HueSelectionPosition"] = 0
}
Color3.fromRGB(0, 190, 255)
coroutine.wrap(function()
	-- upvalues: (ref) vu7
    while wait() do
        vu7.RainbowColorValue = vu7.RainbowColorValue + 0.00392156862745098
        vu7.HueSelectionPosition = vu7.HueSelectionPosition + 1
        if vu7.RainbowColorValue >= 1 then
            vu7.RainbowColorValue = 0
        end
        if vu7.HueSelectionPosition == 160 then
            vu7.HueSelectionPosition = 0
        end
    end
end)()
local vu8 = Instance.new("ScreenGui")
vu8.Parent = game:GetService("CoreGui").RobloxGui.Modules
vu8.Name = "Luminary"
vu8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local function vu23(p9, pu10)
	-- upvalues: (ref) vu3, (ref) vu2
    local vu11 = nil
    local vu12 = nil
    local vu13 = nil
    local vu14 = nil
    local function vu19(p15)
		-- upvalues: (ref) vu11, (ref) vu12, (ref) vu3, (ref) pu10
        local v16 = p15.Position - vu11
        local v17 = vu3
        local v18 = {
            ["Position"] = UDim2.new(vu12.X.Scale, vu12.X.Offset + v16.X, vu12.Y.Scale, vu12.Y.Offset + v16.Y)
        }
        v17:Create(pu10, TweenInfo.new(0.2), v18):Play()
    end
    p9.InputBegan:Connect(function(pu20)
		-- upvalues: (ref) vu13, (ref) vu11, (ref) vu12, (ref) pu10
        if pu20.UserInputType == Enum.UserInputType.MouseButton1 or pu20.UserInputType == Enum.UserInputType.Touch then
            vu13 = true
            vu11 = pu20.Position
            vu12 = pu10.Position
            pu20.Changed:Connect(function()
				-- upvalues: (ref) pu20, (ref) vu13
                if pu20.UserInputState == Enum.UserInputState.End then
                    vu13 = false
                end
            end)
        end
    end)
    p9.InputChanged:Connect(function(p21)
		-- upvalues: (ref) vu14
        if p21.UserInputType == Enum.UserInputType.MouseMovement or p21.UserInputType == Enum.UserInputType.Touch then
            vu14 = p21
        end
    end)
    vu2.InputChanged:Connect(function(p22)
		-- upvalues: (ref) vu14, (ref) vu13, (ref) vu19
        if p22 == vu14 and vu13 then
            vu19(p22)
        end
    end)
end
local vu395 = {
    ["win"] = function()
		-- upvalues: (ref) vu8, (ref) vu23, (ref) vu6, (ref) vu3, (ref) vu395, (ref) vu7, (ref) vu4, (ref) vu5
        if logoid == nil or logoid == "" then
            logoid = "11495469994"
        end
        local vu24 = false
        local vu25 = Instance.new("Frame")
        vu25.Name = "MainSceen"
        vu25.Parent = vu8
        vu25.AnchorPoint = Vector2.new(0.5, 0.5)
        vu25.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        vu25.BorderSizePixel = 0
        vu25.Position = UDim2.new(0.5, 0, 0.5, 0)
        vu25.Size = UDim2.new(0, 0, 0, 0)
        vu25.ClipsDescendants = true
        local v26 = Instance.new("UICorner")
        v26.CornerRadius = UDim.new(0, 4)
        v26.Name = "Main_UiConner"
        v26.Parent = vu25
        local vu_windowScale = Instance.new("UIScale")
        vu_windowScale.Name = "WindowScale"
        vu_windowScale.Scale = 400 / 610 -- whole window (built for a 550x610 canvas) renders at ~400 tall / ~361 wide, nothing clipped
        vu_windowScale.Parent = vu25
        local v27 = Instance.new("Frame")
        v27.Name = "ClickFrame"
        v27.Parent = vu25
        v27.AnchorPoint = Vector2.new(0.5, 0.5)
        v27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v27.BorderSizePixel = 0
        v27.Position = UDim2.new(0.5, 0, 0.036, 0)
        v27.Size = UDim2.new(0, 514, 0, 30)
        v27.ClipsDescendants = true
        v27.BackgroundTransparency = 1
        vu23(v27, vu25)
        vu6:Create(vu25, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
            ["Size"] = UDim2.new(0, 550, 0, 610)
        }):Play()
        Instance.new("TextButton")
        Instance.new("UICorner")
        local v29 = Instance.new("TextLabel")
        local v30 = Instance.new("TextLabel")
        Instance.new("UIStroke")
        local v31 = Instance.new("TextButton")
        v31.AnchorPoint = Vector2.new(0.5, 0.5)
        v31.ClipsDescendants = true
        v31.Position = UDim2.new(0.94, 0, 0.3, 0)
        v31.BorderSizePixel = 0
        v31.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
        v31.AutoButtonColor = false
        v31.FontSize = Enum.FontSize.Size11
        v31.TextSize = 11
        v31.TextColor3 = Color3.fromRGB(109, 109, 109)
        v31.Text = ""
        v31.Font = Enum.Font.GothamSemibold
        v31.TextXAlignment = Enum.TextXAlignment.Left
        v31.Parent = vu8
        local v32 = Instance.new("UICorner")
        v32.CornerRadius = UDim.new(0, 4)
        v32.Parent = v31
        local vu33 = Instance.new("TextButton")
        vu33.AnchorPoint = Vector2.new(0.5, 0.5)
        vu33.ClipsDescendants = true
        vu33.Position = UDim2.new(0.5, 0, 0.5, 0)
        vu33.BorderSizePixel = 0
        vu33.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        vu33.AutoButtonColor = false
        vu33.FontSize = Enum.FontSize.Size11
        vu33.TextSize = 11
        vu33.TextColor3 = Color3.fromRGB(109, 109, 109)
        vu33.Text = ""
        vu33.Font = Enum.Font.GothamSemibold
        vu33.TextXAlignment = Enum.TextXAlignment.Left
        vu33.Parent = v31
        local v34 = Instance.new("UICorner")
        v34.CornerRadius = UDim.new(0, 4)
        v34.Parent = vu33
        local v35 = Instance.new("TextButton")
        v35.AnchorPoint = Vector2.new(0.5, 0.5)
        v35.Size = UDim2.new(0, 207, 0, 48)
        v35.ClipsDescendants = true
        v35.Position = UDim2.new(0.5, 0, 0.5, 0)
        v35.BorderSizePixel = 0
        v35.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        v35.AutoButtonColor = false
        v35.FontSize = Enum.FontSize.Size11
        v35.TextSize = 11
        v35.TextColor3 = Color3.fromRGB(45, 45, 45)
        v35.Text = ""
        v35.Font = Enum.Font.GothamSemibold
        v35.Parent = v31
        local v36 = Instance.new("UICorner")
        v36.CornerRadius = UDim.new(0, 4)
        v36.Parent = v35
        v29.Name = "Uitoggle"
        v29.Parent = v35
        v29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v29.BackgroundTransparency = 1
        v29.Position = UDim2.new(0.25757575, 0, 0, 0)
        v29.Size = UDim2.new(0, 137, 0, 25)
        v29.Font = Enum.Font.GothamSemibold
        v29.Text = "Ui Toggle :"
        v29.TextColor3 = Color3.fromRGB(255, 255, 255)
        v29.TextSize = 13
        v30.Name = "Yedhee"
        v30.Parent = v35
        v30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v30.BackgroundTransparency = 1
        v30.Position = UDim2.new(0.25757575, 0, 0.479166657, 0)
        v30.Size = UDim2.new(0, 137, 0, 25)
        v30.Font = Enum.Font.GothamSemibold
        v30.Text = "RightControl"
        v30.TextColor3 = Color3.fromRGB(255, 255, 255)
        v30.TextSize = 13
        local vu37 = Instance.new("TextButton")
        vu37.AnchorPoint = Vector2.new(0.5, 0.5)
        vu37.ClipsDescendants = true
        vu37.Position = UDim2.new(0.94, 0, 0.3, 0)
        vu37.BorderSizePixel = 0
        vu37.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
        vu37.AutoButtonColor = false
        vu37.FontSize = Enum.FontSize.Size11
        vu37.TextSize = 11
        vu37.TextColor3 = Color3.fromRGB(109, 109, 109)
        vu37.Text = ""
        vu37.Font = Enum.Font.GothamSemibold
        vu37.TextXAlignment = Enum.TextXAlignment.Left
        vu37.Parent = vu8
        local v38 = Instance.new("UICorner")
        v38.CornerRadius = UDim.new(0, 9)
        v38.Name = "Main_UiConner"
        v38.Parent = vu37
        local v39 = Instance.new("TextButton")
        v39.AnchorPoint = Vector2.new(0.5, 0.5)
        v39.Size = UDim2.new(0, 198, 0, 48)
        v39.ClipsDescendants = true
        v39.Position = UDim2.new(0.5, 0, 0.5, 0)
        v39.BorderSizePixel = 0
        v39.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        v39.AutoButtonColor = false
        v39.FontSize = Enum.FontSize.Size11
        v39.TextSize = 11
        v39.TextColor3 = Color3.fromRGB(45, 45, 45)
        v39.Text = ""
        v39.Font = Enum.Font.GothamSemibold
        v39.Parent = vu37
        local v40 = Instance.new("UICorner")
        v40.CornerRadius = UDim.new(0, 9)
        v40.Name = "Main_UiConner"
        v40.Parent = v39
        local v41 = Instance.new("TextLabel")
        v41.AnchorPoint = Vector2.new(0.5, 0.5)
        v41.Size = UDim2.new(0, 198, 0, 50)
        v41.ClipsDescendants = true
        v41.BackgroundTransparency = 1
        v41.Position = UDim2.new(0.5, 0, 0.5, 0)
        v41.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v41.TextSize = 13
        v41.TextColor3 = Color3.fromRGB(255, 255, 255)
        v41.Text = "Ui Toggle : \nRightControl"
        v41.TextWrap = true
        v41.Font = Enum.Font.GothamSemibold
        v41.TextWrapped = true
        v41.Parent = v39
        local vu42 = {
            ["toggledui"] = false
        }
        game:GetService("UserInputService").InputBegan:Connect(function(p43)
			-- upvalues: (ref) vu42, (ref) vu6, (ref) vu25, (ref) vu3, (ref) vu37, (ref) vu33, (ref) vu8
            if p43.KeyCode == Enum.KeyCode.RightControl then
                if vu42.toggledui ~= false then
                    vu8.Enabled = true
                    vu3:Create(vu37, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        ["Size"] = UDim2.new(0, 0, 0, 0)
                    }):Play()
                    vu3:Create(vu33, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        ["Size"] = UDim2.new(0, 0, 0, 0)
                    }):Play()
                    vu6:Create(vu25, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                        ["Size"] = UDim2.new(0, 550, 0, 610)
                    }):Play()
                    repeat
                        wait()
                    until vu25.Size == UDim2.new(0, 550, 0, 610)
                    vu42.toggledui = false
                    if vu25.Size == UDim2.new(0, 550, 0, 610) then
                        vu8.Enabled = true
                    end
                else
                    vu42.toggledui = true
                    vu6:Create(vu25, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                        ["Size"] = UDim2.new(0, 0, 0, 0)
                    }):Play()
                    wait(0.2)
                    vu3:Create(vu37, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        ["Size"] = UDim2.new(0, 220, 0, 50)
                    }):Play()
                    vu3:Create(vu33, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        ["Size"] = UDim2.new(0, 217, 0, 47)
                    }):Play()
                end
            end
        end)
        function UISetToggle(p44)
			-- upvalues: (ref) vu42, (ref) vu3, (ref) vu25, (ref) vu37, (ref) vu33, (ref) vu8, (ref) vu6
            if p44 then
                vu8.Enabled = true
                vu6:Create(vu25, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                    ["Size"] = UDim2.new(0, 550, 0, 610)
                }):Play()
                repeat
                    wait()
                until vu25.Size == UDim2.new(0, 550, 0, 610)
                vu42.toggledui = true
                vu8.Enabled = true
            else
                vu42.toggledui = true
                vu3:Create(vu25, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                wait(0.2)
                vu3:Create(vu37, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(0, 220, 0, 50)
                }):Play()
                vu3:Create(vu33, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 210, 0, 50)
                }):Play()
                wait(2)
                vu3:Create(vu37, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                vu3:Create(vu33, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                wait(0.5)
                vu8.Enabled = false
            end
        end
        if Config and Config.HideUI then
            UISetToggle(false)
        end
        local v45 = {}
        local v46, v47, v48 = pairs(v45)
        local vu49 = vu25
        while true do
            local v50
            v48, v50 = v46(v47, v48)
            if v48 == nil then
                break
            end
            v48[v50] = nil
            v50:Disconnect()
        end
        local vu_chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if vu_chatEvents and vu_chatEvents:FindFirstChild("OnMessageDoneFiltering") then
            v45.OnChat = vu_chatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(p51)
                local v52 = p51.Message
                local v53 = game:service("Players")[p51.FromSpeaker]
                if string.lower(v52) == "." and v53.Name == game.Players.LocalPlayer.Name then
                    vu8.Enabled = not vu8.Enabled
                end
            end)
        end
        -- (legacy chat command hook skipped safely if this game uses TextChatService instead)
        local v54 = Instance.new("UIStroke")
        v54.Thickness = 1
        v54.Name = ""
        v54.Parent = vu49
        v54.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        v54.LineJoinMode = Enum.LineJoinMode.Round
        v54.Color = Color3.fromRGB(255, 255, 255)
        v54.Transparency = 0
        local v55 = Instance.new("Frame")
        v55.Name = "MainSceen22"
        v55.Parent = vu49
        v55.AnchorPoint = Vector2.new(0.5, 0.5)
        v55.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        v55.BorderSizePixel = 0
        v55.Position = UDim2.new(0.5, 0, 0.05, 88)
        v55.Size = UDim2.new(0, 528, 0, 130)
        v55.ClipsDescendants = true
        local v56 = Instance.new("Frame")
        v56.Name = "MainSceen222"
        v56.Parent = vu49
        v56.AnchorPoint = Vector2.new(0.5, 0.5)
        v56.BackgroundColor3 = _G.ColorMethod
        v56.BorderSizePixel = 0
        v56.Position = UDim2.new(0.1, 0, 0.05, 72)
        v56.Size = UDim2.new(0, 6, 0, 70)
        v56.ClipsDescendants = true
        local v57 = Instance.new("UICorner")
        v57.CornerRadius = UDim.new(0, 4)
        v57.Name = "Main_UiXConner"
        v57.Parent = v56
        local v58 = Instance.new("UICorner")
        v58.CornerRadius = UDim.new(0, 4)
        v58.Name = "Main_UiXConner"
        v58.Parent = v55
        local v59 = Instance.new("UIStroke")
        v59.Thickness = 1.5
        v59.Name = ""
        v59.Parent = v55
        v59.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        v59.LineJoinMode = Enum.LineJoinMode.Round
        v59.Color = Color3.fromRGB(255, 255, 255)
        v59.Transparency = 0
        local v60 = Instance.new("TextLabel")
        v60.Parent = v55
        v60.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v60.BackgroundTransparency = 1
        v60.BorderSizePixel = 0
        v60.Position = UDim2.new(0.2, 0, 0.05, 19)
        v60.AnchorPoint = Vector2.new(0.5, 0.5)
        v60.Size = UDim2.new(0, 1, 0, 0)
        v60.Font = Enum.Font.GothamBold
        v60.Text = "Welcome to"
        v60.TextColor3 = Color3.fromRGB(255, 255, 255)
        v60.TextSize = 15
        local v63 = Instance.new("ImageLabel")
        v63.Name = "IMGDATA"
        v63.Parent = v55
        v63.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v63.BackgroundTransparency = 1
        v63.Position = UDim2.new(0, 400, 0, 6)
        v63.Size = UDim2.new(0, 100, 0, 100)
        v63.Image = "rbxassetid://" .. tostring(logoid)
        local v65 = Instance.new("TextLabel")
        v65.Parent = v55
        v65.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v65.BackgroundTransparency = 1
        v65.BorderSizePixel = 0
        v65.Position = UDim2.new(0.2, 0, 0.05, 40)
        v65.AnchorPoint = Vector2.new(0.5, 0.5)
        v65.Size = UDim2.new(0, 136, 0, 34)
        v65.Font = Enum.Font.GothamBold
        v65.Text = "Luminary "
        v65.TextColor3 = _G.ColorMethod
        v65.TextSize = 25
        function vu395.bar(p66)
			-- upvalues: (ref) vu49
            Infomation = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
            NameGames = Infomation.Name
            local v67 = {}
            local vu68 = Instance.new("TextLabel")
            vu68.Parent = vu49
            vu68.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu68.BackgroundTransparency = 1
            vu68.BorderSizePixel = 0
            vu68.Position = UDim2.new(0.25, 0, 0.05, 570)
            vu68.AnchorPoint = Vector2.new(0.5, 0.5)
            vu68.Size = UDim2.new(0, 136, 0, 34)
            vu68.Font = Enum.Font.GothamBold
            vu68.Text = tostring("" .. NameGames .. "" .. p66)
            vu68.TextColor3 = Color3.fromRGB(255, 255, 255)
            vu68.TextSize = 14
            function v67.loadbar(_)
				-- upvalues: (ref) vu68
                vu68.Text = "                                                                    " .. NameGames .. "                                                      " .. os.date("%H") .. ":" .. os.date("%M") .. ":" .. os.date("%S")
            end
            return v67
        end
        local v69 = Instance.new("TextLabel")
        v69.Parent = v55
        v69.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v69.BackgroundTransparency = 1
        v69.BorderSizePixel = 0
        v69.Position = UDim2.new(0.3, 0, 0.05, 40)
        v69.AnchorPoint = Vector2.new(0.5, 0.5)
        v69.Size = UDim2.new(0, 136, 0, 34)
        v69.Font = Enum.Font.GothamBold
        v69.Text = "       HUB"
        v69.TextColor3 = Color3.fromRGB(255, 255, 255)
        v69.TextSize = 25
        local v71 = Instance.new("TextLabel")
        v71.Parent = vu49
        v71.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v71.BackgroundTransparency = 1
        v71.BorderSizePixel = 0
        v71.Position = UDim2.new(0.2, 0, 0.04, 0)
        v71.AnchorPoint = Vector2.new(0.5, 0.5)
        v71.Size = UDim2.new(0, 136, 0, 34)
        v71.Font = Enum.Font.GothamBold
        v71.Text = "Luminary "
        v71.TextColor3 = _G.ColorMethod
        v71.TextSize = 23
        local v72 = Instance.new("TextLabel")
        v72.Parent = vu49
        v72.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v72.BackgroundTransparency = 1
        v72.BorderSizePixel = 0
        v72.Position = UDim2.new(0.34, - 5, 0.04, 0)
        v72.AnchorPoint = Vector2.new(0.5, 0.5)
        v72.Size = UDim2.new(0, 136, 0, 34)
        v72.Font = Enum.Font.GothamBold
        v72.Text = "HUB"
        v72.TextColor3 = Color3.fromRGB(255, 255, 255)
        v72.TextSize = 23
        local v73 = Instance.new("Frame")
        v73.Name = "MainSceen2"
        v73.Parent = vu49
        v73.AnchorPoint = Vector2.new(0.5, 0.5)
        v73.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        v73.BorderSizePixel = 0
        v73.Position = UDim2.new(0.5, 0, 0.5, 0)
        v73.Size = UDim2.new(0, 0, 0, 0)
        v73.ClipsDescendants = true
        local v74 = Instance.new("UICorner")
        v74.CornerRadius = UDim.new(0, 4)
        v74.Name = "Main_UiConner"
        v74.Parent = vu49
        v73:TweenSizeAndPosition(UDim2.new(0, 530, 0, 390), UDim2.new(0.5, 0, 0.53, 70), "Out", "Back", 0.5, true)
        local v75 = Instance.new("Frame")
        v75.Name = "MainSceen2"
        v75.Parent = v73
        v75.AnchorPoint = Vector2.new(0.5, 0.5)
        v75.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v75.BorderSizePixel = 0
        v75.BackgroundTransparency = 1
        v75.Position = UDim2.new(0.5, 0, 0.07, 0)
        v75.Size = UDim2.new(0, 500, 0, 35)
        v75.ClipsDescendants = true
        local vu76 = Instance.new("ScrollingFrame")
        vu76.Parent = v75
        vu76.Active = true
        vu76.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        vu76.BackgroundTransparency = 1
        vu76.BorderSizePixel = 0
        vu76.Size = UDim2.new(0, 500, 0, 30)
        vu76.CanvasSize = UDim2.new(2, 0, 0, 0)
        vu76.ScrollBarImageColor3 = _G.ColorMethod
        vu76.ScrollBarThickness = 3
        local vu77 = Instance.new("UIListLayout")
        vu77.Parent = vu76
        vu77.FillDirection = Enum.FillDirection.Horizontal
        vu77.SortOrder = Enum.SortOrder.LayoutOrder
        vu77.Padding = UDim.new(0, 10)
        local v78 = Instance.new("UIPadding")
        v78.Parent = vu76
        v78.PaddingTop = UDim.new(0, 2)
        local vu79 = - 1
        local v80 = Instance.new("Frame", v73)
        v80.Size = UDim2.new(0, 518, 0, 268)
        v80.Position = UDim2.new(0.5, 0, 0.45, 0)
        v80.BackgroundTransparency = 1
        v80.Name = "Page "
        v80.AnchorPoint = Vector2.new(0.5, 0.5)
        local vu81 = Instance.new("Folder")
        vu81.Name = "pagesFolder"
        vu81.Parent = v80
        local vu82 = Instance.new("UIPageLayout", vu81)
        vu82.SortOrder = Enum.SortOrder.LayoutOrder
        vu82.EasingDirection = Enum.EasingDirection.InOut
        vu82.EasingStyle = Enum.EasingStyle.Quad
        vu82.Padding = UDim.new(0, 10)
        vu82.TweenTime = 0.5
        local v83 = {}
        local vu84 = Instance.new("Frame")
        vu84.Name = "NotiFrame"
        vu84.Parent = vu8
        vu84.AnchorPoint = Vector2.new(0.5, 0.5)
        vu84.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        vu84.BorderSizePixel = 0
        vu84.Position = UDim2.new(1, - 210, 1, - 500)
        vu84.Size = UDim2.new(0, 400, 0, 500)
        vu84.ClipsDescendants = true
        vu84.BackgroundTransparency = 1
        local v85 = Instance.new("UIListLayout")
        v85.Parent = vu84
        v85.SortOrder = Enum.SortOrder.LayoutOrder
        v85.Padding = UDim.new(0, 5)
        function vu395.Notifile(_, p86, p87, p88)
			-- upvalues: (ref) vu84, (ref) vu3
            local vu89 = Instance.new("Frame")
            vu89.Name = "TitleFrame"
            vu89.Parent = vu84
            vu89.AnchorPoint = Vector2.new(0.5, 0.5)
            vu89.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            vu89.BorderSizePixel = 0
            vu89.Position = UDim2.new(0.5, 0, 0.5, 0)
            vu89.Size = UDim2.new(0, 0, 0, 0)
            vu89.ClipsDescendants = true
            vu89.BackgroundTransparency = 0
            local v90 = Instance.new("UICorner")
            v90.CornerRadius = UDim.new(0, 4)
            v90.Name = ""
            v90.Parent = vu89
            vu89:TweenSizeAndPosition(UDim2.new(0, 390, 0, 70), UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            local v91 = Instance.new("ImageLabel")
            v91.Parent = vu89
            v91.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v91.BackgroundTransparency = 1
            v91.AnchorPoint = Vector2.new(0.5, 0.5)
            v91.Position = UDim2.new(0.9, 0, 0.5, 0)
            v91.Size = UDim2.new(0, 50, 0, 50)
            local v92 = Instance.new("TextLabel")
            v92.Parent = vu89
            v92.Name = "TextLabel_Tap"
            v92.BackgroundColor3 = _G.ColorMethod
            v92.Size = UDim2.new(0, 160, 0, 25)
            v92.Font = Enum.Font.GothamBold
            v92.Text = p86
            v92.TextColor3 = _G.ColorMethod
            v92.TextSize = 13
            v92.AnchorPoint = Vector2.new(0.5, 0.5)
            v92.Position = UDim2.new(0.23, 0, 0.3, 0)
            v92.TextXAlignment = Enum.TextXAlignment.Left
            v92.BackgroundTransparency = 1
            local v93 = Instance.new("Frame")
            v93.Name = "LableFrame"
            v93.Parent = vu89
            v93.AnchorPoint = Vector2.new(0.5, 0.5)
            v93.BackgroundColor3 = _G.ColorMethod
            v93.BorderSizePixel = 0
            v93.Position = UDim2.new(0.36, 0, 0.67, 0)
            v93.Size = UDim2.new(0, 260, 0, 25)
            v93.ClipsDescendants = true
            v93.BackgroundTransparency = 1
            local v94 = Instance.new("TextLabel")
            v94.Parent = v93
            v94.Name = "TextLabel_Tap"
            v94.BackgroundColor3 = _G.ColorMethod
            v94.Size = UDim2.new(0, 260, 0, 25)
            v94.Font = Enum.Font.GothamBold
            v94.Text = p87
            v94.TextColor3 = Color3.fromRGB(255, 255, 255)
            v94.TextSize = 13
            v94.AnchorPoint = Vector2.new(0.5, 0.5)
            v94.Position = UDim2.new(0.5, 0, 0.5, 0)
            v94.TextXAlignment = Enum.TextXAlignment.Left
            v94.BackgroundTransparency = 1
            repeat
                wait()
            until vu89.Size == UDim2.new(0, 390, 0, 70)
            local v95 = Instance.new("Frame")
            v95.Name = "Time"
            v95.Parent = vu89
            v95.BackgroundColor3 = _G.ColorMethod
            v95.BorderSizePixel = 0
            v95.Position = UDim2.new(0, 0, 0, 0)
            v95.Size = UDim2.new(0, 0, 0, 0)
            v95.ClipsDescendants = false
            v95.BackgroundTransparency = 0
            local v96 = Instance.new("UICorner")
            v96.CornerRadius = UDim.new(0, 4)
            v96.Name = ""
            v96.Parent = v95
            v95:TweenSizeAndPosition(UDim2.new(0, 390, 0, 3), UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.3, true)
            repeat
                wait()
            until v95.Size == UDim2.new(0, 390, 0, 3)
            vu3:Create(v95, TweenInfo.new(tonumber(p88), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["Size"] = UDim2.new(0, 0, 0, 3)
            }):Play()
            delay(tonumber(p88), function()
				-- upvalues: (ref) vu3, (ref) vu89
                vu3:Create(vu89, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                wait(0.3)
                vu89:Destroy()
            end)
        end
        function v83.Taps(_, pu97)
			-- upvalues: (ref) vu79, (ref) vu76, (ref) vu81, (ref) vu82, (ref) vu3, (ref) vu24, (ref) vu77, (ref) vu7, (ref) vu4, (ref) vu5
            vu79 = vu79 + 1
            local v98 = tostring(pu97) or tostring(math.random(1, 5000))
            local v99 = Instance.new("Frame")
            v99.Parent = vu76
            v99.Name = pu97 .. "Server"
            v99.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v99.BackgroundTransparency = 1
            v99.Position = UDim2.new(0, 0, 0, 0)
            v99.Size = UDim2.new(0, 100, 0, 25)
            v99.Visible = true
            local v100 = Instance.new("TextLabel")
            v100.Parent = v99
            v100.Name = "TextLabel_Tap"
            v100.BackgroundColor3 = _G.ColorMethod
            v100.Position = UDim2.new(0.5, 0, 0.8, 0)
            v100.Size = UDim2.new(0, 0, 0, 0)
            v100.Font = Enum.Font.SourceSans
            v100.Text = " "
            v100.TextColor3 = Color3.fromRGB(0, 0, 0)
            v100.TextSize = 14
            v100.AnchorPoint = Vector2.new(0.5, 0.5)
            local vu101 = Instance.new("TextButton")
            vu101.Parent = v99
            vu101.Name = "TextButton_Tap"
            vu101.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu101.BackgroundTransparency = 1
            vu101.Position = UDim2.new(0.114491031, 0, - 0.0216345787, 0)
            vu101.Size = UDim2.new(0, 80, 0, 20)
            vu101.Font = Enum.Font.GothamSemibold
            vu101.TextColor3 = Color3.fromRGB(155, 155, 155)
            vu101.TextSize = 13
            vu101.Text = tostring(pu97)
            local vu102 = Instance.new("Frame")
            vu102.Name = v98 .. "_MainPage"
            vu102.Parent = vu81
            vu102.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            vu102.BorderSizePixel = 0
            vu102.Position = UDim2.new(0.5, 0, 0.5, 0)
            vu102.Size = UDim2.new(0, 518, 0, 375)
            vu102.BackgroundTransparency = 1
            vu102.ClipsDescendants = true
            vu102.Visible = true
            vu102.LayoutOrder = vu79
            vu101.MouseButton1Click:connect(function()
				-- upvalues: (ref) vu102, (ref) pu97, (ref) vu82, (ref) vu76, (ref) vu3, (ref) vu101
                if vu102.Name == pu97 .. "_MainPage" then
                    vu82:JumpToIndex(vu102.LayoutOrder)
                end
                local v103 = next
                local v104, v105 = vu76:GetChildren()
                while true do
                    local v106
                    v105, v106 = v103(v104, v105)
                    if v105 == nil then
                        break
                    end
                    if v106:IsA("Frame") then
                        vu3:Create(v106.TextButton_Tap, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                        }):Play()
                    end
                    vu3:Create(vu101, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ["TextColor3"] = _G.ColorMethod
                    }):Play()
                end
            end)
            if vu24 == false then
                vu3:Create(vu101, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["TextColor3"] = _G.ColorMethod
                }):Play()
                vu102.Visible = true
                v99.Name = pu97 .. "Server"
                vu24 = true
            end
            local vu107 = Instance.new("ScrollingFrame")
            vu107.Parent = vu102
            vu107.Active = true
            vu107.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            vu107.BorderSizePixel = 0
            vu107.Size = UDim2.new(0, 518, 0, 375)
            vu107.ScrollBarThickness = 4
            vu107.ScrollBarImageColor3 = _G.ColorMethod
            local vu108 = Instance.new("UIGridLayout")
            local v109 = Instance.new("UIPadding")
            vu108.Archivable = false
            vu108.Parent = vu107
            vu108.SortOrder = Enum.SortOrder.LayoutOrder
            vu108.CellPadding = UDim2.new(0, 13, 0, 15)
            vu108.CellSize = UDim2.new(0, 240, 0, 370)
            v109.Parent = vu107
            v109.PaddingLeft = UDim.new(0, 10)
            v109.PaddingTop = UDim.new(0, 20)
            return {
                ["newpage"] = function(_)
					-- upvalues: (ref) vu107, (ref) vu108, (ref) vu76, (ref) vu77, (ref) vu3, (ref) vu7, (ref) vu4, (ref) vu5
                    local v110 = Instance.new("Frame")
                    v110.Parent = vu107
                    v110.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    v110.BorderSizePixel = 0
                    v110.Position = UDim2.new(0.028957529, 0, 0.0496277921, 0)
                    v110.Size = UDim2.new(0, 240, 0, 379)
                    local vu111 = Instance.new("ScrollingFrame")
                    vu111.Parent = v110
                    vu111.Active = true
                    vu111.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    vu111.BorderSizePixel = 0
                    vu111.Position = UDim2.new(0, 0, - 0.0101253344, 0)
                    vu111.Size = UDim2.new(0, 240, 0, 379)
                    vu111.ScrollBarThickness = 4
                    vu111.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)
                    local v112 = Instance.new("UIPadding")
                    local vu113 = Instance.new("UIListLayout")
                    v112.Parent = vu111
                    v112.PaddingLeft = UDim.new(0, 15)
                    v112.PaddingTop = UDim.new(0, 10)
                    vu113.Parent = vu111
                    vu113.SortOrder = Enum.SortOrder.LayoutOrder
                    vu113.Padding = UDim.new(0, 7)
                    local v114 = vu113
                    vu113.GetPropertyChangedSignal(v114, "AbsoluteContentSize"):Connect(function()
						-- upvalues: (ref) vu111, (ref) vu113
                        vu111.CanvasSize = UDim2.new(0, 0, 0, vu113.AbsoluteContentSize.Y + 120)
                    end)
                    vu108:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
						-- upvalues: (ref) vu107, (ref) vu108
                        vu107.CanvasSize = UDim2.new(0, 0, 0, vu108.AbsoluteContentSize.Y + 50)
                    end)
                    game:GetService("RunService").Stepped:Connect(function()
						-- upvalues: (ref) vu76, (ref) vu77, (ref) vu111, (ref) vu113, (ref) vu107, (ref) vu108
                        pcall(function()
							-- upvalues: (ref) vu76, (ref) vu77, (ref) vu111, (ref) vu113, (ref) vu107, (ref) vu108
                            vu76.CanvasSize = UDim2.new(0, vu77.AbsoluteContentSize.X, 0, 0)
                            vu111.CanvasSize = UDim2.new(0, 0, 0, vu113.AbsoluteContentSize.Y + 20)
                            vu107.CanvasSize = UDim2.new(0, 0, 0, vu108.AbsoluteContentSize.Y + 40)
                        end)
                    end)
                    return {
                        ["Toggle"] = function(_, p115, p116, pu117)
							-- upvalues: (ref) vu111, (ref) vu3
                            local v118 = Instance.new("Frame")
                            v118.Parent = vu111
                            v118.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v118.BorderSizePixel = 0
                            v118.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v118.Size = UDim2.new(0, 213, 0, 35)
                            v118.BackgroundTransparency = 1
                            v118.AnchorPoint = Vector2.new(0.5, 0.5)
                            local v119 = Instance.new("TextButton")
                            v119.Parent = v118
                            v119.BackgroundTransparency = 1
                            v119.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                            v119.BorderSizePixel = 0
                            v119.Size = UDim2.new(0, 213, 0, 35)
                            v119.AutoButtonColor = false
                            v119.Font = Enum.Font.SourceSans
                            v119.Text = " "
                            v119.TextColor3 = Color3.fromRGB(0, 0, 0)
                            v119.TextSize = 12
                            local vu120 = Instance.new("TextButton")
                            vu120.Parent = v119
                            vu120.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
                            vu120.BorderSizePixel = 0
                            vu120.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu120.Position = UDim2.new(0.9, 0, 0.5, 0)
                            vu120.Size = UDim2.new(0, 30, 0, 13)
                            vu120.Font = Enum.Font.SourceSans
                            vu120.Text = " "
                            vu120.TextColor3 = Color3.fromRGB(0, 0, 0)
                            vu120.TextSize = 12
                            vu120.AutoButtonColor = false
                            local v121 = Instance.new("UICorner")
                            v121.CornerRadius = UDim.new(0, 30)
                            v121.Name = ""
                            v121.Parent = vu120
                            local vu122 = Instance.new("TextButton")
                            vu122.Parent = vu120
                            vu122.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu122.BorderSizePixel = 0
                            vu122.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu122.Position = UDim2.new(0.1, 0, 0.5, 0)
                            vu122.Size = UDim2.new(0, 19, 0, 19)
                            vu122.Font = Enum.Font.SourceSans
                            vu122.Text = " "
                            vu122.TextColor3 = Color3.fromRGB(0, 0, 0)
                            vu122.TextSize = 12
                            vu122.AutoButtonColor = false
                            local v123 = Instance.new("UICorner")
                            v123.CornerRadius = UDim.new(0, 30)
                            v123.Name = ""
                            v123.Parent = vu122
                            local vu124 = Instance.new("TextButton")
                            vu124.Parent = vu122
                            vu124.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
                            vu124.BorderSizePixel = 0
                            vu124.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu124.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu124.Size = UDim2.new(0, 27, 0, 25)
                            vu124.Font = Enum.Font.SourceSans
                            vu124.Text = " "
                            vu124.TextColor3 = Color3.fromRGB(0, 0, 0)
                            vu124.TextSize = 12
                            vu124.AutoButtonColor = false
                            vu124.BackgroundTransparency = 1
                            vu124.Visible = true
                            local v125 = Instance.new("UICorner")
                            v125.CornerRadius = UDim.new(0, 30)
                            v125.Name = ""
                            v125.Parent = vu124
                            local vu126 = Instance.new("TextLabel")
                            vu126.Parent = v118
                            vu126.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu126.BackgroundTransparency = 1
                            vu126.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu126.Position = UDim2.new(0.4, 0, 0.5, 0)
                            vu126.BorderSizePixel = 0
                            vu126.Size = UDim2.new(0, 130, 0, 25)
                            vu126.Font = Enum.Font.GothamSemibold
                            vu126.Text = p115
                            vu126.TextColor3 = Color3.fromRGB(200, 200, 200)
                            vu126.TextSize = 13
                            vu126.ClipsDescendants = true
                            vu126.TextWrapped = true
                            vu126.TextXAlignment = Enum.TextXAlignment.Left
                            local v127 = Instance.new("TextButton")
                            v127.Parent = v119
                            v127.BackgroundTransparency = 1
                            v127.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                            v127.BorderSizePixel = 0
                            v127.Size = UDim2.new(0, 213, 0, 35)
                            v127.AutoButtonColor = false
                            v127.Font = Enum.Font.SourceSans
                            v127.Text = " "
                            v127.TextColor3 = Color3.fromRGB(0, 0, 0)
                            v127.TextSize = 12
                            v127.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu124, (ref) vu126
                                vu3:Create(vu124, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundTransparency"] = 0.6
                                }):Play()
                                vu3:Create(vu126, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                            end)
                            v127.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu124, (ref) vu126
                                vu3:Create(vu124, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundTransparency"] = 1
                                }):Play()
                                vu3:Create(vu126, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(200, 200, 200)
                                }):Play()
                            end)
                            local vu128 = {
                                ["toogle"] = false,
                                ["loacker"] = true,
                                ["togfunction"] = {}
                            }
                            v127.MouseButton1Click:Connect(function()
								-- upvalues: (ref) vu128, (ref) vu3, (ref) vu124, (ref) vu122, (ref) vu120, (ref) pu117
                                if vu128.toogle ~= false or vu128.loacker ~= true then
                                    if vu128.loacker == true then
                                        vu3:Create(vu124, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(155, 155, 155)
                                        }):Play()
                                        vu3:Create(vu122, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                                        }):Play()
                                        vu3:Create(vu120, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(155, 155, 155)
                                        }):Play()
                                        vu122:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                    end
                                else
                                    vu3:Create(vu124, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = _G.ColorMethod
                                    }):Play()
                                    vu3:Create(vu122, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                                    }):Play()
                                    vu3:Create(vu120, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = _G.ColorMethod
                                    }):Play()
                                    vu122:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                end
                                if vu128.loacker == true then
                                    vu128.toogle = not vu128.toogle
                                    pu117(vu128.toogle)
                                end
                            end)
                            if p116 == true then
                                vu3:Create(vu124, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundColor3"] = Color3.fromRGB(0, 190, 255)
                                }):Play()
                                vu3:Create(vu122, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundColor3"] = Color3.fromRGB(0, 190, 255)
                                }):Play()
                                vu3:Create(vu120, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundColor3"] = _G.ColorMethod
                                }):Play()
                                local v129 = vu122
                                vu122.TweenSizeAndPosition(v129, UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                vu128.toogle = true
                                pu117(vu128.toogle)
                            end
                            local vu130 = Instance.new("Frame")
                            vu130.Name = "lockerframe"
                            vu130.Parent = v118
                            vu130.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            vu130.BackgroundTransparency = 1
                            vu130.Size = UDim2.new(0, 320, 0, 35)
                            vu130.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu130.AnchorPoint = Vector2.new(0.5, 0.5)
                            local vu131 = Instance.new("ImageLabel")
                            vu131.Parent = vu130
                            vu131.BackgroundTransparency = 1
                            vu131.BorderSizePixel = 0
                            vu131.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu131.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu131.Size = UDim2.new(0, 0, 0, 0)
                            vu131.Image = "http://www.roblox.com/asset/?id=6031082533"
                            function vu128.togfunction.lock(_)
								-- upvalues: (ref) vu3, (ref) vu130, (ref) vu131, (ref) vu128
                                vu3:Create(vu130, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                    ["BackgroundTransparency"] = 0.7
                                }):Play()
                                vu3:Create(vu131, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                    ["Size"] = UDim2.new(0, 30, 0, 30)
                                }):Play()
                                vu128.loacker = false
                            end
                            function vu128.togfunction.unlock(_)
								-- upvalues: (ref) vu3, (ref) vu130, (ref) vu131, (ref) vu128
                                vu3:Create(vu130, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                    ["BackgroundTransparency"] = 1
                                }):Play()
                                vu3:Create(vu131, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                    ["Size"] = UDim2.new(0, 0, 0, 0)
                                }):Play()
                                vu128.loacker = true
                            end
                            return vu128.togfunction
                        end,
                        ["Button"] = function(_, p132, pu133)
							-- upvalues: (ref) vu111, (ref) vu3
                            local v134 = Instance.new("Frame")
                            v134.Name = "ButtonFrame"
                            v134.Parent = vu111
                            v134.BackgroundColor3 = _G.ColorMethod
                            v134.BorderSizePixel = 0
                            v134.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v134.AnchorPoint = Vector2.new(0.5, 0.5)
                            v134.Size = UDim2.new(0, 213, 0, 25)
                            v134.BackgroundTransparency = 1
                            v134.ClipsDescendants = true
                            local v135 = Instance.new("UIStroke")
                            v135.Thickness = 0
                            v135.Name = ""
                            v135.Parent = v134
                            v135.LineJoinMode = Enum.LineJoinMode.Round
                            v135.Color = _G.ColorMethod
                            v135.Transparency = 0.7
                            local vu136 = Instance.new("TextButton")
                            vu136.Parent = v134
                            vu136.Name = "Button"
                            vu136.BackgroundColor3 = _G.ColorMethod
                            vu136.Size = UDim2.new(0, 150, 0, 25)
                            vu136.Font = Enum.Font.SourceSansSemibold
                            vu136.Text = tostring(p132)
                            vu136.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu136.TextSize = 13
                            vu136.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu136.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu136.TextXAlignment = Enum.TextXAlignment.Center
                            vu136.BackgroundTransparency = 0.6
                            vu136.TextWrapped = true
                            vu136.AutoButtonColor = false
                            vu136.ClipsDescendants = true
                            local v137 = Instance.new("UICorner")
                            v137.CornerRadius = UDim.new(0, 4)
                            v137.Name = ""
                            v137.Parent = vu136
                            vu136.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu136
                                vu3:Create(vu136, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Size"] = UDim2.new(0, 213, 0, 25)
                                }):Play()
                                vu3:Create(vu136, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundTransparency"] = 0
                                }):Play()
                                vu3:Create(vu136, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                            end)
                            vu136.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu136
                                vu3:Create(vu136, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Size"] = UDim2.new(0, 150, 0, 25)
                                }):Play()
                                vu3:Create(vu136, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundTransparency"] = 0.6
                                }):Play()
                                vu3:Create(vu136, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                            end)
                            vu136.MouseButton1Click:Connect(function()
								-- upvalues: (ref) pu133, (ref) vu3, (ref) vu136
                                pu133()
                                vu3:Create(vu136, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                    ["TextSize"] = 16
                                }):Play()
                                wait(0.1)
                                vu3:Create(vu136, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                    ["TextSize"] = 13
                                }):Play()
                            end)
                        end,
                        ["Slider"] = function(_, p138, p139, pu140, pu141, pu142, pu143, pu144, p145, pu146)
							-- upvalues: (ref) vu111, (ref) vu3
                            if p139 then
                                local v147 = Instance.new("Frame")
                                v147.Name = "SliderFrame"
                                v147.Parent = vu111
                                v147.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                                v147.BorderSizePixel = 0
                                v147.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v147.AnchorPoint = Vector2.new(0.5, 0.5)
                                v147.Size = UDim2.new(0, 213, 0, 75)
                                v147.BackgroundTransparency = 0
                                v147.ClipsDescendants = true
                                local v148 = Instance.new("UICorner")
                                v148.CornerRadius = UDim.new(0, 4)
                                v148.Name = ""
                                v148.Parent = v147
                                local vu149 = Instance.new("UIStroke")
                                vu149.Thickness = 1
                                vu149.Name = ""
                                vu149.Parent = v147
                                vu149.LineJoinMode = Enum.LineJoinMode.Round
                                vu149.Color = _G.ColorMethod
                                vu149.Transparency = 0.7
                                v147.MouseEnter:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu149
                                    vu3:Create(vu149, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0
                                    }):Play()
                                end)
                                v147.MouseLeave:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu149
                                    vu3:Create(vu149, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0.7
                                    }):Play()
                                end)
                                local v150 = Instance.new("TextLabel")
                                v150.Parent = v147
                                v150.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v150.BackgroundTransparency = 1
                                v150.BorderSizePixel = 0
                                v150.Position = UDim2.new(0.35, 0, 0.2, 0)
                                v150.AnchorPoint = Vector2.new(0.5, 0.5)
                                v150.Size = UDim2.new(0, 120, 0, 20)
                                v150.Font = Enum.Font.GothamBold
                                v150.Text = tostring(p138)
                                v150.TextColor3 = Color3.fromRGB(255, 255, 255)
                                v150.TextSize = 11
                                v150.TextXAlignment = Enum.TextXAlignment.Left
                                local v151 = Instance.new("Frame")
                                v151.Name = "ShowValueFarm"
                                v151.Parent = v147
                                v151.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                v151.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                                v151.Size = UDim2.new(0, 75, 0, 15)
                                v151.BackgroundTransparency = 0
                                v151.BorderSizePixel = 0
                                v151.AnchorPoint = Vector2.new(0.5, 0.5)
                                v151.Position = UDim2.new(0.8, 0, 0.2, 0)
                                v151.ClipsDescendants = false
                                local vu152 = Instance.new("TextBox")
                                vu152.Parent = v151
                                vu152.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                vu152.BorderSizePixel = 0
                                vu152.ClipsDescendants = true
                                vu152.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu152.Position = UDim2.new(0.5, 0, 0.5, 0)
                                vu152.Size = UDim2.new(0, 158, 0, 26)
                                vu152.Font = Enum.Font.GothamSemibold
                                vu152.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
                                vu152.PlaceholderText = ""
                                if pu140 == true then
                                    vu152.Text = tostring(pu143 and (string.format("%.1f", pu143 / pu142 * (pu142 - pu141) + pu141) or 0) or 0)
                                else
                                    vu152.Text = tostring(pu143 and (math.floor(pu143 / pu142 * (pu142 - pu141) + pu141) or 0) or 0)
                                end
                                vu152.TextColor3 = Color3.fromRGB(255, 255, 255)
                                vu152.TextSize = 8
                                vu152.BackgroundTransparency = 1
                                local vu153 = Instance.new("Frame")
                                vu153.Name = "ValueFrame"
                                vu153.Parent = v147
                                vu153.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                vu153.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                                vu153.Size = UDim2.new(0, 140, 0, 5)
                                vu153.BackgroundTransparency = 0
                                vu153.BorderSizePixel = 0
                                vu153.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu153.Position = UDim2.new(0.4, 0, 0.8, 0)
                                vu153.ClipsDescendants = false
                                local v154 = Instance.new("Frame")
                                v154.Name = "PartValue"
                                v154.Parent = vu153
                                v154.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
                                v154.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                                v154.Size = UDim2.new(0, 140, 0, 5)
                                v154.BackgroundTransparency = 1
                                v154.BorderSizePixel = 0
                                v154.AnchorPoint = Vector2.new(0.5, 0.5)
                                v154.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v154.ClipsDescendants = false
                                local vu155 = Instance.new("Frame")
                                vu155.Name = "MainValue"
                                vu155.Parent = v154
                                vu155.BackgroundColor3 = _G.ColorMethod
                                vu155.Size = UDim2.new((pu143 or 0) / pu142, 0, 0, 5)
                                vu155.BackgroundTransparency = 0
                                vu155.BorderSizePixel = 0
                                vu155.Position = UDim2.new(0, 0, 0, 0)
                                vu155.ClipsDescendants = false
                                local v156 = Instance.new("UICorner")
                                v156.CornerRadius = UDim.new(0, 8)
                                v156.Name = ""
                                v156.Parent = vu155
                                local v157 = Instance.new("UICorner")
                                v157.CornerRadius = UDim.new(0, 8)
                                v157.Name = ""
                                v157.Parent = vu153
                                local vu158 = Instance.new("Frame")
                                vu158.Name = "ConneValue"
                                vu158.Parent = v154
                                vu158.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                vu158.Size = UDim2.new(0, 13, 0, 13)
                                vu158.BackgroundTransparency = 0
                                vu158.BorderSizePixel = 0
                                vu158.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu158.Position = UDim2.new((pu143 or 0) / pu142, 0.5, 0.3, 0.5, 0)
                                vu158.ClipsDescendants = false
                                local v159 = Instance.new("UICorner")
                                v159.CornerRadius = UDim.new(0, 300)
                                v159.Name = ""
                                v159.Parent = vu158
                                local v160 = Instance.new("ImageButton")
                                v160.Name = "Imatog"
                                v160.Parent = v147
                                v160.BackgroundTransparency = 1
                                v160.BorderSizePixel = 0
                                v160.Position = UDim2.new(0.85, 0, 0.35, 0)
                                v160.Size = UDim2.new(0, 15, 0, 15)
                                v160.Image = "http://www.roblox.com/asset/?id=6035067836"
                                v160.ImageColor3 = _G.ColorMethod
                                local v161 = Instance.new("ImageButton")
                                v161.Name = "Imatog"
                                v161.Parent = v147
                                v161.BackgroundTransparency = 1
                                v161.BorderSizePixel = 0
                                v161.Position = UDim2.new(0.7, 0, 0.35, 0)
                                v161.Size = UDim2.new(0, 15, 0, 15)
                                v161.Image = "http://www.roblox.com/asset/?id=6035047377"
                                v161.ImageColor3 = _G.ColorMethod
                                local vu162 = Instance.new("TextButton")
                                vu162.Parent = vu153
                                vu162.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
                                vu162.BorderSizePixel = 0
                                vu162.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu162.Position = UDim2.new(1.25, 0, 0.4, 0)
                                vu162.Size = UDim2.new(0, 30, 0, 13)
                                vu162.Font = Enum.Font.SourceSans
                                vu162.Text = " "
                                vu162.TextColor3 = Color3.fromRGB(0, 0, 0)
                                vu162.TextSize = 12
                                vu162.AutoButtonColor = false
                                local v163 = Instance.new("UICorner")
                                v163.CornerRadius = UDim.new(0, 30)
                                v163.Name = ""
                                v163.Parent = vu162
                                local vu164 = Instance.new("TextButton")
                                vu164.Parent = vu162
                                vu164.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                vu164.BorderSizePixel = 0
                                vu164.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu164.Position = UDim2.new(0.1, 0, 0.5, 0)
                                vu164.Size = UDim2.new(0, 19, 0, 19)
                                vu164.Font = Enum.Font.SourceSans
                                vu164.Text = " "
                                vu164.TextColor3 = Color3.fromRGB(0, 0, 0)
                                vu164.TextSize = 12
                                vu164.AutoButtonColor = false
                                local v165 = Instance.new("UICorner")
                                v165.CornerRadius = UDim.new(0, 30)
                                v165.Name = ""
                                v165.Parent = vu164
                                local vu166 = Instance.new("TextButton")
                                vu166.Parent = vu164
                                vu166.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
                                vu166.BorderSizePixel = 0
                                vu166.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu166.Position = UDim2.new(0.5, 0, 0.5, 0)
                                vu166.Size = UDim2.new(0, 27, 0, 25)
                                vu166.Font = Enum.Font.SourceSans
                                vu166.Text = " "
                                vu166.TextColor3 = Color3.fromRGB(0, 0, 0)
                                vu166.TextSize = 12
                                vu166.AutoButtonColor = false
                                vu166.BackgroundTransparency = 1
                                vu166.Visible = true
                                local v167 = Instance.new("UICorner")
                                v167.CornerRadius = UDim.new(0, 30)
                                v167.Name = ""
                                v167.Parent = vu166
                                local v168 = Instance.new("TextButton")
                                v168.Parent = vu153
                                v168.BackgroundTransparency = 1
                                v168.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v168.BorderSizePixel = 0
                                v168.Size = UDim2.new(0, 50, 0, 20)
                                v168.AutoButtonColor = false
                                v168.Font = Enum.Font.SourceSans
                                v168.Text = " "
                                v168.TextColor3 = Color3.fromRGB(0, 0, 0)
                                v168.TextSize = 12
                                v168.AnchorPoint = Vector2.new(0.5, 0.5)
                                v168.Position = UDim2.new(1.25, 0, 0.4, 0)
                                local vu169 = {
                                    ["toogle2"] = false
                                }
                                local function vu174(p170)
									-- upvalues: (ref) vu153, (ref) vu155, (ref) vu158, (ref) pu140, (ref) pu142, (ref) pu141, (ref) vu152, (ref) pu146, (ref) vu169
                                    local v171 = UDim2.new(math.clamp((p170.Position.X - vu153.AbsolutePosition.X) / vu153.AbsoluteSize.X, 0, 1), 0, 0.3, 0)
                                    vu155:TweenSize(UDim2.new(math.clamp((p170.Position.X - vu153.AbsolutePosition.X) / vu153.AbsoluteSize.X, 0, 1), 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu158:TweenPosition(v171, "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v172 = math.floor(v171.X.Scale * pu142 / pu142 * (pu142 - pu141) + pu141)
                                        vu152.Text = tostring(v172)
                                        pu146({
                                            ["s"] = v172,
                                            ["t"] = vu169.toogle2
                                        })
                                    else
                                        local v173 = string.format("%.1f", v171.X.Scale * pu142 / pu142 * (pu142 - pu141) + pu141)
                                        vu152.Text = tostring(v173)
                                        pu146({
                                            ["s"] = v173,
                                            ["t"] = vu169.toogle2
                                        })
                                    end
                                end
                                local vu175 = false
                                vu158.InputBegan:Connect(function(p176)
									-- upvalues: (ref) vu175
                                    if p176.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu175 = true
                                    end
                                end)
                                vu158.InputEnded:Connect(function(p177)
									-- upvalues: (ref) vu175
                                    if p177.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu175 = false
                                    end
                                end)
                                v147.InputBegan:Connect(function(p178)
									-- upvalues: (ref) vu175
                                    if p178.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu175 = true
                                    end
                                end)
                                v147.InputEnded:Connect(function(p179)
									-- upvalues: (ref) vu175
                                    if p179.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu175 = false
                                    end
                                end)
                                vu153.InputBegan:Connect(function(p180)
									-- upvalues: (ref) vu175
                                    if p180.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu175 = true
                                    end
                                end)
                                vu153.InputEnded:Connect(function(p181)
									-- upvalues: (ref) vu175
                                    if p181.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu175 = false
                                    end
                                end)
                                game:GetService("UserInputService").InputChanged:Connect(function(p182)
									-- upvalues: (ref) vu175, (ref) vu174
                                    if vu175 and p182.UserInputType == Enum.UserInputType.MouseMovement then
                                        vu174(p182)
                                    end
                                end)
                                vu152.FocusLost:Connect(function()
									-- upvalues: (ref) vu152, (ref) pu143, (ref) pu142, (ref) pu141, (ref) vu155, (ref) vu158, (ref) pu140, (ref) pu146, (ref) vu169
                                    if vu152.Text == "" then
                                        vu152.Text = pu143
                                    end
                                    if pu142 < tonumber(vu152.Text) then
                                        vu152.Text = pu142
                                    end
                                    if tonumber(vu152.Text) <= pu141 then
                                        vu152.Text = pu141
                                    end
                                    vu155:TweenSize(UDim2.new((vu152.Text or 0) / pu142, 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu158:TweenPosition(UDim2.new((vu152.Text or 0) / pu142, 0, 0, 0), "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v183 = vu152
                                        local v184 = tostring
                                        local v185 = vu152.Text
                                        if v185 then
                                            v185 = math.floor(vu152.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v183.Text = v184(v185)
                                    else
                                        local v186 = vu152
                                        local v187 = tostring
                                        local v188 = vu152.Text
                                        if v188 then
                                            v188 = string.format("%.1f", vu152.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v186.Text = v187(v188)
                                    end
                                    pu146({
                                        ["s"] = vu152.Text,
                                        ["t"] = vu169.toogle2
                                    })
                                end)
                                v160.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu152, (ref) pu143, (ref) pu144, (ref) pu142, (ref) pu141, (ref) vu155, (ref) vu158, (ref) pu140, (ref) pu146, (ref) vu169
                                    if vu152.Text == "" then
                                        vu152.Text = pu143
                                    end
                                    pcall(function()
										-- upvalues: (ref) vu152, (ref) pu144
                                        vu152.Text = vu152.Text - tonumber(pu144)
                                    end)
                                    if pu142 < tonumber(vu152.Text) then
                                        vu152.Text = pu142
                                    end
                                    if tonumber(vu152.Text) < pu141 then
                                        vu152.Text = pu141
                                    end
                                    vu155:TweenSize(UDim2.new((vu152.Text or 0) / pu142, 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu158:TweenPosition(UDim2.new((vu152.Text or 0) / pu142, 0, 0.5, 0), "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v189 = vu152
                                        local v190 = tostring
                                        local v191 = vu152.Text
                                        if v191 then
                                            v191 = math.floor(vu152.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v189.Text = v190(v191)
                                    else
                                        local v192 = vu152
                                        local v193 = tostring
                                        local v194 = vu152.Text
                                        if v194 then
                                            v194 = string.format("%.1f", vu152.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v192.Text = v193(v194)
                                    end
                                    pu146({
                                        ["s"] = vu152.Text,
                                        ["t"] = vu169.toogle2
                                    })
                                end)
                                v161.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu152, (ref) pu143, (ref) pu144, (ref) pu142, (ref) pu141, (ref) vu155, (ref) vu158, (ref) pu140, (ref) pu146, (ref) vu169
                                    if vu152.Text == "" then
                                        vu152.Text = pu143
                                    end
                                    pcall(function()
										-- upvalues: (ref) vu152, (ref) pu144
                                        vu152.Text = vu152.Text + tonumber(pu144)
                                    end)
                                    if pu142 < tonumber(vu152.Text) then
                                        vu152.Text = pu142
                                    end
                                    if tonumber(vu152.Text) < pu141 then
                                        vu152.Text = pu141
                                    end
                                    vu155:TweenSize(UDim2.new((vu152.Text or 0) / pu142, 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu158:TweenPosition(UDim2.new((vu152.Text or 0) / pu142, 0, 0.5, 0), "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v195 = vu152
                                        local v196 = tostring
                                        local v197 = vu152.Text
                                        if v197 then
                                            v197 = math.floor(vu152.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v195.Text = v196(v197)
                                    else
                                        local v198 = vu152
                                        local v199 = tostring
                                        local v200 = vu152.Text
                                        if v200 then
                                            v200 = string.format("%.1f", vu152.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v198.Text = v199(v200)
                                    end
                                    pu146({
                                        ["s"] = vu152.Text,
                                        ["t"] = vu169.toogle2
                                    })
                                end)
                                v168.MouseEnter:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu166
                                    vu3:Create(vu166, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundTransparency"] = 0.6
                                    }):Play()
                                end)
                                v168.MouseLeave:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu166
                                    vu3:Create(vu166, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundTransparency"] = 1
                                    }):Play()
                                end)
                                v168.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu169, (ref) vu3, (ref) vu166, (ref) vu164, (ref) vu162, (ref) pu146
                                    if vu169.toogle2 ~= false then
                                        vu3:Create(vu166, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(155, 155, 155)
                                        }):Play()
                                        vu3:Create(vu164, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                                        }):Play()
                                        vu3:Create(vu162, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(155, 155, 155)
                                        }):Play()
                                        vu164:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                    else
                                        vu3:Create(vu166, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = _G.ColorMethod
                                        }):Play()
                                        vu3:Create(vu164, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = _G.ColorMethod
                                        }):Play()
                                        vu3:Create(vu162, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["BackgroundColor3"] = Color3.fromRGB(153, 0, 102)
                                        }):Play()
                                        vu164:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                    end
                                    vu169.toogle2 = not vu169.toogle2
                                    pu146({
                                        ["t"] = vu169.toogle2
                                    })
                                end)
                                if p145 == true then
                                    vu3:Create(vu166, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = _G.ColorMethod
                                    }):Play()
                                    vu3:Create(vu164, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = _G.ColorMethod
                                    }):Play()
                                    vu3:Create(vu162, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = Color3.fromRGB(153, 0, 102)
                                    }):Play()
                                    local v201 = vu164
                                    vu164.TweenSizeAndPosition(v201, UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                    vu169.toogle2 = true
                                    pu146({
                                        ["t"] = vu169.toogle2
                                    })
                                end
                            else
                                local v202 = Instance.new("Frame")
                                v202.Name = "SliderFrame"
                                v202.Parent = vu111
                                v202.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                                v202.BorderSizePixel = 0
                                v202.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v202.AnchorPoint = Vector2.new(0.5, 0.5)
                                v202.Size = UDim2.new(0, 213, 0, 75)
                                v202.BackgroundTransparency = 0
                                v202.ClipsDescendants = true
                                local v203 = Instance.new("UICorner")
                                v203.CornerRadius = UDim.new(0, 4)
                                v203.Name = ""
                                v203.Parent = v202
                                local vu204 = Instance.new("UIStroke")
                                vu204.Thickness = 1
                                vu204.Name = ""
                                vu204.Parent = v202
                                vu204.LineJoinMode = Enum.LineJoinMode.Round
                                vu204.Color = _G.ColorMethod
                                vu204.Transparency = 0.7
                                v202.MouseEnter:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu204
                                    vu3:Create(vu204, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0
                                    }):Play()
                                end)
                                v202.MouseLeave:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu204
                                    vu3:Create(vu204, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0.7
                                    }):Play()
                                end)
                                local v205 = Instance.new("TextLabel")
                                v205.Parent = v202
                                v205.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v205.BackgroundTransparency = 1
                                v205.BorderSizePixel = 0
                                v205.Position = UDim2.new(0.35, 0, 0.2, 0)
                                v205.AnchorPoint = Vector2.new(0.5, 0.5)
                                v205.Size = UDim2.new(0, 120, 0, 20)
                                v205.Font = Enum.Font.GothamBold
                                v205.Text = tostring(p138)
                                v205.TextColor3 = Color3.fromRGB(255, 255, 255)
                                v205.TextSize = 11
                                v205.TextXAlignment = Enum.TextXAlignment.Left
                                local v206 = Instance.new("Frame")
                                v206.Name = "ShowValueFarm"
                                v206.Parent = v202
                                v206.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                v206.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                                v206.Size = UDim2.new(0, 75, 0, 15)
                                v206.BackgroundTransparency = 0
                                v206.BorderSizePixel = 0
                                v206.AnchorPoint = Vector2.new(0.5, 0.5)
                                v206.Position = UDim2.new(0.8, 0, 0.2, 0)
                                v206.ClipsDescendants = false
                                local vu207 = Instance.new("TextBox")
                                vu207.Parent = v206
                                vu207.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                vu207.BorderSizePixel = 0
                                vu207.ClipsDescendants = true
                                vu207.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu207.Position = UDim2.new(0.5, 0, 0.5, 0)
                                vu207.Size = UDim2.new(0, 158, 0, 26)
                                vu207.Font = Enum.Font.GothamSemibold
                                vu207.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
                                vu207.PlaceholderText = ""
                                if pu140 == true then
                                    vu207.Text = tostring(pu143 and (string.format("%.1f", pu143 / pu142 * (pu142 - pu141) + pu141) or 0) or 0)
                                else
                                    vu207.Text = tostring(pu143 and (math.floor(pu143 / pu142 * (pu142 - pu141) + pu141) or 0) or 0)
                                end
                                vu207.TextColor3 = Color3.fromRGB(255, 255, 255)
                                vu207.TextSize = 8
                                vu207.BackgroundTransparency = 1
                                local vu208 = Instance.new("Frame")
                                vu208.Name = "ValueFrame"
                                vu208.Parent = v202
                                vu208.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                                vu208.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                                vu208.Size = UDim2.new(0, 190, 0, 5)
                                vu208.BackgroundTransparency = 0
                                vu208.BorderSizePixel = 0
                                vu208.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu208.Position = UDim2.new(0.5, 0, 0.8, 0)
                                vu208.ClipsDescendants = false
                                local v209 = Instance.new("Frame")
                                v209.Name = "PartValue"
                                v209.Parent = vu208
                                v209.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
                                v209.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                                v209.Size = UDim2.new(0, 190, 0, 5)
                                v209.BackgroundTransparency = 1
                                v209.BorderSizePixel = 0
                                v209.AnchorPoint = Vector2.new(0.5, 0.5)
                                v209.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v209.ClipsDescendants = false
                                local vu210 = Instance.new("Frame")
                                vu210.Name = "MainValue"
                                vu210.Parent = v209
                                vu210.BackgroundColor3 = _G.ColorMethod
                                vu210.Size = UDim2.new((pu143 or 0) / pu142, 0, 0, 5)
                                vu210.BackgroundTransparency = 0
                                vu210.BorderSizePixel = 0
                                vu210.Position = UDim2.new(0, 0, 0, 0)
                                vu210.ClipsDescendants = false
                                local v211 = Instance.new("UICorner")
                                v211.CornerRadius = UDim.new(0, 8)
                                v211.Name = ""
                                v211.Parent = vu210
                                local v212 = Instance.new("UICorner")
                                v212.CornerRadius = UDim.new(0, 8)
                                v212.Name = ""
                                v212.Parent = vu208
                                local vu213 = Instance.new("Frame")
                                vu213.Name = "ConneValue"
                                vu213.Parent = v209
                                vu213.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                vu213.Size = UDim2.new(0, 13, 0, 13)
                                vu213.BackgroundTransparency = 0
                                vu213.BorderSizePixel = 0
                                vu213.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu213.Position = UDim2.new((pu143 or 0) / pu142, 0.5, 0.3, 0.5, 0)
                                vu213.ClipsDescendants = false
                                local v214 = Instance.new("UICorner")
                                v214.CornerRadius = UDim.new(0, 300)
                                v214.Name = ""
                                v214.Parent = vu213
                                local v215 = Instance.new("ImageButton")
                                v215.Name = "Imatog"
                                v215.Parent = v202
                                v215.BackgroundTransparency = 1
                                v215.BorderSizePixel = 0
                                v215.Position = UDim2.new(0.85, 0, 0.35, 0)
                                v215.Size = UDim2.new(0, 15, 0, 15)
                                v215.Image = "http://www.roblox.com/asset/?id=6035067836"
                                v215.ImageColor3 = _G.ColorMethod
                                local v216 = Instance.new("ImageButton")
                                v216.Name = "Imatog"
                                v216.Parent = v202
                                v216.BackgroundTransparency = 1
                                v216.BorderSizePixel = 0
                                v216.Position = UDim2.new(0.7, 0, 0.35, 0)
                                v216.Size = UDim2.new(0, 15, 0, 15)
                                v216.Image = "http://www.roblox.com/asset/?id=6035047377"
                                v216.ImageColor3 = _G.ColorMethod
                                local function vu221(p217)
									-- upvalues: (ref) vu208, (ref) vu210, (ref) vu213, (ref) pu140, (ref) pu142, (ref) pu141, (ref) vu207, (ref) pu146
                                    local v218 = UDim2.new(math.clamp((p217.Position.X - vu208.AbsolutePosition.X) / vu208.AbsoluteSize.X, 0, 1), 0, 0.3, 0)
                                    vu210:TweenSize(UDim2.new(math.clamp((p217.Position.X - vu208.AbsolutePosition.X) / vu208.AbsoluteSize.X, 0, 1), 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu213:TweenPosition(v218, "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v219 = math.floor(v218.X.Scale * pu142 / pu142 * (pu142 - pu141) + pu141)
                                        vu207.Text = tostring(v219)
                                        pu146(v219)
                                    else
                                        local v220 = string.format("%.1f", v218.X.Scale * pu142 / pu142 * (pu142 - pu141) + pu141)
                                        vu207.Text = tostring(v220)
                                        pu146(v220)
                                    end
                                end
                                local vu222 = false
                                vu213.InputBegan:Connect(function(p223)
									-- upvalues: (ref) vu222
                                    if p223.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu222 = true
                                    end
                                end)
                                vu213.InputEnded:Connect(function(p224)
									-- upvalues: (ref) vu222
                                    if p224.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu222 = false
                                    end
                                end)
                                v202.InputBegan:Connect(function(p225)
									-- upvalues: (ref) vu222
                                    if p225.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu222 = true
                                    end
                                end)
                                v202.InputEnded:Connect(function(p226)
									-- upvalues: (ref) vu222
                                    if p226.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu222 = false
                                    end
                                end)
                                vu208.InputBegan:Connect(function(p227)
									-- upvalues: (ref) vu222
                                    if p227.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu222 = true
                                    end
                                end)
                                vu208.InputEnded:Connect(function(p228)
									-- upvalues: (ref) vu222
                                    if p228.UserInputType == Enum.UserInputType.MouseButton1 then
                                        vu222 = false
                                    end
                                end)
                                game:GetService("UserInputService").InputChanged:Connect(function(p229)
									-- upvalues: (ref) vu222, (ref) vu221
                                    if vu222 and p229.UserInputType == Enum.UserInputType.MouseMovement then
                                        vu221(p229)
                                    end
                                end)
                                vu207.FocusLost:Connect(function()
									-- upvalues: (ref) vu207, (ref) pu143, (ref) pu142, (ref) vu210, (ref) vu213, (ref) pu140, (ref) pu141, (ref) pu146
                                    if vu207.Text == "" then
                                        vu207.Text = pu143
                                    end
                                    if pu142 < tonumber(vu207.Text) then
                                        vu207.Text = pu142
                                    end
                                    vu210:TweenSize(UDim2.new((vu207.Text or 0) / pu142, 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu213:TweenPosition(UDim2.new((vu207.Text or 0) / pu142, 0, 0, 0), "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v230 = vu207
                                        local v231 = tostring
                                        local v232 = vu207.Text
                                        if v232 then
                                            v232 = math.floor(vu207.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v230.Text = v231(v232)
                                    else
                                        local v233 = vu207
                                        local v234 = tostring
                                        local v235 = vu207.Text
                                        if v235 then
                                            v235 = string.format("%.1f", vu207.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v233.Text = v234(v235)
                                    end
                                    pcall(pu146, vu207.Text)
                                end)
                                v215.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu207, (ref) pu143, (ref) pu144, (ref) pu142, (ref) pu141, (ref) vu210, (ref) vu213, (ref) pu140, (ref) pu146
                                    if vu207.Text == "" then
                                        vu207.Text = pu143
                                    end
                                    vu207.Text = vu207.Text - tonumber(pu144)
                                    if pu142 < tonumber(vu207.Text) then
                                        vu207.Text = pu142
                                    end
                                    if tonumber(vu207.Text) < pu141 then
                                        vu207.Text = pu141
                                    end
                                    vu210:TweenSize(UDim2.new((vu207.Text or 0) / pu142, 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu213:TweenPosition(UDim2.new((vu207.Text or 0) / pu142, 0, 0.5, 0), "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v236 = vu207
                                        local v237 = tostring
                                        local v238 = vu207.Text
                                        if v238 then
                                            v238 = math.floor(vu207.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v236.Text = v237(v238)
                                    else
                                        local v239 = vu207
                                        local v240 = tostring
                                        local v241 = vu207.Text
                                        if v241 then
                                            v241 = string.format("%.1f", vu207.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v239.Text = v240(v241)
                                    end
                                    pcall(pu146, vu207.Text)
                                end)
                                v216.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu207, (ref) pu143, (ref) pu144, (ref) pu142, (ref) pu141, (ref) vu210, (ref) vu213, (ref) pu140, (ref) pu146
                                    if vu207.Text == "" then
                                        vu207.Text = pu143
                                    end
                                    vu207.Text = vu207.Text + tonumber(pu144)
                                    if pu142 < tonumber(vu207.Text) then
                                        vu207.Text = pu142
                                    end
                                    if tonumber(vu207.Text) < pu141 then
                                        vu207.Text = pu141
                                    end
                                    vu210:TweenSize(UDim2.new((vu207.Text or 0) / pu142, 0, 0, 5), "Out", "Sine", 0.2, true)
                                    vu213:TweenPosition(UDim2.new((vu207.Text or 0) / pu142, 0, 0.5, 0), "Out", "Sine", 0.2, true)
                                    if pu140 ~= true then
                                        local v242 = vu207
                                        local v243 = tostring
                                        local v244 = vu207.Text
                                        if v244 then
                                            v244 = math.floor(vu207.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v242.Text = v243(v244)
                                    else
                                        local v245 = vu207
                                        local v246 = tostring
                                        local v247 = vu207.Text
                                        if v247 then
                                            v247 = string.format("%.1f", vu207.Text / pu142 * (pu142 - pu141) + pu141)
                                        end
                                        v245.Text = v246(v247)
                                    end
                                    pcall(pu146, vu207.Text)
                                end)
                            end
                        end,
                        ["Drop"] = function(p248, pu249, p250, p251, pu252)
							-- upvalues: (ref) vu111, (ref) vu3
                            if p250 == false then
                                local vu253 = Instance.new("Frame")
                                vu253.Name = "DropFrame"
                                vu253.Parent = vu111
                                vu253.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                                vu253.BorderSizePixel = 0
                                vu253.Position = UDim2.new(0.5, 0, 0.5, 0)
                                vu253.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu253.Size = UDim2.new(0, 213, 0, 30)
                                vu253.BackgroundTransparency = 0
                                vu253.ClipsDescendants = true
                                local v254 = Instance.new("UICorner")
                                v254.CornerRadius = UDim.new(0, 4)
                                v254.Name = ""
                                v254.Parent = vu253
                                local vu255 = Instance.new("UIStroke")
                                vu255.Thickness = 1
                                vu255.Name = ""
                                vu255.Parent = vu253
                                vu255.LineJoinMode = Enum.LineJoinMode.Round
                                vu255.Color = _G.ColorMethod
                                vu255.Transparency = 0.7
                                local v256 = Instance.new("TextLabel")
                                v256.Parent = vu253
                                v256.Name = "LabelFrameDrop"
                                v256.BackgroundColor3 = _G.ColorMethod
                                v256.Position = UDim2.new(0, 0, 0, 0)
                                v256.Size = UDim2.new(0, 213, 0, 30)
                                v256.Font = Enum.Font.SourceSansSemibold
                                v256.Text = ""
                                v256.TextColor3 = Color3.fromRGB(155, 155, 155)
                                v256.TextSize = 14
                                v256.BackgroundTransparency = 1
                                v256.TextXAlignment = Enum.TextXAlignment.Left
                                local vu257 = Instance.new("TextLabel")
                                vu257.Parent = v256
                                vu257.Name = "TextLabel_TapDrop"
                                vu257.BackgroundColor3 = _G.ColorMethod
                                vu257.Position = UDim2.new(0.04, 0, 0.14, 0)
                                vu257.Size = UDim2.new(0, 140, 0, 20)
                                vu257.Font = Enum.Font.SourceSansSemibold
                                vu257.Text = tostring(pu249) .. " :"
                                vu257.TextColor3 = Color3.fromRGB(155, 155, 155)
                                vu257.TextSize = 14
                                vu257.BackgroundTransparency = 1
                                vu257.TextXAlignment = Enum.TextXAlignment.Left
                                local vu258 = Instance.new("ImageButton")
                                vu258.Parent = v256
                                vu258.BackgroundTransparency = 1
                                vu258.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu258.Position = UDim2.new(0.9, 0, 0.5, 0)
                                vu258.BorderSizePixel = 0
                                vu258.Size = UDim2.new(0, 25, 0, 25)
                                vu258.Image = "http://www.roblox.com/asset/?id=6031091004"
                                vu258.ImageColor3 = Color3.fromRGB(155, 155, 155)
                                local vu259 = Instance.new("ScrollingFrame")
                                vu259.Name = "ScolDown"
                                vu259.Position = UDim2.new(0.02, 0, 1, 0)
                                vu259.Parent = v256
                                vu259.Active = true
                                vu259.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                vu259.BorderSizePixel = 0
                                vu259.Size = UDim2.new(0, 205, 0, 115)
                                vu259.ScrollBarThickness = 3
                                vu259.ClipsDescendants = true
                                vu259.BackgroundTransparency = 1
                                vu259.CanvasSize = UDim2.new(0, 0, 0, 2)
                                local vu260 = Instance.new("UIListLayout")
                                local v261 = Instance.new("UIPadding")
                                vu260.Name = "UIListLayoutlist"
                                vu260.Parent = vu259
                                vu260.SortOrder = Enum.SortOrder.LayoutOrder
                                vu260.Padding = UDim.new(0, 5)
                                v261.Name = "UIPaddinglist"
                                v261.Parent = vu259
                                v261.PaddingTop = UDim.new(0, 5)
                                v261.PaddingLeft = UDim.new(0, 12)
                                local v262 = Instance.new("TextButton")
                                v262.Parent = vu253
                                v262.Name = "ButtonDrop"
                                v262.BackgroundColor3 = _G.ColorMethod
                                v262.Size = UDim2.new(0, 213, 0, 30)
                                v262.Font = Enum.Font.SourceSansSemibold
                                v262.Text = ""
                                v262.TextColor3 = Color3.fromRGB(155, 155, 155)
                                v262.TextSize = 13
                                v262.Position = UDim2.new(0, 0, 0, 0)
                                v262.TextXAlignment = Enum.TextXAlignment.Center
                                v262.BackgroundTransparency = 1
                                v262.TextWrapped = true
                                v262.AutoButtonColor = false
                                v262.ClipsDescendants = true
                                local v263, v264, v265 = pairs(p251)
                                local v266 = 0
                                local vu267 = false
                                local vu268 = 75
                                while true do
                                    local v269, vu270 = v263(v264, v265)
                                    if v269 == nil then
                                        break
                                    end
                                    v265 = v269
                                    v266 = v266 + 1
                                    vu268 = v266 == 1 and 75 or (v266 == 2 and 110 or (v266 >= 3 and 150 or vu268))
                                    local v271 = Instance.new("Frame")
                                    v271.Name = "ListFrame"
                                    v271.Parent = vu259
                                    v271.BackgroundColor3 = Color3.fromRGB(22553, 23, 23)
                                    v271.BorderSizePixel = 0
                                    v271.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    v271.AnchorPoint = Vector2.new(0.5, 0.5)
                                    v271.Size = UDim2.new(0, 180, 0, 30)
                                    v271.BackgroundTransparency = 1
                                    v271.ClipsDescendants = true
                                    local vu272 = Instance.new("TextLabel")
                                    vu272.Parent = v271
                                    vu272.Name = tostring(vu270) .. "Dropdown"
                                    vu272.BackgroundColor3 = _G.ColorMethod
                                    vu272.Position = UDim2.new(0.5, 0, 0.5, 0)
                                    vu272.Size = UDim2.new(0, 180, 0, 30)
                                    vu272.Font = Enum.Font.SourceSansSemibold
                                    vu272.Text = tostring(vu270)
                                    vu272.TextColor3 = Color3.fromRGB(155, 155, 155)
                                    vu272.TextSize = 14
                                    vu272.AnchorPoint = Vector2.new(0.5, 0.5)
                                    vu272.BackgroundTransparency = 1
                                    vu272.TextXAlignment = Enum.TextXAlignment.Center
                                    local v273 = Instance.new("TextButton")
                                    v273.Parent = v271
                                    v273.Name = "ButtonDrop2"
                                    v273.BackgroundColor3 = _G.ColorMethod
                                    v273.Size = UDim2.new(0, 213, 0, 30)
                                    v273.Font = Enum.Font.SourceSansSemibold
                                    v273.Text = ""
                                    v273.TextColor3 = Color3.fromRGB(155, 155, 155)
                                    v273.TextSize = 13
                                    v273.Position = UDim2.new(0, 0, 0, 0)
                                    v273.TextXAlignment = Enum.TextXAlignment.Center
                                    v273.BackgroundTransparency = 1
                                    v273.TextWrapped = true
                                    v273.AutoButtonColor = false
                                    v273.ClipsDescendants = true
                                    v273.MouseEnter:Connect(function()
										-- upvalues: (ref) vu3, (ref) vu272
                                        vu3:Create(vu272, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                        }):Play()
                                    end)
                                    v273.MouseLeave:Connect(function()
										-- upvalues: (ref) vu3, (ref) vu272
                                        vu3:Create(vu272, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                        }):Play()
                                    end)
                                    v273.MouseButton1Click:Connect(function()
										-- upvalues: (ref) vu3, (ref) vu253, (ref) vu258, (ref) vu257, (ref) pu249, (ref) vu270, (ref) pu252, (ref) vu267
                                        vu3:Create(vu253, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["Size"] = UDim2.new(0, 213, 0, 30)
                                        }):Play()
                                        vu3:Create(vu258, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                            ["Rotation"] = 0
                                        }):Play()
                                        vu257.Text = pu249 .. " : " .. tostring(vu270)
                                        pu252(vu270)
                                        vu267 = not vu267
                                    end)
                                    vu259.CanvasSize = UDim2.new(0, 0, 0, vu260.AbsoluteContentSize.Y + 10)
                                end
                                vu253.MouseEnter:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu255, (ref) vu257, (ref) vu258
                                    vu3:Create(vu255, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0
                                    }):Play()
                                    vu3:Create(vu257, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                    }):Play()
                                    vu3:Create(vu258, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
                                    }):Play()
                                end)
                                vu253.MouseLeave:Connect(function()
									-- upvalues: (ref) vu3, (ref) vu255, (ref) vu257, (ref) vu258
                                    vu3:Create(vu255, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0.7
                                    }):Play()
                                    vu3:Create(vu257, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                    }):Play()
                                    vu3:Create(vu258, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["ImageColor3"] = Color3.fromRGB(155, 155, 155)
                                    }):Play()
                                end)
                                v262.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu267, (ref) vu3, (ref) vu253, (ref) vu268, (ref) vu258, (ref) vu259, (ref) vu260
                                    if vu267 ~= false then
                                        vu3:Create(vu253, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["Size"] = UDim2.new(0, 213, 0, 30)
                                        }):Play()
                                        vu3:Create(vu258, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                            ["Rotation"] = 0
                                        }):Play()
                                        vu259.CanvasSize = UDim2.new(0, 0, 0, vu260.AbsoluteContentSize.Y + 10)
                                    else
                                        vu3:Create(vu253, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            ["Size"] = UDim2.new(0, 213, 0, vu268)
                                        }):Play()
                                        vu3:Create(vu258, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                            ["Rotation"] = - 180
                                        }):Play()
                                        vu259.CanvasSize = UDim2.new(0, 0, 0, vu260.AbsoluteContentSize.Y + 10)
                                    end
                                    vu267 = not vu267
                                end)
                                vu259.CanvasSize = UDim2.new(0, 0, 0, vu260.AbsoluteContentSize.Y + 10)
                                return {
                                    ["Clear"] = function(_)
										-- upvalues: (ref) vu257, (ref) pu249, (ref) vu259, (ref) vu260
                                        vu257.Text = tostring(pu249) .. " :"
                                        local v274 = next
                                        local v275, v276 = vu259:GetChildren()
                                        while true do
                                            local v277
                                            v276, v277 = v274(v275, v276)
                                            if v276 == nil then
                                                break
                                            end
                                            if v277:IsA("Frame") then
                                                v277:Destroy()
                                            end
                                        end
                                        vu259.CanvasSize = UDim2.new(0, 0, 0, vu260.AbsoluteContentSize.Y + 10)
                                    end,
                                    ["Add"] = function(_, pu278)
										-- upvalues: (ref) vu259, (ref) vu3, (ref) vu253, (ref) vu258, (ref) vu257, (ref) pu249, (ref) pu252, (ref) vu267, (ref) vu260
                                        local v279 = Instance.new("Frame")
                                        v279.Name = "ListFrame"
                                        v279.Parent = vu259
                                        v279.BackgroundColor3 = Color3.fromRGB(22553, 23, 23)
                                        v279.BorderSizePixel = 0
                                        v279.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        v279.AnchorPoint = Vector2.new(0.5, 0.5)
                                        v279.Size = UDim2.new(0, 180, 0, 30)
                                        v279.BackgroundTransparency = 1
                                        v279.ClipsDescendants = true
                                        local vu280 = Instance.new("TextLabel")
                                        vu280.Parent = v279
                                        vu280.Name = tostring(pu278) .. "Dropdown"
                                        vu280.BackgroundColor3 = _G.ColorMethod
                                        vu280.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        vu280.Size = UDim2.new(0, 180, 0, 30)
                                        vu280.Font = Enum.Font.SourceSansSemibold
                                        vu280.Text = tostring(pu278)
                                        vu280.TextColor3 = Color3.fromRGB(155, 155, 155)
                                        vu280.TextSize = 14
                                        vu280.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu280.BackgroundTransparency = 1
                                        vu280.TextXAlignment = Enum.TextXAlignment.Center
                                        local v281 = Instance.new("TextButton")
                                        v281.Parent = v279
                                        v281.Name = "ButtonDrop2"
                                        v281.BackgroundColor3 = _G.ColorMethod
                                        v281.Size = UDim2.new(0, 213, 0, 30)
                                        v281.Font = Enum.Font.SourceSansSemibold
                                        v281.Text = ""
                                        v281.TextColor3 = Color3.fromRGB(155, 155, 155)
                                        v281.TextSize = 13
                                        v281.Position = UDim2.new(0, 0, 0, 0)
                                        v281.TextXAlignment = Enum.TextXAlignment.Center
                                        v281.BackgroundTransparency = 1
                                        v281.TextWrapped = true
                                        v281.AutoButtonColor = false
                                        v281.ClipsDescendants = true
                                        v281.MouseEnter:Connect(function()
											-- upvalues: (ref) vu3, (ref) vu280
                                            vu3:Create(vu280, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                            }):Play()
                                        end)
                                        v281.MouseLeave:Connect(function()
											-- upvalues: (ref) vu3, (ref) vu280
                                            vu3:Create(vu280, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                            }):Play()
                                        end)
                                        v281.MouseButton1Click:Connect(function()
											-- upvalues: (ref) vu3, (ref) vu253, (ref) vu258, (ref) vu257, (ref) pu249, (ref) pu278, (ref) pu252, (ref) vu267
                                            vu3:Create(vu253, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                ["Size"] = UDim2.new(0, 213, 0, 30)
                                            }):Play()
                                            vu3:Create(vu258, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                                ["Rotation"] = 0
                                            }):Play()
                                            vu257.Text = pu249 .. " : " .. tostring(pu278)
                                            pu252(pu278)
                                            vu267 = not vu267
                                        end)
                                        vu259.CanvasSize = UDim2.new(0, 0, 0, vu260.AbsoluteContentSize.Y + 10)
                                    end
                                }
                            end
                            local vu282 = p251.location or p248.flags
                            local v283 = p250 and "" or (p251.flag or "")
                            local vu284 = pu252 or function()
                            end
                            local v285 = p251.list or {}
                            local v286 = v285.default or v285[1].Name
                            if not p250 then
                                vu282[v283] = v286
                            end
                            local vu287 = Instance.new("Frame")
                            vu287.Name = "DropFrame"
                            vu287.Parent = vu111
                            vu287.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                            vu287.BorderSizePixel = 0
                            vu287.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu287.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu287.Size = UDim2.new(0, 213, 0, 30)
                            vu287.BackgroundTransparency = 0
                            vu287.ClipsDescendants = true
                            local v288 = Instance.new("UICorner")
                            v288.CornerRadius = UDim.new(0, 4)
                            v288.Name = ""
                            v288.Parent = vu287
                            local vu289 = Instance.new("UIStroke")
                            vu289.Thickness = 1
                            vu289.Name = ""
                            vu289.Parent = vu287
                            vu289.LineJoinMode = Enum.LineJoinMode.Round
                            vu289.Color = _G.ColorMethod
                            vu289.Transparency = 0.7
                            local v290 = Instance.new("TextLabel")
                            v290.Parent = vu287
                            v290.Name = "LabelFrameDrop"
                            v290.BackgroundColor3 = _G.ColorMethod
                            v290.Position = UDim2.new(0, 0, 0, 0)
                            v290.Size = UDim2.new(0, 213, 0, 30)
                            v290.Font = Enum.Font.SourceSansSemibold
                            v290.Text = ""
                            v290.TextColor3 = Color3.fromRGB(155, 155, 155)
                            v290.TextSize = 14
                            v290.BackgroundTransparency = 1
                            v290.TextXAlignment = Enum.TextXAlignment.Left
                            local vu291 = Instance.new("TextLabel")
                            vu291.Parent = v290
                            vu291.Name = "TextLabel_TapDrop"
                            vu291.BackgroundColor3 = _G.ColorMethod
                            vu291.Position = UDim2.new(0.04, 0, 0.14, 0)
                            vu291.Size = UDim2.new(0, 140, 0, 20)
                            vu291.Font = Enum.Font.SourceSansSemibold
                            vu291.Text = tostring(pu249) .. " :"
                            vu291.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu291.TextSize = 14
                            vu291.BackgroundTransparency = 1
                            vu291.TextXAlignment = Enum.TextXAlignment.Left
                            local vu292 = Instance.new("ImageButton")
                            vu292.Parent = v290
                            vu292.BackgroundTransparency = 1
                            vu292.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu292.Position = UDim2.new(0.9, 0, 0.5, 0)
                            vu292.BorderSizePixel = 0
                            vu292.Size = UDim2.new(0, 25, 0, 25)
                            vu292.Image = "http://www.roblox.com/asset/?id=6031091004"
                            vu292.ImageColor3 = Color3.fromRGB(155, 155, 155)
                            local vu293 = Instance.new("ScrollingFrame")
                            vu293.Name = "ScolDown"
                            vu293.Position = UDim2.new(0.02, 0, 1, 0)
                            vu293.Parent = v290
                            vu293.Active = true
                            vu293.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu293.BorderSizePixel = 0
                            vu293.Size = UDim2.new(0, 205, 0, 115)
                            vu293.ScrollBarThickness = 3
                            vu293.ClipsDescendants = true
                            vu293.BackgroundTransparency = 1
                            vu293.CanvasSize = UDim2.new(0, 0, 0, 2)
                            local vu294 = Instance.new("UIListLayout")
                            local v295 = Instance.new("UIPadding")
                            vu294.Name = "UIListLayoutlist"
                            vu294.Parent = vu293
                            vu294.SortOrder = Enum.SortOrder.LayoutOrder
                            vu294.Padding = UDim.new(0, 5)
                            v295.Name = "UIPaddinglist"
                            v295.Parent = vu293
                            v295.PaddingTop = UDim.new(0, 5)
                            v295.PaddingLeft = UDim.new(0, 12)
                            local v296 = Instance.new("TextButton")
                            v296.Parent = vu287
                            v296.Name = "ButtonDrop"
                            v296.BackgroundColor3 = _G.ColorMethod
                            v296.Size = UDim2.new(0, 213, 0, 30)
                            v296.Font = Enum.Font.SourceSansSemibold
                            v296.Text = ""
                            v296.TextColor3 = Color3.fromRGB(155, 155, 155)
                            v296.TextSize = 13
                            v296.Position = UDim2.new(0, 0, 0, 0)
                            v296.TextXAlignment = Enum.TextXAlignment.Center
                            v296.BackgroundTransparency = 1
                            v296.TextWrapped = true
                            v296.AutoButtonColor = false
                            v296.ClipsDescendants = true
                            local v297, v298, v299 = pairs(v285)
                            local v300 = 0
                            local vu301 = false
                            local vu302 = 75
                            while true do
                                local vu303
                                v299, vu303 = v297(v298, v299)
                                if v299 == nil then
                                    break
                                end
                                v300 = v300 + 1
                                vu302 = v300 == 1 and 75 or (v300 == 2 and 110 or (v300 >= 3 and 150 or vu302))
                                local v304 = Instance.new("Frame")
                                v304.Name = "listtog"
                                v304.Parent = vu293
                                v304.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                                v304.BackgroundTransparency = 1
                                v304.BorderSizePixel = 0
                                v304.ClipsDescendants = true
                                v304.AnchorPoint = Vector2.new(0.5, 0.5)
                                v304.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v304.Size = UDim2.new(0, 210, 0, 33)
                                local v305 = Instance.new("TextButton")
                                v305.Parent = v304
                                v305.BackgroundTransparency = 1
                                v305.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                                v305.BorderSizePixel = 0
                                v305.Size = UDim2.new(0, 210, 0, 33)
                                v305.AutoButtonColor = false
                                v305.Font = Enum.Font.SourceSans
                                v305.Text = " "
                                v305.TextColor3 = Color3.fromRGB(0, 0, 0)
                                v305.TextSize = 14
                                local v306 = Instance.new("TextButton")
                                v306.Parent = v305
                                v306.BackgroundColor3 = _G.ColorMethod
                                v306.BorderColor3 = _G.ColorMethod
                                v306.BorderSizePixel = 0
                                v306.AnchorPoint = Vector2.new(0.5, 0.5)
                                v306.Position = UDim2.new(0.1, 0, 0.5, 0)
                                v306.Size = UDim2.new(0, 23, 0, 23)
                                v306.Font = Enum.Font.SourceSans
                                v306.Text = " "
                                v306.TextColor3 = Color3.fromRGB(0, 0, 0)
                                v306.TextSize = 14
                                v306.AutoButtonColor = false
                                local v307 = Instance.new("TextButton")
                                v307.Parent = v306
                                v307.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                                v307.BorderColor3 = _G.ColorMethod
                                v307.BorderSizePixel = 0
                                v307.AnchorPoint = Vector2.new(0.5, 0.5)
                                v307.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v307.Size = UDim2.new(0, 21, 0, 21)
                                v307.Font = Enum.Font.SourceSans
                                v307.Text = " "
                                v307.TextColor3 = Color3.fromRGB(0, 0, 0)
                                v307.TextSize = 14
                                v307.AutoButtonColor = false
                                local vu308 = Instance.new("ImageButton")
                                vu308.Parent = v307
                                vu308.BackgroundTransparency = 1
                                vu308.AnchorPoint = Vector2.new(0.5, 0.5)
                                vu308.Position = UDim2.new(0.5, 0, 0.5, 0)
                                vu308.BorderSizePixel = 0
                                vu308.Size = UDim2.new(0, 0, 0, 0)
                                vu308.Image = "http://www.roblox.com/asset/?id=5880482965"
                                local v309 = Instance.new("TextLabel")
                                v309.Parent = v305
                                v309.Name = "textlist"
                                v309.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v309.BackgroundTransparency = 1
                                v309.AnchorPoint = Vector2.new(0.5, 0.5)
                                v309.Position = UDim2.new(0.5, 0, 0.5, 0)
                                v309.BorderSizePixel = 0
                                v309.Size = UDim2.new(0, 91, 0, 25)
                                v309.Font = Enum.Font.GothamSemibold
                                v309.Text = tostring(vu303.Name)
                                v309.TextColor3 = Color3.fromRGB(255, 255, 255)
                                v309.TextSize = 13
                                local v310 = Instance.new("UICorner")
                                v310.CornerRadius = UDim.new(0, 5)
                                v310.Name = ""
                                v310.Parent = v306
                                local v311 = Instance.new("UICorner")
                                v311.CornerRadius = UDim.new(0, 5)
                                v311.Name = ""
                                v311.Parent = v307
                                v305.MouseButton1Click:Connect(function()
									-- upvalues: (ref) vu282, (ref) vu303, (ref) vu308, (ref) vu284
                                    if vu282[vu303.flag] then
                                        vu308:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                                        wait(0.1)
                                        vu308:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                                    else
                                        vu308:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                                        wait(0.1)
                                        vu308:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                                    end
                                    vu282[vu303.flag] = not vu282[vu303.flag]
                                    vu284(vu282[vu303.flag])
                                end)
                                if vu282[vu303.flag] then
                                    local v312 = vu308
                                    vu308.TweenSizeAndPosition(v312, UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                                    wait(0.1)
                                    local v313 = vu308
                                    vu308.TweenSizeAndPosition(v313, UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                                    vu284(vu282[vu303.flag])
                                end
                                vu293.CanvasSize = UDim2.new(0, 0, 0, vu294.AbsoluteContentSize.Y + 10)
                            end
                            vu287.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu289, (ref) vu291, (ref) vu292
                                vu3:Create(vu289, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0
                                }):Play()
                                vu3:Create(vu291, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                vu3:Create(vu292, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                            end)
                            vu287.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu289, (ref) vu291, (ref) vu292
                                vu3:Create(vu289, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0.7
                                }):Play()
                                vu3:Create(vu291, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                                vu3:Create(vu292, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["ImageColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                            end)
                            v296.MouseButton1Click:Connect(function()
								-- upvalues: (ref) vu301, (ref) vu3, (ref) vu287, (ref) vu302, (ref) vu292, (ref) vu293, (ref) vu294
                                if vu301 ~= false then
                                    vu3:Create(vu287, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Size"] = UDim2.new(0, 213, 0, 30)
                                    }):Play()
                                    vu3:Create(vu292, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["Rotation"] = 0
                                    }):Play()
                                    vu293.CanvasSize = UDim2.new(0, 0, 0, vu294.AbsoluteContentSize.Y + 10)
                                else
                                    vu3:Create(vu287, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Size"] = UDim2.new(0, 213, 0, vu302)
                                    }):Play()
                                    vu3:Create(vu292, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["Rotation"] = - 180
                                    }):Play()
                                    vu293.CanvasSize = UDim2.new(0, 0, 0, vu294.AbsoluteContentSize.Y + 10)
                                end
                                vu301 = not vu301
                            end)
                            vu293.CanvasSize = UDim2.new(0, 0, 0, vu294.AbsoluteContentSize.Y + 10)
                        end,
                        ["TextBox"] = function(_, p314, p315, pu316)
							-- upvalues: (ref) vu111, (ref) vu3
                            local v317 = Instance.new("Frame")
                            v317.Name = "TextFrame"
                            v317.Parent = vu111
                            v317.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                            v317.BorderSizePixel = 0
                            v317.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v317.AnchorPoint = Vector2.new(0.5, 0.5)
                            v317.Size = UDim2.new(0, 213, 0, 70)
                            v317.BackgroundTransparency = 1
                            v317.ClipsDescendants = true
                            local vu318 = Instance.new("TextLabel")
                            vu318.Parent = v317
                            vu318.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu318.BackgroundTransparency = 1
                            vu318.BorderSizePixel = 0
                            vu318.Position = UDim2.new(0.5, 0, 0.2, 0)
                            vu318.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu318.Size = UDim2.new(0, 160, 0, 20)
                            vu318.Font = Enum.Font.GothamBold
                            vu318.Text = tostring(p314)
                            vu318.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu318.TextSize = 11
                            vu318.TextXAlignment = Enum.TextXAlignment.Center
                            local v319 = Instance.new("UICorner")
                            v319.CornerRadius = UDim.new(0, 4)
                            v319.Name = ""
                            v319.Parent = v317
                            local vu320 = Instance.new("Frame")
                            vu320.Name = "TextFrame"
                            vu320.Parent = v317
                            vu320.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                            vu320.BorderSizePixel = 0
                            vu320.Position = UDim2.new(0.5, 0, 0.65, 0)
                            vu320.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu320.Size = UDim2.new(0, 158, 0, 30)
                            vu320.BackgroundTransparency = 0.2
                            vu320.ClipsDescendants = true
                            vu320.AnchorPoint = Vector2.new(0.5, 0.5)
                            local vu321 = Instance.new("TextBox")
                            vu321.Parent = vu320
                            vu321.BackgroundColor3 = _G.ColorMethod
                            vu321.BorderSizePixel = 0
                            vu321.ClipsDescendants = true
                            vu321.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu321.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu321.Size = UDim2.new(0, 158, 0, 35)
                            vu321.Font = Enum.Font.GothamSemibold
                            vu321.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
                            vu321.PlaceholderText = p315
                            vu321.Text = ""
                            vu321.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu321.TextSize = 12
                            vu321.BackgroundTransparency = 1
                            local v322 = Instance.new("UICorner")
                            v322.CornerRadius = UDim.new(0, 4)
                            v322.Name = ""
                            v322.Parent = vu320
                            local vu323 = Instance.new("UIStroke")
                            vu323.Thickness = 1
                            vu323.Name = ""
                            vu323.Parent = vu320
                            vu323.LineJoinMode = Enum.LineJoinMode.Round
                            vu323.Color = _G.ColorMethod
                            vu323.Transparency = 0.7
                            v317.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu320, (ref) vu321, (ref) vu318, (ref) vu323
                                vu3:Create(vu320, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Size"] = UDim2.new(0, 213, 0, 30)
                                }):Play()
                                vu3:Create(vu320, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundColor3"] = _G.ColorMethod
                                }):Play()
                                vu3:Create(vu321, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                vu3:Create(vu321, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                vu3:Create(vu318, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                vu3:Create(vu323, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Thickness"] = 0
                                }):Play()
                            end)
                            v317.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu320, (ref) vu321, (ref) vu323, (ref) vu318
                                vu3:Create(vu320, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Size"] = UDim2.new(0, 158, 0, 30)
                                }):Play()
                                vu3:Create(vu320, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundColor3"] = Color3.fromRGB(23, 23, 23)
                                }):Play()
                                vu3:Create(vu321, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["PlaceholderColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                                vu3:Create(vu323, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Thickness"] = 1
                                }):Play()
                                vu3:Create(vu318, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                                vu3:Create(vu321, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                            end)
                            vu321.FocusLost:Connect(function()
								-- upvalues: (ref) vu321, (ref) pu316
                                if # vu321.Text > 0 then
                                    pcall(pu316, vu321.Text)
                                end
                            end)
                        end,
                        ["Bind"] = function(_, p324, p325, pu326)
							-- upvalues: (ref) vu111, (ref) vu3
                            local v327 = Instance.new("Frame")
                            v327.Name = "BindFrame"
                            v327.Parent = vu111
                            v327.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                            v327.BorderSizePixel = 0
                            v327.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v327.AnchorPoint = Vector2.new(0.5, 0.5)
                            v327.Size = UDim2.new(0, 213, 0, 35)
                            v327.BackgroundTransparency = 0
                            v327.ClipsDescendants = true
                            local v328 = Instance.new("UICorner")
                            v328.CornerRadius = UDim.new(0, 4)
                            v328.Name = ""
                            v328.Parent = v327
                            local vu329 = Instance.new("UIStroke")
                            vu329.Thickness = 1
                            vu329.Name = ""
                            vu329.Parent = v327
                            vu329.LineJoinMode = Enum.LineJoinMode.Round
                            vu329.Color = _G.ColorMethod
                            vu329.Transparency = 0.7
                            local vu330 = Instance.new("TextLabel")
                            vu330.Parent = v327
                            vu330.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu330.BackgroundTransparency = 1
                            vu330.BorderSizePixel = 0
                            vu330.Position = UDim2.new(0.4, 0, 0.5, 0)
                            vu330.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu330.Size = UDim2.new(0, 140, 0, 35)
                            vu330.Font = Enum.Font.GothamBold
                            vu330.Text = tostring(p324)
                            vu330.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu330.TextSize = 11
                            vu330.TextXAlignment = Enum.TextXAlignment.Left
                            local vu331 = p325.Name
                            local vu332 = Instance.new("TextButton")
                            vu332.Parent = v327
                            vu332.Name = "LabelBind2"
                            vu332.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu332.Size = UDim2.new(0, 100, 0, 19)
                            vu332.Font = Enum.Font.GothamBold
                            vu332.Text = "KEY : " .. vu331
                            vu332.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu332.TextSize = 11
                            vu332.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu332.Position = UDim2.new(0.75, 0, 0.5, 0)
                            vu332.TextXAlignment = Enum.TextXAlignment.Center
                            vu332.BackgroundTransparency = 1
                            vu332.TextWrapped = true
                            local vu333 = Instance.new("TextButton")
                            vu333.Parent = v327
                            vu333.Name = "LabelBind22"
                            vu333.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu333.Size = UDim2.new(0, 213, 0, 35)
                            vu333.Font = Enum.Font.GothamBold
                            vu333.Text = ""
                            vu333.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu333.TextSize = 11
                            vu333.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu333.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu333.TextXAlignment = Enum.TextXAlignment.Center
                            vu333.BackgroundTransparency = 1
                            vu333.TextWrapped = true
                            v327.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu329, (ref) vu333, (ref) vu332, (ref) vu330
                                vu3:Create(vu329, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0
                                }):Play()
                                vu3:Create(vu333, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                vu3:Create(vu332, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                                vu3:Create(vu330, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                            end)
                            v327.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu329, (ref) vu333, (ref) vu332, (ref) vu330
                                vu3:Create(vu329, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0.7
                                }):Play()
                                vu3:Create(vu333, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                                vu3:Create(vu332, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                                vu3:Create(vu330, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                            end)
                            vu333.MouseButton1Click:Connect(function()
								-- upvalues: (ref) vu332, (ref) vu331
                                vu332.Text = "KEY : ..."
                                local v334 = game:GetService("UserInputService").InputBegan:wait()
                                local v335 = v334.KeyCode == Enum.KeyCode.Unknown and v334.UserInputType or v334.KeyCode
                                if v335.Name ~= "Focus" and (v335.Name ~= "MouseMovement" and v335.Name ~= "Focus") then
                                    vu332.Text = "KEY : " .. v335.Name
                                    vu331 = v335.Name
                                end
                            end)
                            game:GetService("UserInputService").InputBegan:connect(function(p336)
								-- upvalues: (ref) vu331, (ref) pu326
                                if (p336.KeyCode == Enum.KeyCode.Unknown and p336.UserInputType or p336.KeyCode).Name == vu331 then
                                    pcall(pu326)
                                end
                            end)
                        end,
                        ["Line"] = function(_)
							-- upvalues: (ref) vu111
                            local v337 = Instance.new("Frame")
                            v337.Name = "LineFrame"
                            v337.Parent = vu111
                            v337.BackgroundColor3 = _G.ColorMethod
                            v337.BorderSizePixel = 0
                            v337.Position = UDim2.new(0.5, 0, 0.5, 0)
                            v337.AnchorPoint = Vector2.new(0.5, 0.5)
                            v337.Size = UDim2.new(0, 213, 0, 1)
                            v337.BackgroundTransparency = 0
                            v337.ClipsDescendants = true
                            local v338 = Instance.new("UICorner")
                            v338.CornerRadius = UDim.new(0, 30)
                            v338.Name = ""
                            v338.Parent = v337
                        end,
                        ["Color"] = function(_, p339, p340, pu341)
							-- upvalues: (ref) vu111, (ref) vu3, (ref) vu7, (ref) vu4, (ref) vu5
                            local vu342 = Instance.new("Frame")
                            vu342.Name = "Pixker"
                            vu342.Parent = vu111
                            vu342.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                            vu342.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
                            vu342.Size = UDim2.new(0, 213, 0, 33)
                            vu342.BackgroundTransparency = 0
                            vu342.BorderSizePixel = 0
                            vu342.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu342.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu342.ClipsDescendants = true
                            local v343 = Instance.new("UICorner")
                            v343.CornerRadius = UDim.new(0, 4)
                            v343.Name = "BoxColorCorner"
                            v343.Parent = vu342
                            local vu344 = Instance.new("UIStroke")
                            vu344.Thickness = 1
                            vu344.Name = ""
                            vu344.Parent = vu342
                            vu344.LineJoinMode = Enum.LineJoinMode.Round
                            vu344.Color = _G.ColorMethod
                            vu344.Transparency = 0.7
                            local v345 = Instance.new("TextLabel")
                            v345.Parent = vu342
                            v345.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v345.BorderSizePixel = 0
                            v345.Size = UDim2.new(0, 200, 0, 34)
                            v345.Font = Enum.Font.SourceSans
                            v345.Text = "  "
                            v345.TextColor3 = Color3.fromRGB(0, 0, 0)
                            v345.TextSize = 14
                            v345.BackgroundTransparency = 1
                            v345.Position = UDim2.new(0, 0, 0, 0)
                            local vu346 = Instance.new("TextLabel")
                            vu346.Parent = v345
                            vu346.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu346.BorderSizePixel = 0
                            vu346.Size = UDim2.new(0, 140, 0, 34)
                            vu346.Font = Enum.Font.GothamSemibold
                            vu346.Text = p339
                            vu346.TextColor3 = Color3.fromRGB(155, 155, 155)
                            vu346.TextSize = 12
                            vu346.BackgroundTransparency = 1
                            vu346.Position = UDim2.new(0.05, 0, 0, 0)
                            vu346.TextXAlignment = Enum.TextXAlignment.Left
                            local vu347 = Instance.new("Frame")
                            vu347.Name = "BoxColor"
                            vu347.Parent = v345
                            vu347.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu347.Position = UDim2.new(0.85, 0, 0.5, 0)
                            vu347.Size = UDim2.new(0, 35, 0, 19)
                            vu347.AnchorPoint = Vector2.new(0.5, 0.5)
                            local v348 = Instance.new("UICorner")
                            v348.CornerRadius = UDim.new(0, 4)
                            v348.Name = "BoxColorCorner"
                            v348.Parent = vu347
                            local v349 = Instance.new("TextButton")
                            v349.Parent = v345
                            v349.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                            v349.BorderSizePixel = 0
                            v349.Position = UDim2.new(0, 0, 0.14705883, 0)
                            v349.Size = UDim2.new(0, 200, 0, 33)
                            v349.Font = Enum.Font.SourceSans
                            v349.Text = "  "
                            v349.TextColor3 = Color3.fromRGB(0, 0, 0)
                            v349.TextSize = 14
                            v349.AutoButtonColor = false
                            v349.Position = UDim2.new(0, 0, 0, 0)
                            v349.BackgroundTransparency = 1
                            vu342.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu344, (ref) vu346
                                vu3:Create(vu344, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0
                                }):Play()
                                vu3:Create(vu346, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                                }):Play()
                            end)
                            vu342.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu344, (ref) vu346
                                vu3:Create(vu344, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0.7
                                }):Play()
                                vu3:Create(vu346, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["TextColor3"] = Color3.fromRGB(155, 155, 155)
                                }):Play()
                            end)
                            local vu350 = Instance.new("TextButton")
                            vu350.Parent = v345
                            vu350.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
                            vu350.BorderSizePixel = 0
                            vu350.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu350.Position = UDim2.new(0.2, 0, 1.87, 0)
                            vu350.Size = UDim2.new(0, 30, 0, 13)
                            vu350.Font = Enum.Font.SourceSans
                            vu350.Text = " "
                            vu350.TextColor3 = Color3.fromRGB(0, 0, 0)
                            vu350.TextSize = 12
                            vu350.AutoButtonColor = false
                            local v351 = Instance.new("UICorner")
                            v351.CornerRadius = UDim.new(0, 30)
                            v351.Name = ""
                            v351.Parent = vu350
                            local vu352 = Instance.new("TextButton")
                            vu352.Parent = vu350
                            vu352.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu352.BorderSizePixel = 0
                            vu352.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu352.Position = UDim2.new(0.1, 0, 0.5, 0)
                            vu352.Size = UDim2.new(0, 19, 0, 19)
                            vu352.Font = Enum.Font.SourceSans
                            vu352.Text = " "
                            vu352.TextColor3 = Color3.fromRGB(0, 0, 0)
                            vu352.TextSize = 12
                            vu352.AutoButtonColor = false
                            local v353 = Instance.new("UICorner")
                            v353.CornerRadius = UDim.new(0, 30)
                            v353.Name = ""
                            v353.Parent = vu352
                            local vu354 = Instance.new("TextButton")
                            vu354.Parent = vu352
                            vu354.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
                            vu354.BorderSizePixel = 0
                            vu354.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu354.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu354.Size = UDim2.new(0, 27, 0, 25)
                            vu354.Font = Enum.Font.SourceSans
                            vu354.Text = " "
                            vu354.TextColor3 = Color3.fromRGB(0, 0, 0)
                            vu354.TextSize = 12
                            vu354.AutoButtonColor = false
                            vu354.BackgroundTransparency = 1
                            vu354.Visible = true
                            local v355 = Instance.new("UICorner")
                            v355.CornerRadius = UDim.new(0, 30)
                            v355.Name = ""
                            v355.Parent = vu354
                            local v356 = Instance.new("TextButton")
                            v356.Parent = ValueFrame
                            v356.BackgroundTransparency = 1
                            v356.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v356.BorderSizePixel = 0
                            v356.Size = UDim2.new(0, 50, 0, 20)
                            v356.AutoButtonColor = false
                            v356.Font = Enum.Font.SourceSans
                            v356.Text = " "
                            v356.TextColor3 = Color3.fromRGB(0, 0, 0)
                            v356.TextSize = 12
                            v356.AnchorPoint = Vector2.new(0.5, 0.5)
                            v356.Position = UDim2.new(1.25, 0, 0.4, 0)
                            local v357 = Instance.new("TextLabel")
                            v357.Parent = vu350
                            v357.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                            v357.BorderColor3 = _G.ColorMethod
                            v357.BorderSizePixel = 0
                            v357.AnchorPoint = Vector2.new(0.5, 0.5)
                            v357.Position = UDim2.new(1.9, 0, 0.5, 0)
                            v357.Size = UDim2.new(0, 500, 0, 21)
                            v357.Font = Enum.Font.SourceSansBold
                            v357.Text = "Rainbow"
                            v357.TextColor3 = Color3.fromRGB(255, 255, 255)
                            v357.TextSize = 13
                            v357.BackgroundTransparency = 1
                            local v358 = Instance.new("TextButton")
                            v358.Parent = vu350
                            v358.BackgroundTransparency = 1
                            v358.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v358.BorderSizePixel = 0
                            v358.Size = UDim2.new(0, 100, 0, 20)
                            v358.AutoButtonColor = false
                            v358.Font = Enum.Font.SourceSans
                            v358.Text = " "
                            v358.TextColor3 = Color3.fromRGB(0, 0, 0)
                            v358.TextSize = 12
                            v358.AnchorPoint = Vector2.new(0.5, 0.5)
                            v358.Position = UDim2.new(1.3, 0, 0.5, 0)
                            local vu359 = Instance.new("ImageLabel")
                            vu359.Name = "Color"
                            vu359.Parent = v345
                            vu359.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                            vu359.Position = UDim2.new(0.05, 0, 4, 0)
                            vu359.Size = UDim2.new(0, 195, 0, 40)
                            vu359.ZIndex = 0
                            vu359.BorderSizePixel = 0
                            vu359.Image = "rbxassetid://4155801252"
                            local v360 = Instance.new("UICorner")
                            v360.CornerRadius = UDim.new(0, 4)
                            v360.Name = ""
                            v360.Parent = vu359
                            local vu361 = Instance.new("ImageLabel")
                            vu361.Name = "ColorSelection"
                            vu361.Parent = vu359
                            vu361.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu361.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu361.BackgroundTransparency = 1
                            local v362 = UDim2.new
                            local v363
                            if p340 then
                                v363 = select(3, Color3.toHSV(p340))
                            else
                                v363 = p340
                            end
                            vu361.Position = v362(v363)
                            vu361.Size = UDim2.new(0, 18, 0, 18)
                            vu361.Image = "http://www.roblox.com/asset/?id=4805639000"
                            vu361.ScaleType = Enum.ScaleType.Fit
                            vu361.Visible = true
                            local vu364 = Instance.new("ImageLabel")
                            vu364.Name = "Hue2"
                            vu364.Parent = v345
                            vu364.Position = UDim2.new(0.14, 0, 3, 0)
                            vu364.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu364.Size = UDim2.new(0, 160, 0, 25)
                            vu364.ZIndex = 0
                            vu364.BorderSizePixel = 0
                            local v365 = Instance.new("UICorner")
                            v365.CornerRadius = UDim.new(0, 4)
                            v365.Name = ""
                            v365.Parent = vu364
                            local v366 = Instance.new("UIGradient")
                            v366.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)),
                                ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255, 0)),
                                ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21, 255, 0)),
                                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
                                ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 17, 255)),
                                ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 251)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4))
                            })
                            v366.Rotation = 0
                            v366.Name = "HueGradient"
                            v366.Parent = vu364
                            local vu367 = Instance.new("ImageLabel")
                            vu367.Name = "HueSelection"
                            vu367.Parent = vu364
                            vu367.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu367.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            vu367.BackgroundTransparency = 1
                            local v368 = UDim2.new
                            local v369
                            if p340 then
                                v369 = select(3, Color3.toHSV(p340))
                            else
                                v369 = p340
                            end
                            vu367.Position = v368(v369)
                            vu367.Size = UDim2.new(0, 18, 0, 18)
                            vu367.Image = "http://www.roblox.com/asset/?id=4805639000"
                            vu367.ScaleType = Enum.ScaleType.Fit
                            vu367.Visible = true
                            local v370 = Instance.new("TextButton")
                            v370.Parent = v345
                            v370.BackgroundColor3 = _G.ColorMethod
                            v370.BorderColor3 = _G.ColorMethod
                            v370.BorderSizePixel = 0
                            v370.AnchorPoint = Vector2.new(0.5, 0.5)
                            v370.Position = UDim2.new(0.8, 0, 1.9, 0)
                            v370.Size = UDim2.new(0, 50, 0, 25)
                            v370.Font = Enum.Font.GothamSemibold
                            v370.Text = "Confirm"
                            v370.TextColor3 = Color3.fromRGB(255, 255, 255)
                            v370.TextSize = 11
                            v370.AutoButtonColor = false
                            local v371 = Instance.new("UICorner")
                            v371.CornerRadius = UDim.new(0, 4)
                            v371.Name = ""
                            v371.Parent = v370
                            local v372 = Instance.new("UIStroke")
                            v372.Thickness = 1
                            v372.Name = ""
                            v372.Parent = v370
                            v372.LineJoinMode = Enum.LineJoinMode.Round
                            v372.Color = _G.ColorMethod
                            v372.Transparency = 0.7
                            local vu373 = false
                            v358.MouseButton1Click:Connect(function()
								-- upvalues: (ref) vu373, (ref) vu3, (ref) vu354, (ref) vu352, (ref) vu350
                                if vu373 ~= false then
                                    vu3:Create(vu354, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = Color3.fromRGB(155, 155, 155)
                                    }):Play()
                                    vu3:Create(vu352, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                                    }):Play()
                                    vu3:Create(vu350, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = Color3.fromRGB(155, 155, 155)
                                    }):Play()
                                    vu352:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                else
                                    vu3:Create(vu354, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = _G.ColorMethod
                                    }):Play()
                                    vu3:Create(vu352, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = _G.ColorMethod
                                    }):Play()
                                    vu3:Create(vu350, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["BackgroundColor3"] = Color3.fromRGB(153, 0, 102)
                                    }):Play()
                                    vu352:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                                end
                                vu373 = not vu373
                            end)
                            v358.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu354
                                vu3:Create(vu354, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundTransparency"] = 0.6
                                }):Play()
                            end)
                            v358.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu354
                                vu3:Create(vu354, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["BackgroundTransparency"] = 1
                                }):Play()
                            end)
                            v358.MouseButton1Down:Connect(function()
								-- upvalues: (ref) vu347, (ref) vu359, (ref) vu361, (ref) vu367, (ref) vu7, (ref) pu341
                                RainbowColorPicker = not RainbowColorPicker
                                if ColorInput then
                                    ColorInput:Disconnect()
                                end
                                if HueInput then
                                    HueInput:Disconnect()
                                end
                                if RainbowColorPicker then
                                    OldToggleColor = vu347.BackgroundColor3
                                    OldColor = vu359.BackgroundColor3
                                    OldColorSelectionPosition = vu361.Position
                                    OldHueSelectionPosition = vu367.Position
                                    while RainbowColorPicker do
                                        vu347.BackgroundColor3 = Color3.fromHSV(vu7.RainbowColorValue, 1, 1)
                                        vu359.BackgroundColor3 = Color3.fromHSV(vu7.RainbowColorValue, 1, 1)
                                        vu361.Position = UDim2.new(1, 0, 0, 0)
                                        vu367.Position = UDim2.new(0, vu7.HueSelectionPosition, 0.5, 0)
                                        pcall(pu341, vu347.BackgroundColor3)
                                        wait()
                                    end
                                elseif not RainbowColorPicker then
                                    vu347.BackgroundColor3 = OldToggleColor
                                    vu359.BackgroundColor3 = OldColor
                                    vu361.Position = OldColorSelectionPosition
                                    vu367.Position = OldHueSelectionPosition
                                    pcall(pu341, vu347.BackgroundColor3)
                                end
                            end)
                            vu352.MouseButton1Down:Connect(function()
								-- upvalues: (ref) vu347, (ref) vu359, (ref) vu361, (ref) vu367, (ref) vu7, (ref) pu341
                                RainbowColorPicker = not RainbowColorPicker
                                if ColorInput then
                                    ColorInput:Disconnect()
                                end
                                if HueInput then
                                    HueInput:Disconnect()
                                end
                                if RainbowColorPicker then
                                    OldToggleColor = vu347.BackgroundColor3
                                    OldColor = vu359.BackgroundColor3
                                    OldColorSelectionPosition = vu361.Position
                                    OldHueSelectionPosition = vu367.Position
                                    while RainbowColorPicker do
                                        vu347.BackgroundColor3 = Color3.fromHSV(vu7.RainbowColorValue, 1, 1)
                                        vu359.BackgroundColor3 = Color3.fromHSV(vu7.RainbowColorValue, 1, 1)
                                        vu361.Position = UDim2.new(1, 0, 0, 0)
                                        vu367.Position = UDim2.new(0, vu7.HueSelectionPosition, 0.5, 0)
                                        pcall(pu341, vu347.BackgroundColor3)
                                        wait()
                                    end
                                elseif not RainbowColorPicker then
                                    vu347.BackgroundColor3 = OldToggleColor
                                    vu359.BackgroundColor3 = OldColor
                                    vu361.Position = OldColorSelectionPosition
                                    vu367.Position = OldHueSelectionPosition
                                    pcall(pu341, vu347.BackgroundColor3)
                                end
                            end)
                            local function vu374(_)
								-- upvalues: (ref) vu347, (ref) vu359, (ref) pu341
                                vu347.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                                vu359.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                                pcall(pu341, vu347.BackgroundColor3)
                            end
                            ColorH = 1 - math.clamp(vu367.AbsolutePosition.Y - vu364.AbsolutePosition.Y, 0, vu364.AbsoluteSize.Y) / vu364.AbsoluteSize.Y
                            ColorS = math.clamp(vu361.AbsolutePosition.X - vu359.AbsolutePosition.X, 0, vu359.AbsoluteSize.X) / vu359.AbsoluteSize.X
                            ColorV = 1 - math.clamp(vu361.AbsolutePosition.Y - vu359.AbsolutePosition.Y, 0, vu359.AbsoluteSize.Y) / vu359.AbsoluteSize.Y
                            vu347.BackgroundColor3 = p340
                            vu359.BackgroundColor3 = p340
                            pcall(pu341, vu347.BackgroundColor3)
                            local vu375 = false
                            vu359.InputBegan:Connect(function(p376)
								-- upvalues: (ref) vu375, (ref) vu4, (ref) vu5, (ref) vu359, (ref) vu361, (ref) vu374
                                if p376.UserInputType == Enum.UserInputType.MouseButton1 then
                                    if vu375 then
                                        return
                                    end
                                    if ColorInput then
                                        ColorInput:Disconnect()
                                    end
                                    ColorInput = vu4.RenderStepped:Connect(function()
										-- upvalues: (ref) vu5, (ref) vu359, (ref) vu361, (ref) vu374
                                        local v377 = math.clamp(vu5.X - vu359.AbsolutePosition.X, 0, vu359.AbsoluteSize.X) / vu359.AbsoluteSize.X
                                        local v378 = math.clamp(vu5.Y - vu359.AbsolutePosition.Y, 0, vu359.AbsoluteSize.Y) / vu359.AbsoluteSize.Y
                                        vu361.Position = UDim2.new(v377, 0, v378, 0)
                                        ColorS = v377
                                        ColorV = 1 - v378
                                        vu374(true)
                                    end)
                                end
                            end)
                            vu359.InputEnded:Connect(function(p379)
                                if p379.UserInputType == Enum.UserInputType.MouseButton1 and ColorInput then
                                    ColorInput:Disconnect()
                                end
                            end)
                            vu364.InputBegan:Connect(function(p380)
								-- upvalues: (ref) vu375, (ref) vu4, (ref) vu5, (ref) vu364, (ref) vu367, (ref) vu374
                                if p380.UserInputType == Enum.UserInputType.MouseButton1 then
                                    if vu375 then
                                        return
                                    end
                                    if HueInput then
                                        HueInput:Disconnect()
                                    end
                                    HueInput = vu4.RenderStepped:Connect(function()
										-- upvalues: (ref) vu5, (ref) vu364, (ref) vu367, (ref) vu374
                                        local v381 = math.clamp(vu5.Y - vu364.AbsolutePosition.Y, 0, vu364.AbsoluteSize.Y) / vu364.AbsoluteSize.Y
                                        local v382 = math.clamp(vu5.X - vu364.AbsolutePosition.X, 0, vu364.AbsoluteSize.X) / vu364.AbsoluteSize.X
                                        vu367.Position = UDim2.new(v382, 0, v381, 0)
                                        ColorH = 1 - v381
                                        vu374(true)
                                    end)
                                end
                            end)
                            vu364.InputEnded:Connect(function(p383)
                                if p383.UserInputType == Enum.UserInputType.MouseButton1 and HueInput then
                                    HueInput:Disconnect()
                                end
                            end)
                            local vu384 = false
                            v349.MouseButton1Click:Connect(function()
								-- upvalues: (ref) vu384, (ref) vu3, (ref) vu342
                                if vu384 ~= false then
                                    vu3:Create(vu342, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Size"] = UDim2.new(0, 213, 0, 33)
                                    }):Play()
                                else
                                    vu3:Create(vu342, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        ["Size"] = UDim2.new(0, 213, 0, 180)
                                    }):Play()
                                end
                                vu384 = not vu384
                            end)
                            v370.MouseButton1Click:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu342, (ref) vu384
                                vu3:Create(vu342, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Size"] = UDim2.new(0, 213, 0, 33)
                                }):Play()
                                vu384 = not vu384
                            end)
                        end,
                        ["Label"] = function(_, p385, p386)
							-- upvalues: (ref) vu111, (ref) vu3
                            if p386 == nil then
                                local _ = logoid
                            end
                            local v387 = {}
                            local v388 = Instance.new("Frame")
                            v388.Name = "Mainframenoti"
                            v388.Parent = vu111
                            v388.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                            v388.BackgroundTransparency = 0
                            v388.BorderSizePixel = 0
                            v388.ClipsDescendants = false
                            v388.AnchorPoint = Vector2.new(0.5, 0.5)
                            v388.Position = UDim2.new(0.498, 0, 0.5, 0)
                            v388.Size = UDim2.new(0, 213, 0, 28)
                            local vu389 = Instance.new("TextLabel")
                            vu389.Parent = v388
                            vu389.Name = "TextLabel_Tap"
                            vu389.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                            vu389.Size = UDim2.new(0, 130, 0, 24)
                            vu389.Font = Enum.Font.SourceSansSemibold
                            vu389.Text = p385
                            vu389.TextColor3 = Color3.fromRGB(255, 255, 255)
                            vu389.TextSize = 12
                            vu389.AnchorPoint = Vector2.new(0.5, 0.5)
                            vu389.Position = UDim2.new(0.5, 0, 0.5, 0)
                            vu389.TextXAlignment = Enum.TextXAlignment.Center
                            vu389.BackgroundTransparency = 1
                            vu389.TextWrapped = true
                            local v390 = Instance.new("ImageLabel")
                            v390.Parent = v388
                            v390.BackgroundTransparency = 1
                            v390.BorderSizePixel = 0
                            v390.Size = UDim2.new(0, 15, 0, 15)
                            v390.AnchorPoint = Vector2.new(0.5, 0.5)
                            v390.Position = UDim2.new(0.1, 0, 0.5, 0)
                            v390.Image = "http://www.roblox.com/asset/?id=" .. tostring(7040410130)
                            v390.BackgroundTransparency = 1
                            local v391 = Instance.new("UICorner")
                            v391.CornerRadius = UDim.new(0, 4)
                            v391.Name = ""
                            v391.Parent = vu389
                            local v392 = Instance.new("UICorner")
                            v392.CornerRadius = UDim.new(0, 4)
                            v392.Name = ""
                            v392.Parent = v388
                            local vu393 = Instance.new("UIStroke")
                            vu393.Thickness = 1
                            vu393.Name = ""
                            vu393.Parent = v388
                            vu393.LineJoinMode = Enum.LineJoinMode.Round
                            vu393.Color = _G.ColorMethod
                            vu393.Transparency = 0.7
                            v388.MouseEnter:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu393
                                vu3:Create(vu393, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0
                                }):Play()
                            end)
                            v388.MouseLeave:Connect(function()
								-- upvalues: (ref) vu3, (ref) vu393
                                vu3:Create(vu393, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0.7
                                }):Play()
                            end)
                            function v387.Change(_, p394)
								-- upvalues: (ref) vu389
                                vu389.Text = p394
                            end
                            return v387
                        end
                    }
                end
            }
        end
        return v83
    end
}

-- ============================================================
-- USAGE EXAMPLE (delete or replace with your own logic)
-- ============================================================
-- local Window   = vu395.win()
-- local MainTab   = Window:Taps("Main")
-- local MainPage  = MainTab:newpage()
-- MainPage:Toggle("Example Toggle", false, function(state)
--     print("Toggle set to", state)
-- end)
-- MainPage:Slider("Example Slider", false, false, 0, 100, 50, 50, false, function(value)
--     print("Slider value:", value)
-- end)

return vu395
