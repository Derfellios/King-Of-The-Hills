function Client_GameRefresh(game)
	if game.Game.TurnNumber > 0 then return end; -- don't pop up in ongoing games, could be removed later

	if not Mod.PlayerGameData.InitialPopupDisplayed and game.Us ~= nil then
		message = "\n";
		local PublicGameData = Mod.PublicGameData;
		Hills = PublicGameData.Hills;
		for _, Hill in pairs(Hills) do
			message = message .. " - " .. game.Map.Territories[Hill].Name .. "\n";
		end
		UI.Alert("This game includes the King Of The Hills Mod. Capture all hills and hold them to until the end of a turn to win. The hills are" .. message .. "You can find them again by clicking on 'Game' and 'Mod: King Of The Hills'. Good Luck!")
		local payload = {};
		payload.Message = "InitialPopupDisplayed";
		game.SendGameCustomMessage("Please wait... ", payload, function(reply)end);
	end
end