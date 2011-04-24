import Data.Array

type PrimeList = Array Int Bool

tail' :: [a] -> [a]
tail' [] = []
tail' l  = tail l

multiples :: Int -> Int -> [Int]
multiples x max = tail' $ takeWhile (<= max) [x, (x+x) ..]

bigNum = 2000000
-- bigNum =    10

rangeTop = fromIntegral $ round $ sqrt $ fromIntegral bigNum

theBounds = (2, bigNum)
theRange  = [2..bigNum]
allTrue   = zip theRange (repeat True)

addToArr :: PrimeList -> Int -> PrimeList
addToArr arr x =
  if arr ! x then -- if x is marked as prime in the array
    -- then mark all multiples as non-prime
    arr // zip (multiples x bigNum) (repeat False)
  else
    arr

foldl' f z []     = z
foldl' f z (x:xs) = let z' = z `f` x
                    in seq z' $ foldl' f z' xs

primesList :: PrimeList -> PrimeList
-- primesList arr = foldl' addToArr arr [2..rangeTop]
primesList arr = foldl' addToArr arr theRange

primes :: PrimeList -> [Int]
primes arr = map (\ (x, _) -> x) $ filter (\ (x, bool) -> bool) $ assocs arr

main = do
  putStrLn $ show $ sum $ primes $ primesList $ array theBounds allTrue
