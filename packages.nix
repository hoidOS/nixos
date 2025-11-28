{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    appimage-run
    discord
    fd
    gcc
    ghostty
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
    pulsemixer
    rclone
    ripgrep
    rofi
    scrot
    statix
    unclutter-xfixes
    ungoogled-chromium
    unzip
    vim
    virt-manager
    wget
    wl-clipboard
    wofi
    yt-dlp

    # Unstable
    unstable._1password-gui
    unstable.keymapp
    unstable.nh
    unstable.nixfmt-rfc-style
    unstable.sbctl
    unstable.tree-sitter
    unstable.wezterm

    # Developer
    luajitPackages.luarocks
    python3
    unstable.rustup
  ];
}
