abbr -a -- e 'echo'
abbr -a -- t 'type'

if type -q zoxide
  abbr -a -- cd 'z'
  abbr -a -- - 'z -'
else
  abbr -a -- - 'cd -'
end

abbr -a -- cp 'cp -iv'
abbr -a -- cpr 'cp -ivR'
abbr -a -- mv 'mv -iv'
abbr -a -- rmi 'rm -iv'
abbr -a -- rmr 'rm -rf'

if type -q nvim
  abbr -a -- v 'nvim'
  abbr -a -- n 'nvim'
  abbr -a -- vim 'nvim'
else
  abbr -a -- v 'vim'
end

if type -q eza
  abbr -a -- l 'eza -lhag'
  abbr -a -- ll 'eza -lhag'
  abbr -a -- lld 'eza -lhagd'
else
  abbr -a -- l 'ls -lha'
  abbr -a -- ll 'ls -lha'
  abbr -a -- lld 'ls -lhad'
end

if type -q rg
  abbr -a -- r 'rg'
else
  abbr -a -- r 'grep'
end

abbr -a -- ppath 'echo $PATH | tr " " \\n | nl'

abbr -a -- g 'git'
abbr -a -- gs 'git switch'
abbr -a -- g- 'git switch -'
abbr -a -- gsw 'git switch'
abbr -a -- gsc 'git switch -c'
abbr -a -- gcb 'git switch -c'
abbr -a -- gco 'git checkout'
abbr -a -- glg 'git log'
abbr -a -- glp 'git log -p'
abbr -a -- gln 'git log --name-status'
abbr -a -- gst 'git status'
abbr -a -- gpl 'git pull'
abbr -a -- gcl 'git clone'
abbr -a -- scl 'scalar clone'
abbr -a -- gbr 'git branch'
abbr -a -- gbd 'git branch -d'
abbr -a -- gbb 'git bb'
abbr -a -- gbl 'git blame -w -CCC'
abbr -a -- gdi 'git diff'
abbr -a -- gds 'git diff --staged'
abbr -a -- gad 'git add'
abbr -a -- gaa 'git add --all'
abbr -a -- gci 'git commit'
abbr -a -- gca 'git commit --amend'
abbr -a -- gcn 'git commit --amend --no-edit'
abbr -a -- gcf 'git commit --fixup='
abbr -a -- gcm 'git commit -m'
abbr -a -- gce 'git commit --allow-empty'
abbr -a -- gps 'git push'
abbr -a -- gpf 'git push --force-with-lease'
abbr -a -- grs 'git restore'
abbr -a -- gwa 'git worktree add -b'
abbr -a -- gms 'git maintenance start'
abbr -a -- grss 'git restore --staged'
abbr -a -- grsa 'git restore --staged . && git restore .'
abbr -a -- gprv 'git checkout HEAD^'
abbr -a -- gnxt 'git checkout (git rev-list HEAD..demo-end | tail -1)'

if type -q chezmoi
  abbr -a -- ch 'chezmoi'
  abbr -a -- cha 'chezmoi add'
  abbr -a -- che 'chezmoi edit --apply'
  abbr -a -- chs 'chezmoi status'
  abbr -a -- chc 'chezmoi cd'
  abbr -a -- chd 'chezmoi diff'
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
  abbr --erase (abbr --list)
end
