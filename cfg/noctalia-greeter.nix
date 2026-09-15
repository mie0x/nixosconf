{ inputs, pkgs, ... }:
{
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    services.displayManager.noctalia-greeter = {
      enable = true;
      package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

      # Optional configuration
      greeter-args = "";
      settings = {
        cursor = {
          theme = "whitesur-cursors";
          size = "18";
        };
        keyboard = {
          layout = "us";
        };
      };
    };
}
