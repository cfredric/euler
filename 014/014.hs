import Data.List

main = do
    putStrLn $ show prob014

prob014 :: Integer
prob014 = snd $ foldl1' max [(collatzLength n 0, n) | n <- [1..999999]]

collatzLength :: Integer -> Integer -> Integer
collatzLength 1 acc = acc
collatzLength n acc
    | n < 1 = 0
    | even n = collatzLength (n `quot` 2) (1+acc)
    | otherwise = collatzLength (3*n+1) (1+acc)
