{ userConfig, ... }: {
	home.activation = {
		installFluentGtkTheme = userConfig.rnScript "install_fluent_gtk_theme.sh";
		installXfce = userConfig.rnScript "install_xfce.sh";
		makeXfceLink = userConfig.rnScript "make_xfce_link.sh";
	};

	home.file.".xinitrc".text = "exec startxfce4";
}
