 function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);
	UI.CreateLabel(vert).SetText("The hills can found by clicking 'Game' on the bottom left and then 'Mod: King Of The Hill'");
	
	NumberOfHills = Mod.Settings.NumberOfHills;
	if NumberOfHills < 0 then
		NumberOfHills = 0
	end
	
	SizeOfHills = Mod.Settings.SizeOfHills;
	if SizeOfHills < 0 then
		SizeOfHills = 0
	end
	
    UI.CreateLabel(vert).SetText('Number of hills in the game: ' .. NumberOfHills);
	UI.CreateLabel(vert).SetText('Number of armies on each hill: ' .. SizeOfHills);
	UI.CreateLabel(vert).SetText('Hold all hills at the end of a turn to win!');
end
