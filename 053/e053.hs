module E053 where

import Data.List
import Data.Function.Memoize

main :: IO ()
main = print prob053

prob053 :: Integer
prob053 = genericLength $ filter (> 1000000) [ n `choose` r | n <- [1..100], r <- [1..n]]

choose :: Integer -> Integer -> Integer
n `choose` r = factorial n `quot` (factorial r * factorial (n - r))

factorial :: Integer -> Integer
factorial = memoize facH
    where facH 0 = 1
          facH 1 = 1
          facH n = n * factorial (n-1)
