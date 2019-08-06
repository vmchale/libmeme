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

main :: IO ()
main = hspec $ do
    describe "idempotency" $
        traverse_ idempotentProp
            [spongebobCase, spongebobZygo, toFraktur, toScript, toBlackboardBold]
    describe "conjugation" $
        traverse_ conjugateProp
            [toFraktur, toScript, toBlackboardBold]
    describe "homomorphism (concatenation)" $
        traverse_ homoConcatProp
            [toFraktur, toScript, toBlackboardBold]
    describe "toFraktur" $
        it "should handle a simple title" $
            toFraktur "Can Programming Be Liberated from the von Neumann Style" `shouldBe` "𝕮𝖆𝖓 𝕻𝖗𝖔𝖌𝖗𝖆𝖒𝖒𝖎𝖓𝖌 𝕭𝖊 𝕷𝖎𝖇𝖊𝖗𝖆𝖙𝖊𝖉 𝖋𝖗𝖔𝖒 𝖙𝖍𝖊 𝖛𝖔𝖓 𝕹𝖊𝖚𝖒𝖆𝖓𝖓 𝕾𝖙𝖞𝖑𝖊"
    describe "toBlackboardBold" $
        it "should handle a simple title" $
            toBlackboardBold "Fahrenheit 451" `shouldBe` "𝔽𝕒𝕙𝕣𝕖𝕟𝕙𝕖𝕚𝕥 𝟜𝟝𝟙"
