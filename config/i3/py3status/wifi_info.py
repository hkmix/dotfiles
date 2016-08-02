import subprocess
import os, sys

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def wifi_info(self):
        wifi_name = syscmd.run(['iwgetid', '-r'])

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours.green, '', wifi_name),
            'cached_until': 0,
        }
