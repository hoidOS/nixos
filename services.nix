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
    syncthing = {
      enable = true;
      user = "oedon";
      group = "users";
      openDefaultPorts = true;
      systemService = true;
      configDir = "/home/oedon/.config/syncthing";
    };

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

    # Locate Service
    locate = {
      enable = false;
      package = pkgs.mlocate;
      interval = "hourly";
      localuser = null;
    };

    # TRIM
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    flatpak.enable = true;

    # Start emacs daemon
    emacs = {
      enable = true;
      package = pkgs.emacs29;
    };

    # ollama = {
    #   enable = true;
    #   acceleration = "cuda";
    #   package = pkgs.unstable.ollama;
    #   listenAddress = "10.0.0.97:11434";
    #   };

    # Keyring
    gnome.gnome-keyring.enable = true;
  };
}
