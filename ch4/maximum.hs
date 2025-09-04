module Maximum where

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n a 
    | n == 0 = []
    | otherwise = a : replicate' (n-1) a

take' :: Int -> [a] -> [a]
take' _ [] = []
take' n (x:xs) 
    | n <= 0 = []
    | otherwise = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' a = a : repeat' a

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' :: (Eq x) => x -> [x] -> Bool
elem' _ [] = False
elem' x (y:ys)
    | x == y = True
    | otherwise = elem' x ys

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort [a] = [a]
quicksort (x:xs) = quicksort left ++ [x] ++ quicksort right
    where left = [a | a <- xs, a <= x]
          right = [a | a <- xs, a > x]
