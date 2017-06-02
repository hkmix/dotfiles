import subprocess

class syscmd:
    def run(cmds):
        try:
            return subprocess.check_output(cmds).decode("utf-8").strip()
        except subprocess.CalledProcessError as err:
            return err.output
        except:
            return ''
