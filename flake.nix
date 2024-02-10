{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    inkstitch = { url = "github:FabLab-Altmuehlfranken/nix-inkstitch/master"; };
  };

  outputs = { self, nixpkgs, inkstitch }: {
    nixosConfigurations.fablab = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, ... }: {
          system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
          _module.args = { inherit inkstitch; };

          systemd.tmpfiles.rules = [
            "L+ /nix/nixPath - - - - ${pkgs.path}"
          ];

          nix = {
            package = pkgs.nixFlakes;
            extraOptions = ''
              experimental-features = nix-command flakes
            '';
            registry.nixpkgs.flake = nixpkgs;
            nixPath = [ "nixpkgs=/nix/nixPath" ];

            settings = {
              substituters = [
                "https://cache.nixos.org"
                "https://fablab-altmuehlfranken.cachix.org"
              ];

              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "fablab-altmuehlfranken.cachix.org-1:GcRkMyk//g8xxizM3rvvqgm95+JSDm0+dVpoBF+YB/c="
              ];
            };
          };

          imports = [
            ./configuration.nix
          ];
        })
      ];
    };
  };
}
