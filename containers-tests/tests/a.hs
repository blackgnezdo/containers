import Control.Lens
import GHC.Exts (IsList(..))
import qualified Data.IntMap as IM

main :: IO ()
main = do
    let f i a = 5 + i * a
        g i a = a + 2 * i
        m = fromList [(-2,1),(0,-4)] :: IM.IntMap Int
        -- This is a FunctorWithIndex law.
        x = imap f (imap g m)
        y = imap (\i -> f i . g i) m
    print m
    print x
    print y
    print $ x == y
