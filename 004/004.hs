prob004 :: Int
prob004 = maximum [x*y | x <- [100..999], y <- [100..999], isPalindrome $ x*y]
    where
    isPalindrome :: Int -> Bool
    isPalindrome n = str == revStr
            where
            str = show n
            revStr = reverse str 
