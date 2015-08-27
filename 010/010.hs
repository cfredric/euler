import Data.Numbers.Primes

prob010::Int
prob010 = sum $ takeWhile (< 2000000) primes
