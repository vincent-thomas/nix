{ ... }: {
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
    #jack.enable = true; ???

    #media-session.enable = true; ??
  };
}
