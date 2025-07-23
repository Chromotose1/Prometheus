{
  description = "A flake that provides a helloworld command to echo 'hello world'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux"; # Adjust for your system, e.g., aarch64-linux for ARM
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system} = {
        helloworld = pkgs.writeShellScriptBin "helloworld" ''
          echo "hello world"
        '';
        default = self.packages.${system}.helloworld; # Set default package
      };
    };
