module Leap exposing (isLeapYear)

isEvenlyDivisible : Int -> Int -> Bool
isEvenlyDivisible x z = x % z == 0

isDivisibleBy4 : Int -> Bool
isDivisibleBy4 x = isEvenlyDivisible x 4

isDivisibleBy100 : Int -> Bool
isDivisibleBy100 x = isEvenlyDivisible x 100

isNotDivisibleBy100 : Int -> Bool
isNotDivisibleBy100 x = not (isDivisibleBy100 x)

isDivisibleBy400 : Int -> Bool
isDivisibleBy400 x = isEvenlyDivisible x 400

isStandardLeapYear : Int -> Bool
isStandardLeapYear x = isDivisibleBy4 x && isNotDivisibleBy100 x

isSpecialLeapYear : Int -> Bool
isSpecialLeapYear x = isDivisibleBy100 x && isDivisibleBy400 x

isLeapYear : Int -> Bool
isLeapYear x = isStandardLeapYear x || isSpecialLeapYear x