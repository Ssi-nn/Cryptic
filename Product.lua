if (getgenv().Cryptic) then
    return
end
getgenv().Cryptic = true

local function Install()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Downloads/Files.lua", true))("Files")
end

return Install()