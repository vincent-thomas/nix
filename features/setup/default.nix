{ pkgs, inputs,  ... }:

{
  home.file.".config/picom/picom-workaround.conf".source = ../../dotfiles/picom.conf;
  services.picom.enable = true;

  home.file.".config/qtile".source = ../../dotfiles/qtile;

  home.file.".config/polybar".source = ../../dotfiles/polybar;
  services.polybar = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
    extraConfig = ''
      include-file = ~/.config/polybar/bar.ini
    '';

    enable = true;
    script = "polybar";
  };
}
