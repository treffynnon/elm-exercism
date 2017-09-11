module NucleotideCount exposing (..)


version : Int
version =
  2

type alias NucleotideCount = {
  a: Int,
  t: Int,
  c: Int,
  g: Int
}

countIn : Char -> String -> Int
countIn c x = 
  x
    |> String.filter ((==) c)
    |> String.length

nucleotideCounts : String -> NucleotideCount
nucleotideCounts x = {
    a = (countIn 'A' x),
    t = (countIn 'T' x),
    c = (countIn 'C' x),
    g = (countIn 'G' x)
  }