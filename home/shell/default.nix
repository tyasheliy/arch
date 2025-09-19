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
      	  export NIXPKGS_ALLOW_INSECURE=1
      	  export NIXPKGS_ALLOW_UNFREE=1

      	  ns() {
      		 nix shell nixpkgs#"$1" --impure
      	  }
    '';
    profileExtra =
      "	if [ -z \"$DISPLAY\" ] && [ \"$XDG_VTNR\" -eq 1 ]; then\n		exec startx\n	fi\n";
  };

  home.activation.installZsh = userConfig.systemInstall "zsh";

  home = {
    shellAliases = {
      docker = "sudo -E docker";
      lzd = "sudo $(which lazydocker)";
      dcu = "docker compose up -d";
      dcul = "docker compose up -d && lzd";
      dcd = "docker compose down";

      sail = "sudo ./vendor/bin/sail";
      vim = "nvim";
      hsw =
        "sudo echo 'Using sudo!' && export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake ${userConfig.cfgDir}";
      rn = userConfig.rnAlias;
    };

    sessionVariables = { EDITOR = "nvim"; };
  };
}
