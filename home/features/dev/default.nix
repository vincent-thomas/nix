{ pkgs, lib, ... }:
{
  imports = [
    ./shell.nix
    ./neovim
  ];

  programs.yazi.enable = true;

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
    git = true;
  };

  home.file.".config/zellij".source = ../../dotfiles/zellij;
  programs.zellij = {
    enable = true;
  };
  programs.zoxide.enable = true;


  programs.git = {
    enable = true;
    userName = "Vincent Thomas";
    userEmail = "77443389+vincent-thomas@users.noreply.github.com";
    aliases = {
      st = "status";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };

      user = {
        signingKey = "...";
      };
    };
  };

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
