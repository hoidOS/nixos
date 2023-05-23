{ config, pkgs, ... }:
{
  networking = {
    hostName = "3900X"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
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

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      # joypixels
      liberation_ttf
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      ubuntu_font_family
      unifont
      # ICONS
      siji
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "FiraMono" "Go-Mono" "Inconsolata" "JetBrainsMono" ]; })
    ];
  };

  # nixpkgs.config = {
  #   allowUnfree = true;
  #   joypixels.acceptLicense = true;
  # };

}
