af1::Int->Maybe Int
af1 0 = Nothing
af1 n = Just (2 * n)

af2 :: Int->Maybe Int
af2 0 = Nothing
af2 n = Just(3 * n)

af1nf2 n = do
    nn <- af1 n -- <- implies the possibility of failure
    af2 nn

bf1 :: Int->[Int]
bf1 n = [0..n-1]

bf2 :: Int->[Int]
bf2 n = [n+1, n-1]

bf1nf2 :: Int->[Int]
--f1nf2 n = concat( map f2 (f1 n))
bf1nf2 n = do
    nn <- bf1 n
    bf2 nn

-- Using pipeline
af1nf2 n = af1 n >>= af2
bf1nf2 n = bf1 n >>= bf2
