abbr -a -- pppath 'echo $PATH | tr " " \\n | nl'

abbr -a -- - 'cd -'
abbr -a -- c 'command'
abbr -a -- t 'type'

abbr -a -- cp 'cp -iv'
abbr -a -- mv 'mv -iv'
abbr -a -- rmi 'rm -iv'
abbr -a -- rmr 'rm -rf'
abbr -a -- r 'rip'

abbr -a -- e 'echo'
abbr -a -- v 'vim'

if type -q exa
  abbr -a -- l 'exa -lhag'
  abbr -a -- ll 'exa -lhag'
else
  abbr -a -- l 'ls -lha'
  abbr -a -- ll 'ls -lha'
end

abbr -a -- g 'git'
abbr -a -- glg 'git log'
abbr -a -- glp 'git log -p'
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

if type -q chezmoi
  abbr -a -- ch 'chezmoi'
  abbr -a -- che 'chezmoi edit --apply'
  abbr -a -- chs 'chezmoi status'
  abbr -a -- chd 'chezmoi diff'
  abbr -a -- chc 'chezmoi cd'
end

if type -q nnn
  abbr -a -- n 'nnn'
end

# echo "Added" (abbr -l | wc -l | tr -d ' ') "abbreviations"

function abbr_erase_all --description 'Erase all abbrs'
  while true
    read -l -P "Are you sure you want to erase all abbreviations? [y/N] " confirm
    switch $confirm
      case Y y
        break
      case '' N n
        return 1
    end
  end
  for abbr_name in (abbr -l)
    abbr -e $abbr_name
  end
end
