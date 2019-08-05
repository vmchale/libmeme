import           Data.Foldable         (traverse_)
import           Test.Hspec
import           Test.Hspec.QuickCheck
import           Text.Convert
import           Text.Spongebob

isIdempotent :: (String -> String) -> (String -> Bool)
isIdempotent f = \str -> f (f str) == f str

idempotentProp :: (String -> String) -> SpecWith ()
idempotentProp = parallel . prop "should be idempotent" . isIdempotent

conjugate :: (String -> String) -> (String -> Bool)
conjugate f = \str -> reverse (f (reverse str)) == f str

conjugateProp :: (String -> String) -> SpecWith ()
conjugateProp = parallel . prop "reverse . f . reverse ≡ f" . conjugate

main :: IO ()
main = hspec $ do
    describe "idempotency" $
        traverse_ idempotentProp
            [spongebobCase, spongebobZygo, toFraktur, toScript, toBlackboardBold]
    describe "conjugation" $
        traverse_ conjugateProp
            [toFraktur, toScript, toBlackboardBold]
