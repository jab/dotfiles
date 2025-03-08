fish_add_path --move --prepend --path \
  "$HOME/.local/bin" \


if status is-interactive
  set -gx LESS -iR

  set_to_first_on_path LS "eza ls"
  set_to_first_on_path EDITOR "nvim vim"
  set_to_first_on_path PAGER "nvimpager vimpager"
  set_to_first_on_path GREP "rg grep"

  if type -q starship
    starship init fish | source
  end

  if type -q direnv
    direnv hook fish | source
  end

  if type -q zoxide
    zoxide init fish | source
  end
end
