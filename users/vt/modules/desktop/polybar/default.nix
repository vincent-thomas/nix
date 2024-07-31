{ ... }: {

  home.file.".config/polybar".source = ./config;
  services.polybar = {
    catppuccin.enable = false;
    enable = true;
    script = "polybar";
  };
}
