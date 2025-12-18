{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
      ];
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      perSystem =
        {
          pkgs,
          ...
        }:
        {
          packages.default = pkgs.hello;
          devShells.default = pkgs.mkShell {
            packages = [ pkgs.sops ];

            SOPS_AGE_KEY_FILE = "/Users/ben/.config/komodo/syncs-key.age";
          };
        };
    };
}
