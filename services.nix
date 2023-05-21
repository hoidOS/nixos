{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];

      # Only for displayManager
      displayManager.sessionCommands = ''
        xrandr --output DP-2 --mode 3440x1440 --rate 144
        xset r rate 300 50 &
        xset m 0 0 &
        dunst &
        nitrogen --restore &
        picom &
        # dwmblocks &
        unclutter &
      '';

      # Configure keymap in X11
      layout = "us,de";
      xkbOptions = "grp:shifts_toggle, grp_led:caps, caps:escape";
      autoRepeatDelay = 300;
      autoRepeatInterval = 50;

      # Display & Window Manager
      # displayManager.startx.enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.autoSuspend = false;
      # desktopManager.gnome.enable = true;
      windowManager.dwm.enable = true;
      # windowManager.leftwm.enable = true;
      displayManager.defaultSession = "none+dwm";
    };

    # Enable CUPS to print documents.
    printing.enable = true;
    printing.drivers = [ pkgs.samsung-unified-linux-driver_1_00_37 ];

    # Start emacs daemon
    emacs.enable = true;

    # Locate Service
    locate = {
      enable = true;
      locate = pkgs.mlocate;
      interval = "hourly";
      localuser = null;
    };

    # TRIM
    fstrim = {
      enable = true;
      interval = "weekly";
    };

  };
}
