#!/usr/bin/env fish

set install_dir "$HOME/.vim/pack/plugins/start"
mkdir -p $install_dir

set plugin_urls "https://github.com/sheerun/vim-polyglot" "https://github.com/tpope/vim-eunuch"
for url in $plugin_urls
  set name (basename $url)
  set target_dir $install_dir/$name
  echo "Plugin: $name"
  if test -d $target_dir/.git
    git -C $target_dir pull
  else
    git clone --depth 1 $url $target_dir
  end
  echo
end
