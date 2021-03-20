function Client_GameRefresh(game)
	if game.Game.TurnNumber > 1 or (game.Game.TurnNumber == 1 and not game.Settings.AutomaticTerritoryDistribution) then return end; -- don't pop up in ongoing games, could be removed later

	if not Mod.PlayerGameData.InitialPopupDisplayed and game.Us ~= nil then
		message = "\n";
		local PublicGameData = Mod.PublicGameData;
		Hills = PublicGameData.Hills;
		for _, Hill in pairs(Hills) do
			message = message .. " - " .. game.Map.Territories[Hill].Name .. "\n";
		end
		UI.Alert("This game includes King of the Hills. Hold all hills at the end of a turn to win. The hills are" .. message .. "They can be found under 'Game' and 'Mod: King Of The Hills'.")
		local payload = {};
		payload.Message = "InitialPopupDisplayed";
		game.SendGameCustomMessage("Please wait... ", payload, function(reply)end);
	end
end