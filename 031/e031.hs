module E031 where
import Data.Function.Memoize (memoize2)

main :: IO ()
main = print prob031

prob031 :: Integer
prob031 = countWays [1, 2, 5, 10, 20, 50, 100, 200] 200

countWays :: [Integer] -> Integer -> Integer
countWays cs v = fromIntegral . length $ enumerateWays cs v

enumerateWays :: [Integer] -> Integer -> [[Integer]]
enumerateWays = memoize2 enumerateHelper
    where enumerateHelper cs 0 = [replicate (length cs) 0]
          enumerateHelper [] _ = []
          enumerateHelper (c:cs) v
                | v < 0 = []
                | null cs = if v `mod` c == 0 then [[quot v c]] else []
                | otherwise = [ x:xs | x <- [0 .. quot v c], xs <- enumerateWays cs (v-x*c)]
