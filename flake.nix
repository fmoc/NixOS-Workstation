{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    inkstitch = {
      url = "git+https://codeberg.org/tropf/nix-inkstitch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, inkstitch }: {
    nixosConfigurations.fablab = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      _module.args = { inherit inkstitch; };
      modules = [ ./configuration.nix ];
    };
  };
}