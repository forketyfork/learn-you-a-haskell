module Monadic where

import Control.Monad
import Control.Monad.Writer

keepSmall :: Int -> Writer [String] Bool 
keepSmall x
    | x < 4 = do
        tell ["Keeping " ++ show x]
        return True 
    | otherwise = do
        tell [show x ++ " is too large, throwing it away"]
        return False

powerset :: [a] -> [[a]]
powerset = filterM (const [True, False])

binSmalls :: Int -> Int -> Maybe Int 
binSmalls acc x
    | x > 9 = Nothing 
    | otherwise = Just (acc + x)

readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of [(x, "")] -> Just x
                                _ -> Nothing

solveRPN :: String -> Maybe Double 
solveRPN st = do
    [result] <- foldM foldingFunction [] (words st)
    return result

foldingFunction :: [Double] -> String -> Maybe [Double]
foldingFunction (x:y:ys) "*" = return ((x * y) : ys)
foldingFunction (x:y:ys) "+" = return ((x + y) : ys)
foldingFunction (x:y:ys) "-" = return ((x - y) : ys)
foldingFunction xs numberString = fmap (:xs) (readMaybe numberString)
