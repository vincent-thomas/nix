{ pkgs, ... }: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    nix-output-monitor
    fastfetch
    obsidian
  ];

  programs.btop.enable = true;
}
