import Data.Set (fromList, member)

main = print prob045

prob045 = head [ t | t <- tris, isPentagonal t, isHexagonal t]


isPentagonal :: Int -> Bool
isPentagonal = flip member $ fromList pents
isHexagonal :: Int -> Bool
isHexagonal = flip member $ fromList hexes

upperLim = 10^7

tris :: [Int]
tris = drop 285 [div (n*n+n) 2 | n<-[1..upperLim]]
pents :: [Int]
pents = drop 165 [div (3*n*n-n) 2 | n<-[1..upperLim]]
hexes :: [Int]
hexes = drop 143 [2*n*n-n | n<-[1..upperLim]]
