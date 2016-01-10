module E033 where

import Data.Ratio
import Data.List

main :: IO ()
main = print (prob033::Integer)

prob033 :: (Integral a, Show a, Read a) => a
prob033 = denominator . product $ map (\(n,d) -> n % d) fauxReducers

fauxReducers :: (Integral a, Show a, Read a) => [(a, a)]
fauxReducers = [ (n, d)
               | n <- [10..99]
               , d <- [n+1..99]
               , isFauxReducerCandidate n d
               , let (fn, fd) = fauxReduce n d
               , (fn % fd) == (n % d)
               ]

isFauxReducerCandidate :: (Integral a, Show a) => a -> a -> Bool
isFauxReducerCandidate n d = and [ n < d                                    -- n/d < 1
                                 , intersect (show n) (show d) /= []        -- fauxReducing would actually do something
                                 , sort (show n) /= sort (show d)           -- no permutations of each other, results in ""/""
                                 , and $ map (\x -> x `mod` 10 /= 0) [n, d] -- weed out trivial faux reducers
                                 ]

fauxReduce :: (Integral a, Read a, Show a) => a -> a -> (a, a)
fauxReduce num denom = let (nstr, dstr) = reduceStrs (show num) (show denom)
                       in (read nstr, read dstr)
    where reduceStrs nstr dstr = foldl (\(nacc, dacc) n -> if n `elem` dacc
                                                           then (delete n nacc, delete n dacc)
                                                           else (nacc, dacc))
                                       (nstr, dstr) nstr
