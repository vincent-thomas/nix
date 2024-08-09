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

  outputs = { nixpkgs, ... }@inputs:
    let
      allowed-unfree-packages = [ "obsidian" ];

      mkSystem = import ./lib/mksystem.nix {
        inherit nixpkgs inputs allowed-unfree-packages;
      };

      user = "vt";
    in {
      nixosConfigurations.vt-pc = mkSystem "${user}-pc" {
        system = "x86_64-linux";
        user = user;
      };
    };
}
