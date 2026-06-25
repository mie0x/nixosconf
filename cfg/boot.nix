{ config, pkgs, ... }:

{
  #bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #kernel type
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #Enable v4l2loopback kernel module
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  
  # Set up the loopback device parameters
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  # Ensure OBS has permission to access the device
  security.polkit.enable = true;
}
