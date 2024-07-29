{pkgs, ...}:
{
  home.file.".config/nvim".source = ../../../dotfiles/nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # LSPs
      rust-analyzer
      lua-language-server
      nixd
      pyright
      typescript-language-server
      marksman
    ];
  };
}
