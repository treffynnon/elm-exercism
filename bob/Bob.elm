module Bob exposing (..)

import String exposing (toUpper, any)
import Char exposing (isDigit, isUpper)

isYelling : String -> Bool
isYelling x = toUpper x == x && any isUpper x

isAsking : String -> Bool
isAsking = String.endsWith "?"

isSilence : String -> Bool
isSilence x = String.isEmpty (String.trim x)

hey : String -> String
hey x =
    if isSilence x then "Fine. Be that way!"
    else if isYelling x then "Whoa, chill out!"
    else if isAsking x then "Sure."
    else "Whatever."