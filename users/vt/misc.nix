{ pkgs, ... }: {
  # TODO:
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [ nix-output-monitor nerdfetch obsidian ];

  programs.btop.enable = true;
}
