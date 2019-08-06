module Text.Convert.Wide ( toWide ) where

import qualified Data.Map            as M
import           Text.Convert.Common

uppercaseWide :: [Char]
uppercaseWide = ['Ａ','Ｂ','Ｃ','Ｄ','Ｅ','Ｆ','Ｇ','Ｈ','Ｉ','Ｊ','Ｋ','Ｌ','Ｍ','Ｎ','Ｏ','Ｐ','Ｑ','Ｒ','Ｓ','Ｔ','Ｕ','Ｖ','Ｗ','Ｘ','Ｙ','Ｚ']

lowercaseWide :: [Char]
lowercaseWide = ['ａ','ｂ','ｃ','ｄ','ｅ','ｆ','ｇ','ｈ','ｉ','ｊ','ｋ','ｌ','ｍ','ｎ','ｏ','ｐ','ｑ','ｒ','ｓ','ｔ','ｕ','ｖ','ｗ','ｘ','ｙ','ｚ']

digitsWide :: [Char]
digitsWide = ['０','１','２','３','４','５','６','７','８','９']

wideTable :: M.Map Char Char
wideTable = M.fromList $
    zip (alphabet ++ digits) (uppercaseWide ++ lowercaseWide ++ digitsWide)

-- | \\( O(n) \\)
toWide :: String -> String
toWide = fmap (withCharTable wideTable)
