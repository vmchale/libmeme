module Text.Convert.Monospace ( toMonospace ) where

import qualified Data.Map            as M
import           Text.Convert.Common

uppercaseMono :: [Char]
uppercaseMono = ['𝙰','𝙱','𝙲','𝙳','𝙴','𝙵','𝙶','𝙷','𝙸','𝙹','𝙺','𝙻','𝙼','𝙽','𝙾','𝙿','𝚀','𝚁','𝚂','𝚃','𝚄','𝚅','𝚆','𝚇','𝚈','𝚉']

lowercaseMono :: [Char]
lowercaseMono = ['𝚊','𝚋','𝚌','𝚍','𝚎','𝚏','𝚐','𝚑','𝚒','𝚓','𝚔','𝚕','𝚖','𝚗','𝚘','𝚙','𝚚','𝚛','𝚜','𝚝','𝚞','𝚟','𝚠','𝚡','𝚢','𝚣']

digitsMono :: [Char]
digitsMono = ['𝟶','𝟷','𝟸','𝟹','𝟺','𝟻','𝟼','𝟽','𝟾','𝟿']

monospaceTable :: M.Map Char Char
monospaceTable = M.fromList $
    zip (alphabet ++ digits) (uppercaseMono ++ lowercaseMono ++ digitsMono)

-- | \\( O(n) \\)
toMonospace :: String -> String
toMonospace = fmap (withCharTable monospaceTable)
