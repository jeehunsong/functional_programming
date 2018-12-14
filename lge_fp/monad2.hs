f1 :: Int->[Int]
f1 n = [0..n-1]

f2 :: Int->[Int]
f2 n = [n+1, n-1]

f1nf2 :: Int->[Int]
--f1nf2 n = concat( map f2 (f1 n))
f1nf2 n = do
    nn <- f1 n
    f2 nn
