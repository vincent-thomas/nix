{ pkgs, ... }: {


  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      HOME_MNGR_DIR = "$HOME/nix";
    };
    dotDir = ".config/zsh";

    shellAliases = {
      v = "nvim";
      hms = "rm -f /home/vincent/.mozilla/firefox/vincent/search.json.mozlz4 && revision";
    };
    initExtraFirst = builtins.readFile ./.zshrc;
  };

}
