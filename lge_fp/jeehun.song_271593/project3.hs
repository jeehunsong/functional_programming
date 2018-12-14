substr :: String->Int->Int->String
substr "" _ _  = ""
substr (x:xs) y z
    | z == 0 = ""
    | y > 0 = substr xs (y-1) z
    | otherwise = x : (substr xs y (z-1))
