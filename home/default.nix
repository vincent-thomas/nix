let
  catTheme = "frappe";
  catAccent = "blue";
in {

  home.stateVersion = "23.11";

  home.username = "vt";
  home.homeDirectory = "/home/vt";

   home.sessionPath = [
    "$HOME/.nix-profile/bin" #binaries
    "$HOME/.nix-profile/share/applications" #.desktop files
  ];

  home.file.".vt/scripts".source = ./scripts;

  nixpkgs.config.allowUnfree = true;

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
  ];
}
