nextFib :: (Int,Int) -> (Int,Int)
nextFib (prev, now) = (now, prev+now)

fibPairSeq :: [(Int, Int)]
fibPairSeq =
  iterate nextFib (1, 1)

fibSeq :: [Int]
fibSeq =
  map snd fibPairSeq

evenFibs :: [Int]
evenFibs =
  filter even fibSeq

evenFibsUnder4mil :: [Int]
evenFibsUnder4mil =
  takeWhile (<= 4000000) evenFibs

allSummed = sum evenFibsUnder4mil

main = do
  putStrLn $ show $ allSummed

