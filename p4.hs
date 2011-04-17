palindrome :: String -> Bool
palindrome s =  s == reverse s

range = [999,998..1]

largestPalindrome :: Int
largestPalindrome = maximum $ filter (palindrome . show) [ a*b | a <- range, b <- range, a > 99, b > 99 ]

main = do
  putStrLn $ show $ largestPalindrome
