{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
  
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations."3900X" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./configuration.nix ];
    };
  };
}
