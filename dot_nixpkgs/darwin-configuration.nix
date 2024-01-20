{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat
    bottom
    chezmoi
    delta
    direnv
    eza
    fd
    file
    fish
    fishPlugins.forgit
    fzf
    gh
    neovim
    pre-commit
    pwgen
    python311Packages.ipython
    ripgrep
    rlwrap
    rm-improved
    sd
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
    "appcleaner"
    "authy"
    "bitwarden"
    "discord"
    "firefox"
    "iterm2"
    "qmk-toolbox"
    "maccy"
    "rectangle-pro"
    "scroll-reverser"
    "via"
    "visual-studio-code"
    "vlc"
  ];

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    cm_unicode
    meslo-lgs-nf
  ];

  # Used for backwards compatibility. Run `darwin-rebuild changelog` before changing.
  system.stateVersion = 4;

  # Based on https://github.com/DeterminateSystems/nix-installer
  nix.extraOptions = "
build-users-group = nixbld
experimental-features = nix-command flakes
auto-optimise-store = true";
}
