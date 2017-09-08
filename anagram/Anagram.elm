module Anagram exposing (..)

makeSymetrical : String -> List Char
makeSymetrical x =
    x
      |> String.toList
      |> List.sort

compareWords : String -> String -> Bool
compareWords word anagram =
    let w = String.toLower word
        a = String.toLower anagram
    in w /= a
       && makeSymetrical w == makeSymetrical a

detect : String -> List String -> List String
detect word list = List.filter (compareWords word) list
