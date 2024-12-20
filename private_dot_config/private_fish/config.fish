function _set_to_first_on_path -a env_var -a candidates
  for exe in (string split ' ' $candidates)
    if type -q $exe
      set -gx $env_var $exe
      break
    end
  end
end

if status is-interactive
  set -gx LESS -iR
  # set -gx PIP_REQUIRE_VIRTUALENV true

  fish_add_path --move --prepend --path \
    "$HOME/.local/bin" \

  _set_to_first_on_path EDITOR "nvim vim"
  _set_to_first_on_path PAGER "nvimpager vimpager"

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
