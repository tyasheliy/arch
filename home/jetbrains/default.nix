{ userConfig, ... }: {
  home.file.".ideavimrc".text = "inoremap kj <ESC>";

  # place phpstorm flake and build it in $HOME/phpstorm-flake.
  xdg.desktopEntries = {
      phpstorm = {
        name = "Phpstorm";
        genericName = "IDE";
        exec = "${userConfig.homeDir}/phpstorm-flake/result/bin/phpstorm";
        terminal = false;
      };
      goland = {
        name = "Goland";
        genericName = "IDE";
        exec = "${userConfig.homeDir}/phpstorm-flake/result/bin/goland";
        terminal = false;
      };
  };
}
