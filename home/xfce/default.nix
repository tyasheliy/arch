{ userConfig, ... }: {
	home.activation.makeXfceLink = userConfig.rnScript "make_xfce_link.sh";
}
