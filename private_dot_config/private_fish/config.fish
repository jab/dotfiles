if status is-interactive
  set -gx EDITOR vim
  set -gx LESS -iR

  set -gx PIP_REQUIRE_VIRTUALENV true
  if type -q python3
    if test -f ~/.local/pythonstartup.py &>/dev/null
      set -gx PYTHONSTARTUP ~/.local/pythonstartup.py
    end
  end

  if type -q starship  # https://starship.rs
    starship init fish | source
  end

  if type -q direnv  # https://direnv.net
    direnv hook fish | source
  end

  if type -q zoxide
    zoxide init fish | source
  end

  fish_add_path --move --prepend --path "$HOME/.local/bin"
end
