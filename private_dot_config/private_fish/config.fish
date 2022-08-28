if status is-interactive
  set -gx EDITOR vim
  set -gx LESS -iR

  if test python || test python3
    set -gx PIP_REQUIRE_VIRTUALENV true

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

function mcd -a dir
  mkdir -p $dir && cd $dir
end

function add_abbrevs
  abbr -a -- c command
  abbr -a -- t type

  abbr -a -- cp 'cp -iv'
  abbr -a -- mv 'mv -iv'
  abbr -a -- rm 'rm -iv'

  abbr -a -- e emacs
  abbr -a -- v vim

  abbr -a -- g git
  abbr -a -- glg 'git log'
  abbr -a -- gst 'git status'
  abbr -a -- gsw 'git switch'
  abbr -a -- gdi 'git diff'
  abbr -a -- gad 'git add --all'
  abbr -a -- gci 'git commit'
  abbr -a -- gps 'git push'
  abbr -a -- gpl 'git pull'
  abbr -a -- grs 'git restore'
  abbr -a -- gco 'git checkout'

  if type -q lsd  # https://github.com/Peltoche/lsd
    abbr -a -- l 'lsd -lha'
    abbr -a -- ll 'lsd -lha'
  end

  if type -q nnn  # https://github.com/jarun/nnn
    abbr -a -- n 'nnn'
  end

  if type -q chezmoi  # https://chezmoi.io
    abbr -a -- ch chezmoi
    abbr -a -- che chezmoi edit
  end

  if type -q rip  # https://github.com/nivekuil/rip
    abbr -a -- r rip
  end

  if type -q duf
    abbr -a -- df duf
  end

  if type -q ncdu
    abbr -a -- du ncdu
  end

  if type -q fd
    abbr -a -- find fd
  end

  if type -q gping
    abbr -a -- ping gping
  end

  if type -q procs
    abbr -a -- ps procs
  end

  if type -q sd
    abbr -a -- sed sd
  end

  if type -q btm
    abbr -a -- top btm
  end
end
