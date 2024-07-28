{ config, pkgs, inputs, lib, builtins, ... }:
let
  catTheme = "frappe";
  catAccent = "blue";
in {

  home.stateVersion = "23.11";

  home.username = "vincent";
  home.homeDirectory = "/home/vincent";

   home.sessionPath = [
    "$HOME/.nix-profile/bin" #binaries
    "$HOME/.nix-profile/share/applications" #.desktop files
  ];

  home.file.".scripts".source = ./scripts;

  programs.home-manager.enable = true;
  catppuccin = {
    enable = true;
    flavor = catTheme;
    accent = catAccent;
    pointerCursor = {
      enable = true;
      flavor = catTheme;
      accent = catAccent;
    };
  };

  imports = [
    ./features/firefox
    ./features/dev
    ./features/setup
    ./features/misc.nix
  ];
}
