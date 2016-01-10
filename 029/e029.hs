module E029 where
import Data.Set (size, fromList)

main :: IO ()
main = print prob029

prob029 :: Int
prob029 = size $ fromList [ a^b | a <- [2..100] :: [Integer], b <- [2..100] :: [Integer]]
