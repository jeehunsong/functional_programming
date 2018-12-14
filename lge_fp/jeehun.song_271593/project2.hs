query = [("Kim", 60), ("Park", 80), ("Choi", 70), ("Lee", 90), ("Jung", 85)]


sol21 :: [(String, Integer)] -> [(String, Integer)]
sol21 [] = []
sol21 ((name, score):xs)
    | (score >= 80) = (name, score) : sol21 xs
    | otherwise = sol21 xs

sol22 :: [(String, Integer)] -> [(String, Integer)]
sol22 = filter (\(x, y) -> if y >= 80 then True else False)

sol23 :: [(String, Integer)] -> [(String, Integer)]
sol23 = filter (((<=) 80 ) . snd)
