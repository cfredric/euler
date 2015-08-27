import Data.List

prob012 :: Int
prob012 = head $ filter (\x -> divisorCount x > 500) triangles

triangles = map (\n -> (n*(n+1)) `div` 2) [1..]

divisorCount :: Int -> Int
divisorCount n = length $ (1:) $ (n:) $ nub $ concat [ [x, div n x] | x <- [2..limit], rem n x == 0]
    where limit = floor $ sqrt $ fromIntegral n
