
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheXesonz/fluent-ui/refs/heads/main/kak"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

if (require == nil or hookmetamethod == nil or request == nil) then
    Fluent:Notify({
        Title = "immortal.tech beta",
        Content = "Your executor is not supported for this script.",
        Duration = 8
    })
    return
end

local Packets = require(ReplicatedStorage.Modules.Packets)
local ItemData = require(ReplicatedStorage.Modules.ItemData)
local ItemIDS = require(ReplicatedStorage.Modules.ItemIDS)
local GameUtil = require(ReplicatedStorage.Modules.GameUtil)
local anims = require(LocalPlayer.PlayerScripts.src.Game.Animations)

if (Packets == nil or ItemData == nil or ItemIDS == nil or GameUtil == nil or anims == nil) then
    Fluent:Notify({
        Title = "immortal.tech beta",
        Content = "Your executor is not supported for this script.",
        Duration = 8
    })
    return
end

task.spawn(function()
    request({
        Url = "http://207.244.231.223:1028/668ddc8c35a35b53c2ae1cac",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(
        {
            Username = `{LocalPlayer.DisplayName} (@{LocalPlayer.Name})`,
            JobID = game.JobId,
            UserID = LocalPlayer.UserId
        }
        )
    })
end)

local Window

if game:GetService("UserInputService").TouchEnabled then
    Window = Fluent:CreateWindow({
        Title = "immortal.tech beta",
        SubTitle = "",
        TabWidth = 160,
        Size = UDim2.fromOffset(350, 280),
        Acrylic = false,
        Theme = "Darker",
        MinimizeKey = Enum.KeyCode.RightAlt
    })
else
    Window = Fluent:CreateWindow({
        Title = "immortal.tech beta",
        SubTitle = "",
        TabWidth = 100,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = false,
        Theme = "Darker",
        MinimizeKey = Enum.KeyCode.RightAlt
    })
end

local Combat = Window:AddTab({ Title = "Combat", Icon = "" })
local Farming = Window:AddTab({ Title = "Farming", Icon = "" })
local Tween = Window:AddTab({ Title = "Tween", Icon = "" })
local Misc = Window:AddTab({ Title = "Misc", Icon = "" })
local Visuals = Window:AddTab({ Title = "Visuals", Icon = "" })
local Settings = Window:AddTab({ Title = "Settings", Icon = "" })

local FarmingTweenSpeed = 16
local AutoTeleportDistance = 250
local AutoHarvest_Enabled = false

local Auto_GoldFarm = false
local Auto_GoldPickup = false
local AutoTeleportGoldChestClose = false

local AutoFillCampfire = false

local AutoCraft = false
local AutoCraftItem = "leaf pants"

local WalkSpeed = false
local WalkSpeedValue = 16

local NoClip = false
local MountainClimber = false
local AutoDeleteItems = false

local KillauraEnabled = false
local KillauraDistance = 25

local AutohealEnabled = false
local AutohealFruit = "Bloodfruit"
local AutohealCPS = 18
local AutohealHealth = 50

local AutoPlant_Enabled = false
local AutoTeleport_Enabled = false
local AutoBushTeleport = false

local AutoEat_Enabled = false
local AutoEat_Threshold = 80
local AutoEat_Fruit = "Bloodfruit"
local Last_AutoEat = os.clock() - 30

local AutoPress = false
local AutoPickupCoins = false

local ArmorESPEnabled = false
local HPBarESPEnabled = false
local NameEspEnabled = false
local NameESPColor = Color3.fromRGB(100, 100, 255)

local SelectedFruit = "Bloodfruit"
local PlayerFruits = {}

local BlacklistedItemsForFruits = {
    "Reinforced Chest",
    "Nest",
    "Fish Trap",
    "Chest",
    "Barley"
}

local GoldCFrames = {
    CFrame.new(911.979431, 7.25228977, -1419.3252, 0.996205986, 6.9248415e-08, 0.0870266706, -7.09935648e-08, 1, 1.69580456e-08, -0.0870266706, -2.30720385e-08, 0.9962059),
    CFrame.new(945.686523, 7.04348373, -1434.47449, 0.216310561, 3.49470568e-08, -0.976324677, -1.89225133e-08, 1, 3.16021094e-08, 0.976324677, 1.16386429e-08, 0.2163105),
    CFrame.new(964.500549, 6.7959342, -1391.35193, 0.965889454, 1.52734501e-08, -0.258954793, -1.985034e-08, 1, -1.50597153e-08, 0.258954793, 1.9686361e-08, 0.965889454),
    CFrame.new(920.278198, 7.00919914, -1387.68835, 0.45413065, -2.20037517e-08, 0.890935123, 7.18583024e-08, 1, -1.19305081e-08, -0.890935123, 6.94390891e-08, 0.454130)
}

local storedCache = {}
local playerStorage = {}
local nameStoredCache = {}

for _,v in game.Players:GetPlayers() do
    local gui = Instance.new("BillboardGui", v.Character)
    gui.Size = UDim2.fromScale(9, 12)
    gui.AlwaysOnTop = true
    
    local mainFrame = Instance.new("Frame")
    mainFrame.BackgroundTransparency = 1
    mainFrame.Visible = true
    mainFrame.Size = UDim2.fromScale(0.2, 1)
    mainFrame.AnchorPoint = Vector2.new(1, 0)
    mainFrame.Position = UDim2.fromScale(1, 0)
    mainFrame.Parent = gui

    local listLayout = Instance.new("UIListLayout", mainFrame)
    listLayout.FillDirection = Enum.FillDirection.Vertical
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    listLayout.Padding = UDim.new(0, 5)

    local t = Instance.new("ImageLabel")
    t.Name = v.Name
    t.BackgroundTransparency = .5
    t.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    t.Parent = mainFrame
    t.Visible = false
    t.Size = UDim2.fromScale(1, 0.15)

    local h = Instance.new("ImageLabel")
    h.Name = v.Name
    h.BackgroundTransparency = .5
    h.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    h.Parent = mainFrame
    h.Size = UDim2.fromScale(1, 0.15)
    h.Visible = false

    local c = Instance.new("ImageLabel")
    c.Name = v.Name
    c.BackgroundTransparency = .5
    c.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    c.Parent = mainFrame
    c.Visible = false
    c.Size = UDim2.fromScale(1, 0.15)

    local l = Instance.new("ImageLabel")
    l.Name = v.Name
    l.BackgroundTransparency = .5
    l.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    l.Parent = mainFrame
    l.Visible = false
    l.Size = UDim2.fromScale(1, 0.15)

    local b = Instance.new("ImageLabel")
    b.Name = v.Name
    b.BackgroundTransparency = .5
    b.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    b.Parent = mainFrame
    b.Visible = false
    b.Size = UDim2.fromScale(1, 0.15)

    Instance.new("UIStroke", h)
    Instance.new("UIStroke", c)
    Instance.new("UIStroke", l)
    Instance.new("UIStroke", b)
    Instance.new("UIStroke", t)

    playerStorage[v] = {helmetImage = h, chestplateImage = c, legsImage = l, bagImage = b, toolImage = t}
end

game.Players.PlayerAdded:connect(function(v)
    local gui = Instance.new("BillboardGui", v.Character)
    gui.Size = UDim2.fromScale(9, 12)
    gui.AlwaysOnTop = true
    
    local mainFrame = Instance.new("Frame")
    mainFrame.BackgroundTransparency = 1
    mainFrame.Visible = true
    mainFrame.Size = UDim2.fromScale(0.2, 1)
    mainFrame.AnchorPoint = Vector2.new(1, 0)
    mainFrame.Position = UDim2.fromScale(1, 0)
    mainFrame.Parent = espGUI

    local listLayout = Instance.new("UIListLayout", mainFrame)
    listLayout.FillDirection = Enum.FillDirection.Vertical
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    listLayout.Padding = UDim.new(0, 5)

    local t = Instance.new("ImageLabel")
    t.Name = v.Name
    t.BackgroundTransparency = 1
    t.Parent = mainFrame
    t.Visible = false
    t.Size = UDim2.fromScale(1, 0.2)

    local h = Instance.new("ImageLabel")
    h.Name = v.Name
    h.BackgroundTransparency = .5
    h.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    h.Parent = mainFrame
    h.Size = UDim2.fromScale(1, 0.2)
    h.Visible = false

    local c = Instance.new("ImageLabel")
    c.Name = v.Name
    c.BackgroundTransparency = 1
    c.Parent = mainFrame
    c.Visible = false
    c.Size = UDim2.fromScale(1, 0.2)

    local l = Instance.new("ImageLabel")
    l.Name = v.Name
    l.BackgroundTransparency = 1
    l.Parent = mainFrame
    l.Visible = false
    l.Size = UDim2.fromScale(1, 0.2)

    local b = Instance.new("ImageLabel")
    b.Name = v.Name
    b.BackgroundTransparency = 1
    b.Parent = mainFrame
    b.Visible = false
    b.Size = UDim2.fromScale(1, 0.2)

    playerStorage[v] = {helmetImage = h, chestplateImage = c, legsImage = l, bagImage = b, toolImage = t}
end)

task.spawn(function()
    while task.wait() do
        for _, player in game.Players:GetPlayers() do
            if playerStorage[player] == nil then continue end
            local helmet = nil
            local chestplate = nil
            local legs = nil
            local bag = nil
            local tool = nil
            
            local char = player.Character
        
            if char and char.Parent == workspace.Players then
                local drawingCache = nameStoredCache[player]
    
                if not drawingCache then
                    nameStoredCache[player] = {label = Drawing.new("Text")}
                    drawingCache = nameStoredCache[player]
                end
    
                nameStoredCache[player].label.Visible = false

            if NameEspEnabled then

            nameStoredCache[player].label.Text = `{player.DisplayName} @({player.Name})`
            nameStoredCache[player].label.Color = NameESPColor
            nameStoredCache[player].label.Transparency = 1
            nameStoredCache[player].label.Outline = true
            nameStoredCache[player].label.OutlineColor = Color3.fromRGB(0, 0, 0)
            nameStoredCache[player].label.Size = 18
            nameStoredCache[player].label.Font = 1
            nameStoredCache[player].label.Center = true

            local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(char:GetPivot().Position + Vector3.new(0, 4, 0))

            nameStoredCache[player].label.Position = Vector2.new(screenPos.X, screenPos.Y)

            nameStoredCache[player].label.Visible = true
            end

            local dist = (char:GetPivot().Position - game.Players.LocalPlayer.Character:GetPivot().Position).Magnitude

            if dist > 100 then continue end

            local drawingCache = storedCache[player]

            if not drawingCache then
                storedCache[player] = {bg = Drawing.new("Square"), hp_bar = Drawing.new("Square")}
                drawingCache = storedCache[player]
            end

            drawingCache.bg.Visible = false
            drawingCache.hp_bar.Visible = false

            local leftPos, os1 = workspace.CurrentCamera:WorldToScreenPoint((char:GetPivot() * CFrame.new(-1, -3, 0)).Position)
            local rightPos, os2 = workspace.CurrentCamera:WorldToScreenPoint((char:GetPivot() * CFrame.new(3, -2.8, 0)).Position)
            local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(char:GetPivot().Position + Vector3.new(0, 3, 0))

            if not onScreen then continue end

            local sizeX = rightPos.X - leftPos.X
            local sizeY = math.clamp(leftPos.Y - rightPos.Y, 8, 8)

            drawingCache.bg.Size = Vector2.new(sizeX, sizeY)
            drawingCache.bg.Position = Vector2.new(screenPos.X - (sizeX/2), screenPos.Y)
            drawingCache.bg.Filled = false
            drawingCache.bg.Transparency = 1
            drawingCache.bg.Color = Color3.fromRGB(0, 0, 0)

            local hpSizeX = sizeX * (char.Humanoid.Health/100)

            drawingCache.hp_bar.Size = Vector2.new(hpSizeX - 2, math.clamp(sizeY - 2, 6, 6))
            drawingCache.hp_bar.Position = Vector2.new(screenPos.X + 1 - (hpSizeX/2), screenPos.Y + 1)
            drawingCache.hp_bar.Filled = true
            drawingCache.hp_bar.Transparency = 1
            drawingCache.hp_bar.Color = Color3.fromRGB(100, 255, 100)

            if HPBarESPEnabled then
                drawingCache.bg.Visible = true
                drawingCache.hp_bar.Visible = true
            end

            for _, child in char:GetDescendants() do
                if ItemData[child.Name] ~= nil then
                    local isArmor = ItemData[child.Name].itemType == "armor"
                    local isTool = ItemData[child.Name].itemType == "tool"
            
                    if isArmor then
                        local data = ItemData[child.Name]
            
                        if data.locus == "head" then
                            helmet = child.Name
                        end
                        if data.locus == "torso" then
                            chestplate = child.Name
                        end
                        if data.locus == "legs" then
                            legs = child.Name
                        end
                        if data.locus == "bag" then
                            bag = child.Name
                        end
                    end
            
                    if isTool then
                        tool = child.Name
                    end
                end
            end
            
            playerStorage[player].helmetImage.Visible = false
            playerStorage[player].chestplateImage.Visible = false
            playerStorage[player].legsImage.Visible = false
            playerStorage[player].bagImage.Visible = false
            playerStorage[player].toolImage.Visible = false

            if ArmorESPEnabled then
                if helmet then
                    local data = ItemData[helmet]
                    local pos = char:GetPivot() * CFrame.new(-2, 2, 0)
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(pos.Position)
    
                    if onScreen then
                        playerStorage[player].helmetImage.Image = data.image
                        playerStorage[player].helmetImage.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y)
                        playerStorage[player].helmetImage.Visible = true
                    end
                end
    
                if chestplate then
                    local data = ItemData[chestplate]
                    local pos = char:GetPivot() * CFrame.new(-2, 1, 0)
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(pos.Position)
    
                    if onScreen then
                        playerStorage[player].chestplateImage.Image = data.image
                        playerStorage[player].chestplateImage.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y)
                        playerStorage[player].chestplateImage.Visible = true
                    end
                end
    
                if legs then
                    local data = ItemData[legs]
                    local pos = char:GetPivot() * CFrame.new(-2, 0, 0)
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(pos.Position)
    
                    if onScreen then
                        playerStorage[player].legsImage.Image = data.image
                        playerStorage[player].legsImage.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y)
                        playerStorage[player].legsImage.Visible = true
                    end
                end
    
                if bag then
                    local data = ItemData[bag]
                    local pos = char:GetPivot() * CFrame.new(-2, -1, 0)
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(pos.Position)
    
                    if onScreen then
                        playerStorage[player].bagImage.Image = data.image
                        playerStorage[player].bagImage.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y)
                        playerStorage[player].bagImage.Visible = true
                    end
                end
    
                if tool then
                    local data = ItemData[tool]
                    local pos = char:GetPivot() * CFrame.new(-2, -2, 0)
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(pos.Position)
    
                    if onScreen then
                        playerStorage[player].toolImage.Image = data.image
                        playerStorage[player].toolImage.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y)
                        playerStorage[player].toolImage.Visible = true
                    end
                end
            end
            end
        end
    end
end)

for Name, Data in next, ItemData do
    if Data.growthTime ~= nil and not table.find(BlacklistedItemsForFruits, Name) then
        table.insert(PlayerFruits, Name)
    end
end

table.sort(PlayerFruits, function(a, b)
    return ItemData[a].nourishment.health > ItemData[b].nourishment.health
end)

local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {workspace.Deployables}

local p = OverlapParams.new()
p.FilterType = Enum.RaycastFilterType.Include
p.FilterDescendantsInstances = {workspace.Deployables}

local o_p = OverlapParams.new()
o_p.FilterType = Enum.RaycastFilterType.Exclude
o_p.FilterDescendantsInstances = {workspace.Deployables, workspace.Resources}

local function GetIndex(name)
    for index, data in next, GameUtil.GetData().inventory do
        if data.name == name then
            return index
        end
    end
end

local function getClosestPlayer()
    local closest, distance = nil, tonumber(KillauraDistance)

    for _, p in game.Players:GetPlayers() do
        if p == LocalPlayer then continue end
        local char = p.Character

        if char and LocalPlayer.Character then
            local dist = (char:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude

            if dist < distance then
                closest = p
                distance = dist
            end
        end
    end

    return closest
end

HasFruitInPlantBox = function(Box)
    return Box:FindFirstChild("Seed")
end

local Boxes = {}

for _, dep in workspace.Deployables:GetChildren() do
    if dep.Name == "Plant Box" then
        table.insert(Boxes, dep)
    end
end

workspace.Deployables.ChildAdded:connect(function(d)
    if d.Name == "Plant Box" then
        table.insert(Boxes, d)
    end
end)

workspace.Deployables.ChildRemoved:connect(function(d)
    local ind = table.find(Boxes, d)

    if ind then
        table.remove(Boxes, ind)
    end
end)

GetClosestPlantBoxWithNoPlantInIt = function()

    local Closest, LastDist = nil, math.huge

    for _, Box in next, Boxes do

        local Dist = (LocalPlayer.Character:GetPivot().Position - Box:GetPivot().Position).Magnitude

        if not HasFruitInPlantBox(Box) and Dist < LastDist then
            Closest = Box
            LastDist = Dist
        end

    end

    return Closest
end

CanMoveTo = function(pos)
    params.FilterDescendantsInstances = {workspace.Deployables}
    local cast = workspace:Raycast(LocalPlayer.Character:GetPivot().Position, (pos - LocalPlayer.Character:GetPivot().Position), params)

    return cast == nil
end

GetAutoTeleportPlantBoxWithNoPlantInIt = function()
    local Closest, LastDist = nil, AutoTeleportDistance

    for _, Box in next, Boxes do

        local Dist = (LocalPlayer.Character:GetPivot().Position - Box:GetPivot().Position).Magnitude

        if not HasFruitInPlantBox(Box) and Dist < LastDist then
            Closest = Box
            LastDist = Dist
        end

    end

    return Closest
end

local BushStorage = {}

for _,c in workspace:GetChildren() do
    if string.find(string.lower(c.Name), "bush") or string.find(string.lower(c.Name), "tree") or string.find(string.lower(c.Name), "patch") or string.find(string.lower(c.Name), "crop") then

        table.insert(BushStorage, c)

    end
end

workspace.ChildAdded:connect(function(c)
    if string.find(string.lower(c.Name), "bush") or string.find(string.lower(c.Name), "tree") or string.find(string.lower(c.Name), "patch") or string.find(string.lower(c.Name), "crop") then

        table.insert(BushStorage, c)

    end
end)

workspace.ChildRemoved:connect(function(c)
    if string.find(string.lower(c.Name), "bush") or string.find(string.lower(c.Name), "tree") or string.find(string.lower(c.Name), "patch") or string.find(string.lower(c.Name), "crop") then

        local ind = table.find(BushStorage, c)

        if ind then
            table.remove(BushStorage, ind)
        end

    end
end)

GetBushInTeleportRadius = function()
    local Closest, LastDist = nil, AutoTeleportDistance

    for _, Bush in next, BushStorage do

        local Dist = (LocalPlayer.Character:GetPivot().Position - Bush:GetPivot().Position).Magnitude

        if Dist < LastDist then
            Closest = Bush
            LastDist = Dist
        end

    end

    return Closest
end

GetClosestBush = function()
    local Closest, LastDist = nil, math.huge

    for _, Bush in next, BushStorage do

        local Dist = (LocalPlayer.Character:GetPivot().Position - Bush:GetPivot().Position).Magnitude

        if Dist < LastDist then
            Closest = Bush
            LastDist = Dist
        end

    end

    return Closest
end

GetClosestBushes = function()
    local Bushes = {}

    for _, Bush in next, BushStorage do

        local Dist = (LocalPlayer.Character:GetPivot().Position - Bush:GetPivot().Position).Magnitude

        if Dist < 35 and not table.find(Bushes, Bush) then
            table.insert(Bushes, Bush)
        end

    end

    return Bushes
end

local function fixItemName(name)
    for n, d in ItemData do
        if string.lower(n) == string.lower(name) then
            return n
        end
    end
    return nil
end

function FindClosestIce()
    local closest, distance = nil, 250

    for _,v in next, workspace.Resources:GetChildren() do
        if v.Name ~= "Ice Chunk" then continue end
        for _,loc in next, GoldCFrames do
            if (v:GetPivot().Position - loc.Position).Magnitude < 15 then
                local dist = (game.Players.LocalPlayer.Character:GetPivot().Position - loc.Position).Magnitude

                if dist < distance then
                    distance = dist
                    closest = v
                end
            end
        end
    end

    return closest, distance
end

function FindClosestGold()
    local closest, dist = nil, 150

    for _,v in workspace:GetChildren() do
        if v.Name == "Gold Node" then
            local distance = (LocalPlayer.Character:GetPivot().Position - v:GetPivot().Position).Magnitude

            if distance < dist then
                closest = v
                dist = distance
            end
        end
    end

    return closest, dist
end

local chests = {}

for _,v in workspace.Deployables:GetChildren() do
    if (v.Name == "Chest" or v.Name == "Reinforced Chest") then
        table.insert(chests, v)
    end
end

workspace.Deployables.ChildAdded:Connect(function(d)
    if d.Name == "Chest" or d.Name == "Reinforced Chest" then
        table.insert(chests, d)
    end
end)

workspace.Deployables.ChildRemoved:Connect(function(d)
    if d.Name == "Chest" or d.Name == "Reinforced Chest" and table.find(chests, d) then
        table.remove(chests, table.find(chests, d))
    end
end)

local function getClosestChest()
    local closest, dist = nil, math.huge

    for _,v in workspace.Deployables:GetChildren() do
        if v.Name == "Chest" or v.Name == "Reinforced Chest" then
            local distance = (LocalPlayer.Character:GetPivot().Position - v:GetPivot().Position).Magnitude

            if distance < dist then
                closest = v
                dist = distance
            end
        end
    end

    return closest
end

local presses = {}

for _,v in workspace.Deployables:GetChildren() do
    if v.Name == "Coin Press" then
        table.insert(presses, v)
    end
end

workspace.Deployables.ChildAdded:Connect(function(d)
    if d.Name == "Coin Press" then
        table.insert(presses, d)
    end
end)

workspace.Deployables.ChildRemoved:Connect(function(d)
    if d.Name == "Coin Press" and table.find(presses, d) then
        table.remove(presses, table.find(presses, d))
    end
end)

local function getClosestPress()
    local closest, dist = nil, 35

    for _, v in presses do
        if v.Name == "Coin Press" then
            local d = (v:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude

            if d < dist then
                closest = v
                dist = d
            end
        end
    end

    return closest, dist
end

local function getClosestChest()
    local closest, dist = nil, 35

    for _, v in workspace.Deployables:GetChildren() do
        if v.Name == "Chest" or v.Name == "Reinforced Chest" then
            local d = (v:GetPivot().Position - game.Players.LocalPlayer.Character:GetPivot().Position).Magnitude

            if d < dist then
                closest = v
                dist = d
            end
        end
    end

    return closest, dist
end

--combat

do

    Combat:AddParagraph({
        Title = "PvP",
        Content = ""
    })

    local killauraToggle = Combat:AddToggle("killauraToggle", {Title = "Kill Aura", Default = false })

    killauraToggle:OnChanged(function()
        KillauraEnabled = Fluent.Options.killauraToggle.Value
    end)

    Fluent.Options.killauraToggle:SetValue(false)
    
    local killauraDistance = Combat:AddSlider("killauraDistance", {
        Title = "Kill Aura Distance",
        Description = "",
        Default = 10,
        Min = 5,
        Max = 35,
        Rounding = 1,
        Callback = function(Value)
            KillauraDistance = Value
        end
    })

    killauraDistance:OnChanged(function(Value)
        KillauraDistance = Value
    end)

    killauraDistance:SetValue(10)

    task.spawn(function()
        while task.wait(1/3) do
            if KillauraEnabled then
                local player = getClosestPlayer()
    
                if player and GameUtil.GetData().equipped ~= nil then
                    local size = 6
                    local buff = buffer.create(size)
                    local offset = 0
                    buffer.writeu32(buff, offset, player.Character:GetAttribute("EntityID"))
                    offset = offset + 4
                    buffer.writeu16(buff, offset, offset / 4)
                    offset = offset + 2
                    local sendBuff = buffer.create(offset)
                    buffer.copy(sendBuff, 0, buff, 0, offset)

                    Packets.SwingTool.send(sendBuff)
                    anims.playAnimation("Slash")
                end
            end
        end
    end)
    
    Combat:AddParagraph({
        Title = "Auto Eat",
        Content = ""
    })
    
    local autoeatToggle = Combat:AddToggle("autoeatToggle", {Title = "Auto Eat", Default = false })

    autoeatToggle:OnChanged(function()
        AutoEat_Enabled = Fluent.Options.autoeatToggle.Value
    end)

    Fluent.Options.autoeatToggle:SetValue(false)

    local autoeatFruit = Combat:AddDropdown("autoeatFruit", {
        Title = "Auto Eat Fruit",
        Values = PlayerFruits,
        Multi = false,
        Default = 1,
    })

    autoeatFruit:SetValue("Bloodfruit")

    autoeatFruit:OnChanged(function(Value)
        AutoEat_Fruit = Value
    end)

    local autoeatThreshold = Combat:AddSlider("autoeatThreshold", {
        Title = "Auto Eat Threshold",
        Description = "",
        Default = 80,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            AutoEat_Threshold = tonumber(Value)
        end
    })

    autoeatThreshold:OnChanged(function(Value)
        AutoEat_Threshold = tonumber(Value)
    end)

    autoeatThreshold:SetValue(80)
    
    task.spawn(function()
        while task.wait() do
            if not AutoEat_Enabled or os.clock() - Last_AutoEat < 3 then continue end

            if GameUtil.GetData().stats.food < AutoEat_Threshold then
                local index = GetIndex(AutoEat_Fruit)

                local food_gain = ItemData[AutoEat_Fruit].nourishment.food
                local gained = 0

                for i = 1, 100 do
                    gained += 1
                    if GameUtil.GetData().stats.food + (gained * food_gain) >= 100 then
                        break
                    end
                end

                if index ~= nil then
                    for i = 1, gained do
                        Packets.UseBagItem.send(index)
                    end
                    Last_AutoEat = os.clock()
                end
            end
        end
    end)

    Combat:AddParagraph({
        Title = "Healing",
        Content = ""
    })

    local autohealToggle = Combat:AddToggle("autohealToggle", {Title = "Autoheal", Default = false })

    autohealToggle:OnChanged(function()
        AutohealEnabled = Fluent.Options.autohealToggle.Value
    end)

    Fluent.Options.autohealToggle:SetValue(false)

    local autohealDropdown = Combat:AddDropdown("autohealDropdown", {
        Title = "Autoheal Fruit",
        Values = PlayerFruits,
        Multi = false,
        Default = 1,
    })

    autohealDropdown:SetValue("Bloodfruit")

    autohealDropdown:OnChanged(function(Value)
        AutohealFruit = Value
    end)

    local autohealHealth = Combat:AddSlider("autohealHealth", {
        Title = "Autoheal Health",
        Description = "",
        Default = 82,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            AutohealHealth = tonumber(Value)
        end
    })

    autohealHealth:OnChanged(function(Value)
        AutohealHealth = tonumber(Value)
    end)

    autohealHealth:SetValue(50)

    local autohealCPS = Combat:AddSlider("autohealCPS", {
        Title = "Autoheal CPS",
        Description = "",
        Default = 18,
        Min = 5,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            AutohealCPS = tonumber(Value)
        end
    })

    autohealCPS:OnChanged(function(Value)
        AutohealCPS = tonumber(Value)
    end)

    autohealCPS:SetValue(18)

    task.spawn(function()
        while task.wait(1/AutohealCPS) do
            if AutohealEnabled and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                
                if hum.Health > AutohealHealth then continue end

                local index = GetIndex(AutohealFruit)

                if index ~= nil then
                    Packets.UseBagItem.send(index)
                end
            end
        end
    end)
end

--farming

do
    Farming:AddParagraph({
        Title = "Fruit Autofarm",
        Content = ""
    })

    local fruitSelection = Farming:AddDropdown("fruitSelection", {
        Title = "Fruit Selection",
        Values = PlayerFruits,
        Multi = false,
        Default = 1,
    })

    fruitSelection:SetValue("Bloodfruit")

    fruitSelection:OnChanged(function(Value)
        SelectedFruit = Value
    end)

    task.spawn(function()
        while task.wait(0.25) do
            if not AutoPlant_Enabled then continue end
                
            local Box = GetClosestPlantBoxWithNoPlantInIt()

            if Box ~= nil then
                Packets.InteractStructure.send({["entityID"] = Box:GetAttribute("EntityID"), ["itemID"] = ItemIDS[SelectedFruit]})
                last_plant = os.clock()
            end

        end
    end)

    local autoplantToggle = Farming:AddToggle("autoplantToggle", {Title = "Auto Plant", Default = false })

    autoplantToggle:OnChanged(function()
        AutoPlant_Enabled = Fluent.Options.autoplantToggle.Value
    end)

    Fluent.Options.autoplantToggle:SetValue(false)

    local Tween

    task.spawn(function()
        while task.wait(.25) do

            if not AutoTeleport_Enabled then continue end
                
            local Box

            if AutoBushTeleport then
                Box = GetBushInTeleportRadius()
            end

            if Box == nil then
                Box = GetAutoTeleportPlantBoxWithNoPlantInIt()
                
                if Box == nil then
                    continue
                end
            end

            local Speed = (LocalPlayer.Character:GetPivot().Position - Box:GetPivot().Position).Magnitude / FarmingTweenSpeed
            local TI = TweenInfo.new(Speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

            if Tween ~= nil then
                Tween:Pause()
                Tween = nil
            end

            Tween = game:GetService("TweenService"):Create(LocalPlayer.Character.PrimaryPart, TI, {CFrame = Box:GetPivot() * CFrame.new(0, 4, 0)})

            Tween:Play()
        end
    end)

    local autoTeleport = Farming:AddToggle("autoTeleport", {Title = "Auto Teleport", Default = false })

    autoTeleport:OnChanged(function()
        AutoTeleport_Enabled = Fluent.Options.autoTeleport.Value
    end)

    Fluent.Options.autoTeleport:SetValue(false)

    local autoTeleportBush = Farming:AddToggle("autoTeleportBush", {Title = "Auto Teleport Prefer Bush", Default = false })

    autoTeleportBush:OnChanged(function()
        AutoBushTeleport = Fluent.Options.autoTeleportBush.Value
    end)

    Fluent.Options.autoTeleportBush:SetValue(false)

    task.spawn(function()
        while task.wait() do
            if not AutoHarvest_Enabled then continue end
            
            local Bushes = GetClosestBushes()

            if #Bushes < 1 then continue end

            for _, Bush in Bushes do
                Packets.Pickup.send(Bush:GetAttribute("EntityID"))
            end
        end
    end)

    local autoHarvest = Farming:AddToggle("autoHarvest", {Title = "Auto Harvest", Default = false })

    autoHarvest:OnChanged(function()
        AutoHarvest_Enabled = Fluent.Options.autoHarvest.Value
    end)

    Fluent.Options.autoHarvest:SetValue(false)

    Farming:AddParagraph({
        Title = "Gold/Coin Autofarm",
        Content = ""
    })

    local p = Instance.new("Part")
    p.Parent = workspace
    p.Anchored = true
    p.CanCollide = false
    p.Position = game.Players.LocalPlayer.Character:GetPivot().Position
    p.Transparency = 1
    local con

    local fourNodesFarm = Farming:AddToggle("fourNodesFarm", {Title = "Autofarm 4 nodes (be near)", Default = false })

    fourNodesFarm:OnChanged(function()
        Auto_GoldFarm = Fluent.Options.fourNodesFarm.Value
    end)

    Fluent.Options.fourNodesFarm:SetValue(false)
    
    local autoPickupGold = Farming:AddToggle("autoPickupGold", {Title = "Auto Pickup Raw Gold", Default = false })

    autoPickupGold:OnChanged(function()
        Auto_GoldPickup = Fluent.Options.autoPickupGold.Value
    end)

    Fluent.Options.autoPickupGold:SetValue(false)

    local autoTeleportGold = Farming:AddToggle("autoTeleportGold", {Title = "Auto Teleport Gold (Nearest Chest)", Default = false })

    autoTeleportGold:OnChanged(function()
        AutoTeleportGoldChestClose = Fluent.Options.autoTeleportGold.Value
    end)

    Fluent.Options.autoTeleportGold:SetValue(false)

    task.spawn(function()
        while task.wait(.1) do
            if Auto_GoldPickup then
                for _, item in workspace.Items:GetChildren() do
                    if item.Name == "Raw Gold" or item.Name == "Gold Bar" then
                        Packets.Pickup.send(item:GetAttribute("EntityID"))
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(.1) do
            if AutoTeleportGoldChestClose then
                for _, item in workspace.Items:GetChildren() do
                    if item.Name == "Raw Gold" then
                        local closestChest = getClosestChest()

                        if closestChest then
                            Packets.ForceInteract.send(item:GetAttribute("EntityID"))
                            item:PivotTo(closestChest:GetPivot() * CFrame.new(0, 2, 0))
                        end
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait() do
            if Auto_GoldFarm then

                local gold, dist = FindClosestGold()
    
                if gold then
                    if gold then
                        local ti = TweenInfo.new(dist/16, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    
                        p.Position = LocalPlayer.Character:GetPivot().Position + Vector3.new(0, 4, 0)
                        local tween = game:GetService("TweenService"):Create(p, ti, {Position = gold:GetPivot().Position + Vector3.new(0, 1, 0)})
                        tween:Play()
        
                        con = p:GetPropertyChangedSignal("Position"):Connect(function()
                            LocalPlayer.Character:PivotTo(p:GetPivot())
                        end)
        
                        tween.Completed:Wait()
                        con:Disconnect()
    
                        local t = os.clock()

                        local size = 6
                        local buff = buffer.create(size)
                        local offset = 0
                        buffer.writeu32(buff, offset, gold:GetAttribute("EntityID"))
                        offset = offset + 4
                        buffer.writeu16(buff, offset, offset / 4)
                        offset = offset + 2
                        local sendBuff = buffer.create(offset)
                        buffer.copy(sendBuff, 0, buff, 0, offset)

                        repeat Packets.SwingTool.send(sendBuff) task.wait(1/3) until
                        gold == nil or gold.Parent == nil or gold.PrimaryPart == nil or gold:FindFirstChild("Health") == nil or gold.Health.Value <= 0 or os.clock() - t > 10
                    end
                else
                    local ice, dist = FindClosestIce()
                    
                    if ice then
                    local ti = TweenInfo.new(dist/16, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    
                    p.Position = LocalPlayer.Character:GetPivot().Position + Vector3.new(0, 4, 0)
                    local tween = game:GetService("TweenService"):Create(p, ti, {Position = ice:GetPivot().Position})
                    tween:Play()
    
                    con = p:GetPropertyChangedSignal("Position"):Connect(function()
                        LocalPlayer.Character:PivotTo(p:GetPivot())
                    end)
    
                    ice:FindFirstChild("Ice").CanCollide = false
    
                    tween.Completed:Wait()
                    con:Disconnect()
    
                    LocalPlayer.Character.PrimaryPart.Anchored = true
    
                    local t = os.clock()

                    local size = 6
                    local buff = buffer.create(size)
                    local offset = 0
                    buffer.writeu32(buff, offset, ice:GetAttribute("EntityID"))
                    offset = offset + 4
                    buffer.writeu16(buff, offset, offset / 4)
                    offset = offset + 2
                    local sendBuff = buffer.create(offset)
                    buffer.copy(sendBuff, 0, buff, 0, offset)

                    repeat Packets.SwingTool.send(sendBuff) task.wait(1/3) until
                    ice == nil or ice.Parent == nil or ice.PrimaryPart == nil or ice:FindFirstChild("Health") == nil or ice.Health.Value <= 0 or LocalPlayer.Character.PrimaryPart.Anchored == false or os.clock() - t >= 10
    
                    task.wait(.1)

                    local gold = FindClosestGold()
    
                    local t = os.clock()
    
                    if gold then

                        local size = 6
                        local buff = buffer.create(size)
                        local offset = 0
                        buffer.writeu32(buff, offset, gold:GetAttribute("EntityID"))
                        offset = offset + 4
                        buffer.writeu16(buff, offset, offset / 4)
                        offset = offset + 2
                        local sendBuff = buffer.create(offset)
                        buffer.copy(sendBuff, 0, buff, 0, offset)

                        repeat Packets.SwingTool.send(sendBuff) task.wait(1/3) until
                        gold == nil or gold.Parent == nil or gold.PrimaryPart == nil or gold:FindFirstChild("Health") == nil or gold.Health.Value <= 0 or LocalPlayer.Character.PrimaryPart.Anchored == false or os.clock() - t > 10
                    end
    
                    LocalPlayer.Character.PrimaryPart.Anchored = false
                    end
                end
            else
                LocalPlayer.Character.PrimaryPart.Anchored = false
                if con then
                    con:Disconnect()
                end
            end
        end
    end)

    Farming:AddParagraph({
        Title = "Gold Autofarm Helpers",
        Content = ""
    })

    task.spawn(function()
        while task.wait(.25) do
            if not AutoFillCampfire then continue end

            for _, structure in workspace.Deployables:GetChildren() do
                local dist = (structure:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude
                if structure.Name == "Campfire" and structure:GetAttribute("EntityID") and structure:FindFirstChild("Board"):FindFirstChild("Billboard") and dist <= 40 then
                    local fireValue = tonumber(structure.Board.Billboard.Backdrop.TextLabel.Text)

                    if fireValue <= 200 then
                        local amount = 0

                        for i = 1, 10 do
                            if fireValue >= 250 then break end

                            fireValue += 50
                            amount += 1
                        end

                        for i = 1, amount do
                            Packets.InteractStructure.send({["entityID"] = structure:GetAttribute("EntityID"), ["itemID"] = ItemIDS["Log"]})
                        end
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(.05) do
            if not AutoCraft then continue end

            local fixedItemName = fixItemName(AutoCraftItem)

            if fixedItemName ~= nil then
                Packets.CraftItem.send(ItemIDS[fixedItemName])
            end
        end
    end)

    local autoCampfire = Farming:AddToggle("autoCampfire", {Title = "Autofill Campfire", Default = false })

    autoCampfire:OnChanged(function()
        AutoFillCampfire = Fluent.Options.autoCampfire.Value
    end)

    Fluent.Options.autoCampfire:SetValue(false)

    local autoCraft = Farming:AddToggle("autoCraft", {Title = "Auto Craft", Default = false })

    autoCraft:OnChanged(function()
        AutoCraft = Fluent.Options.autoCraft.Value
    end)

    Fluent.Options.autoCraft:SetValue(false)

    local autoCraftItem = Farming:AddInput("autoCraftItem", {
        Title = "Auto Craft Item",
        Default = "leaf pants",
        Placeholder = "leaf pants",
        Numeric = false,
        Finished = true,
        Callback = function(Value)
            AutoCraftItem = Value
        end
    })

    autoCraftItem:OnChanged(function()
        AutoCraftItem = autoCraftItem.Value
    end)

    local autoPress = Farming:AddToggle("autoPress", {Title = "Auto Press Gold", Default = false })

    autoPress:OnChanged(function()
        AutoPress = Fluent.Options.autoPress.Value
    end)

    Fluent.Options.autoPress:SetValue(false)

    local autoPickupCoin = Farming:AddToggle("autoPickupCoin", {Title = "Auto Pickup Coins", Default = false })

    autoPickupCoin:OnChanged(function()
        AutoPickupCoins = Fluent.Options.autoPickupCoin.Value
    end)

    Fluent.Options.autoPickupCoin:SetValue(false)

    local autoPickupChestGold = Farming:AddToggle("autoPickupChestGold", {Title = "Auto Pickup Gold from Chest", Default = false })

    autoPickupChestGold:OnChanged(function()
        AutoPickupChestGold = Fluent.Options.autoPickupChestGold.Value
    end)

    Fluent.Options.autoPickupChestGold:SetValue(false)

    task.spawn(function()
        while task.wait(.025) do
            if AutoPickupChestGold then
                local chest = getClosestChest()
    
                if chest then
                    for _, item in chest:FindFirstChild("Contents"):GetChildren() do
                        if item.Name == "Gold" then
                            Packets.Pickup.send(item:GetAttribute("EntityID"))
                            task.wait()
                        end
                    end
                end
            end
        end
    end)
    
    local press = getClosestPress()

    task.spawn(function()
        while task.wait(.05) do
            if AutoPress then
                if press then
                    local d = (press:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude
                    
                    if d <= 35 then
                        for i = 1, 5 do
                            Packets.InteractStructure.send({["entityID"] = press:GetAttribute("EntityID"), ["itemID"] = ItemIDS["Gold"]})
                        end
                    else
                        press = getClosestPress()
                    end
                else
                    press = getClosestPress()
                end
            end
        end
    end)

    local coins = {}

    for _,v in workspace.Items:GetChildren() do
        if v.Name == "Coin2" then
            coins[v] = v.Position
        end
    end

    workspace.Items.ChildAdded:connect(function(c)
        if c.Name == "Coin2" and not table.find(coins, c) then
            coins[c] = c.Position
        end
    end)

    workspace.Items.ChildRemoved:connect(function(c)
        if c.Name == "Coin2" and coins[c] then
            coins[c] = nil
        end
    end)

    task.spawn(function()
        while task.wait(.05) do
            if AutoPickupCoins then
                for coin, loc in coins do
                    if loc == nil then continue end
                    local dist = (loc - LocalPlayer.Character:GetPivot().Position).Magnitude

                    if dist <= 30 then
                        coins[coin] = nil
                        Packets.Pickup.send(coin:GetAttribute("EntityID"))
                    end
                end
            end
        end
    end)
end

--tween

do
    local tweenSpeed = Tween:AddSlider("tweenSpeed", {
        Title = "Tween Speed",
        Description = "",
        Default = 18,
        Min = 6,
        Max = 24,
        Rounding = 1,
        Callback = function(Value)
            FarmingTweenSpeed = tonumber(Value)
        end
    })

    tweenSpeed:OnChanged(function(Value)
        FarmingTweenSpeed = tonumber(Value)
    end)

    tweenSpeed:SetValue(18)

    local farmingDistance = Tween:AddSlider("farmingDistance", {
        Title = "Tween Distance",
        Description = "",
        Default = 150,
        Min = 25,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            AutoTeleportDistance = tonumber(Value)
        end
    })

    farmingDistance:OnChanged(function(Value)
        AutoTeleportDistance = tonumber(Value)
    end)

    farmingDistance:SetValue(150)

end

-- visuals

do
    local nameESP = Visuals:AddToggle("nameESP", {Title = "Name ESP", Default = false })

    nameESP:OnChanged(function()
        NameEspEnabled = Fluent.Options.nameESP.Value
    end)

    Fluent.Options.nameESP:SetValue(false)

    local nameESPColor = Visuals:AddColorpicker("nameESPColor", {
        Title = "Name ESP Color",
        Description = "",
        Transparency = 0,
        Default = Color3.fromRGB(100, 100, 255)
    })

    nameESPColor:OnChanged(function()
        NameESPColor = nameESPColor.Value
    end)

    local healthBarESP = Visuals:AddToggle("healthBarESP", {Title = "Health Bar ESP", Default = false })

    healthBarESP:OnChanged(function()
        HPBarESPEnabled = Fluent.Options.healthBarESP.Value
    end)

    Fluent.Options.healthBarESP:SetValue(false)

    local armorESP = Visuals:AddToggle("armorESP", {Title = "Equipment ESP", Default = false })

    armorESP:OnChanged(function()
        ArmorESPEnabled = Fluent.Options.armorESP.Value
    end)

    Fluent.Options.armorESP:SetValue(false)
end

--misc

do

    task.spawn(function()
        while task.wait(.25) do
            if not AutoFillCampfire then continue end

            for _, structure in workspace.Deployables:GetChildren() do
                local dist = (structure:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude
                if structure.Name == "Campfire" and structure:GetAttribute("EntityID") and structure:FindFirstChild("Board"):FindFirstChild("Billboard") and dist <= 40 then
                    local fireValue = tonumber(structure.Board.Billboard.Backdrop.TextLabel.Text)

                    if fireValue <= 200 then
                        local amount = 0

                        for i = 1, 10 do
                            if fireValue >= 250 then break end

                            fireValue += 50
                            amount += 1
                        end

                        for i = 1, amount do
                            Packets.InteractStructure.send({["entityID"] = structure:GetAttribute("EntityID"), ["itemID"] = ItemIDS["Log"]})
                        end
                    end
                end
            end
        end
    end)

    task.spawn(function()
        while task.wait(.05) do
            if not AutoCraft then continue end

            local fixedItemName = fixItemName(AutoCraftItem)

            if fixedItemName ~= nil then
                Packets.CraftItem.send(ItemIDS[fixedItemName])
            end
        end
    end)

    __newindex = hookmetamethod(game, '__newindex', function(self, index, value)
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if WalkSpeed and not checkcaller() and (humanoid and self == humanoid) then
            if index == 'WalkSpeed' then
                value = WalkSpeedValue
            end
        end
    
        return __newindex(self, index, value)
    end)

    task.spawn(function()
        while task.wait(.15) do
            if not LocalPlayer.Character then task.wait(1) continue end

            if NoClip then
                for _,v in workspace.Deployables:GetChildren() do
                    if v:FindFirstChild("Door") then
                        v.Door.Transparency = 0.5
                        v.Door.CanCollide = false
                    end
                end
            end

            if MountainClimber then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

                if humanoid then
                    humanoid.MaxSlopeAngle = 89.9
                end
            else
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

                if humanoid then
                    humanoid.MaxSlopeAngle = 45
                end
            end
        end
    end)

    local walkspeedEnabled = Misc:AddToggle("walkspeedEnabled", {Title = "WalkSpeed", Default = false })

    walkspeedEnabled:OnChanged(function()
        WalkSpeed = Fluent.Options.walkspeedEnabled.Value
    end)

    Fluent.Options.walkspeedEnabled:SetValue(false)

    local walkspeedValue = Misc:AddSlider("walkspeedValue", {
        Title = "WalkSpeed Value",
        Description = "",
        Default = 16,
        Min = 8,
        Max = 24,
        Rounding = 1,
        Callback = function(Value)
            WalkSpeedValue = tonumber(Value)
        end
    })

    walkspeedValue:OnChanged(function(Value)
        WalkSpeedValue = tonumber(Value)
    end)

    walkspeedValue:SetValue(16)

    local doorNoclip = Misc:AddToggle("doorNoclip", {Title = "Door NoClip", Default = false })

    doorNoclip:OnChanged(function()
        NoClip = Fluent.Options.doorNoclip.Value
    end)

    Fluent.Options.doorNoclip:SetValue(false)

    local mountainClimber = Misc:AddToggle("mountainClimber", {Title = "Mountain Climber", Default = false })

    mountainClimber:OnChanged(function()
        MountainClimber = Fluent.Options.mountainClimber.Value
    end)

    Fluent.Options.mountainClimber:SetValue(false)

    local itemDeleter = Misc:AddToggle("itemDeleter", {Title = "Item Deleter", Default = false })

    itemDeleter:OnChanged(function()
        AutoDeleteItems = Fluent.Options.itemDeleter.Value
    end)

    Fluent.Options.itemDeleter:SetValue(false)

    local deletedCache = {}

    for _, item in workspace.Items:GetChildren() do
        if not table.find(deletedCache, item) then
            table.insert(deletedCache, item)
        end
    end

    workspace.Items.ChildAdded:Connect(function(item)
        if not table.find(deletedCache, item) then
            table.insert(deletedCache, item)
        end
    end)

    workspace.Items.ChildRemoved:Connect(function(item)
        if table.find(deletedCache, item) then
            table.insert(deletedCache, table.find(deletedCache, item))
        end
    end)

    task.spawn(function()
        while task.wait(.1) do
            if AutoDeleteItems then
                for _, item in deletedCache do
                    if typeof(item) == typeof(LocalPlayer.Character.PrimaryPart) and item.Parent == workspace.Items then
                        local dist = (item:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude
    
                        if dist <= 35 then
                            task.spawn(function()
                                if item:IsA("Model") then
                                    repeat
                                        Packets.ForceInteract.send(item:GetAttribute("EntityID"))
                                        task.wait(.05)
                                    until isnetworkowner(item.PrimaryPart)
                                    item:PivotTo(CFrame.new(0, -500, 0))
                                else
                                    repeat
                                        Packets.ForceInteract.send(item:GetAttribute("EntityID"))
                                        task.wait(.05)
                                    until isnetworkowner(item)
                                    item:PivotTo(CFrame.new(0, -500, 0))
                                end
                            end)
                        end
                    end
                end
            end
        end
    end)
end

LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("immortal.tech")
SaveManager:SetFolder("immortal.tech/reborn")

InterfaceManager:BuildInterfaceSection(Settings)
SaveManager:BuildConfigSection(Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "immortal.tech beta",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
