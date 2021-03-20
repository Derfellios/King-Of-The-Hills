 function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);
	UI.CreateLabel(vert).SetText('The hills can found by clicking on 'Game' on the bottom left and then on 'Mod: King Of The Hill');
    	UI.CreateLabel(vert).SetText('Number of hills in the game: ' .. Mod.Settings.NumberOfHills);
	UI.CreateLabel(vert).SetText('Number of armies on each hill: ' .. Mod.Settings.SizeOfHills);
	UI.CreateLabel(vert).SetText('Hold all hills at the end of a turn to win!');
end
