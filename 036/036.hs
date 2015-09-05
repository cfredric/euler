import Data.Char (intToDigit)
import Numeric (showIntAtBase)
prob036 = sum [x | x <- [1..1000000], isBinaryPalindrome x, isDecimalPalindrome x]

isBinaryPalindrome :: Int -> Bool
isBinaryPalindrome n = let str = (showIntAtBase 2 intToDigit n) "" in str == reverse str

isDecimalPalindrome :: Int -> Bool
isDecimalPalindrome n = let str = show n in str == reverse str
