import Data.List

prob021 = sum $ filter isAmicable [1..9999]

isAmicable:: Int -> Bool
isAmicable n = n == (d.d) n && n /= d n

d :: Int -> Int
d n = sum $ properDivisors n

properDivisors :: Int -> [Int]
properDivisors n = (1:) $ nub $ concat[ [x, div n x] | x <- [2..limit], rem n x == 0]
    where limit = floor $ sqrt $ fromIntegral n
