module Raindrops exposing (raindrops)

factors : List Int
factors = [3,5,7]
strings : List String
strings = ["Pling", "Plang", "Plong"]

isFactorOf : Int -> Int -> Bool
isFactorOf n f = n % f == 0

nToString : Int -> Int -> String -> String
nToString n factor string =
    if isFactorOf n factor then string
    else ""

factorString : Int -> String
factorString n =
    List.map2 (nToString n) factors strings
      |> String.concat

raindrops : Int -> String
raindrops x = 
    let s = factorString x
    in if String.isEmpty s then toString x
       else s    