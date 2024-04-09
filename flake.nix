{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Overlays
    # leftwm.url = "github:leftwm/leftwm";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, neovim-nightly-overlay, ... }:
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
      overlay-neovim = neovim-nightly-overlay.overlay;
      # overlay-leftwm = inputs.leftwm.overlay;

      # Define pkgs
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.joypixels.acceptLicense = true;
        overlays = [
          overlay-dwm
          overlay-dwmblocks
          # overlay-leftwm
          overlay-unstable
          overlay-neovim
        ];
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
