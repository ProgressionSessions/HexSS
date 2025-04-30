<p align="center">
  <img src="https://raw.githubusercontent.com/ProgressionSessions/HexSS/refs/heads/stable/hexssbanner.png" alt="HexSS Banner">
</p>

<h1 align="center">HexSS Script Executor</h1>
<h3 align="center"><em>the smartest server sided code ide</em></h3>

---

<p align="center">
  📜 <a href="#-script">Get Script</a>
  📜 <a href="#-about">About</a>
</p>

---

## 🧩 About

**HexSS** was a powerful, server-sided script injection & execution IDE built for the Roblox platform. Designed as an IDE that allowed developers and exploiters to inject and run Lua code from the client that would execute on the server environment, HexSS aimed to bring intelligent features and modern workflows to Roblox exploitation and debugging.

> ⚠️ **Disclaimer**: HexSS has been **defunct since 2023**, Most useful features (including injection and execution) may not function or may become un-useable in future updates. Running this code may result in exploit detections or worse. Use at your own risk.

---

## 🛠️ Usage

HexSS is designed to run utilizing client executors (Such as Synapse X, Script-Ware, Krnl, etc.). However execution & injection relys on the game itself having a malicious module which allows the HexSS Client to interact with the server. If said game you are trying to utilize HexSS on does NOT have the malicious module, Execution will be disabled. 

HexSS is designed to run on the client and utilize modules/RemoteEvents to communicate to the server, Which allows it to support multiple standards such as ones found with Backdoor.Exe and SS.FUN.

---

## 🚀 Getting Started

Getting Started is quite easy, You just need to have a Client IDE (Synapse, Krnl, etc) and the loadstring in hand. Executing the Loader code will automatically begin loading the client into your game. Run 📜 <a href="#-script">This Script Loader</a> to begin using HexSS.

---

## 👨🏻 Credit
Much ♥️ to all who have Contributed to the development of HexSS.

- **HexerMaster1929** | Lead Programming, Creator.
- **ProgressionSessions** (Formerly MrolivesGaming) | Secondary Programming and Backdoor Developer.
- **VannahReese** (Formerly MissSavannah) | Interface & Animation.
- **Upbolt / Hydroxide** | UI Design Base.
- **CframeCodes** (Formerly CframeMan10) | Backdoor Design & Method.
> **Note**: There are more contributers which i do not know about solely due to the fact that HexerMaster1929 Never gave me the needed information before handing the project over to me.

---

## Script

**Use this script below to begin using HexSS** 
```lua
local owner = "ProgressionSessions"
local branch = "stable"
local Repo = "HexSS"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/%s/%s/%s.lua"):format(owner, Repo, branch, file)), file .. '.lua')()
end


webImport("init")
webImport("modules/moduleloader")
webImport("ui/init")
```
