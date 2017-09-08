module RunLengthEncoding exposing (..)

import Set
import Debug
import Char
import Regex

version : Int
version =
  2

takeWhile : (a -> Bool) -> List a -> List a
takeWhile predicate list =
  case list of
    []      -> []
    x::xs   -> if (predicate x) then x :: takeWhile predicate xs
               else []

grabContigious : Char -> List Char -> List Char
grabContigious x xs = takeWhile ((==) x) xs

group : List Char -> List (List Char)
group xs =
  case xs of
    h::t -> let chars = h :: grabContigious h t
                newList = List.drop (List.length chars - 1) t
            in  chars :: (group newList)
    _ -> []

getLetter : List Char -> String
getLetter xs =
    let c = List.head xs
    in case c of
        Just x -> String.fromChar x
        Nothing -> ""

getCount : List Char -> String
getCount xs =
    let c = List.length xs
    in if c > 1 then toString c
       else ""

compress : List (List Char) -> List String
compress xs =
    List.map (\x -> getCount x ++ getLetter x) xs

encode : String -> String
encode x =
    x
      |> String.toList
      |> group
      |> compress
      |> String.join ""


decode : String -> String
decode =
    Regex.replace Regex.All (Regex.regex "(\\d*)(.)")
        (\match ->
            case match.submatches of
                [ Just count, Just char ] ->
                    String.toInt count
                        |> Result.withDefault 1
                        |> (\n -> String.repeat n char)

                _ ->
                    ""
        )