import System.IO
import Data.List.Split (splitOn)
import Data.Char (ord)

prob042 = do
    handle <- openFile "words.txt" ReadMode
    contents <- hGetContents handle
    let words = map (filter (/= '"')) $ splitOn "," contents
        triWords = filter isTriangleWord words
        total = length triWords
    putStrLn $ show total
    hClose handle

isTriangleWord :: String -> Bool
isTriangleWord word = let score = wordScore wordScore
                        in score `elem` (takeWhile (<= score) tris)

tris = [ n*(n+1) `div` 2 | n <- [1..]]

wordScore :: String -> Int
wordScore word = sum $ map ((+1).(subtract (ord 'A')).ord) word
