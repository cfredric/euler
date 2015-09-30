import Control.Parallel.Strategies (using, parList, rdeepseq)
import Data.Numbers.Primes (isPrime, primes)

main = print prob050

prob050 = findLongestPrimeSequenceUnderLimit 1000000 10000

findLongestPrimeSequenceUnderLimit :: Int -> Int -> (Int, Int)
findLongestPrimeSequenceUnderLimit upperLim maxStart = maximum (tuples `using` parList rdeepseq)
    where tuples = map (findLongestPrimeSequenceFromStart upperLim) $ boundPrimes maxStart upperLim

findLongestPrimeSequenceFromStart :: Int -> Int -> (Int, Int)
findLongestPrimeSequenceFromStart upperLim start = maximum parSums
    where
    primeList = dropWhile (< start) $ uBoundPrimes upperLim
    consecutiveSums = scanl (\(count, sum) p -> (count+1, sum+p)) (0, 0) primeList
    sumsUnderLimit = takeWhile (\(count, sum) -> sum < upperLim) consecutiveSums
    primeSums = filter (\(count, sum) -> isPrime sum) sumsUnderLimit
    parSums = primeSums `using` parList rdeepseq

boundPrimes :: Int -> Int -> [Int]
boundPrimes low high = dropWhile (< low) $ uBoundPrimes high

uBoundPrimes high = takeWhile (< high) primes
