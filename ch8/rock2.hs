module Rock2 where

import Data.Char

main :: IO ()
main = do
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine
    let firstNameUpper = map toUpper firstName
        lastNameUpper = map toUpper lastName
    putStrLn $ "Hey " ++ firstNameUpper ++ " " ++ lastNameUpper ++ ", how are you?"