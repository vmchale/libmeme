module Text.Convert.BlackboardBold ( toBlackboardBold ) where

import qualified Data.Map            as M
import           Text.Convert.Common

bbDigits :: [Char]
bbDigits = ['𝟘','𝟙','𝟚','𝟛','𝟜','𝟝','𝟞','𝟟','𝟠','𝟡']

uppercase :: [Char]
uppercase = ['𝔸','𝔹','ℂ','𝔻','𝔼','𝔽','𝔾','ℍ','𝕀','𝕁','𝕂','𝕃','𝕄','ℕ','𝕆','ℙ','ℚ','ℝ','𝕊','𝕋','𝕌','𝕍','𝕎','𝕏','𝕐','ℤ']

bbLowercase :: [Char]
bbLowercase = ['𝕒','𝕓','𝕔','𝕕','𝕖','𝕗','𝕘','𝕙','𝕚','𝕛','𝕜','𝕝','𝕞','𝕟','𝕠','𝕡','𝕢','𝕣','𝕤','𝕥','𝕦','𝕧','𝕨','𝕩','𝕪','𝕫']

blackboardBoldTable :: M.Map Char Char
blackboardBoldTable = M.fromList $
    zip (alphabet ++ digits) (uppercase ++ bbLowercase ++ bbDigits)

-- | \\( O(n) \\)
toBlackboardBold :: String -> String
toBlackboardBold = fmap (withCharTable blackboardBoldTable)
