import subprocess
import os, sys

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def mpd_info(self):
        char = ''

        format = syscmd.run(['mpc', 'current'])

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours.blue, char, format) if format else '',
            'cached_until': 0,
        }

    def on_click(self, event):
        subprocess.call(['pavucontrol'])
