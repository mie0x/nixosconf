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

  environment.sessionVariables.XDG_DATA_DIRS = [
    "$XDG_DATA_DIRS"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          gtk-theme = "adw-gtk3-dark";
          cursor-theme = "whitesur-cursors";
          cursor-size = "16";
        };
      };
    }
  ];
}
