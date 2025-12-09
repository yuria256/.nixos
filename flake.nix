{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/release-25.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Make your configuration Delicious
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.lix.follows = "lix";
    };

    # And sprinkle on the Soho Vibes
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs = {self, nixpkgs, home-manager, lix, lix-module, stylix, nixvim, nixcord, ... }@inputs:
  {
    nixosConfigurations.hosidius = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/configuration.nix
        stylix.nixosModules.stylix
        lix-module.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.yuria = ./hosts/home.nix;
            sharedModules = [
              inputs.stylix.homeModules.default
              nixvim.homeModules.nixvim
              nixcord.homeModules.nixcord
            ];
            backupFileExtension = "back";
          };
        }
      ];
    };
  };
}
