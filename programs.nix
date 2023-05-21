{ config, pkgs, ... }:
{
  programs = {
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
