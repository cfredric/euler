module E036 where

import Data.Char (intToDigit)
import Numeric (showIntAtBase)

prob036 :: Int
prob036 = sum [x | x <- [1..1000000], isBinaryPalindrome x, isDecimalPalindrome x]

isBinaryPalindrome :: Int -> Bool
isBinaryPalindrome n = isPalindrome $ (showIntAtBase 2 intToDigit n) ""

isDecimalPalindrome :: Int -> Bool
isDecimalPalindrome n = isPalindrome $ show n

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = reverse xs == xs
