{ userConfig, ... }: 
let
	external = userConfig.monitors.external;
	builtIn = userConfig.monitors.builtIn;
in {
	xsession.windowManager = {
		bspwm = {
			enable = false;
			extraConfigEarly = ''
			if xrandr -q | grep "${external} connected"; then
		    bspc monitor ${external} -d 1 2 3 4 5 6 7 8 9
        bspc monitor ${builtIn} -d 10
      else
		    bspc monitor -d 1 2 3 4 5 6 7 8 9
			fi
			'';
			settings = {
				border_width = 2;
			};
		};
	};
}
