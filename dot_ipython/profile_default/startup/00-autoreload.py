# https://dev.to/abbazs/how-to-set-autoreload-in-ipython-at-startup-16cl
import IPython

ipython = IPython.get_ipython()
ipython.run_line_magic(magic_name="load_ext", line="autoreload")
ipython.run_line_magic(magic_name="autoreload", line="2")
