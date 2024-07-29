{pkgs, ...}: {
  imports = [ ./audio.nix ./xserver.nix ./programs.nix ./polkit.nix ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
