if status is-interactive
  set -gx EDITOR emacs
  set -gx LESS -iR

  if test python
    set -gx PIP_REQUIRE_VIRTUALENV true
    if test -f ~/.local/pythonstartup.py &>/dev/null
      set -gx PYTHONSTARTUP ~/.local/pythonstartup.py
    end
  end

  if test -d ~/.local/bin
    fish_add_path ~/.local/bin
  end

  if test -f ~/.local/google-cloud-sdk/path.fish.inc
    source ~/.local/google-cloud-sdk/path.fish.inc
  end

  if type -q starship  # https://starship.rs
    starship init fish | source
  end
end
