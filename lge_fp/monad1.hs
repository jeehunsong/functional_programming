f1::Int->Maybe Int
f1 0 = Nothing
f1 n = Just (2 * n)

f2 :: Int->Maybe Int
f2 0 = Nothing
f2 n = Just(3 * n)

{-}
f1nf2 :: Int->Maybe Int
f1nf2 n = case f1 n of -- f2 (f1 n)
      Nothing -> Nothing
      Just nn -> f2 nn
-}

f1nf2 n = do
    nn <- f1 n -- <- implies the possibility of failure
    f2 nn
