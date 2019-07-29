module Main (main) where

import           Criterion.Main
import           Text.Clapify
import           Text.Expand
import           Text.Spongebob

benchStrFunction :: (String -> String) -> Int -> Benchmark
benchStrFunction f n = bench (show n) $ nf f (replicate n 'a')

main :: IO ()
main =
    defaultMain [ bgroup "clapify" (benchStrFunction clapify <$> powers)
                , bgroup "spongebobCase" (benchStrFunction spongebobCase <$> powers)
                , bgroup "spongebobZygo" (benchStrFunction spongebobZygo <$> powers)
                , bgroup "expand" (benchStrFunction textExpand <$> powers)
                ]

    where powers = [ 10^i | i <- [(1::Int)..2] ]
