prob017 = sum $ map count [1..1000]


count :: Int -> Int
count n =
        let
            thousands = n `div` 1000
            hundreds = (n `mod` 1000) `div` 100
            tens = (n `mod` 100) `div` 10
            teens = n `mod` 100
            ones = n `mod` 10
        in (if thousands > 0 then 8 + amtOnes thousands else 0) +
            (if hundreds > 0 then 7 + (amtOnes hundreds) + (if teens > 0 then 3 else 0) else 0) +
            (if tens > 1 then amtTens tens else 0) +
            (if teens <= 19 then amtOnes teens else amtOnes ones)

amtOnes :: Int -> Int
amtOnes n
    | n `elem` [1,2,6,10] = 3
    | n `elem` [4,5,9] = 4
    | n `elem` [3,7,8] = 5
    | n `elem` [11,12] = 6
    | n `elem` [15,16] = 7
    | n `elem` [13,14,18,19] = 8
    | n == 17 = 9
    | n == 0  = 0

amtTens :: Int -> Int
amtTens n
    | n `elem` [4,5,6] = 5
    | n `elem` [2,3,8,9] = 6
    | n == 7 = 7
    | n == 0 = 0
