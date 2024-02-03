{ pkgs, inkstitch, ... }:
{
  environment.systemPackages = with pkgs; [
    arduino
    freecad
    gimp
    inkcut
    inkstitch.hydraJobs.inkscape-inkstitch.x86_64-linux
    libreoffice
    openscad
    prusa-slicer
    gnome.adwaita-icon-theme
    (callPackage applications/visicut.nix { })
    yakuake
  ];
  nixpkgs.overlays = [
    (
      final: prev: {
        inkcut = prev.inkcut.overridePythonAttrs {
          propagatedBuildInputs = with pkgs.python3.pkgs; [
            enamlx
            twisted
            lxml
            qreactor
            jsonpickle
            pyserial
            pycups
            qtconsole
            pyqt5
            setuptools
          ];
        };
      }
    )
  ];

  virtualisation.docker.enable = true;
}
