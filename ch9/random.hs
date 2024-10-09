import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = 
    let (coin1, gen') = random gen
        (coin2, gen'') = random gen'
        (coin3, gen''') = random gen''
    in (coin1, coin2, coin3)


randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen in value : randoms' newGen

finiteRandoms :: (RandomGen g, Random a) => Int -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen = 
    let (value, gen') = random gen
        (rest, finalGen) = finiteRandoms (n - 1) gen'
    in (value : rest, finalGen)

