--> All I could change in here were formatting issues, because well, there is not much to change I guess..

if not game:GetService("CoreGui").Commands then
    repeat
        task.wait()
    until game:GetService("CoreGui").Commands
end

--> Tables <--
local Commands = {}

--> Commands <--
Commands[#Commands+1] = {Command = "kill", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "goto | to", Args = "[user]", Power = ""}
Commands[#Commands+1] = {Command = "rj | rejoin", Args = "[me]", Power = ""}
Commands[#Commands+1] = {Command = "bring", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "explode", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "freeze | ice", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "unfreeze | thaw", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "rocket", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "fling", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "flex | brag | script", Args = "", Power = ""}
Commands[#Commands+1] = {Command = "version | scriptversion", Args = "", Power = ""}
Commands[#Commands+1] = {Command = "kick", Args = "[me, user, others]", Power = ""}
Commands[#Commands+1] = {Command = "speed | walkspeed", Args = "[me, user, all, others]", Power = "[speed]"}
Commands[#Commands+1] = {Command = "jpower | jumppower", Args = "[me, user, all, others]", Power = "[power]"}
Commands[#Commands+1] = {Command = "jump", Args = "[me, user, all, others]", Power = "[height]"}
Commands[#Commands+1] = {Command = "sit", Args = "[me, user, all, others]", Power = ""}
Commands[#Commands+1] = {Command = "edition | type | mode", Args = "", Power = ""}

--> UI Elements <--

for i = 1, #Commands do
    Converted = {
        ["_TextLabel"] = Instance.new("TextLabel");
    }
    Converted["_TextLabel"].Font = Enum.Font.Gotham
    Converted["_TextLabel"].Text = Commands[i].Command.."  "..Commands[i].Args.." "..Commands[i].Power
    Converted["_TextLabel"].TextColor3 = Color3.fromRGB(200.00001847743988, 200.00001847743988, 200.00001847743988)
    Converted["_TextLabel"].TextScaled = true
    Converted["_TextLabel"].TextSize = 14
    Converted["_TextLabel"].TextStrokeColor3 = Color3.fromRGB(170.0000050663948, 85.0000025331974, 255)
    Converted["_TextLabel"].TextStrokeTransparency = 0.699999988079071
    Converted["_TextLabel"].TextWrapped = true
    Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
    Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted["_TextLabel"].BackgroundTransparency = 1
    Converted["_TextLabel"].Size = UDim2.new(1, 0, 0.0649999976, 0)
    Converted["_TextLabel"].Parent = game:GetService("CoreGui").Commands.Base.ScrollingFrame
end

return Commands