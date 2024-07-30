{ pkgs, ... }: 

pkgs.writeShellScriptBin "vt-powertools" ''
  chosen=$(printf "Power Off\nRestart\nLock" | rofi -dmenu -i)

  case "$chosen" in
    "Power Off") poweroff ;;
    "Restart") reboot ;;
    "Lock") qtile cmd-obj -o cmd -f shutdown ;;
    *) exit 1 ;;
  esac
''
