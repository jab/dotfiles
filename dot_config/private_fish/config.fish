fish_add_path --move --prepend --path \
  "$HOME/.local/bin" \


if status is-interactive
  set -gx LESS -iR

  set_to_first_on_path LS "eza ls"
  set_to_first_on_path EDITOR "nvim vim"
  set_to_first_on_path PAGER "nvimpager vimpager"
  set_to_first_on_path GREP "rg grep"

  fish_config theme choose 'ayu Mirage'
  # Prefer https://github.com/IlanCosman/tide, fall back to starship if installed
  if ! set -q tide_character_color
    if type -q starship
      starship init fish | source
    end
  end

  if type -q direnv
    direnv hook fish | source
  end

  if type -q zoxide
    zoxide init fish | source
  end
end
