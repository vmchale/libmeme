module Text.Convert.Smallcaps ( toSmallcaps ) where

import qualified Data.Map            as M
import           Text.Convert.Common

smallLowercase :: [Char]
smallLowercase = ['ᴀ','ʙ','ᴄ','ᴅ','ᴇ','ꜰ','ɢ','ʜ','ɪ','ᴊ','ᴋ','ʟ','ᴍ','ɴ','ᴏ','ᴘ','ǫ','ʀ','s','ᴛ','ᴜ','ᴠ','ᴡ','x','ʏ','ᴢ']

scriptTable :: M.Map Char Char
scriptTable = M.fromList $
    zip lowercase smallLowercase

-- | \\( O(n) \\)
toSmallcaps :: String -> String
toSmallcaps = fmap (withCharTable scriptTable)
