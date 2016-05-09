import Data.Char (digitToInt)
import Data.List (genericLength)

main :: IO ()
main = do
    print prob040
    print prob040Smart
    return ()

-- Naive, brute force
prob040 :: Integer
prob040 = product $ map (\e -> (fromIntegral . digitToInt) (champernowne !! (10^e - 1))) [0::Integer .. 6]

champernowne :: String
champernowne = concatMap show [1::Integer ..]

-- Smarter

prob040Smart :: Int
prob040Smart = product $ map (\n -> digitAt (10^n)) [0::Integer .. 6]

digitsUntil :: (Integral a, Show a) => a -> a
digitsUntil n
    | numDigits == 1 = n
    | otherwise      = digitsUntil cap + numDigits * (n - cap)
    where
    numDigits = genericLength $ show n
    cap = 10^(numDigits - 1) - 1

digitAt :: Int -> Int
digitAt n = digitToInt (if incompleteParts == 0
            then last (show fullNums)
            else show (fullNums + 1) !! (incompleteParts - 1))
    where
    numDigits = head $ dropWhile (\d -> digitsUntil (10^d - 1) < n) [1 .. ]
    low = 10 ^ (numDigits - 1) - 1
    digitsBefore = digitsUntil low
    fullNums = low + ((n - digitsBefore) `quot` numDigits)
    incompleteParts = (n - digitsBefore) `rem`  numDigits
