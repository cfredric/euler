import Data.Char (digitToInt)

prob040 = product $ map (\i -> digitToInt $ champernowne !! i) $ map (10^) [0..6]

champernowne :: String
champernowne = recurConcat 0
    where
    recurConcat n = show n ++ recurConcat (n+1)
