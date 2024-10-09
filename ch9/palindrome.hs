main = interact respondPalindrome

respondPalindrome :: String -> String
respondPalindrome = unlines .
    map (\line -> if isPal line then "palindrome" else "not a palindrome") . 
    lines

isPal :: String -> Bool
isPal string = string == reverse string