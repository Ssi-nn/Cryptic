--> Variables <--
local Users = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Server/Users.lua", true))()

local Players = game.Players or game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserId = LocalPlayer.UserId

if (not table.find(Users, UserId)) then --> Checking if the user is in the `users` list.
    LocalPlayer:Kick("Unfortunately, you're unwhitelisted with Cryptic. We're doing this for security reasons, so our script stays up as long as possible. Contact Suno#0526 if you think this is a mistake.")
end