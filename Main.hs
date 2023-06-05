import Text.Printf
import Text.Read
import Control.Applicative
import Control.Arrow
import Data.Maybe
import Data.Function
main = liftA2 (,) getLine getLine 
        >>= uncurry (printf "%i\n%i" `on` length)
          . (filter (==GT) &&& filter (==LT))
          . uncurry (zipWith compare 
                       `on` map (fromMaybe 0 . readMaybe) . words)

-- doesn't fucking work
-- main =
--   -- Takes 2 lines of input and stores it in a tuple
--   (,) <$> getLine <*> getLine
--   -- basically takes a list of lists, gets the length of each list. And prints them.
--   >>=
--   mapM_ (print . length)
--   -- The rest of the bind works on the the created Tuple
--   . ap (map (filter . (==)) [GT, LT])
-- -- pure is a -> f a. In this case f is [] so it's a -> [a]. 
--   . pure 
-- -- uncurry is just (\f (x,y) -> f x y). A way to pass tuple elements as though they're function arguments.
-- -- zipWith f [x1,x2...] [y1,y2,...] = [f x1 y1, f x2 y2,...]
--   . uncurry (zipWith compare)
--   -- bimap is a function that works on both sides of a tuple. bimap f g (x,y) = (f x, g y)
--   -- join uses the Monad instance on functions and creates the combinator (\f x -> f x x) basically it just applies one argument twice.
--   -- @Int is a TypeApplication, it's basically type hints. (Maybe a, Int) @Int = (Maybe Int, Int). It's basically a way to assign variables in longer types.
--   . join bimap (map (read @Int) . words)