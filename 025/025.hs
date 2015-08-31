import Data.List
import Data.Maybe

prob025 = do findIndex ((>= 1000) . length . show) fibList
    where fibList = 0:1:zipWith (+) fibList (tail fibList)
