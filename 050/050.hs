import Data.Numbers.Primes (primes)
import Data.Maybe (catMaybes)

main = print prob050

prob050 = snd $ maximum [(length $ rewriteAsSumOfPrimes x, x) | x <- takeWhile (<1000000) primes]

-- rewrite as the sum of consecutive primes. Opts for the sum with the most terms
rewriteAsSumOfPrimes :: Int -> [Int]
rewriteAsSumOfPrimes n =
    head $ catMaybes
        [rewriteHelper n filteredPrimes []
            | start <- startPrimes n
            , let filteredPrimes = filter (start<=) $ startPrimes n]
    where
    startPrimes n = takeWhile (<=n) primes
    rewriteHelper :: Int -> [Int] -> [Int] -> Maybe [Int]
    rewriteHelper 0 _ accList   = Just accList
    rewriteHelper _ [] _        = Nothing
    rewriteHelper accDiff restOfPrimes accList
        | accDiff < 0 = Nothing
        | otherwise = rewriteHelper
            (accDiff - (head restOfPrimes))
            (tail restOfPrimes)
            ((head restOfPrimes):accList)
