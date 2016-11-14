--[[
	Moderator Commands ~ Stormersoul
--]]

local Administrators = {
	["Stormersoul"] = true,
	["caden2hip"] = true,
	["kirbygreen4"] = true,
	["Stormersoul"] = true,
	["caden2hip"] = true,
	["sweg2hip"] = true,
	["Theheadlessadmin"] = true,
	["Emc5322"] = true,
	["Player1"] = true,
	["StarterRBLX"] = true,
	["7Slivka"] = true,
	["Cli_ck"] = true,
	["IICyanTheDiamondII"] = true
}

game.Players.PlayerAdded:connect(function(player2)
	if Administrators[player2.Name] then
		local hint = Instance.new("Hint")
		hint.Text = player2.Name .. " has joined and is an administrator."
		hint.Parent = workspace
		game:GetService("Debris"):AddItem(hint, 6)
	end
end)

function findPlayer(name)
	for _, player in ipairs(game.Players:GetPlayers()) do
		if player.Name:lower() == name:lower() then
			return player
		end
	end
end

function onChatted(message, player)
	if message:sub(1, 5) == "/kill" and Administrators[player.Name] then
		local victim = findPlayer(message:sub(7))
		if victim and victim.Character then
			victim.Character:BreakJoints()
		end
	end
	if message:sub(1, 5) == "/warn" and Administrators[player.Name] then
		local victim = findPlayer(message:sub(7))
		if victim and victim.Character then
			local s = game.ServerStorage.WarningGui:Clone()
			s.Parent = victim.PlayerGui
		end
	end
	if message:sub(1, 5) == "/kick" and Administrators[player.Name] then
		local victim = findPlayer(message:sub(7))
		if victim and victim.Character then
			local s = game.ServerStorage.KickedGui:Clone()
			s.Parent = victim.PlayerGui
			victim:Kick("You have been kicked by a moderator.")
		end
	end
	if message == "/ac" and Administrators[player.Name] then
		player.PlayerGui:FindFirstChild("ConsoleGui").MainFrame.Visible = true
	end
	
end

game.Players.PlayerAdded:connect(function(player)
	local plrRank = player:GetRoleInGroup(2987620)
	if plrRank == "Admin" or plrRank == "Head Admin" then
		table.insert(Administrators, player.Name)
	end
	player.Chatted:connect(function(message)
		onChatted(message, player)
	end)
end)