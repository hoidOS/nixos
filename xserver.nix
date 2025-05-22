{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      # videoDrivers = [ "nvidia" ];
      videoDrivers = [ "amdgpu" ];

      # Configure keymap in X11
      xkb.layout = "us,us";
      xkb.variant = ",intl";
      # xkbOptions = "grp:shifts_toggle, grp_led:caps, caps:escape";
      autoRepeatDelay = 300;
      autoRepeatInterval = 50;

      # Login Display settings
      displayManager = {
        # startx.enable = true;
        gdm.enable = true;
        gdm.wayland = true;
        gdm.autoSuspend = false;

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
        gnome.enable = true;
        # plasma6.enable = true;
      };
    };
    displayManager = {
        # defaultSession = "none+leftwm";
        defaultSession = "hyprland";
      };
  };

  programs.waybar.enable = true;

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

}
