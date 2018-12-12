module Text.Clapify
    ( clapify
    ) where

import           Data.List (intercalate)

clapify :: String -> String
clapify = (++ "👏") . intercalate "👏" . words
