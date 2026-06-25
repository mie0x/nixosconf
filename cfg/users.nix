{ config, pkgs, ... }:

{
  users.users."mie" = {
    isNormalUser = true;
    description = "mie";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}
