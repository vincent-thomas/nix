{ config, pkgs, inputs, lib, builtins, ... }:

{

  home.stateVersion = "23.11";

  home.username = "vincent";
  home.homeDirectory = "/home/vincent";

   home.sessionPath = [
    "$HOME/.nix-profile/bin" #binaries
    "$HOME/.nix-profile/share/applications" #.desktop files
  ];

  programs.home-manager.enable = true;

  imports = [
    # inputs.nix-colors.homeManagerModules.default
    ./features/firefox
    ./features/dev
    ./features/setup
    ./features/misc.nix
  ];

  # colorScheme = inputs.nix-colors.colorSchemes.onedark;
}