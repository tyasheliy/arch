{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          resurrect_dir="$HOME/.tmux/resurrect"
          set -g @resurrect-dir $resurrect_dir

          set -g @resurrect-strategy-nvim "session"
          set -g @resurrect-strategy-vim 'session'
        '';
      }

      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set-option -g status-right ""
          set-option -g @continuum-restore 'on'
        '';
      }
    ];
  };
}
