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
    neovim.vimAlias = true;
    neovim.viAlias = true;
    zsh.enable = true;
  };

  # programs.sway.enable = true;

}
