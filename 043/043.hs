import Data.List (sort, permutations)
import Data.Numbers.Primes (primes)


prob043 = sum [x | perm <- permutations "0123456789", perm !! 0 /= '0', let x = read perm, substringsAreDivisible x]

substringsAreDivisible :: Int -> Bool
substringsAreDivisible n = and $ map (isSubstrDivisible n) [0..6]

isSubstrDivisible :: Int -> Int -> Bool
isSubstrDivisible n start = read substr `mod` prime == 0
    where substr = substring (show n) (start+1) 3
          prime = primes !! start

substring :: String -> Int -> Int -> String
substring string start length = take length $ drop start string
