{
  description = "vtOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, self, catppuccin, ... }@inputs:
    let
      inherit (self) outputs;
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      username = "vt";
    in {
      nixosConfigurations = {
        vt-pc = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [ ./hosts/vt-pc ];
        };
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        modules = [
          ./home
          catppuccin.homeManagerModules.catppuccin
        ];
      };
    };
}
