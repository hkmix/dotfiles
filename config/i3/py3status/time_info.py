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
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours.base1, '', time_status),
            'cached_until': 0,
        }
