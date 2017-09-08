module Pangram exposing (..)

import Char
import Set

isAlpha : Char -> Bool
isAlpha x =
    let c = Char.toCode x
    in (c >= 97) && (c <= 122)

isPangram : String -> Bool
isPangram s =
    s
      |> String.toLower
      |> String.filter isAlpha
      |> String.toList
      |> Set.fromList
      |> Set.size
      |> (==) 26