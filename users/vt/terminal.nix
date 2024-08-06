{ ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 12;
    };

    settings = {
      confirm_os_window_close = 0;
    };
  };
}
