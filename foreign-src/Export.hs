module Export () where

import           Control.Monad
import           Foreign.C.String
import           Text.Clapify
import           Text.Spongebob

helper :: (String -> String) -> CString -> IO CString
helper f = newCString <=< fmap f . peekCString

clapify_ :: CString -> IO CString
clapify_ = helper clapify

spongebob_case :: CString -> IO CString
spongebob_case = helper spongebobCase

foreign export ccall clapify_ :: CString -> IO CString
foreign export ccall spongebob_case :: CString -> IO CString
