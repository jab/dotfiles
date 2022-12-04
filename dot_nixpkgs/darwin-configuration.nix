{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bottom
    broot
    chezmoi
    choose
    duf
    fcp
    fd
    file
    fish
    fq
    fzf
    gh
    git
    git-extras
    gojq
    gping
    grc
    grex
    jc
    jless
    jq
    lnav
    lsd
    mkcert
    moreutils
    mtr
    navi
    ncdu_2
    nnn
    # operator-mono-lig  # pending https://github.com/NixOS/nixpkgs/issues/191827
    nodejs
    pv
    pwgen
    python311
    rename
    ripgrep
    rlwrap
    rm-improved
    scc
    sd
    shellcheck
    socat
    starship
    tree
    tz
    ugrep
    up
    vim
    websocat
    xh
    yamllint
    yank
    youtube-dl
    zoxide
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  programs.fish.enable = true;

  # Used for backwards compatibility. Run `darwin-rebuild changelog` before changing.
  system.stateVersion = 4;
}
