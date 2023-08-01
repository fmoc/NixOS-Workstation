{ pkgs, ... }:
{
  systemd.services.autoupdater = {
    after = [ "network-online.target" ];
    description = "FabLab AutoUpdater";
    wantedBy = [ "multi-user.target" ];
    script = ''
      rm -rf /etc/nixos
      git clone https://git.lewd.wtf/Ciapa/FabLab-NixOS.git /etc/nixos
      nixos-rebuild boot --upgrade
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      Environment = [
        "PATH=/run/current-system/sw/bin:$PATH"
        "NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels"
        "NIX_PROFILES=/run/current-system/sw /nix/var/nix/profiles/default"
      ];
    };
  };
}
