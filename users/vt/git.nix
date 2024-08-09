{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Vincent Thomas";
    userEmail = "77443389+vincent-thomas@users.noreply.github.com";
    aliases = {
      st = "status";
      cm = "commit -m";
      a = "add";
      l = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };
    extraConfig = {
      init.defaultBranch = "main";
      core.askpass = ""; # Disable git credential manager
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      commit.gpgsign = true;
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK2TanW6Iiz6qrI+BV8P3KGAfS+w/eKHBoOUiPyBFSal";
    };
  };
}
