{ pkgs, userConfig, ... }: {
	  programs.neovim = {
	    enable = true;
	    viAlias = true;
	    withNodeJs = true;
	    withPython3 = true;
	    extraPackages = with pkgs; [ 
	 	gcc 
	 	fzf 
	 	cargo 
	 	xclip 
	 	gomodifytags 
	 	impl
	 	go
	 ];
	  };

  home.activation.makeNeovimLink = userConfig.rnScript "make_neovim_link.sh";
}
