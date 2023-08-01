{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    freecad
    gimp
    inkcut
    inkscape-with-extensions
    inkscape-extensions.inkcut
    openscad
    prusa-slicer
    (callPackage applications/visicut.nix { })
  ];
}
