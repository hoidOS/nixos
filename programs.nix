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
    neovim = {
      vimAlias = true;
      viAlias = true;
    };
    zsh.enable = true;
  };
}
