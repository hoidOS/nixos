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
    # Neovim
    neovim = {
      enable = true;
      package = pkgs.unstable.neovim-unwrapped;
      vimAlias = true;
      viAlias = true;
    };
    # zsh
    zsh.enable = true;

    steam.enable = true;
  };
}
