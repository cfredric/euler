prob039 = snd $ maximum [(numSols, p) | p <- [1..1000], let numSols = length $ pythSols p]

pythSols :: Int -> [(Int, Int, Int)]
pythSols p = [(a,b,c) | a <- [1..p-2], b<-[a+1..p-2-a], let c = p-a-b, a^2+b^2 == c^2]
