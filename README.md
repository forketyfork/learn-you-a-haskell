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

## Prerequisites

- Nix with flakes enabled. If flakes are not enabled on your system, you can use the one‑shot form:

```bash
nix --extra-experimental-features 'nix-command flakes' develop
```

## Quick start (Nix flakes)

Enter the development shell:

```bash
nix develop
```

Run examples inside the shell:

```bash
ghci ch1/baby.hs
ghc ch1/baby.hs && ./baby
```

Not using Nix? See Running the Code (without Nix) below.

## Formatting

Format Nix files via the flake formatter:

```bash
nix fmt
```

## Editor integration

Haskell Language Server works inside the `nix develop` shell. Optionally use `direnv` to auto‑enter the dev shell in your editor.

## Running the Code (without Nix)

You can compile and run individual Haskell files using GHC:

```bash
ghc filename.hs
./filename
```

Or load them interactively in GHCi:

```bash
ghci filename.hs
```

