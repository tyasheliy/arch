{ userConfig, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    package = pkgs.emptyDirectory;
    oh-my-zsh = {
      enable = true;
      theme = "eastwood";
    };
    autosuggestion.enable = true;
    initExtra = ''
      set -o allexport
      source ${userConfig.homeDir}/.env || touch ${userConfig.homeDir}/.env
      set +o allexport
      export PATH="$PATH:${userConfig.homeDir}/.config/composer/vendor/bin"
    '';
  };

  home.activation.installZsh = userConfig.systemInstall "zsh";

  home = {
    shellAliases = {
      docker = "sudo -E docker";
      sail = "sudo ./vendor/bin/sail";
      lzd = "sudo $(which lazydocker)";
      hsw =
        "export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake ${userConfig.cfgDir}";
      rn = userConfig.rnAlias;
      dsr1 = "ollama run deepseek-r1:8b";
      ds = "ollama run deepseek-coder-v2:16b";
    };

    sessionVariables = { EDITOR = "nvim"; };
  };
}
