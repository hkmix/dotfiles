import subprocess
import os, sys

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def eth_info(self):
        network_name = 'enp0s3'
        status = 'up'
        eth_status = syscmd.run(['ip', 'link', 'show', network_name])
        colour = colours.green

        if not 'state UP' in eth_status:
            status = 'down'
            colour = colours.base0

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colour, '', status),
            'cached_until': 0,
        }
