from libqtile import bar, widget
from libqtile.config import Screen


screens = [
  Screen(
    bottom=bar.Bar([
        widget.GruopBox(),
        widget.CurrentLayout()
    ], size = 24)
  )
]
