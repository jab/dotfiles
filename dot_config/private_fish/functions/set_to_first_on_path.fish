function set_to_first_on_path -a env_var -a candidates
  for exe in (string split ' ' $candidates)
    if type -q $exe
      set -gx $env_var $exe
      break
    end
  end
end
