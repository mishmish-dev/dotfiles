{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  outputs = inputs @ { nixpkgs, home-manager, nix-doom-emacs, ... }: {
    nixosConfigurations.bonditpad = 
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./os-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mishmish = nixpkgs.lib.mkMerge [
              (import ./home.nix)
              nix-doom-emacs.hmModule
            ];

            home-manager.extraSpecialArgs = { inherit inputs; };  
          }
        ];
    };
  };
}
