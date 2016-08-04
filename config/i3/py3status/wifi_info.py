import subprocess
import os, sys

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def wifi_info(self):
        wifi_name = syscmd.run(['iwgetid', '-r'])
        colour = colours.green

        if not wifi_name:
            wifi_name = 'down'
            colour = colours.base0

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours, '', wifi_name),
            'cached_until': 0,
        }
