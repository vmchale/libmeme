module Text.Convert.Fraktur ( toFraktur ) where

import qualified Data.Map            as M
import           Text.Convert.Common

uppercase :: [Char]
uppercase = ['𝕬','𝕭','𝕮','𝕯','𝕰','𝕱','𝕲','𝕳','𝕴','𝕵','𝕶','𝕷','𝕸','𝕹','𝕺','𝕻','𝕼','𝕽','𝕾','𝕿','𝖀','𝖁','𝖂','𝖃','𝖄','𝖅']

frakturLowercase :: [Char]
frakturLowercase = ['𝖆','𝖇','𝖈','𝖉','𝖊','𝖋','𝖌','𝖍','𝖎','𝖏','𝖐','𝖑','𝖒','𝖓','𝖔','𝖕','𝖖','𝖗','𝖘','𝖙','𝖚','𝖛','𝖜','𝖝','𝖞','𝖟']

frakturTable :: M.Map Char Char
frakturTable = M.fromList $
    zip alphabet (uppercase ++ frakturLowercase)

-- | \\( O(n) \\)
--
-- >>> putStrLn $ toFraktur "Can Programming Be Liberated from the von Neumann Style"
-- 𝕮𝖆𝖓 𝕻𝖗𝖔𝖌𝖗𝖆𝖒𝖒𝖎𝖓𝖌 𝕭𝖊 𝕷𝖎𝖇𝖊𝖗𝖆𝖙𝖊𝖉 𝖋𝖗𝖔𝖒 𝖙𝖍𝖊 𝖛𝖔𝖓 𝕹𝖊𝖚𝖒𝖆𝖓𝖓 𝕾𝖙𝖞𝖑𝖊
toFraktur :: String -> String
toFraktur = fmap (withCharTable frakturTable)
