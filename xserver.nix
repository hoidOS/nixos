{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];

      # Configure keymap in X11
      layout = "us,us";
      xkbVariant = ",intl";
      xkbOptions = "grp:shifts_toggle, grp_led:caps, caps:escape";
      autoRepeatDelay = 300;
      autoRepeatInterval = 50;

      # Login Display settings
      displayManager = {
        # startx.enable = true;
        gdm.enable = true;
        gdm.autoSuspend = false;
        defaultSession = "none+leftwm";

        # sessionCommands = ''
        #   xrandr --output DP-2 --mode 3440x1440 --rate 144
        #   xset r rate 300 50 &
        #   xset m 0 0 &
        #   dunst &
        #   nitrogen --restore &
        #   picom &
        #   dwmblocks &
        #   unclutter &
        # '';

      };

      # Window managers
      windowManager = {
        dwm.enable = true;
        leftwm.enable = true;
      };

      # Desktop managers
      desktopManager = {
        # desktopManager.gnome.enable = true;
      };
    };
  };
}
