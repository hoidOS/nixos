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
    # neovim = {
    #   enable = true;
    #   # package = pkgs.unstable.neovim-unwrapped;
    #   package = pkgs.neovim-unwrapped; #nightly overlay
    #   vimAlias = true;
    #   viAlias = true;
    #   extra.packages = with pkgs; [
    #   lua-language-server
    #
    #   ];
    # };
    # zsh
    zsh.enable = true;

    steam.enable = true;
  };
}
