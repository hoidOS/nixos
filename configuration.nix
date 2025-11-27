{ pkgs, config, ... }:

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

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable sound.
  # rtkit is optional but recommended for pipewire
  security.rtkit.enable = true;
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Nvidia Setting
  hardware.graphics.enable = true;

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    open = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Zsa
  hardware.keyboard.zsa.enable = true;

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
