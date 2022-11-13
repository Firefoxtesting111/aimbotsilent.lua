local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Myth's Hub | Hoopz",
	LoadingTitle = "Myth's Hub",
	LoadingSubtitle = "by Myth",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = MythsFolder, -- Create a custom folder for your hub/game
		FileName = ""
	},
        Discord = {
        	Enabled = false,
        	Invite = "", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Myth's Hub",
		Subtitle = "Key System",
		FileName = "MythsKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "jxlhyshSNonmJD5uhYJz"
	}
})

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local ExploitsTab = Window:CreateTab("Exploits", 4483362458) -- Title, Image

local Toggle = MainTab:CreateToggle({
	Name = "Aimbot",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game:GetService("Players").Name = "Players"

function closestHoop()
    local dist,hoop = math.huge
    
    for i,v in next, workspace.Courts:GetChildren() do
        for k,s in next, v:GetChildren() do
            if s:FindFirstChild("Net") and game.Players.LocalPlayer.Character then
                local net = s:FindFirstChild("Net")
                    if net then
                    
                    local magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - net.Position).Magnitude
                    if magnitude < dist then
                        dist = magnitude
                        hoop = net
                    end
                end
            end
        end
    end
    return hoop.Position
end
    for i,v in next, workspace.Courts:GetChildren() do
        if game.Players.LocalPlayer.Character then
            local char = game.Players.LocalPlayer.Character
            if v:IsA("Model") then
               for k,s in next,v:GetChildren() do
                   local net = s:FindFirstChild("Net")
                    if net then
                        local magnitude = (char.HumanoidRootPart.Position - net.Position).Magnitude
                        if magnitude < dist then
                        hoop2 = net
                        dist2 = magnitude 
                       end
                    end
               end
            end
        end
    end
    if dist < dist2 then
        return hoop.Position else return hoop2.Position
    end
end

coroutine.resume(coroutine.create(function()
while task.wait() do
    if game.Players.LocalPlayer.Character then
        local char = game.Players.LocalPlayer.Character
        _G.mag = (char.HumanoidRootPart.Position - closestHoop()).Magnitude * 1.25
        end
    end
end))
coroutine.resume(coroutine.create(function()
while wait(0.1) do
    _G.hoop = closestHoop()
    _G.sp = workspace.CurrentCamera:WorldToViewportPoint(closestHoop()) 
    end
end))

coroutine.resume(coroutine.create(function()
    pcall(function()
    game:GetService("RunService").Stepped:Connect(function()
           if game.Players.LocalPlayer.Character then
               local char = game.Players.LocalPlayer.Character
                local  magnitude = (char.HumanoidRootPart.Position - _G.hoop).Magnitude * 1.3
                if magnitude < 120 and magnitude > 71 then
                    local function round(to_round)
                        local divided = to_round / 5
                        local rounded = 5 * math.floor(divided)
                        return rounded
                    end
                    changed = true
                    game.Players.LocalPlayer.Power.Value = round(magnitude)
                    task.wait(0.05)
                elseif magnitude < 120 and magnitude < 71 then
                    local  magnitude = (char.HumanoidRootPart.Position - _G.hoop).Magnitude * 1.41
                    local function round(to_round)
                        local divided = to_round / 5
                        local rounded = 5 * math.floor(divided)
                        return rounded
                    end
                    changed = true
                    game.Players.LocalPlayer.Power.Value = round(magnitude)
                    task.wait(0.05)
                end
            end
        end)
    end)
end))


local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local method = getnamecallmethod()
    local args = {...}
    
    if method == "GetMouseLocation" then
        return Vector2.new(_G.sp.X, _G.mag)
    end
    return old(self,...)
end)
	end,
})

local Toggle = MainTab:CreateToggle({
	Name = "Walkspeed (Default Set to 18)",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 18
	end,
})

