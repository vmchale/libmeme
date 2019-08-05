module Text.Spongebob ( spongebobCase
                      , spongebobZygo
                      ) where

import           Control.Recursion (ListF (..), zygo)
import           Data.Char         (toLower, toUpper)

-- | \\( O(n) \\)
spongebobCase :: String -> String
spongebobCase = zipWith ($) (cycle [toUpper, toLower])

-- | \\( O(n) \\)
spongebobZygo :: String -> String
spongebobZygo = zygo a pa
    where a :: ListF Char Bool -> Bool
          a Nil           = False
          a (Cons ' ' b)  = b
          a (Cons ',' b)  = b
          a (Cons '-' b)  = b
          a (Cons '\'' b) = b
          a (Cons _ b)    = not b
          pa :: ListF Char (Bool, String) -> String
          pa Nil                 = ""
          pa (Cons c (True, s))  = toUpper c : s
          pa (Cons c (False, s)) = toLower c : s
