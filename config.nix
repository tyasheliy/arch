{ lib, ... }:
let
	homeDir = "/home/tyasheliy";
	cfgDirName = "os"; # name of the repo dir.
	cfgDir = "${homeDir}/${cfgDirName}";
	scriptDirName = "scripts";
	scriptDir = "${cfgDir}/${scriptDirName}";

	rnAlias = "SCRIPT_DIR=${scriptDir} bash ${cfgDir}/rn.sh";
in {
	system = "x86_64-linux";
	username = "tyasheliy";
	inherit homeDir;
	inherit cfgDirName;
	inherit cfgDir;
	inherit scriptDirName;
	inherit scriptDir;

	systemInstall = pkg: lib.hm.dag.entryAfter [ "writeBoundary" ] ''
		run /usr/bin/sudo /usr/bin/apt install -y ${pkg}
	'';

	snapInstall = pkg: lib.hm.dag.entryAfter [ "writeBoundary" ] ''
		run /usr/bin/sudo /usr/bin/snap install -y ${pkg}
	'';

	inherit rnAlias;

	rnScript = script: lib.hm.dag.entryAfter [ "writeBoundary" "installPackages" ] ''
		export PATH=$PATH:/usr/bin
		${rnAlias} ${script}
	'';

	stateVersion = "24.11";

	# this is used in bspwm dual monitor setup.
	# run 'xrandr -q' to get names of display ports.
	monitors = { 		
		# name of built-in display port.
		builtIn = "eDP-1"; 			

		# name of external display port.
		external = "HDMI-2"; 			
	};
}
