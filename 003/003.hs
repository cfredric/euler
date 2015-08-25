import Data.List
prob003 = last $ Data.List.sort $ primeFactors 600851475143
    where
    primeFactors :: Int -> [Int]
    primeFactors n =
        case firstFactor of
            [] -> [n]
            _ -> firstFactor ++ primeFactors (n `div` (head firstFactor))
        where firstFactor = take 1 $ filter (\x -> n `mod` x == 0) [2..n-1]
