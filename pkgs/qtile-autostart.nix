{ writeShellScriptBin }: 

(writeShellScriptBin "qtile-autostart" ''
  nitrogen --random --set-zoom-fill ~/.vt/Wallpapers
'')