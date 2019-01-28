module Text.Clapify ( clapify ) where

import           Data.List (intercalate)

-- | \\( O(n) \\)
clapify :: String -> String
clapify = (++ " 👏") . intercalate " 👏 " . words
