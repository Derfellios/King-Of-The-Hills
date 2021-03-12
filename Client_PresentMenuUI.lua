 function map(array, func, j)
	local new_array = {}
	local i = 1;
	for _,v in pairs(array) do
		new_array[i] = func(v, j);
		i = i + 1;
	end
	return new_array
end

 function filter(array, func)
	local new_array = {}
	local i = 1;
	for _,v in pairs(array) do
		if (func(v)) then
			new_array[i] = v;
			i = i + 1;
		end
	end
	return new_array
end

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
 
	Game = game; --make it globally accessible
	

	
    if Game.Us ~= nil then
	
		NumberOfHills = 2;
		if Mod.Settings.NumberOfHills ~= nil then
			NumberOfHills = Mod.Settings.NumberOfHills;
		end
	
		local vert = UI.CreateVerticalLayoutGroup(rootParent);
		
		UI.CreateLabel(vert).SetText('The '..Mod.Settings.NumberOfHills..' hills in this game are:');

		local PublicGameData = Mod.PublicGameData;
		Hills = PublicGameData.Hills;
		for _, Hill in pairs(Hills) do
			UI.CreateLabel(vert).SetText("-" .. game.Map.Territories[Hill].Name);
		end
		UI.CreateLabel(vert).SetText('Capture all of them to win!');
	end
end


