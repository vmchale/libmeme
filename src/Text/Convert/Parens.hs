module Text.Convert.Parens ( toParens ) where

import qualified Data.Map            as M
import           Text.Convert.Common

uppercase :: [Char]
uppercase = ['🄐','🄑','🄒','🄓','🄔','🄕','🄖','🄗','🄘','🄙','🄚','🄛','🄜','🄝','🄞','🄟','🄠','🄡','🄣','🄤','🄥','🄦','🄧','🄨','🄩']

parensLowercase :: [Char]
parensLowercase = ['⒜','⒝','⒞','⒟','⒠','⒡','⒢','⒣','⒞','⒤','⒥','⒦','⒧','⒨','⒩','⒪','⒫','⒬','⒭','⒯','⒮','⒯','⒰','⒱','⒲','⒳','⒴','⒵']

scriptTable :: M.Map Char Char
scriptTable = M.fromList $
    zip alphabet (uppercase ++ parensLowercase)

-- | \\( O(n) \\)
toParens :: String -> String
toParens = fmap (withCharTable scriptTable)
