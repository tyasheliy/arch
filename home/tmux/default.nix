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

			bind-key -n M-1 select-window -t 1
			bind-key -n M-2 select-window -t 2
			bind-key -n M-3 select-window -t 3
			bind-key -n M-4 select-window -t 4
			bind-key -n M-5 select-window -t 5
			bind-key -n M-6 select-window -t 6
			bind-key -n M-7 select-window -t 7
			bind-key -n M-8 select-window -t 8
			bind-key -n M-9 select-window -t 9
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
