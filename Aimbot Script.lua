local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

getgenv().Aimbot = {
	Enabled = true,
	TeamCheck = false,
	AimPart = "Head",
	AimTime = 0,
	
	CircleColor = Color3.fromRGB(255, 255, 255),
	CircleTransparency = 0.7,
	CircleRadius = 80,
	CircleFilled = false,
	CircleVisible = true,
	CircleThickness = 0,
	
	FOVCircle = Drawing.new("Circle"),
	
	Key = "MouseButton2"
}

if getgenv().Aimbot.Enabled then
	getgenv().Aimbot.FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	getgenv().Aimbot.FOVCircle.Radius = getgenv().Aimbot.CircleRadius
	getgenv().Aimbot.FOVCircle.Filled = getgenv().Aimbot.CircleFilled
	getgenv().Aimbot.FOVCircle.Color = getgenv().Aimbot.CircleColor
	getgenv().Aimbot.FOVCircle.Visible = getgenv().Aimbot.CircleVisible
	getgenv().Aimbot.FOVCircle.Radius = getgenv().Aimbot.CircleRadius
	getgenv().Aimbot.FOVCircle.Transparency  = getgenv().Aimbot.CircleTransparency
	getgenv().Aimbot.FOVCircle.Thickness = getgenv().Aimbot.CircleThickness

	local function GetClosestPlayer()
		local MaximumDistance = getgenv().Aimbot.CircleRadius
		local Target = nil

		for _, v in pairs(Players:GetChildren()) do
			if v.Name ~= LocalPlayer.Name then
				if getgenv().Aimbot.TeamCheck == true then
					if v.Team ~= LocalPlayer.Team then
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild(getgenv().Aimbot.AimPart) or v.Character:FindFirstChild("Humanoid") then
								if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

									if VectorDistance < MaximumDistance then
										Target = v
									end
								end
							end
						end
					end
				else
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild(getgenv().Aimbot.AimPart) or v.Character:FindFirstChild("Humanoid") then
							if v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

								if VectorDistance < MaximumDistance then
									Target = v
								end
							end
						end
					end
				end
			end
		end

		return Target
	end

	UserInputService.InputBegan:Connect(function(Input)
	    if Input.UserInputType == Enum.UserInputType[Aimbot.Key] then
		Holding = true
	    end
	end)

	UserInputService.InputEnded:Connect(function(Input)
	    if Input.UserInputType == Enum.UserInputType[Aimbot.Key] then
		Holding = false
	    end
	end)

	RunService.RenderStepped:Connect(function()
	    if getgenv().Aimbot.Enabled then
	    	getgenv().Aimbot.FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
	    	getgenv().Aimbot.FOVCircle.Radius = Aimbot.CircleRadius
	    	getgenv().Aimbot.FOVCircle.Filled = Aimbot.CircleFilled
	    	getgenv().Aimbot.FOVCircle.Color = Aimbot.CircleColor
	    	getgenv().Aimbot.FOVCircle.Visible = Aimbot.CircleVisible
	    	getgenv().Aimbot.FOVCircle.Radius = Aimbot.CircleRadius
	    	getgenv().Aimbot.FOVCircle.Transparency = Aimbot.CircleTransparency
	    	getgenv().Aimbot.FOVCircle.Thickness = Aimbot.CircleThickness
	    else
		getgenv().Aimbot.FOVCircle.Visible         = false
	    end

	    if Holding == true and Aimbot.Enabled == true then
		if GetClosestPlayer().Character[getgenv().Aimbot.AimPart] then
			TweenService:Create(Camera, TweenInfo.new(Aimbot.AimTime, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[getgenv().Aimbot.AimPart].Position)}):Play()
		end
	    end
	end)
end

return Aimbot
