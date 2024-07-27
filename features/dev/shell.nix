{ pkgs, inputs, ... }:
{

  home.file.".config/starship.toml".source = ../../dotfiles/starship.toml;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "direnv"
      ];
    };

    localVariables = {
      HOME_MNGR_DIR = "$HOME/nix";
    };

    shellAliases = {
      v = "nvim";
      hms = "rm -f /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && . $HOME/nix/scripts/revision.sh";
      sudo = "doas";
    };
    initExtraFirst = builtins.readFile ../../dotfiles/.zshrc;
  };
}
