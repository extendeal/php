#!/usr/bin/python
import sys
import os
import signal

def write_stdout(s):
    sys.stdout.write(s)
    sys.stdout.flush()

def write_stderr(s):
    sys.stderr.write(s)
    sys.stderr.flush()

def main():
    while 1:
        write_stdout('READY\n')
        # wait for an event
        sys.stdin.readline()
        try:
            os.kill(1, signal.SIGQUIT)
            write_stdout('RESULT 2\nOK')
        except Exception as e:
            write_stderr('Could not kill supervisor: ' + e.strerror + '\n')
            write_stdout('RESULT 4\nFAIL')

if __name__ == '__main__':
    main()
