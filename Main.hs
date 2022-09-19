main = liftA2 (,) getLine getLine 
        >>= uncurry (printf "%i\n%i" `on` length)
          . (filter (==GT) &&& filter (==LT))
          . uncurry (zipWith compare 
                       `on` map (fromMaybe 0 . readMaybe) . words)
