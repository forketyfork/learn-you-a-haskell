-- In the previous chapter, we used the monadic aspects of Maybe 
-- to simulate birds landing on the balancing pole of a tightrope
-- walker. As an exercise, you can rewrite that with the error 
-- monad so that when the tightrope walker slips and falls, you 
-- remember how many birds were on each side of the pole when 
-- he fell.

import Control.Monad.Except

type Birds = Int 
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Either String Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4  = Right (left + n, right)
    | otherwise                     = throwError ("Fell on " ++ show (left + n, right))

landRight :: Birds -> Pole -> Either String Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4  = Right (left, right + n)
    | otherwise                     = throwError ("Fell on " ++ show (left, right + n))

banana :: Pole -> Either String Pole
banana _ = Left "Fell on banana"
