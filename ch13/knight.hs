type KnightPos = (Int, Int)
type KnightPath = [KnightPos]

moveKnight :: KnightPath -> [KnightPath]
moveKnight ((c, r) : rest) = (\cell -> cell : (c, r) : rest) <$> filter onBoard
    [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
    ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
    ] 
    where onBoard (c, r) = c `elem` [1..8] && r `elem` [1..8]

in3 :: KnightPos -> [KnightPath]
in3 start = return [start] >>= moveKnight >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> [KnightPath]
canReachIn3 start end = map reverse $ filter (end `elem`) (in3 start)
