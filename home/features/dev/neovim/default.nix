{...}:
{
  home.file.".config/nvim".source = ../../../dotfiles/nvim;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
