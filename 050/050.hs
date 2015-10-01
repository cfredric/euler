import Control.Parallel.Strategies (using, parList, rdeepseq)
import Data.Set (fromList, toList, member)
import Data.Numbers.Primes (primes)

main = print prob050

prob050 = findLongestPrimeSequenceUnderLimit 1000000 2

findLongestPrimeSequenceUnderLimit :: Int -> Int -> (Int, Int)
findLongestPrimeSequenceUnderLimit upperLim maxStart = maximum (tuples `using` parList rdeepseq)
    where
    tuples = map findLongestPrimeSequenceFromStart primeList
    primeSet = fromList $ dropWhile (< maxStart) $ takeWhile (< upperLim) primes
    primeList = toList primeSet
    findLongestPrimeSequenceFromStart :: Int -> (Int, Int)
    findLongestPrimeSequenceFromStart start = maximum parSums
        where
        consecutiveSums = scanl (\(count, sum) p -> (count+1, sum+p)) (0, 0) $ dropWhile (< start) primeList
        sumsUnderLimit = takeWhile (\(count, sum) -> sum < upperLim) consecutiveSums
        primeSums = filter (\(count, sum) -> member sum primeSet) sumsUnderLimit
        parSums = primeSums `using` parList rdeepseq
