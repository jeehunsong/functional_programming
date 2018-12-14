--main = putStrLn "Hello"

main = do
    name <- getLine
    putStrLn name
    addr <- getLine
    putStrLn (name ++ " " ++ addr)


