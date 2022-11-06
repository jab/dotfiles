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
  set -q MY_ABBR_SET && set -e MY_ABBR_SET
end
