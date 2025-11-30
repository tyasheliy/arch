{ userConfig, pkgs, ... }:
let
  external = userConfig.monitors.external;
  builtIn = userConfig.monitors.builtIn;
  isEnable = false;
in {
	xsession.windowManager = {
		bspwm = {
		  enable = isEnable;
		  package = pkgs.emptyDirectory;
		  extraConfigEarly = ''
			if xrandr -q | grep "${external} connected"; then
				bspc monitor ${external} -d 1 2 3 4 5 6 7 8 9
				bspc monitor ${builtIn} -d 10
			else
				bspc monitor -d 1 2 3 4 5 6 7 8 9
			fi
		  '';
		  settings = { border_width = 2; };
		};
	};

	home.activation.installBspwm = userConfig.systemInstall "bspwm";
}
