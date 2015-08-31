import Data.List

prob023 = sum $ filter (not.isSumOf2Abundants) [1..limit]
limit = 28123

isSumOf2Abundants :: Int -> Bool
isSumOf2Abundants n = sumFinder n $ takeWhile (<n) abundants
    where sumFinder :: Int -> [Int] -> Bool
          sumFinder _ [] = False
          sumFinder n (a:as) = if (n-a) `elem` abundants then True else sumFinder n as

abundants = filter isAbundant [1..limit]

isAbundant :: Int -> Bool
isAbundant n = n < (sum $ properDivisors n)

properDivisors :: Int -> [Int]
properDivisors n = (1:) $ nub $ concat [[x, div n x] | x <- [2..limit], n `mod` x == 0]
    where limit = floor $ sqrt $ fromIntegral n
