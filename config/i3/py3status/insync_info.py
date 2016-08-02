import subprocess
import os, sys
import re

# get Solarized colours
sys.path.append(os.path.dirname(__file__))
from colours import colours
from syscmd import syscmd

class Py3status:
    def insync_info(self):
        status = syscmd.run(['insync-headless', 'get_status']).lower()

        count_re = re.compile(r'(\d+) files queued');

        if status == 'share':
            out = ''
        else:
            count_text = syscmd.run(['insync-headless', 'get_sync_progress'])
            result = re.search(count_re, count_text)
            if result:
                out = '{} queued'.format(result.group(1))
            else:
                out = ''

        return {
            'markup': 'pango',
            'full_text': '<span color="{}"><span gravity="west">{}</span> {}</span>'.format(colours.yellow, '', out) if out else '',
            'cached_until': 0,
        }
