module Export () where

import           Control.Monad
import           Foreign.C.String
import           Text.Clapify
import           Text.Expand
import           Text.Spongebob

helper :: (String -> String) -> CString -> IO CString
helper f = newCString <=< fmap f . peekCString

clapify_ :: CString -> IO CString
clapify_ = helper clapify

spongebob_case :: CString -> IO CString
spongebob_case = helper spongebobCase

expand_text :: CString -> IO CString
expand_text = helper textExpand

foreign export ccall clapify_ :: CString -> IO CString
foreign export ccall spongebob_case :: CString -> IO CString
foreign export ccall expand_text :: CString -> IO CString
