module Prob where

import Data.Ratio
import Data.Bifunctor
import Control.Monad
import qualified Data.Map as M

newtype Prob a = Prob { getProb :: [(a, Rational)] } 
    deriving Show

instance Functor Prob where
    fmap f (Prob xs) = Prob $ map (first f) xs

flatten :: Prob (Prob a) -> Prob a
flatten (Prob xs) = Prob $ concatMap multAll xs
    where multAll (Prob innerxs, p) = map (second (*p)) innerxs

instance Applicative Prob where
  pure x = Prob [(x, 1 % 1)]
  (<*>) = ap

instance Monad Prob where
    return x = Prob [(x, 1 % 1)]
    m >>= f = flatten (fmap f m)

data Coin = Heads | Tails deriving (Show, Eq)

coin :: Prob Coin
coin = Prob [(Heads, 1 % 2), (Tails, 1 % 2)]

loadedCoin :: Prob Coin
loadedCoin = Prob [(Heads, 1 % 10), (Tails, 9 % 10)]

flipThree :: Prob Bool 
flipThree = do
    a <- coin
    b <- coin
    c <- loadedCoin
    return (all (== Tails) [a, b, c])

groupProb :: Ord b => Prob b -> Prob b
groupProb (Prob bs) = Prob $ M.toList $ M.fromListWith (+) bs
