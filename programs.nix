{ config, pkgs, ... }:
{
  programs = {
    # virt-manager
    dconf.enable = true;
    # Gnu gpg
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    # zsh
    zsh.enable = true;
    #steam.enable = true;

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        icu
        gmp
        openssl
        (lib.getLib stdenv.cc.cc)
        zlib
      ];
    };

  };
}
