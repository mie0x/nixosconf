{ config, pkgs, ... }:

{
  environment.variables.XCURSOR_SIZE = "16";
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  # Or add to your packages
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

}
