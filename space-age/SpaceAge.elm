module SpaceAge exposing (..)

type Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

earthYear : Float
earthYear = 31557600

calculate : Float -> Float -> Float
calculate factor seconds = seconds / earthYear / factor

getFactor : Planet -> Float
getFactor x = case x of
  Earth -> 1
  Mercury -> 0.2408467
  Venus -> 0.61519726
  Mars -> 1.8808158
  Jupiter -> 11.862615
  Saturn -> 29.447498
  Uranus -> 84.016846
  Neptune -> 164.79132

ageOn : Planet -> Float -> Float
ageOn p = calculate (getFactor p)