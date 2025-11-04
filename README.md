# Learn You a Haskell

[![Build status](https://github.com/forketyfork/learn-you-a-haskell/actions/workflows/build.yml/badge.svg)](https://github.com/forketyfork/learn-you-a-haskell/actions/workflows/build.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Haskell](https://img.shields.io/badge/language-Haskell-purple.svg)](https://www.haskell.org/)

Code examples and exercises from the "Learn You a Haskell for Great Good!" tutorial.

## Structure

The repository is organized by chapters:

- `ch1/` - Starting out
- `ch2/` - Believe the type
- `ch3/` - Syntax in functions  
- `ch4/` - Recursion
- `ch7/` - Modules
- `ch8/` - Input and output
- `ch9/` - More input and more output
- `ch10/` - Functionally solving problems
- `ch11/` - Functors, applicative functors and monoids
- `ch13/` - For a few monads more
- `ch14/` - Zippers
- `ch15/` - Conclusion

## Running the Code

You can compile and run individual Haskell files using GHC:

```bash
ghc filename.hs
./filename
```

Or load them interactively in GHCi:

```bash
ghci filename.hs
```

### With Nix (recommended)

This repository includes a Nix flake that provides a reproducible dev shell with GHC, `cabal-install`, HLS, `hlint`, `ormolu`, and `ghcid`.

```bash
# Enter the dev environment
nix develop

# Start GHCi
ghci

# Or load a file directly
ghci ch8/helloworld.hs
```

### Without Nix

Install the Haskell toolchain (GHC and optionally GHCi) via [GHCup](https://www.haskell.org/ghcup/), then use:

```bash
# Run a script without creating a binary
runghc ch8/helloworld.hs

# Or compile and run
ghc ch8/helloworld.hs && ./helloworld
```

## Examples

- Run an IO example:

```bash
runghc ch8/helloworld.hs
```

- Load an example into GHCi for exploration:

```bash
ghci ch10/heathrow.hs
```

- Tips inside GHCi:
  - `:reload` to recompile after edits
  - `:type <expr>` to see inferred types
  - `:quit` to exit

## Notes

- Some examples read files located next to the source (e.g., files in `ch9/`). Run them from that directory or ensure the working directory contains the expected files so relative paths resolve.
- There is no Cabal project here; each file is standalone. For modules that import from siblings (e.g., under `ch7/Geometry`), load from the chapter directory or set the search path in GHCi (e.g., `:set -i.`).

## License

This project is licensed under the [MIT License](LICENSE).