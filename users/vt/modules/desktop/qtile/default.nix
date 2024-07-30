{ pkgs, ... }: {
  home.file.".config/qtile".source = ./config;
}
