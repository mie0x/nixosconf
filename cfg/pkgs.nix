{ config, pkgs, inputs, ... }:

{ 
  #program enable default
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;
  programs.gamemode.enable = true;

  #steam
  programs.steam = {
    enable = true; # Master switch, already covered in installation
    remotePlay.openFirewall = true;  # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
    # Other general flags if available can be set here.
  };
  
  #record and stream
  programs.gpu-screen-recorder.enable = true;
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
    ];
  };

  #appimage enable
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #boot
    
    #editor
    vim
    neovim
    vscodium
    dconf-editor
    mpv
    ffmpeg
    
    #basic
    wget
    git
    glib
    glib-networking
    pywalfox-native
    zip
    unzip
    mpvpaper
    
    #gtk
    nwg-look
    adw-gtk3
    xsettingsd
    xrdb

    #shell
    kitty
    starship
    fastfetch
    btop
    zenity

    #network
    nmap

    #filemanager
    yazi
    nautilus

    #music
    pear-desktop
    
    #game
    prismlauncher

    #com
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

}
