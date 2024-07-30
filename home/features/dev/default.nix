{ pkgs, lib, ... }:
{
  imports = [
    ./shell.nix
  ];

  home.file.".config/nvim".source = ../../dotfiles/nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # Rust
      rust-analyzer
      clippy

      # Lua
      lua-language-server
      stylua

      # Nix
      nixd
      nixpkgs-fmt

      # Python
      pyright

      # TS/JS 
      typescript-language-server

      # Markdown
      marksman
    ];
  };


  programs.yazi.enable = true;

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
    git = true;
  };

  # home.file.".config/zellij".source = ../../dotfiles/zellij;
  # programs.zellij = {
  #   enable = true;
  # };
  programs.zoxide.enable = true;



  # GENERAL
  home.packages = with pkgs; [
    ripgrep
    gh
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 12;
    };
  };
}
