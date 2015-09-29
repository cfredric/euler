import Data.Numbers.Primes (isPrime)

main = print prob046

prob046 :: Integral a => a
prob046 = head $ filter (not.canBeWrittenAsSum) $ filter (not.isPrime) [3,5..]

canBeWrittenAsSum :: Integral a => a -> Bool
canBeWrittenAsSum k =
    not . null $ [k | s <- takeWhile (<k) squares
            , isPrime (k - 2*s)]

squares :: Integral a => [a]
squares = map (^2) [1..]
