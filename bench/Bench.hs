module Main (main) where

import           Criterion.Main
import           Text.Clapify
import           Text.Expand
import           Text.Spongebob

benchStrFunction :: (String -> String) -> Int -> Benchmark
benchStrFunction f n = bench (show n) $ nf f (replicate n 'a')

main :: IO ()
main =
    defaultMain [ bgroup "clapify" (benchStrFunction clapify <$> [10, 100])
                , bgroup "spongebobCase" (benchStrFunction spongebobCase <$> [10,100])
                , bgroup "expand" (benchStrFunction textExpand <$> [10,100])
                ]
