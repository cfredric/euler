prob009 :: Int
prob009 = (\(x,y,z) -> x*y*z) $ head [(x,y,1000-x-y) | x <- [1..1000], y <- [1..1000-x], x^2 + y^2 == (1000-x-y)^2]