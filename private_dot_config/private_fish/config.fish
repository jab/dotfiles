if status is-interactive
  set -gx EDITOR nvim
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

  if type -q thefuck
    thefuck --alias=f | source
  end

  fish_add_path --move --prepend --path "$HOME/.local/bin" "$HOME/.cargo/bin"
end
