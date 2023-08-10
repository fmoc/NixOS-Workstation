{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    arduino
    freecad
    gimp
    inkcut
    inkscape-with-extensions
    inkscape-extensions.inkcut
    libreoffice
    openscad
    prusa-slicer
    (callPackage applications/visicut.nix { })
  ];
}
