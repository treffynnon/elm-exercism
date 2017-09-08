module Accumulate exposing (..)

accumulate : (a -> b) -> List a -> List b
accumulate fn x =
    case x of
      (hd::tl) -> (fn hd) :: (accumulate fn tl)
      _ -> []