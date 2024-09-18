local version = game:HttpGet("https://raw.githubusercontent.com/Wattville/Watty-Hub-Public/main/version")
local ESP = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bleh2rich/WattyhubPrestiged/main/ArchivedLibs/esp.lua'),true))()
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/bleh2rich/WattyhubPrestiged/main/ArchivedLibs/UI.lua"))()
local uiTheme = loadstring(game:HttpGet("https://raw.githubusercontent.com/bleh2rich/WattyhubPrestiged/main/ArchivedLibs/UITheme.lua"))()
local uiSaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/bleh2rich/WattyhubPrestiged/main/ArchivedLibs/uiSaveManager.lua"))()

local lplr = game:GetService("Players").LocalPlayer
local wksp = game:GetService("Workspace")
local http = game:GetService("HttpService")
local run = game:GetService("RunService")
local rep = game:GetService("ReplicatedStorage")


local generalChannel = game:GetService("TextChatService"):WaitForChild("TextChannels").RBXGeneral
local protected = {}
local protectedteams = {}
local mouse = lplr:GetMouse()
local farmingstats = lplr.leaderstats.Money.Value


-- Farmkart locals
local Player = Players.LocalPlayer
local BuyKart = Workspace:WaitForChild("BarbStores"):WaitForChild("FarmKart"):WaitForChild("CustomerSeat")
local Karts = Workspace:WaitForChild("Karts")
local RiceFolder = Workspace:WaitForChild("Rice")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")




if not LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE = function(...) return (...) end;
    LPH_JIT_MAX = function(...) return (...) end;
end


local infjump = false
local teleported = false
local walkspeed = 16
local jumppower = 50
local ctrltp = false
local aibarboff = false
local stealheal = false
local bodyspammer = false
local spoofarrest = false
local spoofrent = false
local fly = false
local flyspeed = 0.5
local spamsounds = false
local kartfly = false
local vehicleflyspeed = 5
local autorepair = false
local autorepairtool = "Basic Hammer"
local buildingstorepairtable = {}
local autosickle = false
local autosickletool = "Basic Sickle"
local autochop = false
local autochoptree = {}
local autochoptool = "Basic Axe"
local autofish = false
local autofishtool = "Basic Fishing Net"
local autofishies = {}
local autofarmkart = false
local autovote = false
local autovotesetting = {}
local killbarbs = false
local autoarrest = false
local autoarrestteam = {}
local killplayer = nil
local autosteal = false
local hitman = false
local hitmanplayertarget = nil
local autoheal = false
local autohealplr = nil
local autohealteam = {}
local autorent = false
local autorentteam = {}
local autotrip = false
local autotripteam = {}
local hitbox = false
local hitboxsize = 5
local killaura = false
local silentaim = false
local playertowhitelist = nil
local autohunter = false
local playertohunt = nil
local autohuntteam = {}
local kartwarper = false
local playertowarp = nil
local playertotele = false
local frameplayer = nil
local espmoney = false
local espfish = false
local noplresp = false
local boxes = false
local tracers = false
local names = false
local teamcolors = false


LPH_NO_VIRTUALIZE(function()
function CheckPlayer(plr)
    if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then
        return true
    else
        return false
    end
end
function Teleport(cfr)
    task.spawn(function() -- combine these two for cleanness
        if not teleported and CheckPlayer(lplr) == true then
            teleported = true
            local seated = false
            while not seated do wait()
                local randseat = wksp:FindFirstChild("_VisualMap").RandomSeats:GetChildren()[math.random(1, #wksp:FindFirstChild("_VisualMap").RandomSeats:GetChildren())]:FindFirstChild("Seat")
                if randseat.Occupant == nil then randseat:Sit(lplr.Character.Humanoid) seated = true end
            end
            wait(1)
            if not CheckPlayer(lplr) then teleported = false return end
            lplr.Character.Humanoid.Sit = false
            wait()
                if game:GetService("Players"):FindFirstChild(cfr) and CheckPlayer(game:GetService("Players"):FindFirstChild(cfr)) then
                    lplr.Character.HumanoidRootPart.CFrame = game:GetService("Players"):FindFirstChild(cfr).Character.HumanoidRootPart.CFrame
                elseif typeof(cfr) == "CFrame" then
                    lplr.Character.HumanoidRootPart.CFrame = cfr
                end
            wait(3)
            teleported = false
        end
    end)
end
function GetLaws()
    local laws = {}
    for _,frame in pairs(wksp.LawBoards.LawBoard.SurfaceGui.ScrollingFrame:GetChildren()) do
        if frame.Name ~= "UIListLayout" then
            local value = false
            if frame.Box.Text == "✅" then
                value = true
            end
            laws[frame.Name] = value
        end
    end
    return laws
end
function ForceSit(seat)
    if seat ~= nil then
        lplr.Character:FindFirstChild("Humanoid").Sit = false
        repeat
            if seat.Parent.Parent:FindFirstChild("WorkerSeat") and seat.Parent.Parent:FindFirstChild("WorkerSeat").Occupant == nil and lplr.Team.Name ~= "Leader" then
                return false
            end
            if CheckPlayer(lplr) and rep.IsFlooding.Value == false then
                seat:Sit(lplr.Character.Humanoid)
            else
                return false
            end
            if wksp.Karts:FindFirstChild(lplr.Name) and wksp.Karts:FindFirstChild(lplr.Name):FindFirstChild("VehicleSeat").Occupant then return true end
            for _, notif in pairs(lplr.PlayerGui.PermanentGui.Notifications:GetChildren()) do
                if notif:IsA("TextLabel") then
                    local msg = string.split(notif.Text, " ")
                    if msg[1] == "BOUGHT" or msg[1] == "CONGRATS" or notif.Text == "FULLY HEALED" or notif.Text == "YOU GOT A WHEELCHAIR" or notif.Text == "YOU ALREADY HAVE THIS TOOL" then return true end
                end
            end
            wait()
        until not CheckPlayer(lplr) or seat == nil
        return false
    end
end
function UseToolAt(tool, part, buy)
    local theTool = EquipTool(tool, buy)
    if not theTool then return end
    theTool.Handle.Position = part.Position
    firetouchinterest(theTool.Handle,part,0)
    firetouchinterest(theTool.Handle,part,1)
    theTool:Activate()
end
function EquipTool(name, buy)
    if CheckPlayer(lplr) then
        local split = string.split(name," ")
        for _, tool in pairs(lplr.Character:GetChildren()) do
            if tool:IsA("Tool") then tool.Parent = lplr.Backpack end
        end
        for _, tools in pairs(lplr.Backpack:GetChildren()) do
            if tools:IsA("Tool") and tools.Name == name then
                tools.Parent = lplr.Character
                return lplr.Character:FindFirstChildOfClass("Tool") -- already in inventory
            elseif tools:IsA("Tool") and string.split(tools.Name," ")[2] == split[2] then
                local tsplit = string.split(tools.Name, " ")
                local numb = 0
                if split[1] == "Best" then numb = 3 elseif split[1] == "Good" then numb = 2 elseif split[1] == "Basic" then numb = 1 end
                if numb > 0 then
                    if tsplit[2] == split[2] then -- same item
                        local stand = wksp.Stores:FindFirstChild(split[2])
                        if split[2] == "Fishing" then stand = wksp.Stores:FindFirstChild("FishingNet") end
                        local namesplit = split[2]
                        if split[3] ~= nil then namesplit = split[2].." "..split[3] end
                        if numb >= 3 and stand.CustomerSeats:FindFirstChild("3") and lplr.Backpack:FindFirstChild("Best "..namesplit) then lplr.Backpack:FindFirstChild("Best "..namesplit).Parent = lplr.Character return lplr.Character:FindFirstChildOfClass("Tool")
                        elseif numb == 3 and stand.CustomerSeats:FindFirstChild("3") then break end
                        if numb >= 2 and stand.CustomerSeats:FindFirstChild("2") and lplr.Backpack:FindFirstChild("Good "..namesplit) then lplr.Backpack:FindFirstChild("Good "..namesplit).Parent = lplr.Character return lplr.Character:FindFirstChildOfClass("Tool")
                        elseif numb == 2 and stand.CustomerSeats:FindFirstChild("2") then break end
                        if numb >= 1 and stand.CustomerSeats:FindFirstChild("1") and lplr.Backpack:FindFirstChild("Basic "..namesplit) then lplr.Backpack:FindFirstChild("Basic "..namesplit).Parent = lplr.Character return lplr.Character:FindFirstChildOfClass("Tool")
                        elseif numb == 1 and stand.CustomerSeats:FindFirstChild("1") then break end
                    end
                end
            end
        end
        if buy == true then
            local tool = StandBuy(name)
            if tool then
                for _, tool in pairs(lplr.Character:GetChildren()) do
                    if tool:IsA("Tool") then tool.Parent = lplr.Backpack end
                end
                if lplr.Backpack:FindFirstChild(name) then
                    lplr.Backpack:FindFirstChild(name).Parent = lplr.Character
                    return lplr.Character:FindFirstChildOfClass("Tool")
                end
            else
                return false
            end
        else
            return false
        end
    end
end
function StandBuy(name)
    if CheckPlayer(lplr) then
        local split = string.split(name, " ")
        local numb = 0
        local worked = false
        if split[1] == "Best" then numb = 3 elseif split[1] == "Good" then numb = 2 elseif split[1] == "Basic" then numb = 1 end -- divide the stands
        if numb > 0  then -- general stands
            for _, stand in pairs(wksp.Stores:GetChildren()) do
                if (stand.Name == split[2]) or (split[2] == "Fishing" and stand.Name == "FishingNet") then
                    if not stand:FindFirstChild("WorkerSeat") then return false end if stand.WorkerSeat.Occupant == nil and lplr.Team.Name ~= "Leader" then return false end
                    if numb >= 3 then
                        if stand.CustomerSeats:FindFirstChild("3") then worked = ForceSit(stand.CustomerSeats:FindFirstChild("3")) break end
                    end
                    if numb >= 2 then
                        if stand.CustomerSeats:FindFirstChild("2") then worked = ForceSit(stand.CustomerSeats:FindFirstChild("2")) break end
                    end
                    if numb >= 1 then
                        if stand.CustomerSeats:FindFirstChild("1") then worked = ForceSit(stand.CustomerSeats:FindFirstChild("1")) break end
                    end
                end
            end
        elseif name == "Heal" or name == "Limbs" or name == "WheelChair" then
            if name == "Wheelchair" then numb = 3 elseif name == "Limbs" then numb = 2 elseif name == "Heal" then
                if wksp.Stores.Doctor.CustomerSeats:FindFirstChild(tostring(numb)) then
                    if wksp.Stores.Doctor.WorkerSeat.Occupant == nil and lplr.Team.Name ~= "Leader" then return false end
                    worked = ForceSit(wksp.Stores.Doctor.CustomerSeats:FindFirstChild(tostring(numb)))
                end
            end
        elseif wksp.BarbStores:FindFirstChild(name) then
            worked = ForceSit(wksp.BarbStores:FindFirstChild(name).CustomerSeat)
        elseif name == "Admission" then
            if wksp:FindFirstChild(name).WorkerSeat.Occupant == nil then return end
            worked = ForceSit(wksp:FindFirstChild(name).CustomerSeat)
        end
        if worked then return true else return false end
    end
end
function TargetPlayer(plr)
    task.spawn(function()
        while killplayer do wait()
            if lplr.PlayerGui:FindFirstChild("PermanentGui") and lplr.PlayerGui:FindFirstChild("PermanentGui"):FindFirstChild("Resign") and lplr.PlayerGui:FindFirstChild("PermanentGui"):FindFirstChild("Resign").Visible then
                game:GetService("ReplicatedService").RemoteEvent:FireServer()
                lplr.PlayerGui:FindFirstChild("PermanentGui"):FindFirstChild("Resign").Visible = false
            end
            if lplr.Team.Name == "Spectating" and CheckPlayer(lplr) then
                lplr.Character.Humanoid:MoveTo(Vector3.new(-197.263, 453.751, -77.9535))
                lplr.Character.Humanoid.MoveToFinished:Wait()
                fireproximityprompt(wksp.SpawnArea.Spawns.BarbarianSpawn.BarbarianNPC.BarbarianTP.ProximityPrompt, 1)
            elseif CheckPlayer(lplr) and CheckPlayer(plr) and lplr.Team.Name ~= "Criminal" and lplr.Team.Name ~= "Spectating" and plr.Team.Name ~= "Spectating" then
                lplr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(0),0) * CFrame.new(0,0,2)
            else
                killplayer = nil
            end
        end
        if CheckPlayer(lplr) then
            lplr.Character.Humanoid.WalkSpeed = walkspeed
            lplr.Character.Humanoid:MoveTo(lplr.Character.HumanoidRootPart.Position)
        end
        killplayer = nil
    end)
    task.spawn(function()
        while killplayer do wait()
            if lplr.Team.Name ~= "Spectating" then
                if not CheckPlayer(lplr) or not CheckPlayer(plr) then break end
                Teleport(plr.Name)
            end
            local count = 0
            repeat wait()
                count = count + 1
            until count >= 150 or not CheckPlayer(plr) or not killplayer or not CheckPlayer(lplr)
        end
    end)
end
function ClosestPlayerToMouse()
    local target = nil
    local dist = math.huge
    for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr.Name ~= lplr.Name then
            if CheckPlayer(plr) and CheckPlayer(lplr) and plr.Character.Humanoid.Health ~= 0 then
                local screenpoint = wksp.CurrentCamera:WorldToScreenPoint(plr.Character.HumanoidRootPart.Position)
                local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude

                if check < dist then
                    target = plr
                    dist = check
                end
            end
        end
    end
    return target 
end
function GetKart(karttype, wheel)
    local kart = "Kart"
    kart = karttype
    local prekart = wksp.Karts:FindFirstChild(lplr.Name)
    if prekart and prekart:FindFirstChild("VehicleSeat") and prekart.VehicleSeat.Occupant == nil then
        if CheckPlayer(lplr) and lplr.Character.Humanoid.Health ~= 0 then
            ForceSit(prekart.VehicleSeat)
        else
            return false -- assume player is dead
        end
    elseif prekart and prekart:FindFirstChild("VehicleSeat") and prekart.VehicleSeat.Occupant ~= nil then return wksp.Karts:FindFirstChild(lplr.Name)
    else
        local success, response = pcall(function()
            EquipTool(kart, true):Activate()
            wait(2)
        end)
        if not success then return false end
        if wksp.Karts:FindFirstChild(lplr.Name) then
            repeat wait()
                ForceSit(wksp.Karts:FindFirstChild(lplr.Name):FindFirstChild("VehicleSeat"))
                if not wksp.Karts:FindFirstChild(lplr.Name) then
                    EquipTool(kart, true):Activate()
                end
                if not CheckPlayer(lplr) then
                    return false
                elseif lplr.Character.Humanoid.Health <= 0 then
                    return false
                end
            until wksp.Karts:FindFirstChild(lplr.Name) ~= nil and wksp.Karts:FindFirstChild(lplr.Name):FindFirstChild("VehicleSeat") ~= nil and wksp.Karts:FindFirstChild(lplr.Name):FindFirstChild("VehicleSeat").Occupant ~= nil
        end
    end
    local kart = wksp.Karts:FindFirstChild(lplr.Name)
    if wheel and kart ~= nil then
        if kart:FindFirstChild("FL") then kart:FindFirstChild("FL").Parent = nil end
        if kart:FindFirstChild("FR") then kart:FindFirstChild("FR").Parent = nil end
        if kart:FindFirstChild("BL") then kart:FindFirstChild("BL").Parent = nil end
        if kart:FindFirstChild("BR") then kart:FindFirstChild("BR").Parent = nil end
    end
end
function PlayerFly(vfly)
    repeat wait() until CheckPlayer(lplr) and mouse
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
    local T = lplr.Character.HumanoidRootPart
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0
    local function FLY()
        local BG = Instance.new('BodyGyro') local BV = Instance.new('BodyVelocity') BG.P = 9e4 BG.Parent = T BV.Parent = T BG.maxTorque = Vector3.new(9e9, 9e9, 9e9) BG.cframe = T.CFrame BV.velocity = Vector3.new(0, 0, 0) BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        spawn(function()
            repeat wait()
                if not vfly and lplr.Character:FindFirstChildOfClass('Humanoid') then lplr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then SPEED = 50 elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then SPEED = 0 end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then BV.velocity = ((wksp.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((wksp.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - wksp.CurrentCamera.CoordinateFrame.p)) * SPEED lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then BV.velocity = ((wksp.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((wksp.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - wksp.CurrentCamera.CoordinateFrame.p)) * SPEED
                else BV.velocity = Vector3.new(0, 0, 0) end
                BG.cframe = wksp.CurrentCamera.CoordinateFrame
            until fly == false
            BG:Destroy() BV:Destroy() CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0} lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0} SPEED = 0
            if lplr.Character:FindFirstChildOfClass('Humanoid') then lplr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false end
        end)
    end
    flyKeyDown = mouse.KeyDown:Connect(function(KEY)
        if KEY:lower() == 'w' then CONTROL.F = (vfly and flyspeed)
        elseif KEY:lower() == 's' then CONTROL.B = - (vfly and flyspeed)
        elseif KEY:lower() == 'a' then CONTROL.L = - (vfly and flyspeed)
        elseif KEY:lower() == 'd' then CONTROL.R = (vfly and flyspeed)
        elseif QEfly and KEY:lower() == 'e' then CONTROL.Q = (vfly and flyspeed)*2
        elseif QEfly and KEY:lower() == 'q' then CONTROL.E = -(vfly and flyspeed)*2 end
        pcall(function() wksp.CurrentCamera.CameraType = Enum.CameraType.Track end)
    end)
    flyKeyUp = mouse.KeyUp:Connect(function(KEY)
        if KEY:lower() == 'w' then CONTROL.F = 0
        elseif KEY:lower() == 's' then CONTROL.B = 0
        elseif KEY:lower() == 'a' then CONTROL.L = 0
        elseif KEY:lower() == 'd' then CONTROL.R = 0
        elseif KEY:lower() == 'e' then CONTROL.Q = 0
        elseif KEY:lower() == 'q' then CONTROL.E = 0
        end
    end)
    FLY()
end
function VehicleFly(vfly)
    repeat wait() until CheckPlayer(lplr) and mouse
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
    if not wksp.Karts:FindFirstChild(lplr.Name) then return end
    local T
    if wksp.Karts:FindFirstChild(lplr.Name):FindFirstChild("Root") then T = game:GetService("Workspace").Karts:FindFirstChild(lplr.Name).Root else return end
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0
    local function FLY()
        local BG = Instance.new('BodyGyro') local BV = Instance.new('BodyVelocity') BG.P = 9e4 BG.Parent = T BV.Parent = T BG.maxTorque = Vector3.new(9e9, 9e9, 9e9) BG.cframe = T.CFrame BV.velocity = Vector3.new(0, 0, 0) BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        spawn(function()
            repeat wait()
                if not vfly and lplr.Character:FindFirstChildOfClass('Humanoid') then lplr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then SPEED = 50 elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then SPEED = 0 end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then BV.velocity = ((wksp.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((wksp.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - wksp.CurrentCamera.CoordinateFrame.p)) * SPEED lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then BV.velocity = ((wksp.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((wksp.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - wksp.CurrentCamera.CoordinateFrame.p)) * SPEED
                else BV.velocity = Vector3.new(0, 0, 0) end
                BG.cframe = wksp.CurrentCamera.CoordinateFrame
            until lplr.Character.Humanoid.Sit == false
            BG:Destroy() BV:Destroy() CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0} lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0} SPEED = 0
            if lplr.Character:FindFirstChildOfClass('Humanoid') then lplr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false end
        end)
    end
    flyKeyDown = mouse.KeyDown:Connect(function(KEY)
        if KEY:lower() == 'w' then CONTROL.F = (vfly and vehicleflyspeed)
        elseif KEY:lower() == 's' then CONTROL.B = - (vfly and vehicleflyspeed)
        elseif KEY:lower() == 'a' then CONTROL.L = - (vfly and vehicleflyspeed)
        elseif KEY:lower() == 'd' then CONTROL.R = (vfly and vehicleflyspeed)
        elseif QEfly and KEY:lower() == 'e' then CONTROL.Q = (vfly and vehicleflyspeed)*2
        elseif QEfly and KEY:lower() == 'q' then CONTROL.E = - (vfly and vehicleflyspeed)*2 end
        pcall(function() wksp.CurrentCamera.CameraType = Enum.CameraType.Track end)
    end)
    flyKeyUp = mouse.KeyUp:Connect(function(KEY)
        if KEY:lower() == 'w' then CONTROL.F = 0
        elseif KEY:lower() == 's' then CONTROL.B = 0
        elseif KEY:lower() == 'a' then CONTROL.L = 0
        elseif KEY:lower() == 'd' then CONTROL.R = 0
        elseif KEY:lower() == 'e' then CONTROL.Q = 0
        elseif KEY:lower() == 'q' then CONTROL.E = 0
        end
    end)
    FLY()
end
end)();


LPH_NO_VIRTUALIZE(function()
game:GetService("TextChatService").OnIncomingMessage = function(msg)
    if msg.TextSource then
        local checkmsg = string.split(msg.Text, " ")
        local plr = game:GetService("Players"):GetPlayerByUserId(msg.TextSource.UserId)

        if string.lower(checkmsg[1]) == "!kill" and hitman and hitmanplayertarget == nil then -- Basic checks and sees if the player is using the prefix
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if string.lower(v.Name) == string.lower(checkmsg[2]) or string.lower(v.DisplayName) == string.lower(checkmsg[2]) then -- If the target is a valid player
                    if CheckPlayer(v) and v.Team.Name ~= "Barbarian" and v.Team.Name ~= "Criminal" and v.Team.Name ~= "Spectating" and v ~= lplr and not v.Character:FindFirstChildOfClass("ForceField") and table.find(protected, v.UserId) == nil and table.find(protectedteams, v.Team.Name) == nil then
                        hitmanplayertarget = v
                    --else
                        --generalChannel:SendAsync('--------------------------------------------------------------------------- [WATTY HUB] You cannot kill someone that has a forcefield, or is on Criminal, Barbarian, or Spectator team.')
                    end
                end
            end
        end
    end
end end)();


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    run.RenderStepped:Connect(function()
        if CheckPlayer(lplr) then lplr.Character.Humanoid.JumpPower = jumppower end
        if walkspeed ~= 0 and walkspeed ~= 16 and CheckPlayer(lplr) then
            lplr.Character.Humanoid.WalkSpeed = walkspeed
        end
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr.Name ~= lplr.Name then
                if hitbox then
                    if CheckPlayer(plr) and plr.Character:FindFirstChild("HumanoidRootPart").Size ~= Vector3.new(hitboxsize,hitboxsize,hitboxsize) then
                        pcall(function()
                            plr.Character.HumanoidRootPart.Size = Vector3.new(hitboxsize,hitboxsize,hitboxsize)
                            plr.Character.HumanoidRootPart.CanCollide = false
                            plr.Character.HumanoidRootPart.Transparency = 0.75
                        end)
                    end
                else
                    if CheckPlayer(plr) and plr.Character:FindFirstChild("HumanoidRootPart").Size ~= Vector3.new(2,2,1) then
                        pcall(function()
                            plr.Character.HumanoidRootPart.Size = Vector3.new(2,2,1) -- Sets targets humanoidrootpart back to default
                            plr.Character.HumanoidRootPart.CanCollide = false
                            plr.Character.HumanoidRootPart.Transparency = 1
                        end)
                    end
                end
                if killaura then
                    if CheckPlayer(plr) and CheckPlayer(lplr) and plr.Character.Humanoid.Health > 0 and lplr:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position) <= 15 then
                        local tool = lplr.Character and lplr.Character:FindFirstChildOfClass("Tool")
                        if tool and tool:FindFirstChild("Handle") then
                            tool:Activate()
                            for _,part in next, plr.Character:GetChildren() do
                                if part:IsA("BasePart") then
                                    firetouchinterest(tool.Handle,part,0)
                                    firetouchinterest(tool.Handle,part,1)
                                end
                            end
                        end
                    end
                end
                if killplayer and plr == killplayer then
                    if CheckPlayer(plr) and CheckPlayer(lplr) and plr.Character.Humanoid.Health > 0 and lplr:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position) <= 15 then
                        for _,toolitem in pairs(lplr.Character:GetChildren()) do
                            if toolitem:IsA("Tool") and not toolitem:FindFirstChild("SwordScript") then toolitem.Parent = lplr.Backpack end
                        end
                        local tool = false
                        for _,sword in pairs(lplr.Backpack:GetChildren()) do
                            if sword:FindFirstChild("SwordScript") then
                                sword.Parent = lplr.Character
                                tool = lplr.Character and lplr.Character:FindFirstChild(sword.Name)
                                break
                            end
                        end
                        if lplr.Character:FindFirstChildOfClass("Tool") then
                            tool = lplr.Character and lplr.Character:FindFirstChildOfClass("Tool")
                        end
                        if tool and tool:FindFirstChild("Handle") then
                            tool:Activate()
                            for _,part in next, plr.Character:GetChildren() do
                                if part:IsA("BasePart") then
                                    firetouchinterest(tool.Handle,part,0)
                                    firetouchinterest(tool.Handle,part,1)
                                end
                            end
                        end
                    end
                end
                if wksp.CouncilHouse:FindFirstChild("COUNCILONLY") then
                    wksp.CouncilHouse:FindFirstChild("COUNCILONLY").Parent = nil
                end
                if wksp._VisualMap.GuardBase.GuardCollision:FindFirstChild("GUARDONLY") then
                    wksp._VisualMap.GuardBase.GuardCollision:FindFirstChild("GUARDONLY").Parent = nil
                end
                if wksp.LeaderTower:FindFirstChild("LEADERONLY") then
                    wksp.LeaderTower:FindFirstChild("LEADERONLY").Parent = nil
                end
            end
        end
    end)
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(0.2)
        if autorepair then
            for _, building in pairs(buildingstorepairtable) do
                if building == "Stores" then
                    for _,stand in pairs(wksp.Stores:GetChildren()) do
                        if autorepair ~= true then break end
                        if stand.Breakable.HealthGui.Enabled and CheckPlayer(lplr) then
                            UseToolAt(autorepairtool, stand.Breakable, true)
                        end
                    end
                end
                if building == "Gate" then
                    if wksp.Gate.Door.HealthGui.Enabled or wksp.Gate.Broken.Union.Transparency == 0 then
                        if autorepair == true and CheckPlayer(lplr) then
                            UseToolAt(autorepairtool, wksp.Gate.Door, true)
                        end
                    end
                end
                if building == "JailGate" then
                    if wksp.JailGate.FrontDoor.Breakable.HealthGui.Enabled or wksp.JailGate.FrontDoor.Broken.Union.Transparency == 0 then -- Checks if store jail repairing
                        if autorepair == true and CheckPlayer(lplr) then 
                            UseToolAt(autorepairtool, wksp.JailGate.FrontDoor.Breakable, true)
                        end
                    end
                end
                if building == "Houses" then
                    for _,house in pairs(wksp.Houses:GetChildren()) do
                        if autorepair ~= true then break end
                        if house ~= nil and house:FindFirstChild("Outline") ~= nil then
                            if house.Outline:FindFirstChild("HealthGui") ~= nil then
                                if house.Outline.HealthGui.Enabled or house.Level.Value == 0 and CheckPlayer(lplr) then
                                    UseToolAt(autorepairtool, house.Door, true)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(0.05)
        if autosickle then
            for _,rice in pairs(wksp.Rice:GetChildren()) do
                if autosickle ~= true then break end
                if rice and rice:FindFirstChild("PhysicalRice") and rice:FindFirstChild("PhysicalRice"):FindFirstChild("Middle") and CheckPlayer(lplr) then
                    for index,choppable in pairs(rice.PhysicalRice:GetChildren()) do
                        if autosickle ~= true then break end
                        if choppable:IsA("Part") and choppable.Name ~= "Chopped" then
                            repeat
                                if choppable then
                                    UseToolAt(autosickletool, choppable, true)
                                end
                                wait(0.2)
                                if choppable.Name == "Middle" and choppable:FindFirstChild("Mesh") == nil then break end
                            until not choppable or not CheckPlayer(lplr) or not autosickle or choppable.Name == "Chopped"
                        end
                    end
                end
            end
        end
    end 
end)(); end)


spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(0.2)
        if autochop then
            for _,tree in pairs(wksp.Trees:GetChildren()) do
                if table.find(autochoptree, tree.Name) ~= nil then
                    if tree:FindFirstChild("PhysicalTree") then
                        if tree.PhysicalTree:FindFirstChild("Middle") and not tree:FindFirstChild("Owner") then
                            if tree:FindFirstChild("Health") then
                                if autochop == false then break end
                                repeat
                                    if autochop == false then break end
                                    if tree:FindFirstChild("PhysicalTree") and CheckPlayer(lplr) then
                                        UseToolAt(autochoptool, tree.PhysicalTree.Middle, true)
                                    end
                                    wait(0.2)
                                until not tree or not tree:FindFirstChild("Health") or tree.Health.Value <= 0 or not tree:FindFirstChild("PhysicalTree")
                            end
                        end
                    end
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait()
        if stealheal then
            for _,plr in pairs(game:GetService("Teams").Doctor:GetPlayers()) do
                if CheckPlayer(plr) and CheckPlayer(lplr) and plr ~= lplr and plr.Team == game.Teams.Doctor then
                    if plr.Character:FindFirstChild("Bandage") and plr.Character:FindFirstChild("Bandage"):FindFirstChild("Handle") then
                        firetouchinterest(lplr.Character.HumanoidRootPart, plr.Character.Bandage.Handle, 0)
                        firetouchinterest(lplr.Character.HumanoidRootPart, plr.Character.Bandage.Handle, 1)
                    end
                end 
            end
        end
    end
end)(); end)


local fishingtool local autofishiesplaceholder local autofishplaceholder local autofishtoolplaceholder
task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(0.2)
        if autofarmkart then
--// Get Tool \\--
function GetTool(Name)
    local Tool = Player.Character and Player.Character:FindFirstChild(Name) or Player.Backpack:FindFirstChild(Name)
    if Tool and Player.Character then
        Tool.Parent = Player.Character
        task.wait()
        return Tool
    end
end

--// Get Rice \\--
function GetRice()
    for _, Rice in next, RiceFolder:GetChildren() do
        local Model = Rice:FindFirstChildOfClass("Model")
        if Model and Model.PrimaryPart and Rice:FindFirstChild("Health") and Rice.Health.Value > 0 and Rice:FindFirstChild("Reward") and Rice.Reward.Value > 0 then
            return Rice, Model.PrimaryPart
        end
    end
end

--// Use Kart \\--
function UseKart(Kart)
    task.wait()
    if Kart.Name == Player.Name then
        -- Sickles
        local Sickles = {Kart:WaitForChild("LeftSickle"), Kart:WaitForChild("RightSickle")}
        -- Farm Rice
        while Kart.Parent == Karts and task.wait() do
            -- Sit
            if Kart:FindFirstChild("VehicleSeat") and Kart.VehicleSeat.Occupant ~= Player.Character.Humanoid then
                Kart.VehicleSeat:Sit(Player.Character.Humanoid)
            end
            -- Rice
            local Rice, Part = GetRice()
            if Rice and Kart.PrimaryPart then
                Kart:SetPrimaryPartCFrame(Part.CFrame * CFrame.new(0, 5, -3))
                for _, Sickle in next, Sickles do
                    firetouchinterest(Sickle, Part, 0)
                    firetouchinterest(Sickle, Part, 1)
                end
            end
        end
    end
end

--// Get Kart \\--
while true do
    if not Karts:FindFirstChild(Player.Name) then
        local Tool = GetTool("FarmKart")
        local Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
        if Humanoid and Humanoid.Health <= 0 then
            RemoteEvent:FireServer("Respawn")
        elseif Tool then
            Tool:Activate()
        else
            BuyKart:Sit(Player.Character.Humanoid)
        end
    else
        UseKart(Karts[Player.Name])
    end
    task.wait(2.5)
end
                    if wksp.Stores.FishingNet.CustomerSeats:FindFirstChild("2") == nil and wksp.Stores.FishingNet.Buttons:FindFirstChild("2") and lplr.leaderstats.Money.Value >= 100 and rep.Approval.Value >= 40 then
                        lplr.Character.Humanoid.Jump = true
                        wait(1)
                        Teleport(CFrame.new(wksp.Stores.FishingNet.Buttons:FindFirstChild("2").Button.Position + Vector3.new(5,5,0)))
                        wait(5)
                        fireproximityprompt(wksp.Stores.FishingNet.Buttons:FindFirstChild("2").Button.ProximityPrompt, 1)
                        wait(3)
                        fishingtool = "Good Fishing Net"
                    end
                    if wksp.Stores.FishingNet.CustomerSeats:FindFirstChild("3") == nil and wksp.Stores.FishingNet.Buttons:FindFirstChild("3") and lplr.leaderstats.Money.Value >= 500 and rep.Approval.Value >= 60 then
                        lplr.Character.Humanoid.Jump = true
                        wait(1)
                        Teleport(CFrame.new(wksp.Stores.FishingNet.Buttons:FindFirstChild("3").Button.Position + Vector3.new(5,5,0)))
                        wait(5)
                        fireproximityprompt(wksp.Stores.FishingNet.Buttons:FindFirstChild("3").Button.ProximityPrompt, 1)
                        wait(3)
                        fishingtool = "Best Fishing Net"
                    end
                    if not CheckPlayer(lplr) then break end
                    if wksp.Stores.FishingNet.Buttons:FindFirstChild("1") then fishingtool = "Basic Fishing Net" end
                    if wksp.Stores.FishingNet.CustomerSeats:FindFirstChild("1") then fishingtool = "Basic Fishing Net" end
                    if wksp.Stores.FishingNet.CustomerSeats:FindFirstChild("2") then fishingtool = "Good Fishing Net" end
                    if wksp.Stores.FishingNet.CustomerSeats:FindFirstChild("3") then fishingtool = "Best Fishing Net" end
                    if lplr.Character:FindFirstChild(fishingtool) == nil and lplr.Backpack:FindFirstChild(fishingtool) == nil then
                        if not CheckPlayer(lplr) then return end
                        if rep.IsFlooding.Value == true then repeat wait(1) until rep.IsFlooding.Value == false end
                        lplr.Character.Humanoid.Jump = true
                        StandBuy(fishingtool)
                        wait(5)
                    end
                    local kart = false
                    if CheckPlayer(lplr) and lplr.Character.Humanoid.Health ~= 0 then
                        kart = GetKart("FarmKart", true)
                    end
                    if kart == false and rep.IsFlooding.Value == true then
                        repeat wait(1) until rep.IsFlooding.Value == false
                    end
                    if autofarmkart == false then break end
                    if kart and kart:FindFirstChild("RightSickle") and kart:FindFirstChild("LeftSickle") and kart:FindFirstChild("VehicleSeat") then
                        if lplr.PlayerGui.PermanentGui.Event:FindFirstChild("EventLabel") then
                            for _, council in pairs(lplr.PlayerGui.PermanentGui.Event:GetChildren()) do
                                if council.Text == "COUNCIL STARTING: CAST YOUR VOTE" then
                                    kart.VehicleSeat.CFrame = wksp.CouncilHouse.No.CFrame + Vector3.new(0,3,0)
                                    wait(1)
                                    fireproximityprompt(wksp.CouncilHouse.No.ProximityPrompt, 1)
                                    wait(3)
                                    council.Text = "WATTY HUB ON TOP"
                                end
                            end
                        end
                        if CheckPlayer(lplr) and lplr.Character.Humanoid.Health ~= 0 and kart and kart:FindFirstChild("RightSickle") and kart:FindFirstChild("LeftSickle") and kart:FindFirstChild("VehicleSeat") and rice and rice:FindFirstChild("PhysicalRice") and rice:FindFirstChild("PhysicalRice"):FindFirstChild("Middle") then
                            local v = rice.PhysicalRice.Middle
                            autofish = true
                            autofishtool = fishingtool
                            autofishies = {"Shark"}
                            kart.RightSickle.CFrame = v.CFrame + Vector3.new(0, 1, 0)
                            kart.RightSickle.Orientation = Vector3.new(90,0,0)
                            kart.LeftSickle.CFrame = v.CFrame + Vector3.new(0, 1, 0)
                            kart.LeftSickle.Orientation = Vector3.new(90,0,0)
                            firetouchinterest(kart.RightSickle, v, 0)
                            firetouchinterest(kart.LeftSickle, v, 0)
                            firetouchinterest(kart.RightSickle, v, 1)
                            firetouchinterest(kart.LeftSickle, v, 1)
                            if kart.RightSickle.Position.X > 144 then
                                kart.VehicleSeat.CFrame = CFrame.new(205.329, 37.4998, 256.938)
                            elseif kart.RightSickle.Position.X > -60 then
                                kart.VehicleSeat.CFrame = CFrame.new(40.5395, 49.4998, 259.347)
                            elseif kart.RightSickle.Position.X < -60 then
                                kart.VehicleSeat.CFrame = CFrame.new(-124.398, 37.4999, 257.493)
                            end
                            wait()
                        end
                    end
                end
            end
            local kart = false
            if CheckPlayer(lplr) and lplr.Character.Humanoid.Health ~= 0 then
                kart = GetKart("FarmKart" , true)
            end
            if kart and kart:FindFirstChild("VehicleSeat") then
                kart.VehicleSeat.CFrame = CFrame.new(40.5395, 49.4998, 259.347)
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(0.2)
        if autofish then
            for _,spawn in pairs(wksp.FishSpawns:GetChildren()) do
                if spawn:FindFirstChild("Fish") then
                    for _,fish in pairs(spawn.Fish:GetChildren()) do
                        if CheckPlayer(lplr) and table.find(autofishies, fish.Name) ~= nil and fish:FindFirstChild("Health") and fish:FindFirstChild("Root") and autofish then
                            repeat 
                                if autofish == false then break end
                                if fish:FindFirstChild("Root") then
                                    UseToolAt(autofishtool, fish.Root, true)
                                end
                                wait(1)
                            until fish == nil or fish:FindFirstChild("Health") == nil or fish.Health.Value <= 0 or not fish:FindFirstChild("Root") or not autofish
                        end
                    end
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function() -- add auto priortization
    while true do wait(0.2)
        if autoheal and CheckPlayer(lplr) and lplr.Team.Name == "Doctor" then
            for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if autohealplr and autohealplr ~= "" and autoheal then
                    if string.lower(plr.Name) == string.lower(autohealplr) or string.lower(plr.DisplayName) == string.lower(autohealplr) then
                        if lplr ~= plr and CheckPlayer(plr) and CheckPlayer(lplr) and plr.Character.Humanoid.Health < 100 and plr.Character.Humanoid.Health > 0 then
                            repeat
                                if autoheal == false then break end
                                if CheckPlayer(plr) and CheckPlayer(lplr) then
                                    UseToolAt("Bandage", plr.Character.Torso, false)
                                end
                                wait(.2)
                            until CheckPlayer(plr) == false or plr.Character.Humanoid.Health == 100 or plr.Character.Humanoid.Health <= 0 or CheckPlayer(lplr) == false
                        end
                    end
                end
            end
            local priorityteam = 1 local teams = {"Peasant", "Barbarian", "Civilian", "Janitor", "Jester", "Landlord", "Doctor", "Guard", "Council", "Leader"}
            for _, team in pairs(autohealteam) do
                if table.find(teams, team) ~= nil and table.find(teams, team) > priorityteam then
                    for _, teamPlr in pairs(game.Teams:FindFirstChild(team):GetPlayers()) do
                        if CheckPlayer(teamPlr) and teamPlr.Character.Humanoid.Health < 100 then
                            priorityteam = table.find(teams, team)
                        end
                    end
                end
            end
            local team = teams[priorityteam]
            for _, teamPlr in pairs(game.Teams:FindFirstChild(team):GetPlayers()) do
                if CheckPlayer(teamPlr) and table.find(autohealteam, teamPlr.Team.Name) ~= nil and autoheal and lplr ~= teamPlr and teamPlr.Character and CheckPlayer(lplr) and teamPlr.Character.Humanoid.Health < 100 and teamPlr.Character.Humanoid.Health > 0 then
                    repeat
                        if autoheal == false then break end
                        if CheckPlayer(teamPlr) and CheckPlayer(lplr) then
                            UseToolAt("Bandage", teamPlr.Character.Torso, false)
                        end
                        wait(.2)
                    until CheckPlayer(teamPlr) == false or teamPlr.Character.Humanoid.Health == 100 or teamPlr.Character.Humanoid.Health <= 0 or CheckPlayer(lplr) == false
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(.2)
        if autoarrest then
            for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if CheckPlayer(plr) and CheckPlayer(lplr) and plr.stats.Arrestable.Value then
                    if table.find(autoarrestteam, plr.Team.Name) then
                        UseToolAt("Handcuffs", plr.Character.HumanoidRootPart, false)
                    end
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(3)
        if autovote then
            if (GetLaws()["10"] == true and lplr.Team.Name == "Guard") or lplr.Team.Name == "Leader" or lplr.Team.Name == "Council Member" then
                if wksp.CouncilHouse.Board.SurfaceGui.LawStatus.Text ~= "COUNCIL ADJOURNED" and CheckPlayer(lplr) then
                    if table.find(autovotesetting, wksp.CouncilHouse.Board.SurfaceGui.Prompt.Text) then
                        Teleport(CFrame.new(wksp.CouncilHouse.Yes.Position + Vector3.new(0,5,0)))
                        wait(1.5)
                        fireproximityprompt(workspace.CouncilHouse.Yes.ProximityPrompt)
                    else
                        Teleport(CFrame.new(wksp.CouncilHouse.No.Position + Vector3.new(0,5,0)))
                        wait(0.5)
                        fireproximityprompt(wksp.CouncilHouse.No.ProximityPrompt)
                    end
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(.5)
        if autorent and CheckPlayer(lplr) and lplr.Team.Name == "Landlord" then
            for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if CheckPlayer(plr) and table.find(autorentteam, plr.Team.Name) and plr.stats.RentDue.Value > 0 and CheckPlayer(lplr) then
                     UseToolAt("Collect Rent", plr.Character.HumanoidRootPart, false) 
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(1)
        if autotrip and CheckPlayer(lplr) and lplr.Team.Name == "Jester" then
            for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if CheckPlayer(plr) and CheckPlayer(lplr) and table.find(autotripteam, plr.Team.Name) then
                    UseToolAt("BananaPeel", plr.Character.HumanoidRootPart, false) 
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(0.2)
        if autosteal then
            if CheckPlayer(lplr) and lplr.Team.Name == "Barbarian" then
                if lplr.PlayerGui:FindFirstChild("PermanentGui") and lplr.PlayerGui.PermanentGui:FindFirstChild("Notifications") then
                    for _, notification in pairs(lplr.PlayerGui.PermanentGui.Notifications:GetChildren()) do
                        if notification:IsA("TextLabel") and notification.Text == "STOLE FOOD (10/10)" then
                            local endloop = false 
                            repeat wait(0.2)
                                UseToolAt("steal food", wksp.FoodSupplies.BarbSupply.FoodLevel, false)
                                for _,notif in pairs(lplr.PlayerGui.PermanentGui.Notifications:GetChildren()) do
                                    if notif:IsA("TextLabel") and notif.Text == "SUCCESSFULLY RETURNED FOOD: +$100" then
                                    endloop = true
                                    end
                                end
                            until endloop == true or not CheckPlayer(lplr) or not autosteal
                            wait(30)
                            break
                        end
                    end
                end
                UseToolAt("steal food", wksp.FoodSupplies.TownSupply.Silo, false)
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(.2)
        if autohunter then
            for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if not autohunter then break end
                if string.lower(playertohunt) == string.lower(plr.Name) or string.lower(playertohunt) == string.lower(plr.DisplayName) then
                    if CheckPlayer(plr) and killplayer == nil then
                        killplayer = plr
                        TargetPlayer(plr)
                        repeat wait() until not CheckPlayer(plr) or plr.Character.Humanoid.Health == 0 or not autohunter or not killplayer
                        killplayer = nil
                        wait(.2)
                    end
                end
                if not autohunter then break end
                if CheckPlayer(plr) and table.find(autohuntteam, plr.Team.Name) and killplayer == nil then
                    killplayer = plr
                    TargetPlayer(plr)
                    repeat wait() until not CheckPlayer(plr) or plr.Character.Humanoid.Health == 0 or not autohunter or not killplayer
                    killplayer = nil
                    wait(.2)
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(.2)
        if killbarbs then
            for _,plr in pairs(game:GetService("Teams").Barbarian:GetPlayers()) do
                if CheckPlayer(plr) and CheckPlayer(lplr) and lplr.Team.Name == "Guard" and plr.Character.HumanoidRootPart.Position.Z > 258 and plr.Character.HumanoidRootPart.Position.X < 350 and killplayer == nil then
                    killplayer = plr
                    TargetPlayer(plr)
                    repeat wait() until not CheckPlayer(plr) or plr.Character.Humanoid.Health == 0 or not killbarbs or not killplayer
                    killplayer = nil
                    wait(.2)
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(5)
        if aibarboff then
            for _,barb in pairs(wksp.Barbarians:GetChildren()) do
                for _, v in pairs(barb:GetChildren()) do
                    if v.ClassName ~= "Part" and v.ClassName ~= "Humanoid" and v.ClassName ~= "Accessory" and v.ClassName ~= "BodyColors" then
                        v.Parent = nil
                    end
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait()
        if bodyspammer then
            if CheckPlayer(lplr) then
                if lplr.Team.Name == "Spectating" then
                    lplr.Character.Humanoid:MoveTo(Vector3.new(-193.292, 453.751, -12.8732))
                    lplr.Character.Humanoid.MoveToFinished:Wait()
                    fireproximityprompt(wksp.SpawnArea.Spawns.PeasantSpawn.PeasantNPC.PeasantTP.ProximityPrompt,1)
                end
                wait(0.2)
                lplr.Character.Humanoid.Health = 0
                wait(1)
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(1)
        if hitman and CheckPlayer(lplr) then
            for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if hitman and CheckPlayer(lplr) and hitmanplayertarget == plr and CheckPlayer(plr) and killplayer == nil then
                    killplayer = plr
                    TargetPlayer(plr)
                    repeat wait() until not CheckPlayer(plr) or plr.Character.Humanoid.Health == 0 or not hitman or not killplayer
                    killplayer = nil
                    generalChannel:SendAsync("--------------------------------------------------------------------------- [WATTY HUB] Kill on "..plr.Name.." was successful!")
                    wait(3)
                    if CheckPlayer(lplr) then
                        Teleport(CFrame.new(257.195, 107.876, 256.301)) 
                    end
                    wait(3)
                    hitmanplayertarget = nil
                end
            end
        end
    end
end)(); end)
task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(2)
        if hitman and killplayer == nil and hitmanplayertarget == nil then
            generalChannel:SendAsync('--------------------------------------------------------------------------- [WATTY HUB] Type in chat a player to kill using !kill [player]')
            wait(20)
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(5)
        if spoofrent and CheckPlayer(lplr) then
            if lplr.Character.HumanoidRootPart:FindFirstChild("RentGui"):FindFirstChild("Title") then lplr.Character.HumanoidRootPart.RentGui.Title.Parent = nil end
            if lplr.Character.HumanoidRootPart:FindFirstChild("RentGui"):FindFirstChild("Amount") then lplr.Character.HumanoidRootPart.RentGui.Amount.Parent = nil end
        end
        if spoofarrest and CheckPlayer(lplr) then
            if lplr.Character.HumanoidRootPart:FindFirstChild("ArrestGui"):FindFirstChild("Title") then lplr.Character.HumanoidRootPart.ArrestGui.Title.Parent = nil end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(1)
        if spamsounds then
            for i,v in pairs(wksp:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
            end
        end
    end
end)(); end)


task.spawn(function() LPH_NO_VIRTUALIZE(function()
    while true do wait(10)
        local count = 0
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if CheckPlayer(plr) and plr.Character.HumanoidRootPart:FindFirstChild("HeadGui") and plr.Character.HumanoidRootPart.HeadGui:FindFirstChild("Status") then
                local status = plr.Character.HumanoidRootPart.HeadGui:FindFirstChild("Status") 
                if status.Text == "Mod" or status.Text == "Admin" or status.Text == "AznDibs" then
                    ui:SetWatermarkVisibility(true)
                    ui:SetWatermark('Mod is in your game!')
                    count = count + 1
                end
            end
            wait()
        end
        if count == 0 then
            ui:SetWatermarkVisibility(false)
        else count = 0 end
    end
end)(); end)


LPH_NO_VIRTUALIZE(function()
mouse.Button1Down:Connect(function()
    if silentaim and CheckPlayer(lplr) and lplr.Character:FindFirstChild("Bow") then
        local count = 0
        repeat wait(.1)
            count = count + 1
            local Bow = lplr.Character:FindFirstChild("Bow")
            if Bow and Bow:FindFirstChild("RemoteEvent") then
                Bow.RemoteEvent:FireServer("fire",(ClosestPlayerToMouse().Character.PrimaryPart.Position - Bow.Handle.Position).unit,Bow.Handle.Position)
            end
        until count == 10
    elseif silentaim and CheckPlayer(lplr) and lplr.Character:FindFirstChild("Gun") then
        local count = 0
        repeat wait(.1)
            count = count + 1
            local Gun = lplr.Character:FindFirstChild("Gun")
            if Gun and Gun:FindFirstChild("RemoteEvent") then
                Gun.RemoteEvent:FireServer("fire",(ClosestPlayerToMouse().Character.PrimaryPart.Position - Gun.Handle.Position).unit,Gun.Handle.Position)
            end
        until count == 10
    end
end)
lplr.CharacterAdded:Connect(function(character) -- Activates 2nd death and forward
    character:WaitForChild("Humanoid").Died:Connect(function()
        if autofarmkart then
            wait(1)
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
        end
        if hitman or autohunter then
            local placeholder = killplayer
            killplayer = nil
            wait(1)
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
            wait(1)
            lplr.Character.Humanoid:MoveTo(Vector3.new(-197.289, 453.751, -79.3937))
            lplr.Character.Humanoid.MoveToFinished:Wait()
            fireproximityprompt(wksp.SpawnArea.Spawns.BarbarianSpawn.BarbarianNPC.BarbarianTP.ProximityPrompt, 1) -- Goes to barb team
            killplayer = placeholder
        end
        if killbarbs or autoarrest then
            local placeholder = killplayer
            killplayer = nil
            wait(1)
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
            wait(1)
            lplr.Character.Humanoid:MoveTo(Vector3.new(-190.756, 453.751, -79.4974))
            lplr.Character.Humanoid.MoveToFinished:Wait()
            fireproximityprompt(wksp.SpawnArea.Spawns.GuardSpawn.GuardNPC.GuardTP.ProximityPrompt, 1) -- Goes to barb team
            killplayer = placeholder
        end
    end)
end)
lplr.Character:WaitForChild("Humanoid").Died:Connect(function() -- Activates only on 1st death
    if autofarmkart then
        wait(1)
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
    end
    if hitman or autohunter then
        local placeholder = killplayer
            killplayer = nil
        wait(1)
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
        wait(1)
        lplr.Character.Humanoid:MoveTo(Vector3.new(-197.289, 453.751, -79.3937))
        lplr.Character.Humanoid.MoveToFinished:Wait()
        fireproximityprompt(wksp.SpawnArea.Spawns.BarbarianSpawn.BarbarianNPC.BarbarianTP.ProximityPrompt, 1) -- Goes to barb team
        killplayer = placeholder
    end
    if killbarbs or autoarrest then
        local placeholder = killplayer
        killplayer = nil
        wait(1)
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Respawn")
        wait(1)
        lplr.Character.Humanoid:MoveTo(Vector3.new(-190.756, 453.751, -79.4974))
        lplr.Character.Humanoid.MoveToFinished:Wait()
        fireproximityprompt(wksp.SpawnArea.Spawns.GuardSpawn.GuardNPC.GuardTP.ProximityPrompt, 1) -- Goes to barb team
        killplayer = placeholder
    end
end)
end)();







local Window = ui:CreateWindow({
    Title = "Watty Hub Prestiged | GRG v3.3c | Repaired Version",
    Center = true, 
    AutoShow = true,
})
local Tabs = {
    Player = Window:AddTab("Player"), 
    Farming = Window:AddTab("Farming"),
    Team = Window:AddTab("Team"),
    Combat = Window:AddTab("Combat"),
    Teleportation = Window:AddTab("Teleports"),
    Visual = Window:AddTab("Visuals"),
    ["UI Settings"] = Window:AddTab("Config"),
}


local Humanoid = Tabs.Player:AddLeftGroupbox("Humanoid Exploits")
Humanoid:AddToggle('infJump', {
    Text = 'Infinite Jump',
    Default = false,
    Tooltip = 'Allows you to jump on air',
})
Toggles.infJump:OnChanged(function()
    infjump = Toggles.infJump.Value
    game:GetService("UserInputService").JumpRequest:Connect(function() -- Sends function everytime player presses jump button
        infjump = Toggles.infJump.Value
        if infjump and not hitman and not autohunter then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") -- Makes player jump
        end
        if CheckPlayer(lplr) then lplr.Character.Humanoid.JumpPower = jumppower end
    end)
end)
Humanoid:AddToggle('ctrlTP', {
    Text = 'Control + Click Teleport',
    Default = false,
    Tooltip = 'Allows you to teleport by holding down the control key and clicking',
})
Toggles.ctrlTP:OnChanged(function()
    ctrltp = Toggles.ctrlTP.Value
end)
mouse.Button1Down:connect(function()
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and mouse.Target and ctrltp then 
        Teleport(CFrame.new(mouse.Hit.p))
    end
end)
Humanoid:AddToggle('stealHeals', {
    Text = 'Steal Heals',
    Default = false,
    Tooltip = 'Forces doctors to heal you',
})
Toggles.stealHeals:OnChanged(function()
    stealheal = Toggles.stealHeals.Value
end)
Humanoid:AddToggle('bodySpammer', {
    Text = 'Body Spammer',
    Default = false,
    Tooltip = 'Spams dead bodies',
})
Toggles.bodySpammer:OnChanged(function()
    bodyspammer = Toggles.bodySpammer.Value
end)
Humanoid:AddToggle('playerFly', {
    Text = 'Player Fly',
    Default = false,
    Tooltip = 'allows you to fly',
})
Toggles.playerFly:OnChanged(function()
    fly = Toggles.playerFly.Value
    if fly then PlayerFly(true) end
end)
Humanoid:AddSlider('Walkspeed', {
    Text = 'Walkspeed Modifier',
    Default = 16,
    Min = 16,
    Max = 32,
    Rounding = 0,

    Compact = false,
})
Options.Walkspeed:OnChanged(function()
    walkspeed = Options.Walkspeed.Value
end)
Humanoid:AddSlider('jumpPower', {
    Text = 'Jump Power Modifier',
    Default = 50,
    Min = 50,
    Max = 75,
    Rounding = 0,

    Compact = false,
})
Options.jumpPower:OnChanged(function()
    jumppower = Options.jumpPower.Value
end)

local Game = Tabs.Player:AddRightGroupbox("Game Exploits")
Game:AddToggle('aiBarbOff', {
    Text = 'Reduce AI Barb Damage',
    Default = false,
    Tooltip = 'Reduces that damage you take from the bots',
})
Toggles.aiBarbOff:OnChanged(function()
    aibarboff = Toggles.aiBarbOff.Value
end)
Game:AddToggle('spoofRent', {
    Text = 'Spoof Rent',
    Default = false,
    Tooltip = 'Players cannot see how much rent you owe',
})
Toggles.spoofRent:OnChanged(function()
    spoofrent = Toggles.spoofRent.Value
end)
Game:AddToggle('spoofArrest', {
    Text = 'Spoof Arrest',
    Default = false,
    Tooltip = 'Players cannot see that you are wanted',
})
Toggles.spoofArrest:OnChanged(function()
    spoofarrest = Toggles.spoofArrest.Value
end)
Game:AddToggle('spamSounds', {
    Text = 'Spam Sounds',
    Default = false,
    Tooltip = 'Spams all the game sounds (serversided)',
})
Toggles.spamSounds:OnChanged(function()
    spamsounds = Toggles.spamSounds.Value
end)

local Kart = Tabs.Player:AddLeftGroupbox("Kart Exploits")
Kart:AddButton('Kart Fly', function()
    VehicleFly(true)
end)
Kart:AddSlider('kartFlySpeed', {
    Text = 'Kart Fly Speed Modifier',
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 0,

    Compact = false,
})
Options.kartFlySpeed:OnChanged(function()
    vehicleflyspeed = Options.kartFlySpeed.Value
end)

local Player = Tabs.Player:AddRightGroupbox("Player Exploits")
Player:AddButton('Hide Identity', function()
    LPH_NO_VIRTUALIZE(function()
        if lplr.Character and lplr.Character.HumanoidRootPart then -- Checks if player is alive
            for i, v in pairs(lplr.Character:GetChildren()) do
                if v.ClassName == "Accessory" then
                    if v:FindFirstChild("Handle") then
                        v.Handle.Parent = nil -- Deletes all of their Accessories
                    end
                end
            end
            for i, v in pairs(lplr.Character.HumanoidRootPart:GetDescendants()) do
                if v.ClassName == "TextLabel" then
                    if v.Name ~= "BackgroundHealth" and v.Name ~= "BackgroundHunger" and v.Name ~= "Health" and v.Name ~= "Hunger" then
                        v:Destroy() -- Destroys players name and tags
                    end
                end
            end
            lplr.Character.Head.face.Parent = nil -- Destroys face icon
        end
    end)();
end)
Player:AddButton('Anti AFK', function()
    LPH_NO_VIRTUALIZE(function()
        local GC = getconnections or get_signal_cons -- Gets the connections
        if GC then
            for i,v in pairs(GC(lplr.Idled)) do -- Disables the connections
                if v["Disable"] then
                    v["Disable"](v)
                elseif v["Disconnect"] then
                    v["Disconnect"](v)
                end
            end
        else
            lplr.Idled:Connect(function() -- If no connections then activates [manual] afk
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end)();
end)
Player:AddButton('Rejoin Server', function()
    LPH_NO_VIRTUALIZE(function()
        local Rejoin = coroutine.create(function()
            local Success, ErrorMessage = pcall(function()
                game:GetService("TeleportService"):Teleport(game.PlaceId, lplr)
            end)
            if ErrorMessage and not Success then
                warn(ErrorMessage)
            end
        end)
        coroutine.resume(Rejoin)
    end)();
end)
Player:AddButton('Server Hop', function()
    LPH_NO_VIRTUALIZE(function()
        local PlaceID = game.PlaceId local AllIDs = {} local foundAnything = "" local actualHour = os.date("!*t").hour local Deleted = false
        local File = pcall(function() AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json")) end)
        if not File then table.insert(AllIDs, actualHour) writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs)) end
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end)();
end)


local Hammer = Tabs.Farming:AddLeftGroupbox("Hammer Exploits")
Hammer:AddToggle('autoRepair', {
    Text = 'Auto Repair',
    Default = false,
    Tooltip = 'Repairs the damaged buildings',
})
Toggles.autoRepair:OnChanged(function()
    autorepair = Toggles.autoRepair.Value
end)
Hammer:AddDropdown('repairToolToUse', {
    Values = { 'Basic Hammer', 'Good Hammer', 'Best Hammer' },
    Default = 1,
    Multi = false,
    Text = 'Tool To Use',
    Tooltip = 'Tool to use when auto repair is active',
})
Options.repairToolToUse:OnChanged(function()
    autorepairtool = Options.repairToolToUse.Value
end)
Hammer:AddDropdown('repairBuildings', {
    Values = { 'Stores', 'Gate', 'JailGate', 'Houses' },
    Default = 1,
    Multi = true,
    Text = 'Buildings To Repair',
    Tooltip = 'The buildings auto repair will target',
})
Options.repairBuildings:OnChanged(function()
    buildingstorepairtable = {}
    for key, value in next, Options.repairBuildings.Value do
        table.insert(buildingstorepairtable, key)
    end
end)

local Sickle = Tabs.Farming:AddRightGroupbox("Sickle Exploits")
Sickle:AddToggle('autoSickle', {
    Text = 'Auto Farm Rice',
    Default = false,
    Tooltip = 'Farms rice with a sickle',
})
Toggles.autoSickle:OnChanged(function()
    autosickle = Toggles.autoSickle.Value
end)
Sickle:AddDropdown('sickleToolToUse', {
    Values = { 'Basic Sickle', 'Good Sickle', 'Best Sickle' },
    Default = 1,
    Multi = false,
    Text = 'Tool To Use',
    Tooltip = 'Tool to use when auto farm rice is active',
})
Options.sickleToolToUse:OnChanged(function()
    autosickletool = Options.sickleToolToUse.Value
end)

local Axe = Tabs.Farming:AddLeftGroupbox("Axe Exploits")
Axe:AddToggle('autoChop', {
    Text = 'Auto Chop Trees',
    Default = false,
    Tooltip = 'Automatically chops selected trees',
})
Toggles.autoChop:OnChanged(function()
    autochop = Toggles.autoChop.Value
end)
Axe:AddDropdown('chopToolToUse', {
    Values = { 'Basic Axe', 'Good Axe', 'Best Axe' },
    Default = 1,
    Multi = false,
    Text = 'Tool To Use',
    Tooltip = 'Tool to use when auto chop trees is active',
})
Options.chopToolToUse:OnChanged(function()
    autochoptool = Options.chopToolToUse.Value
end)
Axe:AddDropdown('chopTrees', {
    Values = { 'OG_Money', 'OG_Fruit', 'OG_Normal', 'Present1', 'Present2', 'Present3', 'Present4' },
    Default = 1,
    Multi = true,
    Text = 'Trees To Chop',
    Tooltip = 'The trees auto chop trees will target',
})
Options.chopTrees:OnChanged(function()
    autochoptree = {}
    for key, value in next, Options.chopTrees.Value do
        table.insert(autochoptree, key)
    end
end)

local Fishing = Tabs.Farming:AddRightGroupbox("Fishing Net Exploits")
Fishing:AddToggle('autoFish', {
    Text = 'Auto Catch Fish',
    Default = false,
    Tooltip = 'Automatically catches the selected fish',
})
Toggles.autoFish:OnChanged(function()
    autofish = Toggles.autoFish.Value
end)
Fishing:AddDropdown('fishingToolToUse', {
    Values = { 'Basic Fishing Net', 'Good Fishing Net', 'Best Fishing Net' },
    Default = 1,
    Multi = false,
    Text = 'Tool To Use',
    Tooltip = 'Tool to use when auto catch fish is active',
})
Options.fishingToolToUse:OnChanged(function()
    autofishtool = Options.fishingToolToUse.Value
end)
Fishing:AddDropdown('autoFishies', {
    Values = { 'Plankton', 'Small', 'Medium', 'LongMedium', 'CashCrab', 'Shark' },
    Default = 1,
    Multi = true,
    Text = 'Fish To Catch',
    Tooltip = 'The fish auto catch fish will target',
})
Options.autoFishies:OnChanged(function()
    autofishies = {}
    for key, value in next, Options.autoFishies.Value do
        table.insert(autofishies, key)
    end
end)

local Farmkart = Tabs.Farming:AddLeftGroupbox("Farmkart Exploits")
Farmkart:AddToggle('autoFarmkart', {
    Text = 'Auto Farmkart + ',
    Default = false,
    Tooltip = 'Automatically farms rice with bonus features',
})
Toggles.autoFarmkart:OnChanged(function()
    autofarmkart = Toggles.autoFarmkart.Value
    if autofarmkart then
        local GC = getconnections or get_signal_cons -- Gets the connections
        if GC then
            for i,v in pairs(GC(lplr.Idled)) do -- Disables the connections
                if v["Disable"] then
                    v["Disable"](v)
                elseif v["Disconnect"] then
                    v["Disconnect"](v)
                end
            end
        else
            lplr.Idled:Connect(function() -- If no connections then activates [manual] afk
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end
end)
Farmkart:AddToggle('birdEyeView', {
    Text = 'Birds Eye View',
    Default = false,
    Tooltip = 'Gives you a better view',
})
Toggles.birdEyeView:OnChanged(function()
    local cam = wksp.Camera
    if Toggles.birdEyeView.Value then
        cam.CameraType = Enum.CameraType.Scriptable
        cam.CFrame = CFrame.new(38.6783447, 304.869873, -4.63689423, -0.999996305, -0.00201916555, 0.00183400512, 0, 0.672351599, 0.740231991, -0.00272774696, 0.740229249, -0.672349)
    else
        cam.CameraType = Enum.CameraType.Custom
    end
end)

local Vote = Tabs.Farming:AddRightGroupbox("Auto Vote Exploits")
Vote:AddToggle('autoVote', {
    Text = 'Auto Vote',
    Default = false,
    Tooltip = 'Automatically votes for you',
})
Toggles.autoVote:OnChanged(function()
    autovote = Toggles.autoVote.Value
end)
Vote:AddDropdown('autoVoteLaws', {
    Values = { 'Should guards pay taxes?', 'Should peasants be admitted to town for free?', 'Should violence be allowed in the town?', 'Should civilians be able to riot?', 'Should only guards purchase weapons?', 'Council Members can be arrested?', 'Should council members pay taxes?', 'Should doctors pay taxes?', 'Should healthcare be free?', 'Should guards be allowed to vote?', 'Can criminals post bail? (leader gets 50% of $)' },
    Default = 0,
    Multi = true,
    Text = 'Law Settings (SELECTED = YES)',
    Tooltip = 'Laws to vote for when auto vote is active',
})
Options.autoVoteLaws:OnChanged(function()
    autovotesetting = {}
    for key, value in next, Options.autoVoteLaws.Value do
        table.insert(autovotesetting, key)
    end
end)


local Guard = Tabs.Team:AddLeftGroupbox("Guard Exploits")
Guard:AddToggle('killBarbs', {
    Text = 'Kill Barbs In Town',
    Default = false,
    Tooltip = 'Automatically targets and attempts to kill any barbarians in the town',
})
Toggles.killBarbs:OnChanged(function()
    killbarbs = Toggles.killBarbs.Value
end)
Guard:AddDivider()
Guard:AddToggle('autoArrest', {
    Text = 'Auto Arrest',
    Default = false,
    Tooltip = 'Automatically arrests any wanted citizens',
})
Toggles.autoArrest:OnChanged(function()
    autoarrest = Toggles.autoArrest.Value
end)
Guard:AddDropdown('teamsToArrest', {
    Values = { 'Council Member', 'Landlord', 'Guard', 'Doctor', 'Jester', 'Janitor', 'Civilian', 'Peasant' },
    Default = 1,
    Multi = true,
    Text = 'Teams To Arrest',
    Tooltip = 'Teams auto arrest will target',
})
Options.teamsToArrest:OnChanged(function()
    autoarrestteam = {}
    for key, value in next, Options.teamsToArrest.Value do
        table.insert(autoarrestteam, key)
    end
end)

local Barb = Tabs.Team:AddRightGroupbox("Barbarian Exploits")
Barb:AddToggle('autoStealFood', {
    Text = 'Auto Steal Food',
    Default = false,
    Tooltip = 'Automatically steals the villages food',
})
Toggles.autoStealFood:OnChanged(function()
    autosteal = Toggles.autoStealFood.Value
end)
local lastval
Barb:AddToggle('Hitman', {
    Text = 'Hitman',
    Default = false,
    Tooltip = 'Allows other people to kill others using !kill',
})
Toggles.Hitman:OnChanged(function()
    hitman = Toggles.Hitman.Value
    lastval = stealheal
    if hitman and lastval == false then stealheal = true end
    if hitman == false and lastval == false then stealheal = false end
end)
Barb:AddDropdown('teamsToProtect', {
    Values = { 'Leader', 'Council Member', 'Landlord', 'Guard', 'Doctor', 'Jester', 'Janitor', 'Civilian', 'Peasant' },
    Default = 0,
    Multi = true,
    Text = 'Teams To Protect From Hitman',
    Tooltip = 'Teams hitman will not target',
})
Options.teamsToProtect:OnChanged(function()
    protectedteams = {}
    for key, value in next, Options.teamsToProtect.Value do
        table.insert(protectedteams, key)
    end
end)
Barb:AddInput('playerToProtect', {
    Default = 'Enter A Player Here',
    Numeric = false,
    Finished = false,

    Text = 'Player To Protect From Hitman',
    Tooltip = 'Individual player hitman will not target',

    Placeholder = 'Enter A Player Here',
})
Options.playerToProtect:OnChanged(function()
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if string.lower(plr.Name) == string.lower(Options.playerToProtect.Value) or string.lower(plr.DisplayName) == string.lower(Options.playerToProtect.Value) then
            table.insert(protected, plr.UserId)
        end
    end
end)

local Doctor = Tabs.Team:AddLeftGroupbox("Doctor Exploits")
Doctor:AddToggle('autoHeal', {
    Text = 'Auto Heal Players',
    Default = false,
    Tooltip = 'Automatically heals other players'
})
Toggles.autoHeal:OnChanged(function()
    autoheal = Toggles.autoHeal.Value
end)
Doctor:AddInput('playerToHeal', {
    Default = 'Enter A Player Here',
    Numeric = false,
    Finished = false,

    Text = 'Player To Heal',
    Tooltip = 'Individual player auto heal will target',

    Placeholder = 'Enter A Player Here',
})
Options.playerToHeal:OnChanged(function()
    autohealplr =  Options.playerToHeal.Value
end)
Doctor:AddDropdown('teamsToHeal', {
    Values = { 'Leader', 'Council Member', 'Landlord', 'Guard', 'Doctor', 'Jester', 'Janitor', 'Civilian', 'Peasant', 'Barbarian' },
    Default = 0,
    Multi = true,
    Text = 'Teams To Heal',
    Tooltip = 'Teams auto heal will target',
})
Options.teamsToHeal:OnChanged(function()
    autohealteam = {}
    for key, value in next, Options.teamsToHeal.Value do
        table.insert(autohealteam, key)
    end
end)

local Landlord = Tabs.Team:AddRightGroupbox("Landlord Exploits")
Landlord:AddToggle('autoRent', {
    Text = 'Auto Take Rent',
    Default = false,
    Tooltip = 'Automatically takes rent from other players'
})
Toggles.autoRent:OnChanged(function()
    autorent = Toggles.autoRent.Value
end)
Landlord:AddDropdown('teamsRent', {
    Values = { 'Council Member', 'Landlord', 'Guard', 'Doctor', 'Jester', 'Janitor', 'Civilian', 'Peasant' },
    Default = 1,
    Multi = true,
    Text = 'Teams To Take Rent From',
    Tooltip = 'Teams auto rent will target',
})
Options.teamsRent:OnChanged(function()
    autorentteam = {}
    for key, value in next, Options.teamsRent.Value do
        table.insert(autorentteam, key)
    end
end)

local Jester = Tabs.Team:AddLeftGroupbox("Jester Exploits")
Jester:AddToggle('autoTrip', {
    Text = 'Auto Trip Others',
    Default = false,
    Tooltip = 'Automatically trips other players with bananas'
})
Toggles.autoTrip:OnChanged(function()
    autotrip = Toggles.autoTrip.Value
end)
Jester:AddDropdown('teamsToTrip', {
    Values = { 'Leader', 'Council Member', 'Landlord', 'Guard', 'Doctor', 'Jester', 'Janitor', 'Civilian', 'Peasant' },
    Default = 1,
    Multi = true,
    Text = 'Teams To Trip',
    Tooltip = 'Teams auto trip others will target',
})
Options.teamsToTrip:OnChanged(function()
    autotripteam = {}
    for key, value in next, Options.teamsToTrip.Value do
        table.insert(autotripteam, key)
    end
end)


local Combat = Tabs.Combat:AddLeftGroupbox("Combat Exploits")
Combat:AddToggle('Hitboxes', {
    Text = 'Expand Hitboxes',
    Default = false,
    Tooltip = 'Makes it easier to hit other players'
})
Toggles.Hitboxes:OnChanged(function()
    hitbox = Toggles.Hitboxes.Value
end)
Combat:AddSlider('hitboxSize', {
    Text = 'Hitbox Size',
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 0,

    Compact = false,
})
Options.hitboxSize:OnChanged(function()
    hitboxsize = Options.hitboxSize.Value
end)
Combat:AddToggle('killAura', {
    Text = 'Kill Aura',
    Default = false,
    Tooltip = 'Attacks any nearby enemies'
})
Toggles.killAura:OnChanged(function()
    killaura = Toggles.killAura.Value
end)
Combat:AddToggle('silentAim', {
    Text = 'Silent Aim',
    Default = false,
    Tooltip = 'Bullets follow enemies'
})
Toggles.silentAim:OnChanged(function()
    silentaim = Toggles.silentAim.Value
end)

local Hunter = Tabs.Combat:AddRightGroupbox("Hunter Exploits")
Hunter:AddToggle('autoHunter', {
    Text = 'Kill Player',
    Default = false,
    Tooltip = 'Targets and kills a player'
})
Toggles.autoHunter:OnChanged(function()
    autohunter = Toggles.autoHunter.Value
end)
Hunter:AddInput('playerToHunt', {
    Default = 'Enter A Player Here',
    Numeric = false,
    Finished = false,

    Text = 'Player To Kill',
    Tooltip = 'Individual player kill player will target',

    Placeholder = 'Enter A Player Here',
})
Options.playerToHunt:OnChanged(function()
    playertohunt = Options.playerToHunt.Value
end)
Hunter:AddDropdown('teamsToHunt', {
    Values = { 'Leader', 'Council Member', 'Landlord', 'Guard', 'Doctor', 'Jester', 'Janitor', 'Civilian', 'Peasant' },
    Default = 0,
    Multi = true,
    Text = 'Teams To Kill',
    Tooltip = 'Teams kill player will target',
})
Options.teamsToHunt:OnChanged(function()
    autohuntteam = {}
    for key, value in next, Options.teamsToHunt.Value do
        table.insert(autohuntteam, key)
    end
end)


local Teleportation = Tabs.Teleportation:AddRightGroupbox("Function Teleport Exploits")
Teleportation:AddButton('Teleport To Player', function()
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if string.lower(playertotele) == string.lower(plr.Name) or string.lower(playertotele) == string.lower(plr.DisplayName) then
            if CheckPlayer(plr) then
                Teleport(plr.Name)
            end
        end
    end
end)
Teleportation:AddInput('teleportToPlayer', {
    Default = 'Enter A Player Here',
    Numeric = false,
    Finished = false,

    Text = 'Player To Teleport To',
    Tooltip = 'Individual player to teleport to',

    Placeholder = 'Enter A Player Here',
})
Options.teleportToPlayer:OnChanged(function()
    playertotele = Options.teleportToPlayer.Value
end)

local Seat = Tabs.Teleportation:AddLeftGroupbox("Seat Teleport Exploits")
function newtpseat(name, pos)
    Seat:AddButton(name, function()
        if CheckPlayer(lplr) then
            lplr.Character.HumanoidRootPart.CFrame = pos
        end
    end)
end
newtpseat("Barbarian Rice TP", CFrame.new(65.3058395, -3.23999023, -980.023987, 0.499959469, -0, -0.866048813, 0, 1, -0, 0.866048813, 0, 0.499959469))
newtpseat("Town Rice TP [Teleports Near]", CFrame.new(-5.77159405, 20.7035313, 352.250732, -1, 0, 0, 0, 1, 0, 0, 0, -1))
newtpseat("Kart", CFrame.new(403.231384, 0.760009766, -128.842789, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247))
newtpseat("Farmkart", CFrame.new(318.595337, 0.760009766, 144.975128, -0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, -0.707134247))
newtpseat("Barbarian", CFrame.new(17.2499084, 0.74987793, -901.000061, 1, 0, 0, 0, 1, 0, 0, 0, 1))
newtpseat("Peasant Village", CFrame.new(-58.9500122, 7.6595459, -189.450058, -1, 0, 0, 0, 1, 0, 0, 0, -1))
newtpseat("Arena", CFrame.new(-186.162231, 33.7185059, 42.1336594, 0.0175017118, -0, -0.999846935, 0, 1, -0, 0.999846935, 0, 0.0175017118))
newtpseat("Ally's", CFrame.new(-176.041, 1.85007, 52.2702))
newtpseat("Peasant Admission",  CFrame.new(54.5, 20.75, 251.373993, -1, 0, 0, 0, 1, 0, 0, 0, -1))
newtpseat("Tavern", CFrame.new(-30.6022339, 21.4694672, 414.433319, -0.669180155, 0, 0.743100166, 0, 1, 0, -0.743100166, 0, -0.669180155))
newtpseat("Beach",  CFrame.new(-248.711441, -7.50008631, 419.054535, 0.10454309, 0, 0.994520426, 0, 1, 0, -0.994520426, 0, 0.10454309))
newtpseat("Guard Area", CFrame.new(35.8777809, 21.431181, 447.184845, 1, 0, 0, 0, 1, 0, 0, 0, 1))
newtpseat("Doctor Area", CFrame.new(12.0152979, 22.8184662, 314.085754, 0.99992907, 0, 0.0119122295, 0, 1, 0, -0.0119122295, 0, 0.99992907))
newtpseat("Tools Area [Only Works If Tools Are Bought]", CFrame.new(82.038414, 20.7521305, 346.209503, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247))
newtpseat("Jail", CFrame.new(358.059509, 11.4000692, 321.319763, -0.707134247, 0, -0.707079291, 0, 1, 0, 0.707079291, 0, -0.707134247))

local Rand = Tabs.Teleportation:AddRightGroupbox("Random Teleport Functions")
Rand:AddButton("Random Shack", function()
    local randomnumber = math.random(1,13)
    local number = 1
    for i, v in pairs(wksp.Shacks:GetChildren()) do
        if randomnumber == number then
            lplr.Character.HumanoidRootPart.CFrame = v.Bed.Seat.CFrame
        end
        number = number + 1
    end
end)
Rand:AddButton("Random Bus Stop", function()
    local randomnumber = math.random(1,11)
    local number = 1
    for i, v in pairs(wksp.BusStops:GetChildren()) do
        if randomnumber == number then
            lplr.Character.HumanoidRootPart.CFrame = v.Visual:FindFirstChild("Seat").CFrame
        end
        number = number + 1
    end
end)
Rand:AddButton("Random House", function()
    local randomnumber = math.random(1,28)
    local number = 1
    for i, v in pairs(wksp.Houses:GetChildren()) do
        if randomnumber == number then
            lplr.Character.HumanoidRootPart.CFrame = v.Visual.Bed.Seat.CFrame
        end
        number = number + 1
    end
end)


local Visual = Tabs.Visual:AddLeftGroupbox("ESP Exploits")
ESP:Load()
ESP.options.outOfViewArrows = false
ESP.options.names = false
ESP.options.boxes = false
ESP.options.healthBars = false
ESP.options.healthText = false
ESP.options.distance = false
ESP.options.chams = false
ESP.options.teamColor = true
ESP.options.outOfViewArrowsFilled = false
ESP.options.outOfViewArrowsOutline = false

Visual:AddToggle('Arrows', {
    Text = 'ESP Arrows',
    Default = false,
    Tooltip = 'Creates visual arrows pointing to players'
})
Toggles.Arrows:OnChanged(function()
    ESP.options.outOfViewArrows = Toggles.Arrows.Value
    ESP.options.outOfViewArrowsFilled = Toggles.Arrows.Value
    ESP.options.outOfViewArrowsOutline = Toggles.Arrows.Value
end)
Visual:AddToggle('Names', {
    Text = 'ESP Names',
    Default = false,
    Tooltip = 'Creates visual text displaying the players name'
})
Toggles.Names:OnChanged(function()
    ESP.options.names = Toggles.Names.Value
end)
Visual:AddToggle('Boxes', {
    Text = 'ESP Boxes',
    Default = false,
    Tooltip = 'Creates visual boxes around players'
})
Toggles.Boxes:OnChanged(function()
    ESP.options.boxes = Toggles.Boxes.Value
end)
Visual:AddToggle('HealthBars', {
    Text = 'ESP Health Bars',
    Default = false,
    Tooltip = 'Creates visual health bar near the player'
})
Toggles.HealthBars:OnChanged(function()
    ESP.options.healthBars = Toggles.HealthBars.Value
end)
Visual:AddToggle('HealthText', {
    Text = 'ESP Health Text',
    Default = false,
    Tooltip = 'Creates visual text that displays the players health'
})
Toggles.HealthText:OnChanged(function()
    ESP.options.healthText = Toggles.HealthText.Value
end)
Visual:AddToggle('Distance', {
    Text = 'ESP Distance',
    Default = false,
    Tooltip = 'Creates visual text that displays the players distance'
})
Toggles.Distance:OnChanged(function()
    ESP.options.distance = Toggles.Distance.Value
end)
Visual:AddToggle('Tracers', {
    Text = 'ESP Tracers',
    Default = false,
    Tooltip = 'Creates visual lines that point to players'
})
Toggles.Tracers:OnChanged(function()
    ESP.options.tracers = Toggles.Tracers.Value
end)
Visual:AddToggle('Chams', {
    Text = 'ESP Chams',
    Default = false,
    Tooltip = 'Creates visual lines around the players'
})
Toggles.Chams:OnChanged(function()
    ESP.options.chams = Toggles.Chams.Value
end)

local Frame = Tabs.Visual:AddRightGroupbox("Frame Exploits")
Frame:AddInput('playerToFrame', {
    Default = 'Enter A Player Here',
    Numeric = false,
    Finished = false,

    Text = 'Player To Frame',
    Tooltip = 'Individual player to transform into',

    Placeholder = 'Enter A Player Here',
})
Options.playerToFrame:OnChanged(function()
    pcall(function()
        frameplayer = game:GetService("Players"):GetUserIdFromNameAsync(tostring(Options.playerToFrame.Value))
    end)
end)
Frame:AddButton("Frame Player", function()
    local appearance = game:GetService("Players"):GetCharacterAppearanceAsync(frameplayer)
    if CheckPlayer(lplr) and appearance then
        for i,v in pairs(lplr.Character:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
                v:Destroy()
            end
        end
        if lplr.Character.Head:FindFirstChild("face") then
        lplr.Character.Head.face:Destroy()
        end
        for i,v in pairs(appearance:GetChildren()) do
            if v:IsA("BodyColors") then
                if lplr.Character:FindFirstChild("Left Arm") then
                    lplr.Character["Left Arm"].BrickColor = BrickColor.new(tostring(v.LeftArmColor))
                end
                lplr.Character["Right Arm"].BrickColor = BrickColor.new(tostring(v.RightArmColor))
                lplr.Character.Head.BrickColor = BrickColor.new(tostring(v.HeadColor))
            elseif v:IsA("Accessory") then
                local function AddCustomAccessory(Model, Accessory)
                    Accessory.Parent = Model
                    local HandleAttachment = Accessory.Handle:FindFirstChildOfClass("Attachment") -- Find accessory attachment
                    local CharacterAttachment do -- Find character attachment
                        for _, ac in ipairs(Model:GetDescendants()) do
                            if ac.Name == HandleAttachment.Name and not ac:FindFirstAncestorOfClass("Accessory") then
                                CharacterAttachment = ac
                                break
                            end
                        end
                    end
                    --| Destroy any previous welds.
                    for _, ac in ipairs(Model:GetDescendants()) do
                        if ac.ClassName == "Weld" and ac.Name == "AccessoryWeld" then
                            ac:Destroy()
                        end
                    end
                    --| Replace the weld with a Motor6D instead.
                    local AttachmentWeld = Instance.new("Motor6D")
                    AttachmentWeld.Part0 = CharacterAttachment.Parent
                    AttachmentWeld.Part1 = HandleAttachment.Parent
                    AttachmentWeld.C0 = CharacterAttachment.CFrame
                    AttachmentWeld.C1 = HandleAttachment.CFrame
                    AttachmentWeld.Name = Accessory.Name
                    AttachmentWeld.Parent = Accessory
                end
                AddCustomAccessory(lplr.Character, v)
            end
        end
        if appearance:FindFirstChild("face") then
            appearance.face.Parent = lplr.Character.Head
            else
            local face = Instance.new("Decal")
            face.Face = "Front"
            face.Name = "face"
            face.Texture = "rbxasset://textures/face.png"
            face.Transparency = 0
            face.Parent = lplr.Character.Head
        end
        if lplr.Character.HumanoidRootPart:FindFirstChild("HeadGui") then
            local plrheadgui = lplr.Character.HumanoidRootPart.HeadGui
            plrheadgui.Title.Text = tostring(game:GetService("Players"):GetNameFromUserIdAsync(frameplayer))
            local plr = game:GetService("Players"):GetPlayerByUserId(frameplayer)
            if plr:GetRoleInGroup(5574524) == "fan." then
                plrheadgui.Status.TextColor3 = Color3.fromRGB(99, 95, 98)
                plrheadgui.Status.Text = "fan"
            end
            if lplr.PlayerGui:FindFirstChild("SpectateGui") then
                lplr.PlayerGui.SpectateGui.Button.Visible = true
                lplr.PlayerGui.SpectateGui.Bar:TweenPosition(UDim2.new(0.5, -100, 0.88, -50), "In", "Linear", 0, true)
                lplr.PlayerGui.SpectateGui.Bar.Title.Text = tostring(game:GetService("Players"):GetNameFromUserIdAsync(frameplayer))
            end
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Team ~= game.Teams.Spectating and v.Team ~= game.Teams.Criminal and CheckPlayer(v) and v.Character.HumanoidRootPart:FindFirstChild("HeadGui") and v ~= lplr then
                    local vheadgui = v.Character.HumanoidRootPart.HeadGui
                    if vheadgui:FindFirstChild("Health") and vheadgui:FindFirstChild("Hunger") and vheadgui:FindFirstChild("BackgroundHealth") and vheadgui:FindFirstChild("BackgroundHunger") then
                        if plrheadgui:FindFirstChild("FakeHealth") then plrheadgui.FakeHealth.Parent = nil end if plrheadgui:FindFirstChild("FakeHunger") then plrheadgui.FakeHunger.Parent = nil end if plrheadgui:FindFirstChild("FakeBackgroundHealth") then plrheadgui.FakeBackgroundHealth.Parent = nil end if plrheadgui:FindFirstChild("FakeBackgroundHunger") then plrheadgui.FakeBackgroundHunger.Parent = nil end
                        local health = vheadgui.Health:Clone()
                        health.Parent = plrheadgui
                        health.Name = "FakeHealth"
                        health.Visible = true
                        local hunger = vheadgui.Hunger:Clone()
                        hunger.Parent = plrheadgui
                        hunger.Name = "FakeHunger"
                        hunger.Visible = true
                        local bhealth = vheadgui.BackgroundHealth:Clone()
                        bhealth.Parent = plrheadgui
                        bhealth.Name = "FakeBackgroundHealth"
                        bhealth.Visible = true
                        local bhunger = vheadgui.BackgroundHunger:Clone()
                        bhunger.Parent = plrheadgui
                        bhunger.Name = "FakeBackgroundHunger"
                        bhunger.Visible = true
                        break
                    end
                end
            end
            -- Reload Character
            local parent = lplr.Character.Parent
            lplr.Character.Parent = nil
            lplr.Character.Parent = parent
        end
    end
end)
Frame:AddButton("Framed Player Is VIP", function()
    if CheckPlayer(lplr) and lplr.Character.HumanoidRootPart:FindFirstChild("HeadGui") then
        local plrheadgui = lplr.Character.HumanoidRootPart.HeadGui
        plrheadgui.Status.TextColor3 = Color3.fromRGB(239, 184, 56)
        plrheadgui.Status.Text = "VIP"
    end
end)



uiTheme:SetLibrary(ui)
uiSaveManager:SetLibrary(ui)

uiTheme:SetFolder('WattyHub')
uiSaveManager:SetFolder('WattyHub/GRGV3')

uiSaveManager:BuildConfigSection(Tabs['UI Settings']) 


uiTheme:ApplyToTab(Tabs['UI Settings'])
