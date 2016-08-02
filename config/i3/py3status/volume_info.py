import subprocess
import os, sys

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def volume_info(self):
        vol_chars = {
            'mute': '',
            'mid': '',
            'high': '',
        }

        volume = syscmd.run(['pavol', 'percent'])
        if not volume:
            volume = '0'
        mute_status = syscmd.run(['pavol', 'get'])
        if not mute_status:
            mute_status = ''

        if not 'mute' in mute_status:
            mute_status = ''

        base_colour = colours.green
        if int(volume) == 0 or mute_status:
            colour = colours.base00
            vol_char = vol_chars['mute']
        else:
            colour = base_colour
            if int(volume) < 50:
                vol_char = vol_chars['mid']
            else:
                vol_char = vol_chars['high']

        if mute_status:
            mute_status = ' ({})'.format(mute_status)

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}%{}</span>'.format(colour, vol_char, volume, mute_status),
            'cached_until': 0,
        }

    def on_click(self, event):
        subprocess.call(['pavucontrol'])
