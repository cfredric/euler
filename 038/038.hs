--prob038


isPanDigital :: [Int] -> Bool
isPanDigital list = length list == 9 && and (listApply (map elem [1..9]) list)

listApply :: [[a] -> b] -> [a] -> [b]
listApply [] _ = []
listApply (f:fs) list = (f list) : listApply fs list
