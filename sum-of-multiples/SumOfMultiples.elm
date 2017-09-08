module SumOfMultiples exposing (..)

isTrue : Bool -> Bool
isTrue x = True == x

isDivisible : Int -> Int -> Bool
isDivisible a b = a % b == 0

isMultiple : List Int -> Int -> Bool
isMultiple xs x =
    List.map (isDivisible x) xs
      |> List.any ((==) True)

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples xs x =
    List.range 1 (x - 1)
      |> List.filter (isMultiple xs)
      |> List.sum