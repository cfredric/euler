import Data.Char (digitToInt)

main :: IO ()
main = print (prob040 :: Integer)

prob040 :: Num a => a
prob040 = product $ map (\e -> (fromIntegral . digitToInt) (champernowne !! (10^e - 1))) [0::Integer .. 6]

champernowne :: String
champernowne = concatMap show [1::Integer ..]
