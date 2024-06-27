# This file allows for imperatively installing the packages in ./mysyspkgs.nix via:
# nix-env -iA nixpkgs.mySystemPackages
{
  packageOverrides = pkgs: with pkgs; {
    mySystemPackages = buildEnv {
      name = "my-system-packages";
      paths = import ./mysyspkgs.nix { inherit pkgs; };
    };
  };
}

