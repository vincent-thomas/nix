{ pkgs, ... }: {
  home.file.".config/nvim".source = ./nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [

      # Rust
      rust-analyzer
      rustfmt
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

      # For copilot
      nodejs_22
    ];
  };
}
