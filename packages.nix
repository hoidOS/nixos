{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable._1password-gui
    appimage-run
    fd
    gcc
    git
    gnumake
    htop
    killall
    kitty
    lxappearance
    libnotify
    unstable.neovim
    nitrogen
    nixfmt
    nox
    p7zip
    pandoc
    pcmanfm
    picom
    pulsemixer
    rclone
    ripgrep
    rnix-lsp
    rofi
    scrot
    texlive.combined.scheme-medium
    tor-browser-bundle-bin
    tree-sitter
    unclutter
    ungoogled-chromium
    unzip
    virt-manager
    vim
    wget
    xclip
    xorg.setxkbmap
    xsel

    # Developer
    luajitPackages.luarocks
    nodePackages.npm
    nodejs
    python3
    python310Packages.pip
    unstable.rustup

  ];

}
