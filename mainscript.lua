--[[

  _   _            ____ ____   __     _______ 
 | | | | _____  __/ ___/ ___|  \ \   / /___ / 
 | |_| |/ _ \ \/ /\___ \___ \   \ \ / /  |_ \ 
 |  _  |  __/>  <  ___) |__) |   \ V /  ___) |
 |_| |_|\___/_/\_\|____/____/     \_/  |____/ 

        By HexHub Softworks | Powered By OKDOOR Backdoor Systems

 ------------------------------------------------
 |                -- CREDITS --                 |
 |                                              |
 | HexerMaster1929         Creator,Co-Scripter  |
 |                                              |
 | ProgressionSessions                Scripter  |
 |                                              |
 | VannahReese                     UI Designer  |
 |                                              |
 ------------------------------------------------

]]--

if _G.AlreadyLoaded then 
    warn("ALREADY LOADED")
    return 
    end


local Success,Error = pcall(function()

	local Update1 = "Fixed UI Not Loading"
	local Update2 = "Fixed Missing UI Icons"
	local Update3 = "Added Character Refresh Button In Executor Tab"
	local ScriptVersion = "3.0C"
	local Branch = "stable"-- Latest,Stable


	-- This is it, no turning back now...


	local CurrentTab = nil


	local UI = script.Parent
	if game:GetService("RunService"):IsStudio() then
		UI = script.Parent
	else
		UI =  game:GetObjects("rbxassetid://12773071270")[1]
	end
	local Assets = UI.Assets
	local Base = UI.Base
	local TabsManager,ExecutorManager,BackdoorModule,ListManager,TextTipManager,MessageBox,EditorFunctions,DragModule -- = require(TestingModules.TabsManager)



	if game:GetService("RunService"):IsStudio() then
		EditorFunctions = require(UI.TestingModules.HexSSEditorFunctions)
		TabsManager = require(UI.TestingModules.TabsManager)
		ExecutorManager = require(UI.TestingModules.ExecutorManager)
		BackdoorModule = require(UI.TestingModules.BackdoorManager)
		ListManager = require(UI.TestingModules.ListManager)
		TextTipManager = require(UI.TestingModules.TextTipManager)
		MessageBox = require(UI.TestingModules.MessageBoxManager)
		DragModule = require(UI.TestingModules.Drag)
	else
		local function import(file)
			local FormattedStr = string.format("https://raw.githubusercontent.com/HexerMaster1929/HexSS/%s/modules/%s.lua",Branch,file)
			print(FormattedStr)
			return loadstring(game:HttpGet(FormattedStr))()
		end
		EditorFunctions = import("HexSSEditorFunctions")
		TabsManager = import("TabsManager")
		ExecutorManager = import("ExecutorManager")
		BackdoorModule = import("BackdoorManager")
		ListManager = import("ListManager")
		TextTipManager = import("TextTipManager")
		MessageBox = import("MessageBoxManager")
		DragModule = import("Drag")
	end

	local ExecutorFrame = Base.Body.Pages.Executor
	local AboutFrame = Base.Body.Pages.About
	local IntroFrame = Base.Body.Pages.Introductory
	local ScriptHubFrame = Base.Body.Pages.ScriptHub
	local AddedScriptFrame = Base.Body.Pages.SavedScripts
	local SettingsFrame = Base.Body.Pages.Settings

	local Exploit;
	if identifyexecutor then
		Exploit,Ver = identifyexecutor()
		if Ver then
			Exploit = Exploit..' '..tostring(Ver)
		end
	else
		Exploit = secure_load and "Sentinel" or pebc_execute and "ProtoSmasher" or is_sirhurt_closure and "Sirhurt" or (syn and not is_sirhurt_closure and not isexecutorclosure) and "Synapse X" or KRNL_LOADED and "Krnl"
	end

	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local CoreGui = game:GetService("CoreGui")

	ScriptList = {
		{
			Name = "Topk3k V3",
			Description = "Topk3k V3 Lesgo bois",
			Code = 'require(2609384717).load("%username%")'
		},
		{
			Name = "Grab Knife V3",
			Description = "The Real Grab Knife V3? [Requires R6]",
			Code = "require(2829943043):Run('%username%','i baked you a pie')"
		},
		-- 11 New
		{
			Name = "Cryztal Hub",
			Description = "A Small Hub With Some Fun Scripts",
			Code = 'require(3158330574):e438adeb4c9b1efd9d2dff0bbaf063eb("%username%")'
		},

		{
			Name = "Switcher V4",
			Description = "Despair... [REQUIRES R6]",
			Code = 'require(4639995976).v4("%username%")'
		},

		{     
			Name = "500LB Ball",
			Description = "Throw the ball /blackhole thing at people [REQUIRES R6]",
			Code = 'require(5018462111):Fire("%username%")'
		},

		{
			Name = "School Shooter",
			Description = "AKA: Be mad with a Tec-9 [REQUIRES R6]",
			Code = "require(2826823504):Run('%username%','i baked you a pie')"
		},

		{
			Name = "FPS Guns",
			Description = "Shoot The Place Up! [REQUIRES R6]",
			Code = "require(2823974237).giveGuns'%username%'"
		},
		{
			Name = "Allah Akbar",
			Description = "Suicide Bomba [REQUIRES R6]",
			Code = 'require(1232280447).load("%username%")'
		},






	}





	local ScriptSettings = {
		BorderColor = Color3.fromRGB(43, 0, 255),
		RGBBorder = false,
		Invite = "ZjmX9hG3Mq",
		SaveSettings = false,
		FileSaving = {
			SaveFolder = "HexSS",
			SettingsFile = "ScriptSettings",
			ScriptSaveFile = "ScriptSaves",
			FileExtension = ".hex"
		},
	}

	function LoadConfiguration()
		if (isfolder) and (writefile) and (readfile) then
			if isfolder(ScriptSettings.FileSaving.SaveFolder) then
				if isfile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile..ScriptSettings.FileSaving.FileExtension) then
					AddedScripts = game.HttpService:JSONDecode(readfile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile..ScriptSettings.FileSaving.FileExtension)) 
				end
				if isfile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.SettingsFile..ScriptSettings.FileSaving.FileExtension) then
					ScriptSettings = game.HttpService:JSONDecode(readfile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.SettingsFile..ScriptSettings.FileSaving.FileExtension)) 
				end
			end
		else
			warn("Executor Does Not Support File Saving Functions")
		end
	end

	LoadConfiguration()


	-- Immediate Scripts

	local BottomStatusText = TextTipManager.Add(Base.Status)
	DragModule.Drag(Base,Base.Drag)



	-- Main Functions 

	function UpdateBorderColor(Col)
		if ScriptSettings.RGBBorder then return end
		UI.Base.Border.ImageColor3 = Col
		UI.Base.Border.Border.ImageColor3 = Col
		UI.Base.MessageBox.Border.ImageColor3 = Col
		for i, v in pairs(UI.Base.Prompts:GetChildren()) do
			if v.Name == "PromptShadow" then return end
			v:FindFirstChild("Border").ImageColor3 = Col
		end
	end

	function Execute(Str)
		BottomStatusText:Set("• Status: Waiting")
		BottomStatusText:Show()
		wait(.6)
		BottomStatusText:Set("• Status: Checking Modules")
		wait(.5)
		BottomStatusText:Set("• Status: Starting Backdoor Module")
		wait(.2)
		BottomStatusText:Set("• Status: Checking For Backdoors In Game")
		if BackdoorModule.IsGameInfected() then
			wait(.4)
			BottomStatusText:Set("• Status: Backdoors Found, Executing...")
			wait(.2)
			local Succ,Err = pcall(function()		
				BackdoorModule.Execute(Str)
			end)
			if Err then
				warn("why tf did this error bruh, heres the error ig: ",Err)
				BottomStatusText:Set("• Status: ERROR: "..Err)
				wait(.5)
				BottomStatusText:Hide()
			elseif Succ then
				BottomStatusText:Set("• Status: Successfully Executed!")
				wait(.5)
				BottomStatusText:Hide()
			end
		else
			wait(.2)
			BottomStatusText:Set("• Status: No Backdoors Found, Game Is Not Infected.")
			wait(.5)
			BottomStatusText:Hide()
		end
	end

	function SwitchPage(Name) 
		for i,v in pairs(Base.Body.Pages:GetChildren()) do
			if v:IsA("Frame") or v:IsA("ImageLabel") then
				v.Visible = false
			end
		end
		Base.Body.Pages:FindFirstChild(Name).Visible = true
	end

	function SaveScript(ScriptName,Script,AddedBy)
		if (readfile) or (writefile) then
			local DateTimeServ = DateTime.now()
			local InfoTable = {
				SavedBy = AddedBy,
				SavedOn = DateTimeServ:FormatLocalTime("LL", "en-us"),
			}
			if isfolder(ScriptSettings.FileSaving.ScriptSaveFile) then
				if isfile(ScriptName) then
					MessageBox.show({
						PopupFrame = Base.MessageBox,
						Title = "Error!",
						Message = "You already have a script saved with this name."
					})
				else
					writefile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile.."/"..ScriptName..ScriptSettings.FileSaving.FileExtension,Script)
					writefile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile.."/"..ScriptName.."_SCRIPTINFO"..ScriptSettings.FileSaving.FileExtension,game:GetService("HttpService"):JSONEncode(InfoTable))
					MessageBox.show({
						PopupFrame = Base.MessageBox,
						Title = "Success!",
						Message = "Saved Script Successfully!"
					})
				end
			else
				writefolder(ScriptSettings.FileSaving.ScriptSaveFile)
				writefile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile.."/"..ScriptName..ScriptSettings.FileSaving.FileExtension,Script)
				writefile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile.."/"..ScriptName.."_SCRIPTINFO"..ScriptSettings.FileSaving.FileExtension,game:GetService("HttpService"):JSONEncode(InfoTable))
			end

		else
			MessageBox.show({
				PopupFrame = Base.MessageBox,
				Title = "Error!",
				Message = "Your Executor Does Not Support Readfile"
			})
		end
	end

	function GetSavedScripts()
		local SavedScripts;
		if (listfiles) then
			if isfolder(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile) then

				SavedScripts = listfiles(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile)
			else

				warn("No Saved Scripts!")
				return false

			end

		else
			warn("Executor does not have list file")
		end
		return SavedScripts
	end

	-- Executor System

	local ExecutorParentFrame = ExecutorFrame.ExecutorTabs
	local TabSwitcher = ExecutorFrame.TabSwitcher
	local Buttons = ExecutorFrame.Buttons


	TabsManager.Add(TabSwitcher.Tabs,ExecutorParentFrame)

	TabSwitcher.NewTab.MouseButton1Down:Connect(function()
		TabsManager.Add(TabSwitcher.Tabs,ExecutorParentFrame)
	end)

	Buttons.Execute.MouseButton1Down:Connect(function()
		Execute(ExecutorManager.GetExecutorText(ExecutorParentFrame:FindFirstChild(TabsManager.GetOpenTab())))
	end)

	Buttons.Clear.MouseButton1Down:Connect(function()
		ExecutorManager.ClearText(ExecutorParentFrame:FindFirstChild(TabsManager.GetOpenTab()))
	end)

	Buttons.Save.MouseButton1Down:Connect(function()
		local Prompt = Base.Prompts.SaveScript
		Prompt.Visible = true
		wait(2)
		Prompt.Inner.Buttons.SetCancel.Save.MouseButton1Down:Connect(function()
			Prompt.Visible = false
			SaveScript(Prompt.Inner.Content.Value.Input.Text,ExecutorManager.GetExecutorText(ExecutorParentFrame:FindFirstChild(TabsManager.GetOpenTab())),game.Players.LocalPlayer.Name)
		end)
		Prompt.Parent.PromptShadow.MouseButton1Down:Connect(function()
			if Prompt.Visible then Prompt.Visible = false end
		end)
		Prompt.Inner.Buttons.SetCancel.Cancel.MouseButton1Down:Connect(function()
			if Prompt.Visible then Prompt.Visible = false end
		end)
	end)

	Buttons.R6.MouseButton1Down:Connect(function()
		Execute('require(6697419109):r6("%username%")')
	end)
	
	Buttons.RE.MouseButton1Down:Connect(function()
		Execute('game.Players:FindFirstChild("%username%"):LoadCharacter()')
	end)

	Buttons.R15.MouseButton1Down:Connect(function()
		Execute('require(6209331166):r15("%username%")')
	end)

	-- Script Hub System



	for i,v in pairs(ScriptList) do
		local NewTab = Assets.ScriptHubItm:Clone()
		NewTab.Title.Text = v.Name
		NewTab.Desc.Text = v.Description
		NewTab.Name = v.Name
		NewTab.Parent = ScriptHubFrame.List.Results.Clip.Content
		NewTab.Execute.MouseButton1Down:Connect(function()
			Execute(v.Code)
		end)
	end

	ScriptHubFrame.List.Query.Search:GetPropertyChangedSignal("Text"):Connect(function()
		ListManager.FilterList(ScriptHubFrame.List.Results.Clip.Content,ScriptHubFrame.List.Query.Search.Text)
	end)

	-- Added Script System


	if (isfolder) and isfolder(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile) or (readfile) then
		if GetSavedScripts() ~= false then 
		for i,v in pairs(GetSavedScripts()) do
			if string.match(tostring(v),"_SCRIPTINFO") then
				warn("Script info file insert fail")
				return
			end

			local SavedScripts = GetSavedScripts()

			local ThisScript = readfile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile.."/"..tostring(v))
			local ThisScriptInfo = game:GetService("HttpService"):JSONDecode(readfile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.ScriptSaveFile.."/"..tostring(SavedScripts[v.."_SCRIPTINFO"])..ScriptSettings.FileSaving.FileExtension))



			local NewTab = Assets.ScriptHubItm:Clone()
			NewTab.Title.Text = tostring(v)
			NewTab.Desc.Text = "Added By: "..ThisScriptInfo.SavedOn
			NewTab.Name = tostring(v)
			NewTab.Parent = AddedScriptFrame.List.Results.Clip.Content
			NewTab.Execute.MouseButton1Down:Connect(function()
				Execute(v.Code)
			end)
		end


		
end
	end
	AddedScriptFrame.List.Query.Search:GetPropertyChangedSignal("Text"):Connect(function()
		ListManager.FilterList(AddedScriptFrame.List.Results.Clip.Content,AddedScriptFrame.List.Query.Search.Text)
	end)

	-- Page System

	for i,v in pairs(Base.Tabs.Container:GetChildren()) do
		if v:IsA("ImageButton") then

			local constants = {
				fadeLength = TweenInfo.new(0.15),
				tabSelected = Color3.fromRGB(45, 45, 45),
				iconSelected = Color3.fromRGB(255, 255, 255),
				tabUnselected = Color3.fromRGB(20, 20, 20),
				iconUnselected = Color3.fromRGB(127, 127, 127)
			}

			local selected = TweenService:Create(v, constants.fadeLength, { ImageColor3 = constants.tabSelected })
			local unselected = TweenService:Create(v, constants.fadeLength, { ImageColor3 = constants.tabUnselected })
			local iconSelected = TweenService:Create(v.Icon, constants.fadeLength, { ImageColor3 = constants.iconSelected })
			local iconUnselected = TweenService:Create(v.Icon, constants.fadeLength, { ImageColor3 = constants.iconUnselected })

			v.MouseButton1Down:Connect(function()
				if CurrentTab ~= nil then
					TweenService:Create(Base.Tabs.Container:FindFirstChild(CurrentTab), constants.fadeLength, { ImageColor3 = constants.tabUnselected }):Play()
					warn("Set Unused")
					TweenService:Create(Base.Tabs.Container:FindFirstChild(CurrentTab).Icon, constants.fadeLength, { ImageColor3 = constants.iconUnselected }):Play()
				end
				v.ImageColor3 = constants.tabSelected
				v.Icon.ImageColor3 = constants.iconSelected
				SwitchPage(v.Name)
				CurrentTab = v.Name
			end)
			v.MouseEnter:Connect(function()
				BottomStatusText:Set(v.Name)
				BottomStatusText:Show()
				selected:Play()
				iconSelected:Play()
			end)
			v.MouseLeave:Connect(function()

				if CurrentTab ~= v.Name then
					unselected:Play()
					iconUnselected:Play()
				end
				BottomStatusText:Hide()
			end)
		end
	end

	-- Settings Page 


	local ColorPicker = SettingsFrame.Content.BorderColorPicker.ColorPicker
	local Background = ColorPicker.CPBackground
	local Display = Background.Display
	local Main = Background.MainCP
	local Slider = ColorPicker.ColorSlider

	ColorPicker.Parent.SelectedColor.ImageColor3 = ScriptSettings.BorderColor

	game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 then 
			mainDragging = false
			sliderDragging = false
		end end)
	Main.MouseButton1Down:Connect(function()

		mainDragging = true 

	end)
	Main.MainPoint.MouseButton1Down:Connect(function()

		mainDragging = true 

	end)
	Slider.MouseButton1Down:Connect(function()
		sliderDragging = true 
	end)
	Slider.SliderPoint.MouseButton1Down:Connect(function()
		sliderDragging = true 
	end)
	local h,s,v = ScriptSettings.BorderColor:ToHSV()
	local color = Color3.fromHSV(h,s,v) 
	local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
	local function setDisplay()
		--Main
		Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
		Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
		Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
		Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
		ColorPicker.Parent.SelectedColor.ImageColor3 = Color3.fromHSV(h,s,v)
		--Slider 
		local x = h * Slider.AbsoluteSize.X
		Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
		Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
		local color = Color3.fromHSV(h,s,v) 
		local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
		ColorPicker.R.Inpt.Text = tostring(r)
		ColorPicker.G.Inpt.Text = tostring(g)
		ColorPicker.B.Inpt.Text = tostring(b)
		hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)

	end
	setDisplay()
--[[ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
	if not pcall(function()
			local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
			local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
			h,s,v = rgbColor:ToHSV()
			hex = ColorPicker.HexInput.InputBox.Text
			setDisplay()
			ColorPickerSettings.Color = rgbColor
		end) 
	then 
		ColorPicker.HexInput.InputBox.Text = hex 
	end
	pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
	local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
	ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
	SaveConfiguration()
end)]]--
	--RGB
	local function rgbBoxes(box,toChange)
		local value = tonumber(box.Text) 
		local color = Color3.fromHSV(h,s,v) 
		local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
		local save 
		if toChange == "R" then save = oldR;oldR = value elseif toChange == "G" then save = oldG;oldG = value else save = oldB;oldB = value end
		if value then 
			value = math.clamp(value,0,255)
			h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()

			setDisplay()
		else 
			box.Text = tostring(save)
		end
		local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
		ColorPicker.Parent.SelectedColor.ImageColor3 = Color3.fromHSV(h,s,v)
		pcall(function()
			UpdateBorderColor(Color3.fromHSV(h,s,v))
			ScriptSettings.BorderColor = Color3.fromHSV(h,s,v)
		end)
	end
	ColorPicker.R.Inpt.FocusLost:connect(function()
		rgbBoxes(ColorPicker.R.Inpt,"R")
		pcall(function()
			UpdateBorderColor(Color3.fromHSV(h,s,v))
			ScriptSettings.BorderColor = Color3.fromHSV(h,s,v)
		end)
	end)
	ColorPicker.G.Inpt.FocusLost:connect(function()
		rgbBoxes(ColorPicker.G.Inpt,"G")
		pcall(function()
			UpdateBorderColor(Color3.fromHSV(h,s,v))
			ScriptSettings.BorderColor = Color3.fromHSV(h,s,v)
		end)
	end)
	ColorPicker.B.Inpt.FocusLost:connect(function()
		rgbBoxes(ColorPicker.B.Inpt,"B")
		pcall(function()
			UpdateBorderColor(Color3.fromHSV(h,s,v))
			ScriptSettings.BorderColor = Color3.fromHSV(h,s,v)
		end)
	end)

	local mouse = game.Players.LocalPlayer:GetMouse()

	game:GetService("RunService").RenderStepped:connect(function()
		if mainDragging then 
			local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
			local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
			Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
			s = localX / Main.AbsoluteSize.X
			v = 1 - (localY / Main.AbsoluteSize.Y)
			Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
			Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
			ColorPicker.Parent.SelectedColor.ImageColor3 = Color3.fromHSV(h,s,v)
			Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
			local color = Color3.fromHSV(h,s,v) 
			local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
			ColorPicker.R.Inpt.Text = tostring(r)
			ColorPicker.G.Inpt.Text = tostring(g)
			ColorPicker.B.Inpt.Text = tostring(b)
			--ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
			pcall(function()
				UpdateBorderColor(Color3.fromHSV(h,s,v))
				ScriptSettings.BorderColor = Color3.fromHSV(h,s,v)
			end)
		end
		if sliderDragging then 
			local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
			h = localX / Slider.AbsoluteSize.X
			Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
			Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
			Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
			Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
			Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
			ColorPicker.Parent.SelectedColor.ImageColor3 = Color3.fromHSV(h,s,v)
			local color = Color3.fromHSV(h,s,v) 
			local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
			ColorPicker.R.Inpt.Text = tostring(r)
			ColorPicker.G.Inpt.Text = tostring(g)
			ColorPicker.B.Inpt.Text = tostring(b)
			pcall(function()
				UpdateBorderColor(Color3.fromHSV(h,s,v))
				ScriptSettings.BorderColor = Color3.fromHSV(h,s,v)
			end)
		end
	end)

	local SCL = SettingsFrame.Content

	-- rgb border toggle

	SCL.RGBBorder.Toggle.MouseButton1Down:Connect(function()
		--print("click")
		if ScriptSettings.RGBBorder then
			ScriptSettings.RGBBorder = false
			TweenService:Create(SCL.RGBBorder.Toggle.Label,TweenInfo.new(0.24,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
		else
			ScriptSettings.RGBBorder = true
			TweenService:Create(SCL.RGBBorder.Toggle.Label,TweenInfo.new(0.24,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
		end
	end)

	-- rgb border handler

	task.spawn(function()
		while wait() do
			if ScriptSettings.RGBBorder == true then
				Base.MessageBox.Border.ImageColor3 = Color3.new(255/255,0/255,0/255)
				Base.Border.ImageColor3 = Color3.new(255/255,0/255,0/255)
				Base.Border.Border.ImageColor3 = Color3.new(255/255,0/255,0/255)
				for i = 0,255,10 do
					wait()
					local Color = Color3.new(255/255,i/255,0/255)
					Base.MessageBox.Border.ImageColor3 = Color
					Base.Border.ImageColor3 = Color
					Base.Border.Border.ImageColor3 = Color
				end
				for i = 255,0,-10 do
					wait()

					local Color1 = Color3.new(i/255,255/255,0/255)
					Base.MessageBox.Border.ImageColor3 = Color1
					Base.Border.ImageColor3 = Color1
					Base.Border.Border.ImageColor3 = Color1
				end
				for i = 0,255,10 do
					wait()
					local Color2 = Color3.new(0/255,255/255,i/255)
					Base.MessageBox.Border.ImageColor3 = Color2
					Base.Border.ImageColor3 = Color2
					Base.Border.Border.ImageColor3 = Color2
				end
				for i = 255,0,-10 do
					wait()
					local Color4 = Color3.new(0/255,i/255,255/255)
					Base.MessageBox.Border.ImageColor3 = Color4
					Base.Border.ImageColor3 = Color4
					Base.Border.Border.ImageColor3 = Color4
				end
				for i = 0,255,10 do
					wait()
					local Color5 = Color3.new(i/255,0/255,255/255)
					Base.MessageBox.Border.ImageColor3 = Color5
					Base.Border.ImageColor3 = Color5
					Base.Border.Border.ImageColor3 = Color5
				end
				for i = 255,0,-10 do
					wait()
					local Color6 = Color3.new(255/255,0/255,i/255)
					Base.MessageBox.Border.ImageColor3 = Color6
					Base.Border.ImageColor3 = Color6
					Base.Border.Border.ImageColor3 = Color6
				end
			end
		end
	end)

	local ScreenPos

	UI.Base.Drag.Collapse.MouseButton1Down:Connect(function()
		ScreenPos = UI.Base.Position
		TweenService:Create(UI.Base,TweenInfo.new(0.76,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position = UDim2.new(1.5, 0,0.5, 0)}):Play()
		TweenService:Create(UI.OpenButtonHolder,TweenInfo.new(0.7,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position = UDim2.new(1, 0,1, 0)}):Play()
	end)

	UI.OpenButtonHolder.Open.MouseButton1Down:Connect(function()

		TweenService:Create(UI.Base,TweenInfo.new(0.76,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position = ScreenPos}):Play()
		TweenService:Create(UI.OpenButtonHolder,TweenInfo.new(1.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position = UDim2.new(1.32, 0,1, 0)}):Play()
	end)

	SCL.RGBBorder.Toggle.MouseButton1Down:Connect(function()
		--print("click")
		if ScriptSettings.RGBBorder then
			ScriptSettings.RGBBorder = false
			TweenService:Create(SCL.RGBBorder.Toggle.Label,TweenInfo.new(0.24,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
		else
			ScriptSettings.RGBBorder = true
			TweenService:Create(SCL.RGBBorder.Toggle.Label,TweenInfo.new(0.24,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
		end
	end)

	Base.Body.Pages.Settings.Content.Discord.Toggle.MouseButton1Down:Connect(function()
		local Prompt = Base.Prompts.JoinDiscord
		Prompt.Visible = true
		wait(2)
		Prompt.Inner.Content.Value.Title.Text = "discord.gg/"..tostring(ScriptSettings.Invite)
		Prompt.Inner.Content.Add.MouseButton1Down:Connect(function()
			Prompt.Visible = false
			print("Joining")
			local Request = http_request or syn and syn.request or request or nil
			--local CurrentDiscordInvite = isfile('Invite.DARKHUB') and readfile('Invite.DARKHUB') or nil
			if Request then
				local Invite =ScriptSettings.Invite or "ZjmX9hG3Mq"
			--[[local r = Request(
				{
					['Method'] = 'GET',
					['Headers'] = {
						['discordLinkRequest'] = "true"
					},
					['Url'] = 'https://api.darkhub.cloud/v3/discord/raw'
				})
			if r.StatusCode ~= 200 or not r.Successful then
				Invite = "darkhub"
			else
				Invite = r.Body
			end]]--

				Request(
					{
						['Method'] = 'POST',
						['Headers'] = {
							["origin"] = 'https://discord.com',
							["Content-Type"] = "application/json"
						},
						['Url'] = 'http://127.0.0.1:6463/rpc?v=1',
						['Body'] = game:GetService('HttpService'):JSONEncode({cmd="INVITE_BROWSER",args={code=Invite},nonce=game:GetService('HttpService'):GenerateGUID(false):lower()})
					}    
				)


			end
		end)
		Prompt.Parent.PromptShadow.MouseButton1Down:Connect(function()
			if Prompt.Visible then Prompt.Visible = false end
		end)
		Prompt.Inner.Buttons.Cancel.MouseButton1Down:Connect(function()
			if Prompt.Visible then Prompt.Visible = false end
		end)
	end)

	SCL.LoadConf.Toggle.MouseButton1Down:Connect(function()
		LoadConfiguration()
		MessageBox.show({
			MessageBox = Base.MessageBox,
			Title = "Success!",
			Message = "Loaded Configuration",

		})
	end)

	SCL.AutoSave.Toggle.MouseButton1Down:Connect(function()
		if (isfile) or (writefile) then
			if ScriptSettings.SaveSettings then
				ScriptSettings.SaveSettings = false
				TweenService:Create(SCL.AutoSave.Toggle.Label,TweenInfo.new(0.24,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
			else
				ScriptSettings.SaveSettings = true
				TweenService:Create(SCL.AutoSave.Toggle.Label,TweenInfo.new(0.24,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
			end
		else
			MessageBox.show({
				MessageBox = Base.MessageBox,
				Title = "Error!",
				Message = "Cannot Save Script Settings, Your Exploit does not support Readfile/Writefile"
			})
		end
	end)


	UpdateBorderColor(ScriptSettings.BorderColor)

	Base.Drag.Title.Text = "HexSS V"..ScriptVersion
	AboutFrame.Content.Ver.Text = ScriptVersion
	IntroFrame.Content.Ver.Text = ScriptVersion
	IntroFrame.Content.Update1.Text = "• "..Update1
	IntroFrame.Content.Update2.Text = "• "..Update2
	IntroFrame.Content.Update3.Text = "• "..Update3
	IntroFrame.Content.Exploit.Text = tostring(Exploit)
	AboutFrame.Content.Exploit.Text = tostring(Exploit)

	game.Players.PlayerRemoving:Connect(function(Playr)
		if Playr == game.Players.LocalPlayer then
			local SaveFile = game:GetService("HttpService"):JSONEncode(AddedScripts)
			local SettingsSaveFile = game:GetService("HttpService"):JSONEncode(SettingsFrame)
			if not isfolder(ScriptSettings.FileSaving.SaveFolder) then
				local Folder = writefolder(ScriptSettings.FileSaving.SaveFolder)
				--if not isfile(Folder.."/"..ScriptSettings.FileSaving.ScriptSaveFile..ScriptSettings.FileSaving.FileEXT) then

				if ScriptSettings.SaveSettings then
					writefile(ScriptSettings.FileSaving.SaveFolder.."/"..ScriptSettings.FileSaving.SettingsFile..ScriptSettings.FileSaving.FileExtension,SettingsSaveFile)
				end
				--end
			end
		end
	end)




	if not (writefile) then
		--	wait(5)
		--	MessageBox.show({
		--	MessageBox = Base.MessageBox,
		--	Title = "Warning!",
		--	Message = "Your Exploit Does Not Support File Saving, Your Added Scripts Will Not Save!"
		--})
		warn("no filesystem functions with executor")
	end

	UI.Base.Visible = false
	UI.Loader.Visible = true

	if not RunService:IsStudio() then
		if gethui then
			UI.Parent = gethui()
		elseif syn.protect_gui then 
			syn.protect_gui(UI)
			UI.Parent = CoreGui
		elseif CoreGui:FindFirstChild("RobloxGui") then
			UI.Parent = CoreGui:FindFirstChild("RobloxGui")
		else
			UI.Parent = CoreGui
		end
	else
		UI.Parent = game.Players.LocalPlayer.PlayerGui
	end
	warn(UI.Parent)

	UI.Loader.Title.Text = "Loading Executor Module"
	wait(.2)
	UI.Loader.Title.Text = "Loading Saving Module"
	wait(.7)
	UI.Loader.Title.Text = "Loading Backdoor Module"
	wait(.9)
	UI.Loader.Title.Text = "Loading Luau Module"
	wait(.3)
	UI.Loader.Title.Text = "Cleaning Up"
	wait(.4)
	TweenService:Create(UI.Loader.Title,TweenInfo.new(0.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
	TweenService:Create(UI.Loader.Icon,TweenInfo.new(0.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
	TweenService:Create(UI.Loader,TweenInfo.new(0.6,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Size = Base.Size}):Play()
	wait(.61)
	UI.Loader:Destroy()
	Base.Visible = true
	warn("LOAD SUCCESS")
end)
if Error then
	warn(Error)
elseif Success then print("Load HexSS UI Success")
    _G.AlreadyLoaded = true
end
