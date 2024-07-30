


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

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      # pkgsForSystem = system:
      #   import inputs.nixpkgs (nixpkgs // {
      #       inherit system;
      #   });
      #
       allowed-unfree-packages = [
        "google-chrome"
        "obsidian"
        "postman"
        "vscode"
        "vscode-extension-github-copilot"
      ];
      # lib = pkgs.lib;

      user = "vt";


      # mkSystem = import ./lib/mksystem.nix {
      #   inherit nixpkgs inputs;
      # };
    in {

      # nixosConfigurations.vt-pc = mkSystem "vt-pc" {
      #   system = "x86_64-linux";
      #   user = "vt";
      # };
      












      nixosConfigurations = {
        vt-pc = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {inherit inputs user allowed-unfree-packages;};
          modules = [
            ./hosts/vt-pc
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import ./users/${user};
              home-manager.extraSpecialArgs = { inherit inputs user allowed-unfree-packages; };
              home-manager.backupFileExtension = "backup";
              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
            home-manager.nixosModules.home-manager
          ];
        };
      };









        

      # homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;
      #
      #   extraSpecialArgs = { inherit inputs; };
      #
      #   modules = [
      #     ./home
      #     catppuccin.homeManagerModules.catppuccin
      #   ];
      # };
    };
}
