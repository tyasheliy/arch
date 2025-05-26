{ pkgs, userConfig, ... }: {
	programs.alacritty = {
		enable = true;
		package = pkgs.emptyDirectory;
		settings = {
			font.normal = {
				family = "JetBrains Mono Nerd Font";
				style = "Regular";
			};
		};
	};

	home.activation.installAlacritty = userConfig.systemInstall "alacritty";
}
