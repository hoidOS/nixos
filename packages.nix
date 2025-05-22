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
    mullvad-vpn
    nitrogen
    nix-prefetch-github # nix-prefetch-github hoidOS dwm
    p7zip
    pandoc
    pcmanfm
    picom
    polybar
    pulsemixer
    rclone
    ripgrep
    rofi
    scrot
    wofi
#    texlive.combined.scheme-medium
    tor-browser-bundle-bin
    unclutter-xfixes
    unstable.keymapp
    ungoogled-chromium
    unzip
    vim
    virt-manager
    wget
    xclip
    xsel
    xorg.setxkbmap
    yt-dlp
    ghostty

    # Unstable
    unstable._1password-gui
    unstable.tree-sitter
    unstable.nixfmt-rfc-style
    unstable.wezterm
    unstable.nh

    # Developer
    luajitPackages.luarocks
    nodePackages.npm
    nodejs
    python3
    unstable.rustup
  ];
}
