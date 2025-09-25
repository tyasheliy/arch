{ pkgs, userConfig, ... }: {
	programs.alacritty = {
		enable = true;
		package = pkgs.emptyDirectory;
		settings = {
			font = {
				size = 13;
			};

			font.normal = {
				family = "Inconsolata Nerd Font";
				style = "Regular";
			};
		};
	};

	home.activation.installAlacritty = userConfig.systemInstall "alacritty";
	home.activation.installAlacrittyFont = userConfig.systemInstall "ttf-inconsolata-nerd";
}
