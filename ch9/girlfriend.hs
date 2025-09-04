module Girlfriend where

import System.IO

main = do
    contents <- readFile "girlfriend.txt"
    putStr contents
