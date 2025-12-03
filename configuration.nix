{
  pkgs,
  config,
  lib,
  ...
}:

{
  # Split configuration into manageable modules.
  imports = [
    ./cron.nix # scheduled jobs
    ./hardware-configuration.nix # generated hardware profile
    ./packages.nix # system packages
    ./programs.nix # user programs and tools
    ./services.nix # system services
    ./settings.nix # locale, fonts, networking
    ./virt.nix # virtualization settings
    ./xserver.nix # display stack
  ];

  # Binary cache and nix behavior.
  nix.settings = {
    # Permit these users/groups to perform nix operations.
    trusted-users = [
      "root"
      "@wheel"
      "hoid"
    ];
    # Use upstream and community caches.
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    # Keys that sign the caches above.
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY"
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    # Enable modern CLI and flakes.
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  security.sudo.wheelNeedsPassword = false; # allow wheel sudo without prompt
  # Primary user account.
  users.users.hoid = {
    isNormalUser = true; # regular login user
    extraGroups = [
      "wheel" # sudo access
      "mlocate" # file database updates
      "docker" # container management
      "libvirtd" # virtualization tools
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh; # default shell
  };

  system.stateVersion = "22.11"; # keep defaults from initial install
}
