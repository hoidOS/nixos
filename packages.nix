{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    appimage-run
    dwmblocks
    fd
    gcc
    git
    gnumake
    htop
    killall
    kitty
    libnotify
    lxappearance
    nitrogen
    p7zip
    pandoc
    pcmanfm
    picom
    pulsemixer
    rclone
    ripgrep
    rofi
    scrot
    texlive.combined.scheme-medium
    tor-browser-bundle-bin
    unclutter-xfixes
    ungoogled-chromium
    unzip
    vim
    virt-manager
    wget
    xclip
    xorg.setxkbmap
    # xsel

    # Unstable
    unstable._1password-gui
    # unstable.neovim
    unstable.tree-sitter
    unstable.nixfmt
    unstable.rnix-lsp

    # Developer
    luajitPackages.luarocks
    nodePackages.npm
    nodejs
    python3
    python310Packages.pip
    unstable.rustup
  ];
}
