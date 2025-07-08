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
        
        python = pkgs.python311;
        
        mdx-truly-sane-lists = python.pkgs.buildPythonPackage rec {
          pname = "mdx-truly-sane-lists";
          version = "1.3";
          format = "setuptools";
          
          src = python.pkgs.fetchPypi {
            pname = "mdx_truly_sane_lists";
            inherit version;
            hash = "sha256-tmECLfdSCh4ROvfDVcYiFrOEyGfk9Z+47nrVEebnf0U=";
          };
          
          propagatedBuildInputs = with python.pkgs; [
            markdown
          ];
          
          pythonImportsCheck = [ "mdx_truly_sane_lists" ];
        };
        
        pythonWithPackages = python.withPackages (ps: with ps; [
          mkdocs
          mkdocs-material
          pygments
          pymdown-extensions
          mdx-truly-sane-lists
        ]);
        
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            pythonWithPackages
            nodePackages.markdownlint-cli2
            gnumake
          ];

          shellHook = ''
            echo "MkDocs development environment loaded!"
            echo "Run 'mkdocs serve' to start the development server"
            echo "Visit http://localhost:8000 to view your documentation"
            echo ""
            echo "Markdown linting:"
            echo "  make lint      # Check all markdown files"
            echo "  make lint-fix  # Auto-fix markdown issues"
            
            # Set up convenient aliases
            alias mdl="markdownlint-cli2 '**/*.md'"
            alias mdlfix="markdownlint-cli2 --fix '**/*.md'"
            
            # Set up git hooks directory
            if [ -d .git ]; then
              git config core.hooksPath .githooks
              echo ""
              echo "Git hooks configured. Markdown will be auto-fixed on commit."
            fi
          '';
        };
      });
}