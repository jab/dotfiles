{ config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat
    bazel-buildtools
    bazel-watcher
    bazelisk
    btop
    chezmoi
    delta
    direnv
    dua
    duf
    eza
    fblog
    fd
    file
    fish
    fzf
    gh
    git
    neovim
    nix-inspect
    pre-commit
    pwgen
    ripgrep
    rlwrap
    rm-improved
    sd
    starlark
    starship
    thefuck
    tree
    uv
    vim
    zoxide
    # autoclave
    # bottom
    # broot
    # choose
    # diffoscope
    # fcp
    # fq
    # fishPlugins.forgit
    # git-extras
    # gojq
    # gping
    # grc
    # gron
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
    # perl538Packages.strip-nondeterminism
    # pv
    # rename
    # ripgrep-all
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
    "maccy"
    "obsidian"
    "qlmarkdown"
    "qmk-toolbox"
    "rectangle-pro"
    "scroll-reverser"
    "via"
    "visual-studio-code"
    "vlc"
  ];

  fonts.packages = with pkgs; [
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
