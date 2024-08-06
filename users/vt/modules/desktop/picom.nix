{
  services.picom = {
    enable = true;

    shadow = true;
    shadowExclude = [
      "class_g = 'Polybar'"
    ];
    
    vSync = true;
    backend = "glx";

    fade = true;
    fadeDelta = 3;

    inactiveOpacity = 0.8;
    activeOpacity = 1.0;

    settings = {
      blur = {
        method = "dual_kawase";
        deviation = 5;
      };
    };
  };
}
