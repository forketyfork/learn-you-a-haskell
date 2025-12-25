module GuessTheNumber where

import System.Random
import Control.Monad(unless)

main = do
    gen <- getStdGen
    askForNumber gen

askForNumber :: StdGen -> IO()
askForNumber gen = do
    let (randomNumber, nextGen) = randomR (1, 10) gen :: (Int, StdGen)
    putStrLn "Guess the number from 1 to 10: "
    numberString <- getLine
    unless (null numberString) $ do
        let number = read numberString
        if randomNumber == number
            then putStrLn "Correct!"
            else putStrLn $ "Failure! It was " ++ show randomNumber
        askForNumber nextGen
