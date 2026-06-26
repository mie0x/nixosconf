{ config, pkgs, ... }:

{
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  # Or add to your packages
  environment.systemPackages = with pkgs; [
    xwayland-satellite

    #theme
    whitesur-gtk-theme
    whitesur-icon-theme
    whitesur-cursors
  ];

  environment.variables = {
    GTK_THEME = "adw-gtk3-dark";
    XCURSOR_THEME = "whitesur-cursors";
    XCURSOR_SIZE = "16";
  };

  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          gtk-theme = "adw-gtk3-dark";
          cursor-theme = "Adwaita";
          cursor-size = "16";
        };
      };
    }
  ];
}
