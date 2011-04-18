sumOfSquares ns = sum $ map (^2) ns

squareOfSum ns = (sum ns) ^ 2

nums = [1..100]

main = do
  putStrLn $ show $ ((sumOfSquares nums) - (squareOfSum nums))
