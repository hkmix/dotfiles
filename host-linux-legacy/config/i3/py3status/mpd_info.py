import subprocess
import os, sys
import html

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def mpd_info(self):
        cmd_out = syscmd.run(['mpc'])
        if not cmd_out:
            char = ''
        elif '[paused]' in cmd_out:
            char = ''
        else:
            char = ''

        if char:
            format = syscmd.run(['mpc', 'current'])
            if format:
                format = format.replace(';', '/')
        else:
            format = ''

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours.blue, char, html.escape(format)) if format else '',
            'cached_until': 0,
        }

    def on_click(self, event):
        subprocess.call(['pavucontrol'])
