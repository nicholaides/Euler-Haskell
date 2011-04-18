import Data.List

seqs :: [a] -> Int -> [[a]]
seqs xs n =
 filter (\x-> n == (length x)) $ map (take n) $ tails xs

route :: Int -> [Integer] -> Integer
route n (x:[])
 | n < 1 = x
route n xs =
  let
   pairs = seqs xs 2
   ss = map sum $ pairs

   added = if n > 0 then
    (1 : ss) ++ [1]
   else
    ss
  in
   route (n-1) added


main = do
  putStrLn $ show $ map (take 2) $ tails [1,2,3,4,5, 6]
  putStrLn $ show $ seqs [1,2,3,4,5,6] 2
  putStrLn $ show $ map (\n -> route n [0]) [1..20]
