#imports = [lanzaboote.nixosModules.lanzaboote];

{ pkgs, lib, inputs, lanzaboote, ... }: 
let
  lanzaboote = import inputs.lanzaboote {
    inherit pkgs;};
in
{ 
  imports = [ lanzaboote.nixosModules.lanzaboote ];
  environment.systemPackages = [
    # For debugging and troubleshooting Secure Boot.
    pkgs.sbctl
  ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
