{ pkgs, ... }: {
  home.file.".config/zellij/config.kdl".source = ./config.kdl;

  programs.zellij = {
    enable = true;
    catppuccin.enable = false;
  };
}
