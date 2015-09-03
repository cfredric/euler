import Data.Numbers.Primes (primes)
import Data.List (sort)

main = do putStrLn $ show prob041

-- note: 9 digits is impossible since sum [1..9] = 45, sum [1..8] = 36, so each
-- is always divisible by 3. Similarly, 2, 3, 5, 6 digits are also impossible.
-- So only check 4 and 7 digit primes.
prob041 = maximum $ filter isPanDigital $ takeWhile (<7654322) primes
    where isPanDigital n = let str = show n in (sort str) == (take (length str) "123456789")
