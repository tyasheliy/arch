{
  services.sxhkd = {
    enable = false;
    keybindings = {
      "alt + @space" = "rofi -show drun";
      "alt + Return" = "alacritty";
      "ctrl + alt + Return" = "firefox --browser";
      "alt + q" = "bspc node --kill";
      "alt + shift + {q,r}" = "bspc {quit,wm -r}";
      "alt + Escape" = "pkill -USR1 -x sxhkd";
      "alt + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "alt + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
      "XF86AudioRaiseVolume" = "pactl set-sink-volume 0 +5%";
      "XF86AudioLowerVolume" = "pactl set-sink-volume 0 -5%";
      "XF86AudioMute" = "pactl set-sink-mute 0 toggle";
      "XF86AudioMicMute" = "amixer set Capture toggle";
    };
  };
}
