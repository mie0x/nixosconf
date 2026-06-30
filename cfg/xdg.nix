{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      #xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
    ];
    xdgOpenUsePortal = true;
    config.common.default = [ "wlr" "gtk3" ];
  };

  # Required for the GNOME portal and file picking
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    #xdg-desktop-portal-gnome
    #nautilus # Optional: Recommended fallback file manager for the gnome portal
  ];
  
}
