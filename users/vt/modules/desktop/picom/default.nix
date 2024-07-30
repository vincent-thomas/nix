{

  home.file.".config/picom/picom-workaround.conf".source = ./picom.conf;
  services.picom = {
    enable = true;
    extraArgs = [ "--config ~/.config/picom/picom-workaround.conf" ];
  };


}
