{ config, pkgs, ... }:
{
  nixpkgs.overlays = [

    # (final: prev: {
    # dwm = prev.dwm.overrideAttrs (old: { src = /home/oedon/.config/dwm64 ;});
    # dmenu = prev.dmenu.overrideAttrs (old: { src = /home/oedon/.config/dmenu ;});
    # dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = /home/oedon/.config/dwmblocks ;});
    # })

    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "hoidOS";
          repo = "dwm";
          rev = "f3bac0090f8e112855da4f7f44ffc9ca6c966c76";
          sha256 = "sha256-9n8w8EatJqXiZVniPVOfbAuX4YTHGQHOamVRCGjWJ2E=";
        };
      });
    })

  ];
}
