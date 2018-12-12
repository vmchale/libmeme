module Text.Clapify
    ( clapify
    , clapRepl
    ) where

import           Data.List (intercalate)

-- | \\( O(n) \\)
clapify :: String -> String
clapify = (++ " 👏") . intercalate " 👏 " . words

-- | For use in GHCi
clapRepl :: String -> IO ()
clapRepl = putStrLn . clapify
