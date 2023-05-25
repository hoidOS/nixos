{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }:
    let
      # System
      system = "x86_64-linux";

      # Unstable Overlay
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      # Pkgs Overlays
      overlay-dwm = import ./overlays/dwm.nix;
      overlay-dwmblocks = import ./overlays/dwmblocks.nix;

      # Define pkgs
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.joypixels.acceptLicense = true;
        overlays = [ overlay-unstable overlay-dwm overlay-dwmblocks ];
      };
    in
    {
      nixosConfigurations."3900X" = nixpkgs.lib.nixosSystem {
        inherit pkgs system;
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          # ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./configuration.nix
        ];
      };
    };
}
