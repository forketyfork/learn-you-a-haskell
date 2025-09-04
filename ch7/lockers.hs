module Lockers where

import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String 

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup number map = case Map.lookup number map of
    Nothing -> Left $ "Locker " ++ show number ++ " doesn't exist"
    Just (state, code) -> if state /= Taken
        then Right code
        else Left $ "Locker " ++ show number ++ " is taken"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken, "ZD39I"))
    ,(101,(Free, "JAH3I"))
    ,(103,(Free, "IQSA9"))
    ,(105,(Free, "QOTSA"))
    ,(109,(Taken, "893JJ"))
    ,(110,(Taken, "99292"))
    ]        
