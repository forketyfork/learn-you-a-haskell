module When where

import Control.Monad

main :: IO ()
main = do
    input <- getLine
    when (input == "SWORDFISH") $ do
        putStrLn input

