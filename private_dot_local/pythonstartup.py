# Based on https://ipython.readthedocs.io/en/stable/interactive/reference.html#ipython-as-your-default-python-environment
import os
os.environ["PYTHONSTARTUP"] = ""  # Prevent running again

try:
    import IPython
except:
    pass
else:
    if not IPython.get_ipython():  # IPython not already running
        # See ~/.ipython/profile_default/startup/ for remaining startup customization.
        IPython.start_ipython()
        raise SystemExit
