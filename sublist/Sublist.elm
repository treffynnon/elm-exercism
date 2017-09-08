module Sublist exposing (..)

version : Int
version =
  2

type ListComparison = Equal | Sublist | Superlist | Unequal

getString : List Int -> String
getString = (List.map toString) >> (String.join "")

contains : List Int -> List Int -> Bool
contains a b = String.contains (getString a) (getString b)

sublist : List Int -> List Int -> ListComparison
sublist a b =
  if a == b then Equal
  else if contains a b then Sublist
  else if contains b a then Superlist
  else Unequal