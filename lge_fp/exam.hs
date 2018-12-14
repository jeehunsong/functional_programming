foo :: [Char] -> [Char]
foo str@(' ':xs) = str
foo xs = ' ':xs
