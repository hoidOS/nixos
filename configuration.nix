{
  pkgs,
  config,
  lib,
  ...
}:

{
  imports = [
    ./cron.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./settings.nix
    ./virt.nix
    ./xserver.nix
  ];

  # Binary Cache
  nix.settings = {
    trusted-users = [
      "root"
      "@wheel"
      "hoid"
    ];
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY"
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    # Flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  security.sudo.wheelNeedsPassword = false;
  users.users.hoid = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "mlocate"
      "docker"
      "libvirtd"
    ]; # Enable ‘sudo’ for the user.
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
