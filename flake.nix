{

  description = "Nixy-chan";

  inputs = {
    #release-nixpkgs
    nixpkgs.url = "nixpkgs/master";

    #noctalia
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    #greeter
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #lazaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    

  };

  outputs = inputs@{ self, nixpkgs, spicetify-nix, lanzaboote, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {

      Nixy-chan = lib.nixosSystem {

        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
	modules = [ 
          ./configuration.nix
          
         ];

      };

    };

  };

}
