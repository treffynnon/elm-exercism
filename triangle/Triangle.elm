module Triangle exposing (..)

import Set

type Triangle = Equilateral | Isosceles | Scalene

version : Int
version =
    2

inValidLengths : List Float -> Bool
inValidLengths = List.any (\x -> x <= 0)

violatesInequality : Float -> Float -> Float -> Bool
violatesInequality a b c = 
    a + b < c || a + c < b || b + c < a

triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    let
      list = [a, b, c]
      uniqSides =
        list
          |> Set.fromList
          |> Set.size
    in
      if inValidLengths list then (Err "Invalid lengths")
      else if violatesInequality a b c then (Err "Violates inequality")
      else if uniqSides == 3 then (Ok Scalene)
      else if uniqSides == 2 then (Ok Isosceles)
      else if uniqSides == 1 then (Ok Equilateral)
      else (Err "Failed for some other reason")