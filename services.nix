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
    # locate = {
    #   enable = false;
    #   package = pkgs.mlocate;
    #   interval = "hourly";
    #   localuser = null;
    # };

    # TRIM
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    flatpak.enable = true;

    # Start emacs daemon
    emacs = {
      enable = true;
      # package = pkgs.emacs29;
    };

    ollama = {
      enable = true;
      acceleration = "rocm";
      package = pkgs.unstable.ollama;
      # listenAddress = "10.0.0.97:11434";
      environmentVariables = {
        HSA_OVERRIDE_GFX_VERSION = "11.0.2";
      };
    };
    open-webui = {
      enable = true;
      host = "10.0.0.97";
      port = 8080;
      # package = pkgs.unstable.open-webui;
      # environment = {
      #   ANONYMIZED_TELEMETRY = "False";
      #   DO_NOT_TRACK = "True";
      #   SCARF_NO_ANALYTICS = "True";
      #   OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
      #   OLLAMA_BASE_URL = "http://127.0.0.1:11434";
      # };
    };

    # Keyring
    gnome.gnome-keyring.enable = true;
  };
}
