module Text.Convert.Common ( withCharTable
                           , alphabet
                           , digits
                           , lowercase
                           ) where

import qualified Data.Map   as M
import           Data.Maybe (fromMaybe)

digits :: [Char]
digits = ['0'..'9']

alphabet :: [Char]
alphabet = ['A'..'Z'] ++ lowercase

lowercase :: [Char]
lowercase = ['a'..'z']

withCharTable :: M.Map Char Char -> Char -> Char
withCharTable tab c = fromMaybe c (M.lookup c tab)
