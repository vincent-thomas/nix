{ pkgs, ... }: {

  imports = [ ./neovim ./starship ./zellij ];

  # home.file.".config/zellij".source = ../../dotfiles/zellij;
  # programs.zellij = {
  #   enable = true;
  # };

    # GENERAL
  home.packages = with pkgs; [
    ripgrep
    gh

    rustc
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi.enable = true;

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
    git = true;
  };

  # programs.starship = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   catppuccin.enable = false;
  # };
}
