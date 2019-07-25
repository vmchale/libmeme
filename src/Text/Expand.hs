module Text.Expand ( textExpand ) where

import           Data.List (intersperse)

-- | \\( O(n) \\)
textExpand :: String -> String
textExpand = intersperse ' '
