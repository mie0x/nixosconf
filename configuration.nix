# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cfg/boot.nix
      ./cfg/network.nix
      ./cfg/xdg.nix
      ./cfg/time-loc.nix
      ./cfg/services.nix
      ./cfg/audio.nix
      ./cfg/users.nix
      ./cfg/pkgs.nix
      ./cfg/niri.nix
      ./cfg/noctalia-shell.nix
      ./cfg/noctalia-greeter.nix
      ./cfg/spicetify.nix
      ./cfg/lanzaboote.nix
    ];

    # Limit CPU threads and concurrent builds
    nix.settings = {
      max-jobs = 1; # Only compile one package at a time to save RAM
      cores = 4;    # Let that single build use up to 4 threads (out of 8)
    };

    # Restrict the Nix daemon background service via Systemd
    systemd.services.nix-daemon.serviceConfig = {
      MemoryMax = "12G";    # Hard cap on RAM usage
      MemoryHigh = "10G";   # Start throttling Nix if it hits 10GB
      CPUQuota = "50%";     # Limit the entire service to 50% total CPU output
    };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
