module Main (main) where

import           Criterion.Main
import           Text.Clapify
import           Text.Convert
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
                , bgroup "toFraktur" (benchStrFunction toFraktur <$> powers)
                , bgroup "toScript" (benchStrFunction toScript <$> powers)
                , bgroup "toBlackboardBold" (benchStrFunction toBlackboardBold <$> powers)
                , bgroup "toWide" (benchStrFunction toWide <$> powers)
                , bgroup "toMonospace" (benchStrFunction toMonospace <$> powers)
                ]

    where powers = [ 10^i | i <- [(1::Int)..2] ]
