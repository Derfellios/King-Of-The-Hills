function Server_StartGame(game, standing)
	if not game.Settings.AutomaticTerritoryDistribution then return end;
	NumberOfHills = 2;
	if Mod.Settings.NumberOfHills ~= nil then
		NumberOfHills = Mod.Settings.NumberOfHills;
	end
	
	SizeOfHills = 10
	local BannedPicks = Mod.PublicGameData;
	if Mod.Settings.SizeOfHills ~= nil then
		SizeOfHills = Mod.Settings.SizeOfHills;
	end
	
	local PublicGameData = Mod.PublicGameData;
	PublicGameData.Hills = {}
	local PossTerr = {}
	for _, territory in pairs(standing.Territories) do
		if territory.IsNeutral then
			table.insert(PossTerr, territory.ID)
		end
	end
	for i = 1, NumberOfHills do
		local j = math.random(i, #PossTerr)
		PossTerr[i], PossTerr[j] = PossTerr[j], PossTerr[i]
		table.insert(PublicGameData.Hills, PossTerr[i])
		standing.Territories[PossTerr[i]].NumArmies = WL.Armies.Create(SizeOfHills, {})
	end

	Mod.PublicGameData = PublicGameData;
end
