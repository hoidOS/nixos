{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];

      xkb.layout = "us";
      # xkb.variant = ",intl";
      # xkbOptions = "grp:shifts_toggle, grp_led:caps, caps:escape";

      autoRepeatDelay = 300;
      autoRepeatInterval = 50;
    };

    displayManager = {
      gdm.enable = true;
      gdm.autoSuspend = false;
      defaultSession = "hyprland";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # programs.waybar.enable = true;
}
