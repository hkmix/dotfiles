import subprocess
import os, sys

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def eth_info(self):
        network_name = 'em1'
        status = 'up'
        eth_status = syscmd.run(['ip', 'link', 'show', network_name])
        colour = colours.green

        if not 'state UP' in eth_status:
            status = 'down'
            colour = colours.base0

        return {
            'markup': 'pango',
            'color': colour,
            'full_text': '    {}  {}'.format('', status),
            'cached_until': 0,
        }
