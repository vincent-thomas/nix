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
  stylix.enable = true;
  stylix.image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  };
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts;
      name = "Jetbrains Mono Nerd Font";
    };
  };

  imports = [
    # inputs.nix-colors.homeManagerModules.default
    ./features/firefox
    ./features/dev
    ./features/setup
    ./features/misc.nix
  ];
  # colorScheme = inputs.nix-colors.colorSchemes.onedark;
}
