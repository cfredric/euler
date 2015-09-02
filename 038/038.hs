import Data.Char

prob038 = maximum $ map read (map listToString productsList) :: Int
    where
    productsList = [productList | k <- [1..9999], let productList = buildConcatenatedProduct k 9, isPanDigital productList]

buildConcatenatedProduct :: Int -> Int -> [Int]
buildConcatenatedProduct k lengthLimit = concatHelper k lengthLimit [] [1..]
    where
    concatHelper :: Int -> Int -> [Int] -> [Int] -> [Int]
    concatHelper k lengthLimit acc (n:ns)
        | length acc > lengthLimit = []
        | length acc == lengthLimit = if n == 2 then [] else acc
        | otherwise = concatHelper k lengthLimit (acc ++ (map digitToInt $ show $ k*n)) ns

listToString :: [Int] -> [Char]
listToString ns = map intToDigit ns

isPanDigital :: [Int] -> Bool
isPanDigital list = length list == 9 && and (listApply (map elem [1..9]) list)
    where
    listApply :: [[a] -> b] -> [a] -> [b]
    listApply [] _ = []
    listApply (f:fs) list = (f list) : listApply fs list
