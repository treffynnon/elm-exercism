module Hamming exposing (..)

countCharDiff : String -> String -> Int
countCharDiff a b =
    List.map2 (/=) (String.toList a) (String.toList b)
        |> List.filter ((==) True)
        |> List.length

distance : String -> String -> Maybe Int
distance a b =
    if String.length a /= String.length b then Maybe.Nothing
    else Maybe.Just (countCharDiff a b)