import Data.Numbers.Primes

main = do putStrLn $ show prob037

prob037 = sum $ take 11 $ filter isTruncatablePrime (dropWhile (<10) primes)

isTruncatablePrime :: Int -> Bool
isTruncatablePrime n = isTruncatable str tail && isTruncatable str init
    where str = show n

isTruncatable :: String -> (String -> String) -> Bool
isTruncatable [] _ = True
isTruncatable s truncate = p `elem` (takeWhile (<= p) primes) && isTruncatable (truncate s) truncate
    where p = read s
