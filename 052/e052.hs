module E052 where

import Data.List

main :: IO ()
main = print prob052

prob052 :: Integer
prob052 = head [ x | x <- [1..], multiplesShareDigits $ fmap (*x) [1..6]]

multiplesShareDigits :: [Integer] -> Bool
multiplesShareDigits mults = foldl (\acc y -> case acc of
                                            False -> False
                                            True -> haveSameDigits y (head mults)
                                    ) True mults

haveSameDigits :: Integer -> Integer -> Bool
haveSameDigits n m = sort (show n) == sort (show m)
