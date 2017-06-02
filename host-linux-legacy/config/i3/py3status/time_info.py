import subprocess
import os, sys
import time

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours

class Py3status:
    def time_info(self):
        time_status = time.strftime('%-l:%M:%S %p')

        return {
            'markup': 'pango',
            'color': colours.base1,
            'full_text': '    {} {}'.format('', time_status),
            'cached_until': 0,
        }

    def on_click(self, event):
        subprocess.call(['gnome-clocks'])
