{ config, pkgs, inputs, ... }:

{ 
  #program enable default
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;
  programs.steam.enable = true;
  
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
    
    #basic
    wget
    git
    glib-networking
    pywalfox-native
    zip
    unzip
    
    #gtk
    nwg-look
    adw-gtk3

    #shell
    kitty
    starship
    fastfetch
    btop
    neovim
    zenity

    #network
    nmap

    #filemanager
    yazi

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
