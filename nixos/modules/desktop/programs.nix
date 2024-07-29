{ pkgs, ... }: {
  programs.thunar.enable = true;

  users.users.vt.packages = with pkgs; [
    localsend
    todoist-electron
    discord
    polkit_gnome
    thunderbird
  ];
}
