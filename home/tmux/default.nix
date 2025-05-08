{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    plugins = with pkgs; [{
      plugin = tmuxPlugins.resurrect;
      extraConfig = ''
		set -g @resurrect-strategy-nvim "session"
		set -g @resurrect-strategy-vim 'session'

		resurrect_dir="$HOME/.tmux/resurrect"
		set -g @resurrect-dir $resurrect_dir
		set -g @resurrect-capture-pane-contents 'on'
		set -g @resurrect-hook-post-save-all "sed 's/--cmd[^ ]* [^ ]* [^ ]*//g' $resurrect_dir/last | sponge $resurrect_dir/last"
		set -g @resurrect-processes '"~nvim"'
      '';
    }];
  };
}
