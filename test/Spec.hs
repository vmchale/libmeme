import           Test.Hspec
import           Test.Hspec.QuickCheck
import           Text.Spongebob

main :: IO ()
main = hspec $
    describe "spongebobCase" $
        parallel $ prop "should be idempotent" $
            \str -> spongebobCase (spongebobCase str) == spongebobCase str
