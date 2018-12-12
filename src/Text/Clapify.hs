module Text.Clapify
    ( clapify
    , printClap
    ) where

import           Data.List (intercalate)

clapify :: String -> String
clapify = (++ " 👏") . intercalate " 👏 " . words

printClap :: String -> IO ()
printClap = putStrLn . clapify
