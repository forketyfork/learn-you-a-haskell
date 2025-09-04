{
  description = "Haskell development environment for Learn You a Haskell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        haskellPackages = pkgs.haskell.packages.ghc9122;
        
        ghcWithPackages = haskellPackages.ghcWithPackages (ps: with ps; [
          # Basic packages that might be useful for the examples
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Haskell compiler with packages
            ghcWithPackages
            haskellPackages.cabal-install
            haskellPackages.haskell-language-server
            haskellPackages.hlint
            haskellPackages.ormolu
            haskellPackages.ghcid
            
            # Additional development tools
            pkg-config
            zlib
          ];

          shellHook = ''
            echo "🚀 Haskell development environment loaded!"
            echo "Available tools:"
            echo "  - ghc: $(ghc --version)"
            echo "  - hlint: Haskell linter"
            echo "  - ormolu: Haskell formatter"
            echo "  - ghcid: GHC daemon for fast recompilation"
            echo ""
            echo "To compile a Haskell file: ghc filename.hs"
            echo "To start GHCi: ghci"
            echo "To load a file in GHCi: ghci filename.hs"
          '';
        };
      });
}
