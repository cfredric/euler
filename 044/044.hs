import Data.Set (fromList, member)


main = print prob044
prob044 = head pentPairs

pentPairs = [ (n-m, n, m) | n <- pents, m <- takeWhile (<n) pents, isPentagonal (n-m), isPentagonal (n+m)]

isPentagonal = flip member pentSet

pents = [n*(3*n-1)`div`2 | n <- [1..10^4]]
pentSet = fromList pents
