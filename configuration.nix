{ config, pkgs, ... }:

{
  imports =
    [
      ./cron.nix
      ./hardware-configuration.nix
      ./packages.nix
      ./programs.nix
      ./services.nix
      ./settings.nix
      ./virt.nix
      ./xserver.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable sound.
  # rtkit is optional but recommended for pipewire
  security.rtkit.enable = true;
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Nvidia Setting
  hardware.opengl.enable = true;
  # hardware.nvidia.modesetting.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  security.sudo.wheelNeedsPassword = false;
  users.users.oedon = {
    isNormalUser = true;
    extraGroups = [ "wheel" "mlocate" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    # settings.X11Forwarding = true;
  };
  # programs.ssh.forwardX11 = true;
  # programs.ssh.setXAuthLocation = true;
  

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
