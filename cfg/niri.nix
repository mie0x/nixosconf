{ config, pkgs, ... }:

{
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  # Or add to your packages
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    #gsettings-desktop-schemas

    #theme
    whitesur-gtk-theme
    whitesur-icon-theme
    whitesur-cursors
  ];

  

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          gtk-theme = "adw-gtk3";
          cursor-theme = "whitesur-cursors";
          cursor-size = "18";
        };
      };
    }
  ];
}
