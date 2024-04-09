{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    appimage-run
    discord
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
    nix-prefetch-github                         # nix-prefetch-github hoidOS dwm
    p7zip
    pandoc
    pcmanfm
    picom
    pulsemixer
    polybar
    rclone
    ripgrep
    rofi
    scrot
    texlive.combined.scheme-medium
    tor-browser-bundle-bin
    unclutter-xfixes
    ungoogled-chromium
    mullvad-vpn
    yt-dlp
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
    unstable.nixfmt-rfc-style
    # unstable.rnix-lsp

    # Developer
    luajitPackages.luarocks
    nodePackages.npm
    nodejs
    python3
    python310Packages.pip
    unstable.rustup
  ];
}
