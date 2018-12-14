data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

insertTree :: Ord a => a -> Tree a -> Tree a
insertTree x Empty = Node x Empty Empty
insertTree x (Node y left right)
    | x > y = Node y left (insertTree x right)
    | x < y = Node y (insertTree x left) right
    | otherwise = (Node y left right)

elemTree :: Ord a => Eq a => a -> Tree a -> Bool
elemTree _ Empty = False
elemTree x (Node y left right)
    | x > y = elemTree x right
    | x < y = elemTree x left
    | otherwise = True

st = [1, 3, 5, 7, 2, 4, 6, 8]
tree = foldr insertTree Empty st