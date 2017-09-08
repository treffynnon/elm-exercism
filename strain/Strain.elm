module Strain exposing (..)

keep : (a -> Bool) -> List a -> List a
keep f a =
  case a of
    (hd :: tl) -> if f hd then hd :: (keep f tl)
                  else keep f tl
    _ -> a

discard : (a -> Bool) -> List a -> List a
discard f = keep <| not << f
