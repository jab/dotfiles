if status is-interactive
  set -gx EDITOR vim
  set -gx LESS -iR

  set -gx PIP_REQUIRE_VIRTUALENV true
  if type -q python3
    if test -f ~/.local/pythonstartup.py &>/dev/null
      set -gx PYTHONSTARTUP ~/.local/pythonstartup.py
    end
  end

  # https://github.com/LnL7/nix-darwin/issues/122
  fish_add_path --path --move $HOME/.local/bin $HOME/.nix-profile/bin /run/wrappers/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin

  if test -f ~/.local/google-cloud-sdk/path.fish.inc
    source ~/.local/google-cloud-sdk/path.fish.inc
  end

  if type -q starship  # https://starship.rs
    starship init fish | source
  end

  if type -q zoxide
    zoxide init fish | source
  end
end
