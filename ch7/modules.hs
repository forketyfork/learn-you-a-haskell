import Data.List
import Data.Char
import qualified Data.Map as Map

numUniques :: Eq a => [a] -> Int
numUniques = length . nub

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

findNeedle :: Eq a => [a] -> [a] -> Bool
findNeedle needle haystack = any (isPrefixOf needle) (tails haystack)

caesarEncode :: Int -> String -> String
caesarEncode offset string = map (chr . (+ offset) . ord) string

caesarDecode :: Int -> String -> String
caesarDecode offset = caesarEncode (negate offset)

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo value = find (\x -> digitSum x == value) [1..]

phoneBook =
    [("betty", "555-2938")
    ,("betty", "342-2492")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("patsy", "943-2929")
    ,("patsy", "827-9162")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ,("penny", "555-2111")
    ]
findKey :: Eq k => k -> [(k, v)] -> v
findKey x xs = snd . head . filter (\(k, _) -> k == x) $ xs

findKey2 :: Eq k => k -> [(k, v)] -> Maybe v
findKey2 _ [] = Nothing
findKey2 key ((k,v):xs)
    | k == key = Just v
    | otherwise = findKey2 key xs

findKey3 :: Eq k => k -> [(k, v)] -> Maybe v
findKey3 key xs = foldr (\(k, v) acc -> if k == key then Just v else acc) Nothing xs

phoneBookMap :: Map.Map String String
phoneBookMap = Map.fromList phoneBook

stringToDigits :: String -> [Int]
stringToDigits = map digitToInt . filter isDigit

phoneBookToMap :: Ord k => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
    where add n1 n2 = n1 ++ ", " ++ n2

phoneBookToMap2 :: Ord k => [(k, v)] -> Map.Map k [v]
phoneBookToMap2 = Map.fromListWith (++) . map (\(k,v) -> (k,[v]))

