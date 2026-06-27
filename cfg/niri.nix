{ config, pkgs, ... }:

{
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  # Or add to your packages
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    gsettings-desktop-schemas

    #theme
    whitesur-gtk-theme
    whitesur-icon-theme
    whitesur-cursors
  ];
}
