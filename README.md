# Learn You a Haskell

[![Build status](https://github.com/forketyfork/learn-you-a-haskell/actions/workflows/build.yml/badge.svg)](https://github.com/forketyfork/learn-you-a-haskell/actions/workflows/build.yml)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Haskell](https://img.shields.io/badge/language-Haskell-purple.svg)](https://www.haskell.org/)

Code examples and exercises from the "Learn You a Haskell for Great Good!" tutorial.

## Structure

The repository is organized by chapters:

- `ch1/` - Starting Out
- `ch2/` - Types and Typeclasses
- `ch3/` - Syntax in Functions  
- `ch4/` - Recursion
- `ch7/` - Making Our Own Types and Typeclasses
- `ch8/` - Input and Output
- `ch9/` - More Input and More Output
- `ch10/` - Functionally Solving Problems
- `ch11/` - Functors, Applicative Functors and Monoids
- `ch13/` - For a Few Monads More
- `ch14/` - For a Few Monads More (continued)
- `ch15/` - Zippers

## Development Environment

### Using Nix (Recommended)

This project includes a Nix flake for a reproducible development environment with GHC and essential tools:

```bash
nix develop
```

This provides:
- GHC (Glasgow Haskell Compiler)
- Haskell Language Server (HLS)
- hlint (Haskell linter)
- ormolu (Haskell formatter)
- ghcid (fast recompilation daemon)

### Manual Setup

If you prefer to install Haskell manually, you can use [GHCup](https://www.haskell.org/ghcup/):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

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

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.