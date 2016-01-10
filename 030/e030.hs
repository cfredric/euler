module E030 where
import Data.Char

main :: IO ()
main = print prob030

prob030 :: Integer
prob030 = sum [x | x <- [2..200000], x == sumOfPowers x 5]

sumOfPowers :: (Integral a, Show a, Read a) => a -> a -> a
sumOfPowers x power = sum $ map (\d -> (fromIntegral $ digitToInt d) ^ power) $ show x
