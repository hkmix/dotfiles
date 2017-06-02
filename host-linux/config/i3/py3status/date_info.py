import subprocess
import os, sys
import time

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours

class Py3status:
    def date_info(self):
        date_status = time.strftime('%a, %-d %b %Y')

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours.base1, '', date_status),
            'cached_until': 0,
        }

    def on_click(self, event):
        subprocess.call(['gnome-calendar'])
