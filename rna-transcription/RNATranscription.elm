module RNATranscription exposing (..)

import Dict exposing (Dict(..))
import Set

dnaToRnaMap : Dict Char Char
dnaToRnaMap = Dict.fromList [
        ('G', 'C'),
        ('C', 'G'),
        ('T', 'A'),
        ('A', 'U')
    ]

transcribe : List Char -> Result error String
transcribe xs =
    List.map (\x -> Maybe.withDefault ' ' (Dict.get x dnaToRnaMap)) xs
    |> String.fromList
    |> Result.Ok

getInvalidCharResult : Set.Set Char -> Result Char value
getInvalidCharResult x =
    Set.toList x
    |> List.head
    |> Maybe.withDefault ' '
    |> Result.Err


toRNA : String -> Result Char String
toRNA x =
    let xs = String.toList x
        diff = Set.diff (Set.fromList xs) (Set.fromList (Dict.keys dnaToRnaMap))
    in if Set.size diff > 0 then getInvalidCharResult diff
       else transcribe xs