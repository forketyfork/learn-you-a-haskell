import Traffic
import Tree

class YesNo a where
    yesno :: a -> Bool 

instance YesNo Int where
    yesno 0 = False 
    yesno _ = True 

instance YesNo [a] where
    yesno [] = False 
    yesno _ = True 

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False 

instance YesNo TrafficLight where
    yesno Red = False 
    yesno _ = True

instance YesNo (Tree a) where
    yesno EmptyTree = False 
    yesno _ = True


yesnoIf :: YesNo y => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult =
    if yesno yesnoVal
        then yesResult
        else noResult