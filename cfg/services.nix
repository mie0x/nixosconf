{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" ];
    };

  # Enable the GNOME Desktop Environment     
    displayManager = { 
      gdm.enable = true;
      sddm.enable = false;
      defaultSession = "niri";
    };

    desktopManager.gnome.enable = true;
  
  # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  

  # Enable CUPS to print documents.
    printing.enable = true;
    
  # enable flatpak
    flatpak.enable = true; 
    
  # gvfs serv
    gvfs.enable = true;
  };

  # hardware graphics
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      #Xe driver
      intel-media-driver  #iHD
      vpl-gpu-rt           #QSV

      #tooling
      intel-compute-runtime
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  
  # FFemage/VVAPI/QSV init fail
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [ "i915.enable_guc=3" ];

}
