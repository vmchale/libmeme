import           Data.Foldable         (traverse_)
import           Test.Hspec
import           Test.Hspec.QuickCheck
import           Text.Spongebob

isIdempotent :: (String -> String) -> (String -> Bool)
isIdempotent f = \str -> f (f str) == f str

idempotentProp :: (String -> String) -> SpecWith ()
idempotentProp = parallel . prop "should be idempotent" . isIdempotent

main :: IO ()
main = hspec $
    describe "spongebob" $ traverse_ idempotentProp
        [spongebobCase, spongebobZygo]
