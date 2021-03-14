 function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);
    UI.CreateLabel(vert).SetText('Number of hills in the game: ' .. Mod.Settings.NumberOfHills);
	UI.CreateLabel(vert).SetText('Number of armies on each hill: ' .. Mod.Settings.SizeOfHills);
	UI.CreateLabel(vert).SetText('Capture all hills and hold them until the end of a turn to win.');
end