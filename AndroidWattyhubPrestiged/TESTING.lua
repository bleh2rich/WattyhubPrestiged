
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library"))()

-- beginning of functions & locals


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
                        --generalChannel:SendAsync('Cant kill, forcefield')
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
            for _,rice in pairs(wksp.Rice:GetChildren()) do
                if rice and rice:FindFirstChild("PhysicalRice") and rice:FindFirstChild("PhysicalRice"):FindFirstChild("Middle") then
                    if lplr.Team.Name ~= "Leader" or CheckPlayer(lplr) == false then break end
                    if wksp.Stores.FishingNet.CustomerSeats:FindFirstChild("1") == nil and wksp.Stores.FishingNet.Buttons:FindFirstChild("1") then
                        lplr.Character.Humanoid.Jump = true
                        wait(1)
                        Teleport(CFrame.new(wksp.Stores.FishingNet.Buttons:FindFirstChild("1").Button.Position + Vector3.new(5,5,0)))
                        wait(5)
                        fireproximityprompt(wksp.Stores.FishingNet.Buttons:FindFirstChild("1").Button.ProximityPrompt, 1)
                        wait(3)
                        fishingtool = "Basic Fishing Net"
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
                    generalChannel:SendAsync("murdered")
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
            generalChannel:SendAsync('murder')
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
				local title = plr.Character.HumanoidRootPart.HeadGui:FindFirstChild("Title") 
                if title.Text == "blehgetsnogirls" or title.Text == "dood3" or title.Text == "lokolkllllllollolkll" then
                    ui:SetWatermarkVisibility(true)
                    ui:SetWatermark('Owner Of Wattyhub Is In Your Game!')
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

-- end of functions & locals
-- END
-- END
-- END
-- END
-- END
-- END
-- END
-- END
-- END
-- END
-- END
-- END




local Window = ArrayField:CreateWindow({
   Name = "Watty Hub Prestiged | GRG v3.3c | Android Edition",
   LoadingTitle = "ArrayField Interface Suite",
   LoadingSubtitle = "by Arrays",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "ArrayField"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
      Actions = {
            [1] = {
                Text = 'Click here to copy the key link <--',
                OnPress = function()
                    print('Pressed')
                end,
                }
            },
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
