if not set -U -q MY_ABBR_SET
  set -U MY_ABBR_SET '1'

  abbr -a -- - 'cd -'
  abbr -a -- c 'command'
  abbr -a -- t 'type'

  abbr -a -- cp 'cp -iv'
  abbr -a -- mv 'mv -iv'
  abbr -a -- rm 'rm -iv'
  abbr -a -- rmr 'rm -rf'
  abbr -a -- r 'rip'

  abbr -a -- e 'echo'
  abbr -a -- v 'vim'

  if type -q lsd  # https://github.com/Peltoche/lsd
    abbr -a -- l 'lsd -lha'
    abbr -a -- ll 'lsd -lha'
  else
    abbr -a -- l 'ls -lha'
    abbr -a -- ll 'ls -lha'
  end

  abbr -a -- g 'git'
  abbr -a -- glg 'git log'
  abbr -a -- gst 'git status'
  abbr -a -- gpl 'git pull'
  abbr -a -- gsw 'git switch'
  abbr -a -- gco 'git checkout'
  abbr -a -- gc- 'git checkout -'
  abbr -a -- gcb 'git checkout -b'
  abbr -a -- gbr 'git branch'
  abbr -a -- gbd 'git branch -d'
  abbr -a -- gbl 'git branch -l'
  abbr -a -- gdi 'git diff'
  abbr -a -- gds 'git diff --staged'
  abbr -a -- gad 'git add'
  abbr -a -- gaa 'git add --all'
  abbr -a -- gci 'git commit'
  abbr -a -- gcm 'git commit -m'
  abbr -a -- gps 'git push'
  abbr -a -- gpf 'git push -f'
  abbr -a -- grs 'git restore'
  abbr -a -- grss 'git restore --staged'
  abbr -a -- grsa 'git restore --staged . && git restore .'

  abbr -a -- ch 'chezmoi'
  abbr -a -- che 'chezmoi edit --apply'
  abbr -a -- chs 'chezmoi status'
  abbr -a -- chd 'chezmoi diff'
  abbr -a -- chc 'chezmoi cd'

  abbr -a -- n 'nnn'

  echo "Added" (abbr -l | wc -l | tr -d ' ') "abbreviations"
end
