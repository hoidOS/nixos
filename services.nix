{ config, pkgs, ... }:
{
  services = {

    # Pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    # Syncthing for shared folders (configured directly in the syncthing client)
    # syncthing = {
    #   enable = true;
    #   user = "oedon";
    #   group = "users";
    #   openDefaultPorts = true;
    #   systemService = true;
    #   configDir = "/home/oedon/.config/syncthing";
    # };

    tailscale = {
      enable = true;
      package = pkgs.unstable.tailscale;
    };

    mullvad-vpn = {
      enable = true;
    };

    printing = {
      enable = true;
      drivers = [ pkgs.samsung-unified-linux-driver_1_00_37 ];
    };

    # TRIM
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    flatpak.enable = true;

    colord.enable = true;

    # Start emacs daemon
    emacs = {
      enable = true;
      # package = pkgs.emacs29;
    };

    # Keyring
    gnome.gnome-keyring.enable = true;
  };
}
