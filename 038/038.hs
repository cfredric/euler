import Data.List (sort)

prob038 = maximum [product | k <- [1..9999], let product = buildConcatenatedProduct k 9, isPanDigital product]

buildConcatenatedProduct :: Int -> Int -> String
buildConcatenatedProduct k lengthLimit = concatHelper k lengthLimit [] [1..]
    where
    concatHelper :: Int -> Int -> String -> [Int] -> String
    concatHelper k lengthLimit acc (n:ns)
        | length acc > lengthLimit = []
        | length acc == lengthLimit = if n == 2 then [] else acc
        | otherwise = concatHelper k lengthLimit (acc ++ (show $ k*n)) ns

isPanDigital :: String -> Bool
isPanDigital str = sort str == "123456789"
