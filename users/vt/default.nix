{ inputs, user, ... }:
let
  catTheme = "frappe";
  catAccent = "blue";
in {
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.sessionPath = [
    "$HOME/.nix-profile/bin" # binaries
    "$HOME/.nix-profile/share/applications" # .desktop files
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/desktop
    ./modules/x11-init
    ./git.nix
    ./misc.nix

    ../../modules/home
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  vt.dot.wallpapers = true;
  vt.dot.scripts = true;
  vt.dot.zshIntegration = true;

  vt.kitty.enable = true;
  vt.spotifyd.enable = true;

  vt.starship.enable = true;
  vt.zsh = {
    enable = true;
    starshipIntegration = true;
  };
  vt.cliTools.enable = true;
  vt.cliTools.zshIntegration = true;

  vt.nvim = {
    enable = true;
    defaultEditor = true;
  };
  vt.zellij.enable = true;

  vt.picom.enable = true;
  vt.qtile.config.enable = true;

  vt.firefox.enable = true;

  catppuccin = {
    enable = true;
    flavor = catTheme;
    accent = catAccent;
  };

  programs.imv.enable = true;

  xdg.userDirs.desktop = null;
}
