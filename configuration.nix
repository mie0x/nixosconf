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

    #nix settings
    nix.settings = {
      # Limit to 2 concurrent build jobs
      max-jobs = 2;

      # Allocate 2 threads per job (Total: 4 threads out of your 8)
      cores = 2;
    };

    systemd.services.nix-daemon.serviceConfig = {
      # Capping RAM prevents large builds from causing your system to swap and freeze
      MemoryMax = "10G";
      MemoryHigh = "9G"; # Throttle the daemon slightly before hitting the absolute max
  
      # Give the build process lowest CPU priority so your desktop stays responsive
      Nice = 19;
      CPUSchedulingPolicy = "idle";
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
