import System.Environment
import Data.List

main = do
    args <- getArgs
    progName <- getProgName
    putStrLn "Program arguments are:"
    mapM putStrLn args
    putStrLn "Program name is:"
    putStrLn progName