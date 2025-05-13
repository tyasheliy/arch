{ pkgs, userConfig, ... }: {
	programs.alacritty = {
		enable = true;
		package = pkgs.emptyDirectory;
	};

	home.activation.installAlacritty = userConfig.systemInstall "alacritty";
}
