module Test where

import Prelude hiding (map, filter, take, drop)

fact :: Integer -> Integer
fact n = if n == 0 then 1 else n * fact (n-1)

fact' :: Integer -> Integer
fact' 0 = 1
fact' n = n * fact' (n-1)

fact'' :: Integer -> Integer
fact'' n | n == 0 = 1
         | otherwise = n * fact'' (n-1)

add3 :: Int -> Int -> Int -> Int
add3 x y z = x + y + z

ex16 = add3 3

-- Try:
--add x = x + "String"

--
-- List operations
--

map f xs = undefined

append xs ys = undefined

take n xs = undefined

drop n xs = undefined

--
-- Binary Trees
--

data Tree
