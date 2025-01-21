# NOTICE

HexSS has merged into ProgressionSS, This version will no longer be maintained, please visit https://serverside.progressionsoftworks.dev for the new version.

# About 

HexSS Is a Recently Publicized Roblox Server side that was designed in 2019 By HexHub Softworks (Formerly HaxorMan1929 inc at that time)

We have grown a log way whilst being a full private executor but now we are public for all to see!

# ScriptLoader

```lua
local owner = "HexerMaster1929"
local branch = "stable"
local Repo = "HexSS"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/%s/%s/%s.lua"):format(owner, Repo, branch, file)), file .. '.lua')()
end


webImport("init")
webImport("modules/moduleloader")
webImport("ui/init")

```
