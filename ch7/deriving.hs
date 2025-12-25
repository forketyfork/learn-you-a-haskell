module Deriving where

data Person = Person { firstName :: String
, lastName :: String
, age :: Int} deriving (Eq, Show, Read)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
    deriving (Show, Read, Eq, Ord, Bounded, Enum)

