module Text.Spongebob ( spongebobCase ) where

import           Data.Char (toLower, toUpper)

-- | \\( O(n) \\)
spongebobCase :: String -> String
spongebobCase = zipWith ($) (cycle [toUpper, toLower])
