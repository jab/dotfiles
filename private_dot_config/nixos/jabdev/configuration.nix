# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      # Include the config generated by the hardware scan.
      /etc/nixos/hardware-configuration.nix  # XXX Had to comment out `fileSystems./.device` to avoid conflict with google-compute-image.nix
      <nixpkgs/nixos/modules/virtualisation/google-compute-image.nix>
      <home-manager/nixos>
      (fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master")
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  networking.hostName = "jabdev";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eth0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = { keyMap = "us"; };
  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    bottom
    broot
    chezmoi
    choose
    docker
    duf
    emacs
    fcp
    fd
    file
    fish
    fq
    fzf
    gh
    git
    git-extras
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
    nix-index
    nnn
    plocate
    procs
    pv
    pwgen
    rename
    ripgrep
    rm-improved
    scc
    sd
    shellcheck
    socat
    starship
    tailscale
    tmux
    tree
    tz
    ugrep
    up
    vim
    xh
    yamllint
    yank
    zoxide
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  services.openssh.enable = true;
  services.tailscale.enable = true;
  services.vscode-server.enable = true;

  virtualisation.docker.enable = true;

  security.sudo.wheelNeedsPassword = false;

  users.extraUsers = {
    jab = {
      createHome = true;
      group = "users";
      extraGroups = [ "wheel" "docker" ];
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKt4OvPXGAMKyfKC3CF9EyQl92mHV293r9gEElfDZ6+F jab" ];
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
