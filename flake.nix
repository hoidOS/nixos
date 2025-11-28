{
  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    catppuccin.url = "github:catppuccin/nix";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.3";
      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      catppuccin,
      lanzaboote,
      ...
    }:
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
      # overlay-neovim = neovim-nightly-overlay.overlay;

      # Define pkgs
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.joypixels.acceptLicense = true;
        overlays = [
          overlay-dwm
          overlay-dwmblocks
          overlay-unstable
          # overlay-neovim
        ];
      };
    in
    {
      nixosConfigurations."9800X3D" = nixpkgs.lib.nixosSystem {
        inherit pkgs system;
        modules = [
          ./configuration.nix
          catppuccin.nixosModules.catppuccin
          lanzaboote.nixosModules.lanzaboote
        ];
      };
    };
}
