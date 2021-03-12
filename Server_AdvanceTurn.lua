
function Server_AdvanceTurn_End(game, addNewOrder)
	local Hills  = Mod.PublicGameData.Hills;
	local Owners = {}
	for _, Hill in pairs(Hills) do;
		table.insert(Owners, game.ServerGame.LatestTurnStanding.Territories[Hill].OwnerPlayerID)
	end
	
	AllSame = true
	for i = 1, #Owners do
		if Owners[i] ~= Owners[1] then
			AllSame = false
		end
	end
	ToLose = {}
	if not game.ServerGame.LatestTurnStanding.Territories[Hills[1]].IsNeutral and AllSame then
		PlayerID = game.ServerGame.LatestTurnStanding.Territories[Hills[1]].OwnerPlayerID;
		for TerrID, Terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
			if PlayerID ~= Terr.OwnerPlayerID and not Terr.IsNeutral then
				table.insert(ToLose, TerrID)
			end
		end
		local Effect = {};
		local DoEffect = false;
		for _,terr in pairs(ToLose) do
			Effect[tablelength(Effect)+1] = WL.TerritoryModification.Create(terr); 
			Effect[tablelength(Effect)].SetOwnerOpt = WL.PlayerID.Neutral;
			DoEffect = true
		end
		if DoEffect then 
			addNewOrder(WL.GameOrderEvent.Create(PlayerID, game.ServerGame.Game.PlayingPlayers[PlayerID].DisplayName(nil, false) .." captured all hills. They win!", {}, Effect));
		end
	end
end

function NotTableEmpty(List)
	for a,b in pairs(List) do
		return true
	end
	return false
end

function NotinTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then 
		return false 
	end
    end
    return true
end

function tablelength(t)
	local count = 0;
	for _,elem in pairs(t)do
		count = count + 1;
	end
	return count;
end