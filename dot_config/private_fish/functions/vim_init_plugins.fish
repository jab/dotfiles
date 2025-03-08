function vim_init_plugins
  set install_dir "$HOME/.vim/pack/plugins/start"

  mkdir -p $install_dir

  set plugin_urls \
    "https://github.com/catppuccin/vim" \
    "https://github.com/darfink/vim-plist" \
    "https://github.com/editorconfig/editorconfig-vim" \
    "https://github.com/sheerun/vim-polyglot" \
    "https://github.com/tpope/vim-commentary" \
    "https://github.com/tpope/vim-eunuch" \
    "https://github.com/tpope/vim-sleuth" \
    "https://github.com/tpope/vim-unimpaired" \
    "https://github.com/vim-airline/vim-airline" \


  for url in $plugin_urls
    set name (basename $url)
    set target_dir $install_dir/$name
    echo "Plugin: $name ($target_dir)"
    if test -d $target_dir/.git
      git -C $target_dir pull
    else
      git clone --depth 1 $url $target_dir
    end
    echo
  end
end
