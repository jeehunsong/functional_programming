import Data.Char
import Data.List

--digitToSum
digitToSum :: Int->Int
--digitToSum x = ...; -- normal implementation
digitToSum = sum . map digitToInt . show

-- calcTo 15 -> ???
calcTo :: Int -> Maybe Int
calcTo n = find (\x->digitToSum x == n) [1..]

