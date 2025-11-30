{ userConfig, pkgs, ... }:
let
	isEnable = false;
in {
  services.sxhkd = {
    enable = isEnable;
	package = pkgs.emptyDirectory;
    keybindings = {
      "super + @space" = "rofi -show drun";
      "super + Return" = "alacritty";
      "ctrl + super + Return" = "firefox --browser";
      "super + q" = "bspc node --kill";
      "super + shift + {q,r}" = "bspc {quit,wm -r}";
      "super + Escape" = "pkill -USR1 -x sxhkd";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "super + {t,shift + t,s}" = "bspc node -t {tiled,pseudo_tiled,floating}";
	  "super + f" = "bspc node -t \\~fullscreen";
	  "super + {h,j,k,l}" = "bspc node -f {west,south,north,east}";
      "XF86AudioRaiseVolume" = "pactl set-sink-volume 0 +5%";
      "XF86AudioLowerVolume" = "pactl set-sink-volume 0 -5%";
      "XF86AudioMute" = "pactl set-sink-mute 0 toggle";
      "XF86AudioMicMute" = "amixer set Capture toggle";
    };
  };

  home.activation.installSxhkd = userConfig.systemInstall "sxhkd";
}
