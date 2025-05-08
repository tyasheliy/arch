{ pkgs, userConfig, ... }: {
  programs.git = {
    enable = true;
	package = pkgs.emptyDirectory;
    userName = "tyasheliy";
    userEmail = "egorgerasimov@tuta.io";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };

  home.activation.installGit = userConfig.systemInstall "git";
}
