{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
  };

  outputs = { self, nixpkgs }:
    let
      #system = "x86_64-linux";
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    {

      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            miller
          ];
        };
      };

    };
}
