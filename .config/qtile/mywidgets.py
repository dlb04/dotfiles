import commons

from libqtile import bar, layout, widget

def work_spaces():
    return [
            widget.GroupBox(
                active = commons.colors['fg'],
                inactive = commons.colors['inactive'],
                highlight_method = 'text',
                this_current_screen_border=commons.colors['active'],
                rounded=False,
                font = commons.font,
                disable_drag=True,
                ),
            widget.Spacer(length = bar.STRETCH),
            widget.WindowName(
                padding=5, max_chars=24
                ),
            ]
