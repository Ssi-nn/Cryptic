--> Now, originally, I was so lazy I created a separate function to call loadstrings because I thought it would be nicer, but in general, it just made it more laggy.
--> So to counter that, in this update, since I am focused on stability, I made it just load it like normal, and less lag! Hoorayy!

do
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Documents/Welcome.lua", true))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Documents/Chat.lua", true))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ssi-nn/Cryptic/main/Interface/Commands.lua", true))()
end

--> I also removed a useless loadstring, because it called stuff without ever needed to use them! Fun!!