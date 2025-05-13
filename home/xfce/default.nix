{ userConfig, ... }: {
	home.activation = {
		installXfce = userConfig.rnScript "install_xfce.sh";
		makeXfceLink = userConfig.rnScript "make_xfce_link.sh";
	};
}
