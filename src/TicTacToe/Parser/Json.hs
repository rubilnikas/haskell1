module TicTacToe.Parser.Json where
import Data.Char
import Data.List.Split
import Data.List
import Data.Maybe

parse :: String -> [(Int, Int, Char)]
parse input = map toTuple (takeByIndexes (concat (map (splitOn "}") (splitOn "{" (init (tail (removeCharFromString input ' ')))))) (incByX 2) 1)

removeCharFromString :: String -> Char -> String
removeCharFromString input char = filter (isNotSameChar char) input

isNotSameChar :: Char -> Char -> Bool
isNotSameChar ch1 ch2 =
    if ch1 == ch2
    then False
    else True

toTuple :: String -> (Int, Int, Char)
toTuple input = extractTupleValues (concat (map (splitOn ",") (splitOn ":" (map toUpper (removeCharFromString input '\"')))))

extractTupleValues :: [String] -> (Int, Int, Char)
extractTupleValues input = (read(input!!(fromJust(elemIndex "X" input) +1))::Int,read (input!!(fromJust(elemIndex "Y" input) +1))::Int,head (input!!(fromJust(elemIndex "V" input) +1)))

incByX :: Int -> Int -> Int
incByX c i = i + c

takeByIndexes :: [a] -> (Int -> Int) -> Int -> [a]
takeByIndexes source increaseIndex index = if length source <= index
                                           then []
                                           else source!!index : takeByIndexes source increaseIndex (increaseIndex index)
