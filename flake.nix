


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
      allowed-unfree-packages = [
        "google-chrome"
        "obsidian"
        "postman"
        "vscode"
        "vscode-extension-github-copilot"
      ];

      mkSystem = import ./lib/mksystem.nix {
        inherit nixpkgs inputs allowed-unfree-packages;
      };
    in {
      nixosConfigurations.vt-pc = mkSystem "vt-pc" {
        system = "x86_64-linux";
        user = "vt";
      };
    };
}
