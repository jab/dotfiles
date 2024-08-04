if status is-interactive
  set -gx LESS -iR
  set -gx PIP_REQUIRE_VIRTUALENV true

  fish_add_path --move --prepend --path \
    "$HOME/.local/bin" \
    "$HOME/.cargo/bin" \

  if type -q nvim
    set -gx EDITOR nvim
  end

  if type -q nvimpager
    set -gx PAGER nvimpager
  end

  if type -q direnv  # https://direnv.net
    direnv hook fish | source
  end

  if type -q zoxide  # https://github.com/ajeetdsouza/zoxide
    zoxide init fish | source
  end

  if type -q thefuck  # https://github.com/nvbn/thefuck
    thefuck --alias=f | source
  end

  if test -f ~/.local/pythonstartup.py &>/dev/null
    set -gx PYTHONSTARTUP ~/.local/pythonstartup.py
  end
end
