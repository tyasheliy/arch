{ pkgs, userConfig, ... }: {
  home.activation = {
	  installNeovim = userConfig.rnScript "install_neovim.sh";
	  makeNeovimLink = userConfig.rnScript "make_neovim_link.sh";
  };
}
