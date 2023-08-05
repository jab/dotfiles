{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat
    bottom
    chezmoi
    direnv
    exa
    fd
    file
    fish
    fishPlugins.forgit
    fzf
    gh
    pwgen
    ripgrep
    rlwrap
    rm-improved
    starship
    tree
    vim
    # broot
    # choose
    # duf
    # fcp
    # fq
    # git
    # git-extras
    # gojq
    # gping
    # grc
    # grex
    # jc
    # jless
    # jq
    # lnav
    # mkcert
    # moreutils
    # mtr
    # navi
    # ncdu_2
    # nnn
    # pv
    # rename
    # scc
    # sd
    # shellcheck
    # socat
    # tz
    # ugrep
    # up
    # visidata
    # websocat
    # xh
    # yamllint
    # yank
    # youtube-dl
    # zoxide
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.fish.enable = true;

  # https://github.com/LnL7/nix-darwin/issues/122#issuecomment-1659465635
  programs.fish.loginShellInit =
    let
      dquote = str: "\"" + (builtins.replaceStrings ["\""] ["\"'\"'\""] str) + "\"";
      makeBinPathList = paths: map (path: path + "/bin") (builtins.filter (x: x != null) paths);
    in ''
      fish_add_path --move --prepend --path ${lib.concatMapStringsSep " " dquote (makeBinPathList config.environment.profiles)}
      set fish_user_paths $fish_user_paths
    '';

  homebrew.enable = true;
  homebrew.casks = [
    "authy"
    "bitwarden"
    "discord"
    "firefox"
    "iterm2"
    "maccy"
    "rectangle-pro"
    "scroll-reverser"
    "visual-studio-code"
    "vlc"
  ];

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Used for backwards compatibility. Run `darwin-rebuild changelog` before changing.
  system.stateVersion = 4;
}
