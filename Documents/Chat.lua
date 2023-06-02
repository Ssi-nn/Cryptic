--> This one is the hardest one of them all..
--> ...Mainly because I have to do the most work here .. but whatever, who cares.
--> I won't talk to you much in this one because I will be fixing my god awful ass systems.
--> Anyways, here is some cleaner code than 1.1; for your own sakes.

--> Variables <--
local Variables = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Global/Variables.lua", true))()
local Users = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Server/Users.lua", true))()

local Players = game.Players or game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game.ReplicatedStorage or game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local HumanoidRootPart = workspace[LocalPlayer.Name].HumanoidRootPart
local Humanoid = workspace[LocalPlayer.Name].Humanoid

local Prefix = Variables.prefix
local Version = Variables.version

--> Whitelist <--
loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Server/Whitelist.lua", true))()

--> Functions <--
local function Chat(Message, Place)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, Place)
end

local function FindWhitelistedUser(String)
    if (not String) then
        return
    else
        local Found = {}
        for _, Player in ipairs(Players:GetChildren()) do
            if (string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String))) then
                if (table.find(Users, Player.UserId)) then
                    table.insert(Found, Player)
                else
                    return warn("User is not whitelisted.")
                end 
            end
        end
        if (#Found > 0) then
            return Found[1]
        else
            return nil
        end
    end
end

local function FindNormalUser(String)
    if (not String) then
        return
    else
        local Found = {}
        for _, Player in ipairs(Players:GetChildren()) do
            if (string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String))) then
                table.insert(Found, Player)
            end
        end
        if (#Found > 0) then
            return Found[1]
        else
            return nil
        end
    end
end

local function Command(Command)
    return Arg1 == string.lower(Prefix..Command)
end

local function LocalHandler(Message)
    local Split = Message:split(" ")

    Arg1 = Split[1]
    Arg2 = Split[2]
    Arg3 = Split[3]
    Arg4 = Split[4]

    LocalPlayer = Players.LocalPlayer
    HumanoidRootPart = workspace[LocalPlayer.Name].HumanoidRootPart
    Humanoid = workspace[LocalPlayer.Name].Humanoid

    if (Command("kick")) then
        if (Arg2 == nil or Arg2 == "me") then
            LocalPlayer:Kick("You were kicked by "..LocalPlayer.Name)
        end
    end

    if (Command("version") or Command("scriptversion")) then
        if (getgenv().QWERTYUIOPASDFGHJKLZXCVBNM or getgenv().QAWZSEXDRCFTVGYBHUNJIMKOLP or getgenv().MNBVCXZLKJHGFDSAPOIUYTREWQ) then
            return
        end
        getgenv().QWERTYUIOPASDFGHJKLZXCVBNM = true

        task.wait(3)
        Chat("Running Cryptic "..Version.." by Suno @0526!", "All")

        task.wait(0.5)
        getgenv().QWERTYUIOPASDFGHJKLZXCVBNM = false
    end

    if (Command("flex") or Command("brag") or Command("script")) then
        if (getgenv().QWERTYUIOPASDFGHJKLZXCVBNM or getgenv().QAWZSEXDRCFTVGYBHUNJIMKOLP or getgenv().MNBVCXZLKJHGFDSAPOIUYTREWQ) then
            return
        end
        getgenv().QAWZSEXDRCFTVGYBHUNJIMKOLP = true

        task.wait(3)
        Chat("Cryptic Admin #1! The best trolling admin script, made by Suno @0526", "All")

        task.wait(0.5)
        getgenv().QAWZSEXDRCFTVGYBHUNJIMKOLP = false
    end

    if (Command("edition") or Command("type") or Command("mode")) then
        if (getgenv().QWERTYUIOPASDFGHJKLZXCVBNM or getgenv().QAWZSEXDRCFTVGYBHUNJIMKOLP or getgenv().MNBVCXZLKJHGFDSAPOIUYTREWQ) then
            return
        end
        getgenv().MNBVCXZLKJHGFDSAPOIUYTREWQ = true

        task.wait(3)
        Chat("Cryptic Public Edition by Suno @0526!", "All")

        task.wait(0.5)
        getgenv().MNBVCXZLKJHGFDSAPOIUYTREWQ = false
    end

    if (Command("rocket")) then
        if (Arg2 == nil or Arg2 == "me") then
            local BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Velocity = Vector3.new(0, 25, 0)
            BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyVelocity.P = 500
            BodyVelocity.Parent = Humanoid.RootPart
            
            task.wait(2)
            BodyVelocity:Destroy()
        end
    end

    if (Command("kill")) then
        if (Arg2 == nil or Arg2 == "me") then
            LocalPlayer.Character.Humanoid.Health = 0
        end
    end
    
    if (Command("goto") or Command("to")) then
        local Target = FindNormalUser(Arg2)
        HumanoidRootPart.CFrame = workspace[Target.Name].HumanoidRootPart.CFrame
    end

    if (Command("rj") or Command("rejoin")) then
        if (Arg2 == nil or Arg2 == "me") then
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end
    end
    
    if (Command("freeze") or Command("ice")) then
        if (Arg2 == nil or Arg2 == "me") then
            HumanoidRootPart.Anchored = true
        end
    end

    if (Command("thaw") or Command("unfreeze")) then
        if (Arg2 == nil or Arg2 == "me") then
            HumanoidRootPart.Anchored = false
        end
    end

    if (Command("explode")) then
        if (Arg2 == nil or Arg2 == "me") then
            for i,v in pairs(Humanoid.RootPart:GetChildren()) do
                if v:IsA("BodyAngularVelocity") then
                    v:Destroy()
                end
            end

            local Speed = 75
            local Humanoid = Humanoid
            local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
            local Explosion = Instance.new("Explosion", workspace)

            BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyAngularVelocity.AngularVelocity = Vector3.new(0, Speed, 0)
            BodyAngularVelocity.Parent = Humanoid.RootPart
            Explosion.DestroyJointRadiusPercent = 0
            Explosion.BlastPressure = 10
            Explosion.BlastRadius = 10
            Explosion.Position = HumanoidRootPart.Position

            task.wait(0.25)
            Humanoid.Health = 0  
        end
    end

    if (Command("speed") or Command("walkspeed")) then
        if (Arg2 == nil or Arg2 == "me") then
            local Speed = tonumber(Arg3)
            Humanoid.WalkSpeed = Speed
        end
    end

    if (Command("jumppower") or Command("jpower")) then
        if (Arg2 == nil or Arg2 == "me") then
            local Power = tonumber(Arg3)
            Humanoid.JumpPower = Power
        end
    end

    if (Command("jump")) then
        if (Arg2 == nil or Arg2 == "me") then
            Humanoid:ChangeState("Jumping")
        end
    end

    if (Command("sit")) then
        if (Arg2 == nil or Arg2 == "me") then
            Humanoid.Sit = true
        end
    end
end

local function ServerHandler(Player, Message)
    local Split = Message:split(" ")
    
    Arg1 = Split[1]
    Arg2 = Split[2]
    Arg3 = Split[3]
    Arg4 = Split[4]

    LocalPlayer = Players.LocalPlayer
    HumanoidRootPart = workspace[LocalPlayer.Name].HumanoidRootPart
    Humanoid = workspace[LocalPlayer.Name].Humanoid

    if (Command("sit")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].Humanoid.Sit = true
                end
            end
        elseif (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].Humanoid.Sit = true
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            workspace[Target.Name].Humanoid.Sit = true
        end
    end

    if (Command("jump")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].Humanoid:ChangeState("Jumping")
                end
            end
        elseif (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].Humanoid:ChangeState("Jumping")
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            workspace[Target.Name].Humanoid:ChangeState("Jumping")
        end
    end

    if (Command("jumppower") or Command("jpower")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    local Power = tonumber(Arg3)

                    workspace[Chosen.Name].Humanoid.JumpPower = Power
                end
            end
        elseif (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    local Power = tonumber(Arg3)

                    workspace[Chosen.Name].Humanoid.JumpPower = Power
                end
            end
        else
            local Power = tonumber(Arg3)
            local Target = FindWhitelistedUser(Arg2)

            workspace[Target.Name].Humanoid.JumpPower = Power
        end
    end

    if (Command("speed") or Command("walkspeed")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    local Speed = tonumber(Arg3)

                    workspace[Chosen.Name].Humanoid.WalkSpeed = Speed
                end
            end
        elseif (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    local Speed = tonumber(Arg3)

                    workspace[Chosen.Name].Humanoid.WalkSpeed = Speed
                end
            end
        else
            local Speed = tonumber(Arg3)
            local Target = FindWhitelistedUser(Arg2)

            workspace[Target.Name].Humanoid.WalkSpeed = Speed
        end
    end

    if (Command("kick")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    Chosen:Kick("You were kicked by "..Player.Name)
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            Target:Kick("You were kicked by "..Player.Name)
        end
    end

    if (Command("fling")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))        
                    local BodyVelocity = Instance.new("BodyVelocity")
                    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")

                    BodyVelocity.Velocity = Vector3.new(math.random(-50, 50), math.random(100, 250), math.random(-50, 50))
                    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    BodyVelocity.P = 500
                    BodyVelocity.Parent = workspace[Chosen.Name].Humanoid.RootPart

                    BodyAngularVelocity.AngularVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))
                    BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    BodyAngularVelocity.P = 500
                    BodyAngularVelocity.Parent = workspace[Chosen.Name].Humanoid.RootPart

                    task.wait(2)
                    BodyVelocity:Destroy()
                    BodyAngularVelocity:Destroy()
                end
            end
        elseif (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))        
                    local BodyVelocity = Instance.new("BodyVelocity")
                    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")

                    BodyVelocity.Velocity = Vector3.new(math.random(-50, 50), math.random(100, 250), math.random(-50, 50))
                    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    BodyVelocity.P = 500
                    BodyVelocity.Parent = workspace[Chosen.Name].Humanoid.RootPart

                    BodyAngularVelocity.AngularVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))
                    BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    BodyAngularVelocity.P = 500
                    BodyAngularVelocity.Parent = workspace[Chosen.Name].Humanoid.RootPart

                    task.wait(2)
                    BodyVelocity:Destroy()
                    BodyAngularVelocity:Destroy()
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            local BodyVelocity = Instance.new("BodyVelocity")
            local BodyAngularVelocity = Instance.new("BodyAngularVelocity")

            BodyVelocity.Velocity = Vector3.new(math.random(-50, 50), math.random(100, 250), math.random(-50, 50))
            BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyVelocity.P = 500
            BodyVelocity.Parent = workspace[Target.Name].Humanoid.RootPart

            BodyAngularVelocity.AngularVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))
            BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyAngularVelocity.P = 500
            BodyAngularVelocity.Parent = workspace[Target.Name].Humanoid.RootPart

            task.wait(2)
            BodyVelocity:Destroy()
            BodyAngularVelocity:Destroy()
        end
    end

    if (Command("rocket")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end
        
        if (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    local BodyVelocity = Instance.new("BodyVelocity")

                    BodyVelocity.Velocity = Vector3.new(0, 25, 0)
                    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    BodyVelocity.P = 500
                    BodyVelocity.Parent = workspace[Chosen.Name].Humanoid.RootPart
                    
                    task.wait(2)
                    BodyVelocity:Destroy()
                end
            end
        elseif (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    local BodyVelocity = Instance.new("BodyVelocity")

                    BodyVelocity.Velocity = Vector3.new(0, 25, 0)
                    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    BodyVelocity.P = 500
                    BodyVelocity.Parent = workspace[Chosen.Name].Humanoid.RootPart
                    
                    task.wait(2)
                    BodyVelocity:Destroy()
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            local BodyVelocity = Instance.new("BodyVelocity")

            BodyVelocity.Velocity = Vector3.new(0, 25, 0)
            BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodyVelocity.P = 500
            BodyVelocity.Parent = workspace[Target.Name].Humanoid.RootPart
            
            task.wait(2)
            BodyVelocity:Destroy()
        end
    end

    if (Command("freeze") or Command("ice")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end
        
        if (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].HumanoidRootPart.Anchored = true
                end
            end
        elseif (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].HumanoidRootPart.Anchored = true
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            HumanoidRootPart.Anchored = true
        end
    end

    if (Command("thaw") or Command("unfreeze")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end
        
        if (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].HumanoidRootPart.Anchored = false
                end
            end
        elseif (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].HumanoidRootPart.Anchored = false
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            HumanoidRootPart.Anchored = false
        end
    end
    
    if (Command("explode")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end
        
        if (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))

                    for i,v in pairs(workspace[Chosen.Name].Humanoid.RootPart:GetChildren()) do
                        if v:IsA("BodyAngularVelocity") then
                            v:Destroy()
                        end
                    end

                    local Speed = 75
                    local Humanoid = workspace[Chosen.Name].Humanoid
                    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
                    local Explosion = Instance.new("Explosion", workspace)

                    BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    BodyAngularVelocity.AngularVelocity = Vector3.new(0, Speed, 0)
                    BodyAngularVelocity.Parent = Humanoid.RootPart
                    Explosion.DestroyJointRadiusPercent = 0
                    Explosion.BlastPressure = 10
                    Explosion.BlastRadius = 10
                    Explosion.Position = workspace[Chosen.Name].HumanoidRootPart.Position

                    task.wait(0.25)
                    workspace[Chosen.Name].Humanoid.Health = 0
                end
            end
        elseif (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))

                    for i,v in pairs(workspace[Chosen.Name].Humanoid.RootPart:GetChildren()) do
                        if v:IsA("BodyAngularVelocity") then
                            v:Destroy()
                        end
                    end

                    local Speed = 75
                    local Humanoid = workspace[Chosen.Name].Humanoid
                    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
                    local Explosion = Instance.new("Explosion", workspace)

                    BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    BodyAngularVelocity.AngularVelocity = Vector3.new(0, Speed, 0)
                    BodyAngularVelocity.Parent = Humanoid.RootPart
                    Explosion.DestroyJointRadiusPercent = 0
                    Explosion.BlastPressure = 10
                    Explosion.BlastRadius = 10
                    Explosion.Position = workspace[Chosen.Name].HumanoidRootPart.Position
                    
                    task.wait(0.25)
                    workspace[Chosen.Name].Humanoid.Health = 0
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)

            for i,v in pairs(workspace[Target.Name].Humanoid.RootPart:GetChildren()) do
                if v:IsA("BodyAngularVelocity") then
                    v:Destroy()
                end
            end

            local Speed = 75
            local Humanoid = workspace[Target.Name].Humanoid
            local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
            local Explosion = Instance.new("Explosion", workspace)

            BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            BodyAngularVelocity.AngularVelocity = Vector3.new(0, Speed, 0)
            BodyAngularVelocity.Parent = Humanoid.RootPart
            Explosion.DestroyJointRadiusPercent = 0
            Explosion.BlastPressure = 10
            Explosion.BlastRadius = 10
            Explosion.Position = HumanoidRootPart.Position
            
            task.wait(0.25)
            workspace[Target.Name].Humanoid.Health = 0
        end
    end

    if (Command("bring")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end
        
        if (Arg2 == "others" or Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].HumanoidRootPart.CFrame = workspace[Player.Name].HumanoidRootPart.CFrame
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            HumanoidRootPart.CFrame = workspace[Player.Name].HumanoidRootPart.CFrame
        end
    end

    if (Command("kill")) then
        if (Arg2 == nil or Arg2 == "me") then
            return
        end

        if (Arg2 == "others") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId) and Chosen.UserId ~= Player.UserId) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].Humanoid.Health = 0
                end
            end
        elseif (Arg2 == "all") then
            for i,Chosen in ipairs(Players:GetPlayers()) do
                if (table.find(Users, Chosen.UserId)) then
                    local Chosen = FindWhitelistedUser(tostring(Chosen))
                    workspace[Chosen.Name].Humanoid.Health = 0
                end
            end
        else
            local Target = FindWhitelistedUser(Arg2)
            workspace[Target.Name].Humanoid.Health = 0
        end
    end
end

--> Connections <--
LocalPlayer.Chatted:Connect(LocalHandler)

local function ConnectPlayer(Player)
    Player.Chatted:Connect(function(Message)
        if (table.find(Users, Player.UserId)) then
            ServerHandler(Player, Message)
        end
    end)
end

Players.PlayerAdded:Connect(function(Player)
    ConnectPlayer(Player)
end)

for _,Player in ipairs(Players:GetPlayers()) do
    ConnectPlayer(Player)
end

--> Loaded <--
Chat("Cryptic #1 Admin 💪", "All")
print("Cryptic on TOP! 💪")
