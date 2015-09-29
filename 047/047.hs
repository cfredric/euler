import Data.List (nub)
import Data.Numbers.Primes (primeFactors)

main = print prob047

prob047 :: Integral a => a
prob047 = head [ x
    | x <- [2..]
    , let xs = map (+x) [0..3]
    , and $ map (\k -> (length $ nub $ primeFactors k) == 4) xs]
