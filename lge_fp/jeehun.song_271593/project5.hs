weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

getLeapYearBeforeYear :: Int->Int->Int
getLeapYearBeforeYear year month
    | month > 2 = (quot year 4) - (quot year 100)  + (quot year 400)
    | otherwise = (quot (year-1) 4) - (quot (year-1) 100)  + (quot (year-1) 400)

accumMonthDays :: Int->Int
accumMonthDays m
    | m <= 1 = 0
    | m > 13 = 0
    | otherwise = monthDays !! (m - 2) + accumMonthDays (m - 1)

getOffset :: Int->Int->Int
getOffset year month = (year 
    + (getLeapYearBeforeYear year month 
    + accumMonthDays month)) `mod` 7

isLeapYear :: Int -> Bool
isLeapYear year = (mod year 4 == 0) && ((mod year 100 /= 0) || (mod year 400 == 0))

getMonthDays :: Int->Int->Int
getMonthDays year month
    | (month /= 2) = monthDays !! ( month - 1)
    | isLeapYear year = 29
    | otherwise = 28

setOffset :: Int->String
setOffset 0 = []
setOffset x = "    " ++ setOffset (x - 1)

monthToString :: [Int] -> Int -> String
monthToString [] _ = []
monthToString (x:xs) offset
    | (mod (x + offset) 7 == 0) && (x < 10) = "   " ++ show(x) ++ "\n" ++ (monthToString xs offset)
    | (mod (x + offset) 7 == 0) && (x >= 10) = "  " ++ show(x) ++ "\n" ++ (monthToString xs offset)
    | (x < 10) = "   " ++ show(x) ++ (monthToString xs offset)
    | otherwise = "  " ++ show(x) ++ (monthToString xs offset)


listToStr :: [String]->String
listToStr [] = []
listToStr (x:xs) = " " ++ x ++ listToStr xs

getCal :: Int->Int->String
getCal year month = (listToStr weekDays) ++ "\n" ++ setOffset (getOffset year month) ++ monthToString [1..(getMonthDays year month)] (getOffset year month) ++ "\n"

strlistToStr :: [[String]]->String
strlistToStr [] = []
strlistToStr (x:xs) = (listToStr x) ++ "\n" ++ (strlistToStr xs)

solve = do 
    putStr "Insert Year :"
    year <- getLine
    putStr "Insert Month :"
    month <- getLine
    putStrLn (strlistToStr [weekDays])
