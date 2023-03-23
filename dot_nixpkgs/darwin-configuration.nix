{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    chezmoi
    direnv
    exa
    file
    fish
    gh
    pwgen
    ripgrep
    rlwrap
    rm-improved
    starship
    tree
    # bat
    # bottom
    # broot
    # choose
    # duf
    # fcp
    # fd
    # fq
    # fzf
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
    # vim
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

  homebrew.enable = true;
  homebrew.casks = [
    "authy"
    "bitwarden"
    "firefox"
    "iterm2"
    "maccy"
    "rectangle-pro"
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
