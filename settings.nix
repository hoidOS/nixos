{ config, pkgs, ... }:
{
  # Networking
  networking = {
    hostName = "9800X3D"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    # nameservers = [ "100.100.100.100" ];
    # search = [ "robin-cobra.ts.net" ];
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    firewall.enable = false;
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
    dnsovertls = "true";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = false; # use xkbOptions in tty.
  };

  # Fonts
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      joypixels
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      # (nerdfonts.override { fonts = [ "FiraCode" "Inconsolata" "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
    ];
  };
}
