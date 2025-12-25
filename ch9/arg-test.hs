module ArgTest where

import System.Environment
import Data.List

main :: IO ()
main = do
    args <- getArgs
    progName <- getProgName
    putStrLn "Program arguments are:"
    mapM_ putStrLn args
    putStrLn "Program name is:"
    putStrLn progName