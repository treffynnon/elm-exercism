module WordCount exposing (..)

import Dict exposing (Dict)
import Char

countOccurrences : List String -> String -> (String, Int)
countOccurrences xs x =
    xs
      |> List.filter ((==) x)
      |> List.length
      |> (\z -> (x, z))

isSafeChar : Char -> Bool
isSafeChar x = Char.isDigit x || Char.isLower x || x == ' '

wordList : String -> List String
wordList x =
    x
      |> String.toLower
      |> String.filter isSafeChar
      |> String.words

wordCount : String -> Dict String Int
wordCount x =
    let xs = wordList x
    in xs
      |> List.map (countOccurrences xs)
      |> Dict.fromList