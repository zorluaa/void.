local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")


local void={tabCount = 0, btn = 0}

local function MakeDraggable(ClickObject, Object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	ClickObject.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = Input.Position
			StartPosition = Object.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	ClickObject.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - DragStart
			Object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		end
	end)
end

local _New_ = Instance.new;

local VOID_LUA = _New_("ScreenGui", game.CoreGui);
VOID_LUA.Name = "VOID.LUA";
VOID_LUA.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

local player = game.Players.LocalPlayer
local userId = player.UserId
local thumbType = Enum.ThumbnailType.AvatarBust
local thumbSize = Enum.ThumbnailSize.Size420x420

function void:Draw(e)
	e = e or {}
	local show = true

	local ver = e.Version


	local Main = _New_("Frame", VOID_LUA);
	Main.BackgroundColor3 = Color3.fromRGB(9.000000413507223, 6.000000117346644, 13.000000175088644);
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Main.BorderSizePixel = 0;
	Main.Name = "Main";
	Main.Position = UDim2.new(0.3387676477432251, 0, 0.19225037097930908, 0);
	Main.Size = UDim2.new(0, 428, 0, 412);


	
	game:GetService("UserInputService").InputBegan:Connect(function(Input, Processed)
		if Input.KeyCode == Enum.KeyCode.LeftControl and not Processed then 
			if show == true then
				show = false
				Main.Visible = false
			else
				show = true
				Main.Visible = true
			end
		end
	end)



	local Sidebar = _New_("Frame", Main);
	Sidebar.BackgroundColor3 = Color3.fromRGB(13.000000175088644, 21.000000648200512, 32.00000189244747);
	Sidebar.BackgroundTransparency = 0.15000000596046448;
	Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Sidebar.BorderSizePixel = 0;
	Sidebar.Name = "Sidebar";
	Sidebar.Position = UDim2.new(-0.306, 0,0, 0);
	Sidebar.Size = UDim2.new(0, 131, 0, 412);
	
	MakeDraggable(Sidebar, Main)

	local NameData = _New_("TextLabel", Sidebar);
	NameData.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	NameData.BackgroundTransparency = 1;
	NameData.BorderColor3 = Color3.fromRGB(0, 0, 0);
	NameData.BorderSizePixel = 0;
	NameData.Name = "NameData";
	NameData.Size = UDim2.new(1, 0, 0, 50);
	NameData.Font = Enum.Font.Unknown;
	NameData.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	NameData.Text = e.Name or "VOID.LUA";
	NameData.TextColor3 = Color3.fromRGB(255, 255, 255);
	NameData.TextSize = 26;
	NameData.TextWrapped = true;

	local btnContainers = _New_("Frame", Sidebar);
	btnContainers.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	btnContainers.BackgroundTransparency = 1;
	btnContainers.BorderColor3 = Color3.fromRGB(0, 0, 0);
	btnContainers.BorderSizePixel = 0;
	btnContainers.Name = "btnContainers";
	btnContainers.Position = UDim2.new(0, 0, 0.12135922163724899, 0);
	btnContainers.Size = UDim2.new(1, 0, 0, 318);

	local UIListLayout = _New_("UIListLayout", btnContainers);
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

	local PlayerData = _New_("Frame", Sidebar);
	PlayerData.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	PlayerData.BackgroundTransparency = 1;
	PlayerData.BorderColor3 = Color3.fromRGB(0, 0, 0);
	PlayerData.BorderSizePixel = 0;
	PlayerData.Name = "PlayerData";
	PlayerData.Position = UDim2.new(0, 0, 0.893203854560852, 0);
	PlayerData.Size = UDim2.new(1, 0, -0, 44);

	local PlrHeadshot = _New_("ImageLabel", PlayerData);
	PlrHeadshot.BackgroundColor3 = Color3.fromRGB(9.000000413507223, 86.00000247359276, 130.0000074505806);
	PlrHeadshot.BorderColor3 = Color3.fromRGB(0, 0, 0);
	PlrHeadshot.BorderSizePixel = 0;
	PlrHeadshot.Name = "PlrHeadshot";
	PlrHeadshot.Position = UDim2.new(0, 7, 0, 6);
	PlrHeadshot.Size = UDim2.new(0, 33, 0, 33);
	PlrHeadshot.Image = "rbxassetid://9063481343";

	local UICorner = _New_("UICorner", PlrHeadshot);
	UICorner.CornerRadius = UDim.new(1, 0);

	local Username = _New_("TextLabel", PlayerData);
	Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Username.BackgroundTransparency = 1;
	Username.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Username.BorderSizePixel = 0;
	Username.Name = "Username";
	Username.Position = UDim2.new(0, 40, 0, 7);
	Username.Size = UDim2.new(0, 83, 0, 17);
	Username.Font = Enum.Font.Unknown;
	Username.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	Username.Text = "Player Name";
	Username.TextColor3 = Color3.fromRGB(237.0000010728836, 237.0000010728836, 247.00000047683716);
	Username.TextSize = 11;
	Username.TextXAlignment = Enum.TextXAlignment.Left;

	local UIPadding = _New_("UIPadding", Username);
	UIPadding.PaddingLeft = UDim.new(0, 4);

	local ScriptType = _New_("TextLabel", PlayerData);
	ScriptType.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	ScriptType.BackgroundTransparency = 1;
	ScriptType.BorderColor3 = Color3.fromRGB(0, 0, 0);
	ScriptType.BorderSizePixel = 0;
	ScriptType.Name = "ScriptType";
	ScriptType.Position = UDim2.new(0, 40, 0, 18);
	ScriptType.Size = UDim2.new(0, 83, 0, 17);
	ScriptType.Font = Enum.Font.Unknown;
	ScriptType.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	ScriptType.Text = e.Type or "Paid";
	ScriptType.TextColor3 = Color3.fromRGB(61.00000016391277, 120.00000044703484, 152.0000061392784);
	ScriptType.TextSize = 11;
	ScriptType.TextXAlignment = Enum.TextXAlignment.Left;

	local UIPadding_0 = _New_("UIPadding", ScriptType);
	UIPadding_0.PaddingLeft = UDim.new(0, 4);

	local Divider = _New_("Frame", Sidebar);
	Divider.BackgroundColor3 = Color3.fromRGB(21.000000648200512, 33.00000183284283, 45.00000111758709);
	Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Divider.BorderSizePixel = 0;
	Divider.Name = "Divider";
	Divider.Position = UDim2.new(0, 0, 0.893203854560852, 0);
	Divider.Size = UDim2.new(1, 0, -0, 1);

	local TabHolder = _New_("Frame", Main);
	TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	TabHolder.BackgroundTransparency = 1;
	TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0);
	TabHolder.BorderSizePixel = 0;
	TabHolder.Name = "TabHolder";
	TabHolder.Size = UDim2.new(1, 0, 1, 0);


	-- Main Frame Scripts


	local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	PlrHeadshot.Image = content


	Username.Text = player.Name

	-- Tabs
	local tb = {}
	
	function tb:Splitter(e)
		e = e or {}

		local SectionText = _New_("TextLabel",btnContainers);
		SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		SectionText.BackgroundTransparency = 1;
		SectionText.BorderColor3 = Color3.fromRGB(0, 0, 0);
		SectionText.BorderSizePixel = 0;
		SectionText.Name = "SectionText";
		SectionText.Size = UDim2.new(1, 0, 0, 15);
		SectionText.Font = Enum.Font.Unknown;
		SectionText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		SectionText.Text = e.Text or "Splitter |N/A TEXT FOUND";
		SectionText.TextColor3 = Color3.fromRGB(51.00000075995922, 61.00000016391277, 75.00000312924385);
		SectionText.TextSize = 14;
		SectionText.TextXAlignment = Enum.TextXAlignment.Left;

		local UIPadding = _New_("UIPadding", SectionText);
		UIPadding.PaddingLeft = UDim.new(0, 6);
	end
	
	
	function tb:Tab(e)
		e = e or {}
		-- Button Creation
		void.tabCount = void.tabCount+1
		void.btn = void.btn+1
		local Inactve = _New_("Frame", btnContainers);
		Inactve.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Inactve.BackgroundTransparency = 1;
		Inactve.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Inactve.BorderSizePixel = 0;
		Inactve.Name = "Inactve";
		Inactve.Position = UDim2.new(0, 0, 0.04716981202363968, 0);
		Inactve.Size = UDim2.new(1, 0, 0.012578615918755531, 30);
		--  Color3.fromRGB(9, 86, 130);
		local main1 = _New_("TextButton", Inactve);
		main1.BackgroundColor3 = Color3.new(0,0,255)
		main1.BackgroundTransparency = 1;
		main1.BorderColor3 = Color3.fromRGB(0, 0, 0);
		main1.BorderSizePixel = 0;
		main1.Name = "main1";
		main1.Position = UDim2.new(0.04580152779817581, 0, 0.13333354890346527, 0);
		main1.Size = UDim2.new(0, 118, 0, 23);
		main1.Font = Enum.Font.SourceSans;
		main1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		main1.Text = "";
		main1.TextColor3 = Color3.fromRGB(0, 0, 0);
		main1.TextSize = 14;
		main1.TextXAlignment = Enum.TextXAlignment.Right;

		local UICorner = _New_("UICorner", main1);

		local TabText = _New_("TextLabel", main1);
		TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		TabText.BackgroundTransparency = 1;
		TabText.BorderColor3 = Color3.fromRGB(0, 0, 0);
		TabText.BorderSizePixel = 0;
		TabText.Name = "TabText";
		TabText.Position = UDim2.new(0.05042016878724098, 0, 0, 0);
		TabText.Size = UDim2.new(0.9495782852172852, 0, 1, 0);
		TabText.Font = Enum.Font.Unknown;
		TabText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		TabText.Text = e.Text or "Tab | N/A TEXT";
		TabText.TextColor3 = Color3.fromRGB(207.00000286102295, 233.00000131130219, 246.0000005364418);
		TabText.TextSize = 14;

		local image = _New_("ImageLabel", main1);
		image.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		image.BackgroundTransparency = 1;
		image.BorderColor3 = Color3.fromRGB(0, 0, 0);
		image.BorderSizePixel = 0;
		image.Name = "image";
		image.Visible = e.Value or  false
		--	image.Visible = e.ImageVal or true;
		image.Position = UDim2.new(0.05042016878724098, 0, 0, 0);
		image.Size = UDim2.new(0, 22, 0, 22);
		image.Image ="rbxassetid://"..e.Image or  "rbxassetid://10885644041";

		-- Start Actual tab

		local tb = _New_("Frame", TabHolder);
		tb.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		tb.BackgroundTransparency = 1;
		tb.BorderColor3 = Color3.fromRGB(0, 0, 0);
		tb.BorderSizePixel = 0;
		tb.Name = "Tab"..void.tabCount;
		tb.Size = UDim2.new(1, 0, 1, 0);
		tb.Visible = false

		local Divider = _New_("Frame", tb);
		Divider.BackgroundColor3 = Color3.fromRGB(21.000000648200512, 33.00000183284283, 45.00000111758709);
		Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Divider.BorderSizePixel = 0;
		Divider.Name = "Divider";
		Divider.Position = UDim2.new(0, 0, 0, 40);
		Divider.Size = UDim2.new(1, 0, -0, 1);

		local Content = _New_("Frame", tb);
		Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Content.BackgroundTransparency = 1;
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Content.BorderSizePixel = 0;
		Content.Name = "Content";
		Content.Position = UDim2.new(0, 0, 0, 40);
		Content.Size = UDim2.new(1, 0, 1, -40);

		local left = _New_("Frame", Content);
		left.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		left.BackgroundTransparency = 1;
		left.BorderColor3 = Color3.fromRGB(0, 0, 0);
		left.BorderSizePixel = 0;
		left.Name = "left";
		left.Size = UDim2.new(0, 212, 0, 371);

		local UIListLayout = _New_("UIListLayout", left);
		UIListLayout.Padding = UDim.new(0, 6);
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

		local UIPadding = _New_("UIPadding", left);
		UIPadding.PaddingTop = UDim.new(0, 6);


		local Right = _New_("Frame", Content);
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Right.BackgroundTransparency = 1;
		Right.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Right.BorderSizePixel = 0;
		Right.Name = "Right";
		Right.Position = UDim2.new(0.5046728849411011, 0, 0, 0);
		Right.Size = UDim2.new(0, 212, 0, 371);

		local UIListLayout = _New_("UIListLayout", Right);
		UIListLayout.Padding = UDim.new(0, 6);
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

		local UIPadding = _New_("UIPadding", Right);
		UIPadding.PaddingTop = UDim.new(0, 6);

		local TabName = _New_("TextLabel", tb);
		TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		TabName.BackgroundTransparency = 1;
		TabName.BorderColor3 = Color3.fromRGB(0, 0, 0);
		TabName.BorderSizePixel = 0;
		TabName.Name = "TabName";
		TabName.Size = UDim2.new(1, 0, 0, 40);
		TabName.Font = Enum.Font.Unknown;
		TabName.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		TabName.Text =  e.Text or "tab | N/A TEXT";
		TabName.TextColor3 = Color3.fromRGB(170.0000050663948, 177.0000046491623, 183.00000429153442);
		TabName.TextSize = 14;
		TabName.TextXAlignment = Enum.TextXAlignment.Left;

		local UIPadding_0 = _New_("UIPadding", TabName);
		UIPadding_0.PaddingLeft = UDim.new(0, 12);

		local scriptVS = _New_("TextLabel", tb);
		scriptVS.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		scriptVS.BackgroundTransparency = 1;
		scriptVS.BorderColor3 = Color3.fromRGB(0, 0, 0);
		scriptVS.BorderSizePixel = 0;
		scriptVS.Name = "scriptVS";
		scriptVS.Size = UDim2.new(1, 0, 0, 40);
		scriptVS.Font = Enum.Font.Unknown;
		scriptVS.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		scriptVS.Text = ver or "BETA | N/A TEXT";
		scriptVS.TextColor3 = Color3.fromRGB(49.000004678964615, 51.000004559755325, 53.000004440546036);
		scriptVS.TextSize = 14;
		scriptVS.TextXAlignment = Enum.TextXAlignment.Right;

		local UIPadding_1 = _New_("UIPadding", scriptVS);
		UIPadding_1.PaddingRight = UDim.new(0, 4);

		local activeClr = Color3.fromRGB(16,16,16)
		local inactiveclr = Color3.fromRGB(11,11,11)

		main1.MouseButton1Click:Connect(function()
			for _,v in ipairs(TabHolder:GetChildren()) do --// panels
				v.Visible = false
			end
			tb.Visible = true 


			for _,v in ipairs(TabHolder:GetChildren()) do
				if v.Name == "main1" then

					v.BackgroundColor3 = inactiveclr --// makes the tabs textcolor red
				end

			end


			main1.BackgroundColor3 = activeClr --// makes the tab we just clicked text's green
		end)
		
		if void.tabCount == 1 then
			tb.Visible = true
		end
		
		local a = {}
		
		function a:Section(e)
			e = e or{}
			

			local Container = _New_("Frame", nil);
			Container.BackgroundColor3 = Color3.fromRGB(2.000000118277967, 12.000000234693289, 22.000000588595867);
			Container.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Container.BorderSizePixel = 0;
			Container.Name = "Container";
			Container.Position = UDim2.new(0.04009433835744858, 0, 0, 0);
			Container.Size = UDim2.new(0, 195, 0, 64);
			Container.AutomaticSize = Enum.AutomaticSize.Y;

			local Top = _New_("Frame", Container);
			Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Top.BackgroundTransparency = 1;
			Top.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Top.BorderSizePixel = 0;
			Top.Name = "Top";
			Top.Size = UDim2.new(1, 0, -0.05672508478164673, 30);
			
			local UIListLayout = _New_("UIListLayout", Top);
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			
			local SectionText = _New_("TextLabel", Top);
			SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			SectionText.BackgroundTransparency = 1;
			SectionText.BorderColor3 = Color3.fromRGB(0, 0, 0);
			SectionText.BorderSizePixel = 0;
			SectionText.Name = "SectionText";
			SectionText.Size = UDim2.new(1, 0, 0.8269374966621399, 0);
			SectionText.Font = Enum.Font.Unknown;
			SectionText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			SectionText.Text = e.Text or "Section | N/A TEXT FOUND";
			SectionText.TextColor3 = Color3.fromRGB(235.0000011920929, 246.0000005364418, 250.00000029802322);
			SectionText.TextSize = 11;
			SectionText.TextXAlignment = Enum.TextXAlignment.Left;

			local UIPadding = _New_("UIPadding", SectionText);
			UIPadding.PaddingLeft = UDim.new(0, 6);

			local Divider = _New_("Frame", Top);
			Divider.BackgroundColor3 = Color3.fromRGB(21.000000648200512, 33.00000183284283, 45.00000111758709);
			Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Divider.BorderSizePixel = 0;
			Divider.Name = "Divider";
			Divider.Size = UDim2.new(1, -6, 0, 1);



			local Cont = _New_("Frame", Container);
			Cont.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Cont.BackgroundTransparency = 1;
			Cont.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Cont.BorderSizePixel = 0;
			Cont.Name = "Cont";
			Cont.Size = UDim2.new(1, 0, 1, 0);
			Cont.AutomaticSize = Enum.AutomaticSize.Y

			local UIListLayout_0 = _New_("UIListLayout", Cont);
			UIListLayout_0.Padding = UDim.new(0, 4);
			UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;

			local UIPadding_0 = _New_("UIPadding", Cont);
			UIPadding_0.PaddingTop = UDim.new(0, 25);
			if e.Side == "R" then
				Container.Parent = Right
			end
			if e.Side == "L" then
				Container.Parent = left
			end
			
			
			local s = {}
			function s:Toggle(e)
				e = e or {}
				e.func  = e.func	 or function()end
				
				local Toggle = _New_("Frame", Cont);
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Toggle.BackgroundTransparency = 1;
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Toggle.BorderSizePixel = 0;
				Toggle.Name = "Toggle";
				Toggle.Size = UDim2.new(1, 0, 0, 25);

				local CircleFrame = _New_("Frame", Toggle);
				CircleFrame.BackgroundColor3 = Color3.fromRGB(5.000000176951289, 5.000000176951289, 17.00000088661909);
				CircleFrame.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				CircleFrame.Name = "CircleFrame";
				CircleFrame.Position = UDim2.new(0.7986318469047546, 0, 0.1471429467201233, 0);
				CircleFrame.Size = UDim2.new(0, 36, 0, 17);

				local UICorner = _New_("UICorner", CircleFrame);
				UICorner.CornerRadius = UDim.new(1, 0);

				local Ball = _New_("Frame", CircleFrame);
				Ball.BackgroundColor3 = Color3.fromRGB(74.0000031888485, 87.00000241398811, 96.00000187754631);
				Ball.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Ball.Name = "Ball";
				Ball.Position = UDim2.new(0, 3, 0.14299999177455902, 0);
				Ball.Size = UDim2.new(0, 12, 0, 12);

				local UICorner_0 = _New_("UICorner", Ball);
				UICorner_0.CornerRadius = UDim.new(1, 0);

				local ToggleText = _New_("TextLabel", Toggle);
				ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				ToggleText.BackgroundTransparency = 1;
				ToggleText.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				ToggleText.Name = "ToggleText";
				ToggleText.Position = UDim2.new(0.015384615398943424, 0, 0, 0);
				ToggleText.Size = UDim2.new(0.7521094679832458, 0, 1, 0);
				ToggleText.Font = Enum.Font.Unknown;
				ToggleText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				ToggleText.Text = e.Text or "Toggle | N/A TEXT FOUND";
				ToggleText.TextColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257);
				ToggleText.TextSize = 14;
				ToggleText.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", ToggleText);
				UIPadding.PaddingLeft = UDim.new(0, 5);

				local Action = _New_("TextButton", Toggle);
				Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Action.BackgroundTransparency = 1;
				Action.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Action.Name = "Action";
				Action.Size = UDim2.new(1, 0, 1, 0);
				Action.Font = Enum.Font.SourceSans;
				Action.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Action.Text = "";
				Action.TextColor3 = Color3.fromRGB(0, 0, 0);
				Action.TextSize = 14;
				
				local en = false
				Action.MouseButton1Down:Connect(function()
					if en == false then
						en = true
						--MOVE BALL
						TweenService:Create(
							Ball,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0, 20,0, 2)}
						):Play()
						-- CHANGE COLOR
						TweenService:Create(
							CircleFrame,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(8, 24, 50)}
						):Play()
						
						TweenService:Create(
							Ball,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(6, 161, 244)}
						):Play()

						--CALLBACK

						pcall(e.func,true)

					else
						en = false
						--MOVE BALL
						TweenService:Create(
							Ball,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0, 3,0.143, 0)}
						):Play()
						-- CHANGE COLOR
						TweenService:Create(
							CircleFrame,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(5, 5, 17)}
						):Play()
						
						TweenService:Create(
							Ball,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(74, 87, 96)}
						):Play()

						--CALLBACK

						pcall(e.func,false)
					end
				end)
				
			end
			
			-- SLIDER
			function s:Slider(e)
				e = e or {}
				e.func = e.func or function()end

				local Slider = _New_("Frame", Cont);
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Slider.BackgroundTransparency = 1;
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Slider.BorderSizePixel = 0;
				Slider.Name = "Slider";
				Slider.Size = UDim2.new(1, 0, 0, 25);

				local SliderText = _New_("TextLabel", Slider);
				SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				SliderText.BackgroundTransparency = 1;
				SliderText.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				SliderText.Name = "SliderText";
				SliderText.Position = UDim2.new(0.015384615398943424, 0, 0, 0);
				SliderText.Size = UDim2.new(0.7521094679832458, 0, 1, 0);
				SliderText.Font = Enum.Font.Unknown;
				SliderText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				SliderText.Text = e.Text or "Slider";
				SliderText.TextColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257);
				SliderText.TextSize = 14;
				SliderText.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", SliderText);
				UIPadding.PaddingLeft = UDim.new(0, 5);

				local shiznets = _New_("TextButton", Slider);
				shiznets.AutoButtonColor = false;
				shiznets.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
				shiznets.BorderColor3 = Color3.fromRGB(70.00000342726707, 70.00000342726707, 70.00000342726707);
				shiznets.BorderSizePixel = 0;
				shiznets.Name = "shiznets";
				shiznets.Position = UDim2.new(0.3611794412136078, -3, 0, 12);
				shiznets.Size = UDim2.new(0, 93, 0, 2);
				shiznets.Font = Enum.Font.SourceSans;
				shiznets.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				shiznets.Text = "";
				shiznets.TextColor3 = Color3.fromRGB(0, 0, 0);
				shiznets.TextSize = 14;

				local SliderFill = _New_("Frame", shiznets);
				SliderFill.BackgroundColor3 = Color3.fromRGB(41.00000135600567, 90.00000223517418, 120.00000044703484);
				SliderFill.BorderColor3 = Color3.fromRGB(41.00000135600567, 90.00000223517418, 120.00000044703484);
				SliderFill.BorderSizePixel = 0;
				SliderFill.Name = "SliderFill";
				SliderFill.Position = UDim2.new(-0.008474576286971569, 0, 0, 0);
				SliderFill.Size = UDim2.new(0, 0, 1, 0);

				local UIGradient = _New_("UIGradient", SliderFill);
				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(131.00000739097595, 131.00000739097595, 131.00000739097595))};
				UIGradient.Rotation = 90;

				local SliderBack = _New_("TextButton", SliderFill);
				SliderBack.AnchorPoint = Vector2.new(0.5, 0.5);
				SliderBack.BackgroundColor3 = Color3.fromRGB(61.00000016391277, 131.00000739097595, 226.0000017285347);
				SliderBack.BorderColor3 = Color3.fromRGB(0, 0, 0);
				SliderBack.BorderSizePixel = 0;
				SliderBack.Name = "SliderBack";
				SliderBack.Position = UDim2.new(1, 0, 0.5, 0);
				SliderBack.Size = UDim2.new(0, 11, 0, 11);
				SliderBack.Font = Enum.Font.SourceSans;
				SliderBack.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				SliderBack.Text = "";
				SliderBack.TextColor3 = Color3.fromRGB(0, 0, 0);
				SliderBack.TextSize = 14;

				local UICorner = _New_("UICorner", SliderBack);
				UICorner.CornerRadius = UDim.new(1, 0);

				local UIGradient_0 = _New_("UIGradient", shiznets);
				UIGradient_0.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(131.00000739097595, 131.00000739097595, 131.00000739097595))};
				UIGradient_0.Rotation = 90;

				local SliderValue = _New_("TextLabel", Slider);
				SliderValue.BackgroundColor3 = Color3.fromRGB(138.00000697374344, 144.00000661611557, 158.00000578165054);
				SliderValue.BackgroundTransparency = 1;
				SliderValue.Name = "SliderValue";
				SliderValue.Position = UDim2.new(0.8345296382904053, 8, -0.3199999928474426, 8);
				SliderValue.Size = UDim2.new(0.10749948024749756, 0, 1, 0);
				SliderValue.Font = Enum.Font.Unknown;
				SliderValue.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				SliderValue.Text = "0%";
				SliderValue.TextColor3 = Color3.fromRGB(168.0000051856041, 168.0000051856041, 168.0000051856041);
				SliderValue.TextSize = 14;
				SliderValue.TextXAlignment = Enum.TextXAlignment.Right;

				local UIPadding_0 = _New_("UIPadding", SliderValue);
				UIPadding_0.PaddingLeft = UDim.new(0, 9);
				
				-----Values-----
				e.min = e.min or 0
				e.max = e.max or 100


				-----Callback-----
				e.func = e.func or function() end


				-----Variables-----
				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
				local Value;
				local length = shiznets.Size.X.Offset
				local height = shiznets.Size.Y.Offset
				
				SliderBack.MouseButton1Down:Connect(function()
					SliderValue.Text = Value..e.prefix
				end)



				SliderBack.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min)) or 0
					-- Value = e.def

					pcall(function()
						e.func(Value)
					end)
					SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
					moveconnection = mouse.Move:Connect(function()
						SliderValue.Text = Value..e.prefix
						Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min))
						pcall(function()
							e.func(Value)
						end)

						SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min))
							pcall(function()
								e.func(Value)
							end)
							SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
				-- touch fix

				SliderBack.MouseButton1Down:Connect(function()
					SliderValue.Text = Value..e.prefix
					Value = math.floor((((tonumber(e.max) - tonumber(e.min)) / length) * SliderFill.AbsoluteSize.X) + tonumber(e.min))
					pcall(function()
						e.func(Value)
					end)

					SliderFill.Size = UDim2.new(0, math.clamp(mouse.X - SliderFill.AbsolutePosition.X, 0, length), 0, height)
				end)
			end
			
			function s:DropDown(e)
				
				e =  e or {}
				e.list = e.list or {}
				e.func = e.func or function()end
				
				local drop = _New_("Frame", Cont);
				drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				drop.BackgroundTransparency = 1;
				drop.BorderColor3 = Color3.fromRGB(0, 0, 0);
				drop.BorderSizePixel = 0;
				drop.Name = "drop";
				drop.Size = UDim2.new(1, 0, 0, 25);

				local DropText = _New_("TextLabel", drop);
				DropText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				DropText.BackgroundTransparency = 1;
				DropText.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				DropText.Name = "DropText";
				DropText.Position = UDim2.new(0.015384615398943424, 0, 0, 0);
				DropText.Size = UDim2.new(0.7521094679832458, 0, 1, 0);
				DropText.Font = Enum.Font.Unknown;
				DropText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				DropText.Text = e.Text or "DropDown | N/A TEXT FOUND";
				DropText.TextColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257);
				DropText.TextSize = 14;
				DropText.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", DropText);
				UIPadding.PaddingLeft = UDim.new(0, 5);

				local Container = _New_("Frame", drop);
				Container.BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354);
				Container.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Container.BorderSizePixel = 0;
				Container.Name = "Container";
				Container.Position = UDim2.new(0.4667455554008484, 0, 0.9599999785423279, 0);
				Container.Size = UDim2.new(0.518,	0, 0.03999999910593033, 0);



				local ScrollingFrame = _New_("ScrollingFrame", Container);
				ScrollingFrame.Active = true;
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(2.000000118277967, 12.000000234693289, 22.000000588595867);
				ScrollingFrame.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				ScrollingFrame.Position = UDim2.new(0,0,0,0);
				ScrollingFrame.Size = UDim2.new(1,0,1,0);
				ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y;
				ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0);
				ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
				ScrollingFrame.ScrollBarThickness = 0;



				local UIListLayout = _New_("UIListLayout", ScrollingFrame);
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

				local UIPadding_0 = _New_("UIPadding", ScrollingFrame);
				UIPadding_0.PaddingTop = UDim.new(0, 3);

				local Action = _New_("TextButton", drop);
				Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Action.BackgroundTransparency = 1;
				Action.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Action.Name = "Action";
				Action.Size = UDim2.new(1, 0, 1, 0);
				Action.Font = Enum.Font.SourceSans;
				Action.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Action.Text = "";
				Action.TextColor3 = Color3.fromRGB(0, 0, 0);
				Action.TextSize = 14;

				local SelectedOption = _New_("TextLabel", drop);
				SelectedOption.BackgroundColor3 = Color3.fromRGB(5.000000176951289, 5.000000176951289, 15.000000055879354);
				SelectedOption.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				SelectedOption.Name = "SelectedOption";
				SelectedOption.Position = UDim2.new(0.4667455554008484, 0, 0.14000000059604645, 0);
				SelectedOption.Size = UDim2.new(0, 103, 0, 18);
				SelectedOption.Font = Enum.Font.SourceSansBold;
				SelectedOption.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				SelectedOption.Text = "Bind";
				SelectedOption.TextColor3 = Color3.fromRGB(255, 255, 255);
				SelectedOption.TextSize = 14;
				
				

				local f = false
				Action.MouseButton1Down:Connect(function()
					if f == false then
						f = true
						TweenService:Create(
							Container,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0.518, 0,0, 96)}
						):Play()
					else
						f = false
						TweenService:Create(
							Container,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0.518,	0, 0.03999999910593033, 0)}
						):Play()
					end
				end)

				for i,v in next,	e.list do

					local DropItem = _New_("TextButton", ScrollingFrame);
					DropItem.BackgroundColor3 = Color3.fromRGB(2.000000118277967, 12.000000234693289, 22.000000588595867);
					DropItem.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
					DropItem.Name = "DropItem";
					DropItem.Size = UDim2.new(1, 0, -0.0714285746216774, 23);
					DropItem.Font = Enum.Font.SourceSans;
					DropItem.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					DropItem.Text = v;
					DropItem.TextColor3 = Color3.fromRGB(255, 255, 255);
					DropItem.TextSize = 14;
					

					DropItem.MouseButton1Down:Connect(function()
						SelectedOption.Text = ""..v
						e.func(v)
						TweenService:Create(
							Container,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0.518,	0, 0.03999999910593033, 0)}
						):Play()
						f = false
					end)
				end

				
			end
			
			function s:Button(e)
				e = e or {}
				e.func = e.func or function()end
				

				local Button = _New_("Frame", Cont);
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Button.BackgroundTransparency = 1;
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Button.BorderSizePixel = 0;
				Button.Name = "Button";
				Button.Size = UDim2.new(1, 0, 0, 25);

				local Action = _New_("TextButton", Button);
				Action.AnchorPoint = Vector2.new(0.5, 0.5);
				Action.BackgroundColor3 = Color3.fromRGB(8.000000473111868, 24.000000469386578, 50.000000819563866);
				Action.BackgroundTransparency = 0.30000001192092896;
				Action.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Action.BorderSizePixel = 0;
				Action.Name = "Action";
				Action.Position = UDim2.new(0.5, 0, 0.5, 0);
				Action.Size = UDim2.new(0.9477181434631348, 0, 0.7069995403289795, 0);
				Action.Font = Enum.Font.Unknown;
				Action.Text = e.Text or "BUTTON | N/A TEXT FOUND"
				Action.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Action.TextColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257);
				Action.TextSize = 14;

				local UICorner = _New_("UICorner", Action);
				UICorner.CornerRadius = UDim.new(0, 3);
				
				Action.MouseButton1Down:Connect(function()
					e.func()
				end)
				
				Action.MouseEnter:Connect(function()
					TweenService:Create(
						Action,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(6, 161, 244)}
					):Play()
				end)
				
				Action.MouseLeave:Connect(function()
					TweenService:Create(
						Action,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(8, 24, 50)}
					):Play()
				end)
				
			end
			
			function s:ColorPicker(e)
				e = e or {}
				e.func = e.func or function()end
				
				local Color_Picker = _New_("Frame", Cont);
				Color_Picker.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Color_Picker.BackgroundTransparency = 1;
				Color_Picker.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Color_Picker.BorderSizePixel = 0;
				Color_Picker.Name = "Color Picker";
				Color_Picker.Size = UDim2.new(1, 0, 0, 25);

				local SliderText = _New_("TextLabel", Color_Picker);
				SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				SliderText.BackgroundTransparency = 1;
				SliderText.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				SliderText.Name = "SliderText";
				SliderText.Position = UDim2.new(0.015384615398943424, 0, -0.03999999910593033, 0);
				SliderText.Size = UDim2.new(0.7521094679832458, 0, 1, 0);
				SliderText.Font = Enum.Font.Unknown;
				SliderText.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				SliderText.Text = e.Text or "Color Picker | N/A TEXT FOUND";
				SliderText.TextColor3 = Color3.fromRGB(220.00000208616257, 220.00000208616257, 220.00000208616257);
				SliderText.TextSize = 14;
				SliderText.TextXAlignment = Enum.TextXAlignment.Left;

				local UIPadding = _New_("UIPadding", SliderText);
				UIPadding.PaddingLeft = UDim.new(0, 5);

				local Color = _New_("TextButton", Color_Picker);
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				Color.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
				Color.BorderSizePixel = 0;
				Color.Name = "Color";
				Color.Position = UDim2.new(0.8184103965759277, 0, 0.03999999910593033, 4);
				Color.Size = UDim2.new(0, 27, 0, 14);
				Color.ZIndex = 4;
				Color.Font = Enum.Font.SourceSans;
				Color.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Color.Text = "";
				Color.TextColor3 = Color3.fromRGB(0, 0, 0);
				Color.TextSize = 14;

				local UICorner = _New_("UICorner", Color);
				UICorner.CornerRadius = UDim.new(0, 3);
				

				local Pallete = _New_("Frame", Main);
				Pallete.BackgroundColor3 = Color3.fromRGB(23.000000528991222, 23.000000528991222, 23.000000528991222);
				Pallete.BorderColor3 = Color3.fromRGB(31.000000052154064, 31.000000052154064, 31.000000052154064);
				Pallete.Name = "Pallete";
				Pallete.Position = UDim2.new(1.0370235443115234, 0, 0.04368932172656059, 0);
				Pallete.Size = UDim2.new(0.34101754426956177, 0, 0.3010493814945221, 0);
				Pallete.Visible = false;
				Pallete.ZIndex = 4;

				local Gradient = _New_("UIGradient", Pallete);
				Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(180.00000447034836, 180.00000447034836, 180.00000447034836))};
				Gradient.Rotation = 90;
				Gradient.Name = "Gradient";

				local ColorSlider = _New_("TextButton", Pallete);
				ColorSlider.AnchorPoint = Vector2.new(0.5, 0.5);
				ColorSlider.AutoButtonColor = false;
				ColorSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				ColorSlider.BorderColor3 = Color3.fromRGB(0, 0, 0);
				ColorSlider.BorderSizePixel = 0;
				ColorSlider.Name = "ColorSlider";
				ColorSlider.Position = UDim2.new(0.5000000596046448, 0, 0.45346805453300476, 45);
				ColorSlider.Size = UDim2.new(0, 140, 0.06199999898672104, 0);
				ColorSlider.ZIndex = 4;
				ColorSlider.Font = Enum.Font.SourceSans;
				ColorSlider.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				ColorSlider.Text = "";
				ColorSlider.TextColor3 = Color3.fromRGB(0, 0, 0);
				ColorSlider.TextSize = 14;

				local Gradient_0 = _New_("UIGradient", ColorSlider);
				Gradient_0.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4.000000236555934)), ColorSequenceKeypoint.new(0.20000000298023224, Color3.fromRGB(255, 0, 251.00000023841858)), ColorSequenceKeypoint.new(0.4000000059604645, Color3.fromRGB(0, 17.00000088661909, 255)), ColorSequenceKeypoint.new(0.6000000238418579, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.800000011920929, Color3.fromRGB(21.000000648200512, 255, 0)), ColorSequenceKeypoint.new(0.8999999761581421, Color3.fromRGB(234.00000125169754, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4.000000236555934))};
				Gradient_0.Name = "Gradient";

				local GradientPallete = _New_("ImageButton", Pallete);
				GradientPallete.AutoButtonColor = false;
				GradientPallete.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				GradientPallete.BorderColor3 = Color3.fromRGB(0, 0, 0);
				GradientPallete.BorderSizePixel = 0;
				GradientPallete.Name = "GradientPallete";
				GradientPallete.Position = UDim2.new(0.019923944026231766, 0, -0.0004770242958329618, 0);
				GradientPallete.Size = UDim2.new(0, 140, 0, 96);
				GradientPallete.ZIndex = 4;
				GradientPallete.Image = "rbxassetid://4155801252";

				local Dot = _New_("Frame", GradientPallete);
				Dot.AnchorPoint = Vector2.new(0.5, 0.5);
				Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Dot.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Dot.BorderSizePixel = 2;
				Dot.Name = "Dot";
				Dot.Position = UDim2.new(1, 0, 0, 0);
				Dot.Rotation = 45;
				Dot.Size = UDim2.new(0, 3, 0, 3);
				Dot.ZIndex = 5;

				local Input = _New_("Frame", Pallete);
				Input.BackgroundColor3 = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866);
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Input.BorderSizePixel = 0;
				Input.Name = "Input";
				Input.Position = UDim2.new(0.01992269605398178, 0, 0.8819556832313538, 0);
				Input.Size = UDim2.new(0, 140, 0.06199999898672104, 0);
				Input.ZIndex = 4;

				local InputBox = _New_("TextBox", Input);
				InputBox.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933);
				InputBox.BackgroundTransparency = 1;
				InputBox.BorderColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933);
				InputBox.BorderSizePixel = 0;
				InputBox.Name = "InputBox";
				InputBox.Size = UDim2.new(1, 0, 1, 0);
				InputBox.ZIndex = 5;
				InputBox.Font = Enum.Font.SourceSans;
				InputBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				InputBox.PlaceholderColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
				InputBox.PlaceholderText = "RGB: 255, 0, 0";
				InputBox.Text = "";
				InputBox.TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
				InputBox.TextSize = 15;
				InputBox.TextStrokeTransparency = 0.75;
				InputBox.TextWrapped = true;

				local Gradient_1 = _New_("UIGradient", Input);
				Gradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(180.00000447034836, 180.00000447034836, 180.00000447034836))};
				Gradient_1.Rotation = 90;
				Gradient_1.Name = "Gradient";
				
				local ColorpickerInit = {}
				local o = false

				Color.MouseButton1Down:Connect(function()
					if o == false then
						o = true
						Pallete.Visible = o
					else
						o = false
						Pallete.Visible = o
					end
				end)



				local ColorTable = {
					Hue = 1,
					Saturation = 0,
					Value = 0
				}
				local ColorRender = nil
				local HueRender = nil
				local ColorpickerToggle = false

				local function UpdateColor()
					Color.BackgroundColor3 = Color3.fromHSV(ColorTable.Hue,ColorTable.Saturation,ColorTable.Value)
					Pallete.GradientPallete.BackgroundColor3 = Color3.fromHSV(ColorTable.Hue,1,1)
					Pallete.Input.InputBox.PlaceholderText = "RGB: " .. math.round(Color.BackgroundColor3.R* 255) .. "," .. math.round(Color.BackgroundColor3.G * 255) .. "," .. math.round(Color.BackgroundColor3.B * 255)
					e.func(Color.BackgroundColor3)
				end


				Pallete.GradientPallete.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorRender then
							ColorRender:Disconnect()
						end
						ColorRender = RunService.RenderStepped:Connect(function()
							local Mouse = UserInputService:GetMouseLocation()
							local ColorX = math.clamp(Mouse.X - Pallete.GradientPallete.AbsolutePosition.X, 0, Pallete.GradientPallete.AbsoluteSize.X) / Pallete.GradientPallete.AbsoluteSize.X
							local ColorY = math.clamp((Mouse.Y - 37) - Pallete.GradientPallete.AbsolutePosition.Y, 0, Pallete.GradientPallete.AbsoluteSize.Y) / Pallete.GradientPallete.AbsoluteSize.Y
							Pallete.GradientPallete.Dot.Position = UDim2.new(ColorX,0,ColorY,0)
							ColorTable.Saturation = ColorX
							ColorTable.Value = 1 - ColorY
							UpdateColor()
						end)
					end
				end)

				Pallete.GradientPallete.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorRender then
							ColorRender:Disconnect()
						end
					end
				end)

				Pallete.ColorSlider.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueRender then
							HueRender:Disconnect()
						end
						HueRender = RunService.RenderStepped:Connect(function()
							local Mouse = UserInputService:GetMouseLocation()
							local HueX = math.clamp(Mouse.X - Pallete.ColorSlider.AbsolutePosition.X, 0, Pallete.ColorSlider.AbsoluteSize.X) / Pallete.ColorSlider.AbsoluteSize.X
							ColorTable.Hue = 1 - HueX
							UpdateColor()
						end)
					end
				end)

				Pallete.ColorSlider.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueRender then
							HueRender:Disconnect()
						end
					end
				end)

				function ColorpickerInit:UpdateColor(Color)
					local Hue, Saturation, Value = Color:ToHSV()
					Color.BackgroundColor3 = Color3.fromHSV(Hue,Saturation,Value)
					Pallete.GradientPallete.BackgroundColor3 = Color3.fromHSV(Hue,1,1)
					Pallete.Input.InputBox.PlaceholderText = "RGB: " .. math.round(Color.BackgroundColor3.R* 255) .. "," .. math.round(Color.BackgroundColor3.G * 255) .. "," .. math.round(Colorpicker.Color.BackgroundColor3.B * 255)
					ColorTable = {
						Hue = Hue,
						Saturation = Saturation,
						Value = Value
					}
					e.func(Color)
				end

				Pallete.Input.InputBox.FocusLost:Connect(function(Enter)
					if Enter then
						local ColorString = string.split(string.gsub(Pallete.Input.InputBox.Text," ", ""), ",")
						ColorpickerInit:UpdateColor(Color3.fromRGB(ColorString[1],ColorString[2],ColorString[3]))
						Pallete.Input.InputBox.Text = ""
					end
				end)

				return ColorpickerInit
				
			end
			
			
			return s;
		end
return a;
	end
	
	return tb;
end
 return void;
