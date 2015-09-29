import Data.Numbers.Primes (primes)
import Data.List (sort)

prob049 = map (\l -> foldr (++) "" $ map show l) primeSequences

primeSequences :: [[Int]]
primeSequences = [ [a,b,c]
    | a <- fourDigitPrimes
    , b <- filter (a<) fourDigitPrimes
    , isPermutation a b
    , c <- filter (b<) fourDigitPrimes
    , isPermutation a c
    , a-b == b-c]


isPermutation :: Int -> Int -> Bool
isPermutation n k = (sort.show) n == (sort.show) k

fourDigitPrimes = takeWhile (<10000) $ dropWhile (<1000) primes
