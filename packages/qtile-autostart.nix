{ pkgs, ... }: 

pkgs.writeShellScriptBin "qtile-autostart" ''
  nitrogen --random --set-zoom-fill ~/.vt/wallpapers
''
