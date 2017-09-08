module DifferenceOfSquares exposing (..)

square : Int -> Int
square x = x * x

squareOfSum : Int -> Int
squareOfSum x =
    x
      |> List.range 1
      |> List.sum
      |> square

sumOfSquares : Int -> Int
sumOfSquares x =
    x
      |> List.range 1
      |> List.map square
      |> List.sum

difference : Int -> Int
difference x =
    (squareOfSum x) - (sumOfSquares x)