{ userConfig, ... }: {
  xdg.desktopEntries = {
      cursor = {
        name = "Cursor";
        genericName = "IDE";
        exec = "${userConfig.homeDir}/Applications/cursor.AppImage --no-sandbox";
        terminal = false;
      };
  };
}
