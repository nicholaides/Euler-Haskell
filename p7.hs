factors :: Integer -> [Integer]
factors n =
  [ inverseOf x | x <- [1..(n `div` 2)], n `mod` x == 0 ]
  where
    inverseOf = (n `div`)

prime :: Integer -> Bool
prime p = (filter (p/=) (factors p)) == []

first10001 = last $ take 10001 $ filter prime [2..]

main = do
  putStrLn $ show $ first10001
