num = 600851475143

factors :: Integer -> [Integer]
factors n =
  [ inverseOf x | x <- [1..(n `div` 2)], n `mod` x == 0 ]
  where
    inverseOf = (n `div`)

prime :: Integer -> Bool
prime p = (filter (p/=) (factors p)) == []


largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n =
  head $ filter prime $ factors n

main = do
  putStrLn $ show $ largestPrimeFactor 600851475143
