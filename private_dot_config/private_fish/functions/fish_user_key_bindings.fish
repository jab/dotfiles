# Fish calls this function automatically after it sets up its preset bindings
# (which is after config.fish is called).
function fish_user_key_bindings
  # Remove Alt+S binding (to __fish_prepend_sudo).
  bind --preset --erase \es
  # Map Ctrl+S to __fish_prepend_sudo instead.
  bind \cS "__fish_prepend_sudo"
end
