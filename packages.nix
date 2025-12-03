{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    appimage-run
    discord
    fd
    gcc
    git
    gnumake
    htop
    hyprpaper
    hyprshot
    killall
    kitty
    libnotify
    lxappearance
    p7zip
    pandoc
    pcmanfm
    pulsemixer
    rclone
    ripgrep
    statix
    ungoogled-chromium
    unzip
    vim
    virt-manager
    waybar
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
