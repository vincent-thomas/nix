{ pkgs, inputs, ... }:
{

  home.file.".config/starship.toml".source = ../../dotfiles/starship.toml;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = false;
  };

  programs.tmux = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    localVariables = {
      HOME_MNGR_DIR = "$HOME/nix";
    };

    shellAliases = {
      v = "nvim";
      hms = "rm -f /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && . revision";
      sudo = "doas";
    };
    initExtraFirst = builtins.readFile ../../dotfiles/.zshrc;
  };
}
