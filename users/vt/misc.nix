{ pkgs, ... }: {
  # TODO:
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [ nix-output-monitor nerdfetch obsidian pasystray cargo gcc ];

  programs.btop.enable = true;
}
