module Text.Convert.Script ( toScript ) where

import qualified Data.Map            as M
import           Text.Convert.Common

uppercase :: [Char]
uppercase = ['𝒜','ℬ','𝒞','𝒟','ℰ','ℱ','𝒢','ℋ','ℐ','𝒥','𝒦','ℒ','ℳ','𝒩','𝒪','𝒫','𝒬','ℛ','𝒮','𝒯','𝒰','𝒱','𝒲','𝒳','𝒴','𝒵']

scriptLowercase :: [Char]
scriptLowercase = ['𝒶','𝒷','𝒸','𝒹','ℯ','𝒻','ℊ','𝒽','𝒾','𝒿','𝓀','𝓁','𝓂','𝓃','ℴ','𝓅','𝓆','𝓇','𝓈','𝓉','𝓊','𝓋','𝓌','𝓍','𝓎','𝓏']

scriptTable :: M.Map Char Char
scriptTable = M.fromList $
    zip alphabet (uppercase ++ scriptLowercase)

-- | \\( O(n) \\)
toScript :: String -> String
toScript = fmap (withCharTable scriptTable)
