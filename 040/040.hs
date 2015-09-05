import Data.Char (digitToInt)

--main = do putStrLn $ show prob040
prob040 = product $ map (\i -> digitToInt $ champernowne !! i) $ map (10^) [0..6]

champernowne :: String
champernowne = concatMap show [1..]
