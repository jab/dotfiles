{
  description = "my nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          environment.systemPackages = import ./system-packages.nix { inherit pkgs; };

          # Disable nix-darwin's management of nix for compatibility with Determinate Nix.
          nix.enable = false;

          # Enable alternative shell support in nix-darwin.
          programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          # https://github.com/LnL7/nix-darwin/issues/1339
          ids.gids.nixbld = 30000;

          homebrew.enable = true;
          homebrew.casks = [
            "iterm2"
            "maccy"
            "obsidian"
            "qlmarkdown"
            "scroll-reverser"
            "visual-studio-code"
          ];

          fonts.packages = with pkgs; [
            cm_unicode
            meslo-lgs-nf
            nerd-fonts.fira-code
          ];
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#jabmbp
      darwinConfigurations."jabmbp" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };
    };
}
