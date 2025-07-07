{
  description = "MkDocs development environment for Lathe Mastery Wiki-book";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python311
            python311Packages.mkdocs
            python311Packages.mkdocs-material
            python311Packages.pygments
            python311Packages.pymdown-extensions
          ];

          shellHook = ''
            echo "MkDocs development environment loaded!"
            echo "Run 'mkdocs serve' to start the development server"
            echo "Visit http://localhost:8000 to view your documentation"
          '';
        };
      });
}