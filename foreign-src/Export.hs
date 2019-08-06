module Export () where

import           Control.Monad    ((<=<))
import           Foreign.C.String
import           Text.Clapify
import           Text.Convert
import           Text.Expand
import           Text.Spongebob

helper :: (String -> String) -> CString -> IO CString
helper f = newCString <=< fmap f . peekCString

helperW :: (String -> String) -> CWString -> IO CWString
helperW f = newCWString <=< fmap f . peekCWString

clapify_ :: CWString -> IO CWString
clapify_ = helperW clapify

spongebob_case :: CString -> IO CString
spongebob_case = helper spongebobCase

spongebob_zygo :: CString -> IO CString
spongebob_zygo = helper spongebobZygo

expand_text :: CString -> IO CString
expand_text = helper textExpand

to_fraktur :: CWString -> IO CWString
to_fraktur = helperW toFraktur

to_script :: CWString -> IO CWString
to_script = helperW toScript

to_blackboard_bold :: CWString -> IO CWString
to_blackboard_bold = helperW toBlackboardBold

foreign export ccall clapify_ :: CWString -> IO CWString
foreign export ccall spongebob_case :: CString -> IO CString
foreign export ccall expand_text :: CString -> IO CString
foreign export ccall spongebob_zygo :: CString -> IO CString
foreign export ccall to_fraktur :: CWString -> IO CWString
foreign export ccall to_script :: CWString -> IO CWString
foreign export ccall to_blackboard_bold :: CWString -> IO CWString
