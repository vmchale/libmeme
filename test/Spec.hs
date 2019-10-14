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

homoConcat :: (String -> String) -> String -> String -> Bool
homoConcat f = \str0 str1 -> f (str0 ++ str1) == f str0 ++ f str1

homoConcatProp :: (String -> String) -> SpecWith ()
homoConcatProp = parallel . prop "should be a homomorphism under concatenation" . homoConcat

conversions :: [String -> String]
conversions = [toFraktur, toScript, toBlackboardBold, toWide, toMonospace, toBubble, toParens]

main :: IO ()
main = hspec $ do
    describe "idempotency" $
        traverse_ idempotentProp
            (spongebobCase:spongebobZygo:conversions)
    describe "conjugation" $
        traverse_ conjugateProp
            conversions
    describe "homomorphism (concatenation)" $
        traverse_ homoConcatProp
            conversions
