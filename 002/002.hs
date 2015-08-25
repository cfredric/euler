prob002 = sum [x | x <- takeWhile (< 4000000) fibList, even x]
    where
    fibList = fibRec 1 2
        where
        fibRec first second = first : fibRec second (first + second)
