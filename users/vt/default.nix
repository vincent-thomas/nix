{ inputs, user, ... }:
let
  catTheme = "frappe";
  catAccent = "blue";
in {
  imports = [
    ./modules/desktop
    ./modules/other-apps
    ./modules/dev-env
    ./git.nix
    ./terminal.nix
    ./misc.nix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  home.file.".vt/scripts".source = ./scripts;

  home.stateVersion = "23.11";
  home.username = user;
  home.homeDirectory = "/home/${user}";

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
   home.sessionPath = [
    "$HOME/.nix-profile/bin" #binaries
    "$HOME/.nix-profile/share/applications" #.desktop files
  ];

 catppuccin = {
    enable = true;
    flavor = catTheme;
    accent = catAccent;
  };
  xdg.userDirs.desktop = null;
}
