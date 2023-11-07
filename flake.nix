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
      modules = [
        ({ pkgs, ... }: {
          system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;

          nix = {
            package = pkgs.nixFlakes;
            extraOptions = ''
              experimental-features = nix-command flakes
            '';
            registry.nixpkgs.flake = nixpkgs;

            settings = {
              substituters = [
                "https://cache.nixos.org"
                "https://nix-serve.hq.c3d2.de"
              ];

              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "nix-serve.hq.c3d2.de:KZRGGnwOYzys6pxgM8jlur36RmkJQ/y8y62e52fj1ps="
              ];
            };
          };

          imports = [
            ./default.nix
            ./configuration.nix
          ];
        })
      ];
    };
  };
}